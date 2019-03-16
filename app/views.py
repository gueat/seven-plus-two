import hashlib
import random
import time

from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect

# Create your views here.
from app.models import *


def index(request):
    wheels = Wheel.objects.all()  # 轮拨图
    goods_dir = Goods.objects.all()  #商品列表

    token = request.session.get('token')
    userid = cache.get(token)

    response_dir = {
        'wheels': wheels,
        'user': None,
        'goods_dir': goods_dir,
    }
    if userid:
        user = User.objects.get(pk=userid)
        response_dir['user'] = user

    return render(request, 'index/index.html', context=response_dir)


def mycart(request):
    token = request.session.get('token')
    userid = cache.get(token)
    if userid:  # 有登录才显示
        user = User.objects.get(pk=userid)
        carts = user.cart_set.filter(number__gt=0)
        isall = True
        for cart in carts:
            if not cart.isselect:
                isall = False
        response_dir = {
            'user': None,
            'carts': carts,
            'isall': isall,
        }

        response_dir['user'] = user
        return render(request, 'mycat/mycart.html', context=response_dir)
    else:  # 未登录不显示
        return render(request, 'login/login.html')


def generate_token():
    temp = str(time.time()) + str(random.random())
    md5 = hashlib.md5()
    md5.update(temp.encode('utf-8'))
    return md5.hexdigest()


def generate_password(param):
    md5 = hashlib.md5()
    md5.update(param.encode('utf-8'))
    return md5.hexdigest()


def login(request):
    if request.method == 'GET':
        return render(request, 'login/login.html')
    elif request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        print(username,password)
        users = User.objects.filter(username=username)
        if users.exists():  # 这个用户存在
            user = users.first()
            if user.password == generate_password(password):  # 密码正确
                token = generate_token()  # 状态保持
                cache.set(token, user.id, 60*60*24)
                request.session['token'] = token
                return redirect('seven:index')
            else:  # 密码错误
                return render(request, 'login/login.html', context={'p_err': '帐号或密码错误'})
        else:  # 用户名不存在
            return render(request, 'login/login.html', context={'p_err': '帐号或密码错误'})


def register(request):
    if request.method == 'GET':
        return render(request, 'register/register.html')
    elif request.method == 'POST':
        username = request.POST.get('username')
        password = generate_password(request.POST.get('password'))
        phone = request.POST.get('phone')
        print(username,password)

        user = User()  # 存数据库
        user.username = username
        user.password = password
        user.phone = phone
        user.save()
        token = generate_token()  # 状态保持
        cache.set(token, user.id, 60 * 60 * 24)
        request.session['token'] = token
        return redirect('seven:index')


def detail(request, num):
    goods_dir = Goods.objects.all()
    goods_list = Goods.objects.filter(pk=num).first()
    token = request.session.get('token')
    userid = cache.get(token)
    response_dir = {
        'user': None,
        'goods_dir': goods_dir,
        'goods_list': goods_list,
    }
    if userid:
        user = User.objects.get(pk=userid)
        response_dir['user'] = user

    return render(request, 'detail/detail.html', context=response_dir)


def logout(request):
    request.session.flush()
    return redirect('seven:index')


def checkusername(request):
    username = request.GET.get('username')  # 获取帐号信息

    # 去数据库中查找
    users = User.objects.filter(username=username)
    if users.exists():  # 帐号被占用
        response_data = {
            'status': 0,
            'msg': '该帐号已被使用！',
        }
    else:  # 帐号可以使用
        response_data = {
            'status': 1,
            'msg': '该帐号可以使用！'
        }
    # 返回json数据
    return JsonResponse(response_data)


def addcart(request):
    # 获取token
    token = request.session.get('token')
    # 响应数据
    response_data = {}
    # 缓存
    if token:
        userid = cache.get(token)
        if userid:  # 已经登录
            user = User.objects.get(pk=userid)
            goodsid = request.GET.get('goodsid')
            goods = Goods.objects.get(pk=goodsid)
            print(user,goodsid)
            # 商品不存在： 添加新记录
            # 商品存在： 修改number
            carts = Cart.objects.filter(user=user).filter(goods=goods)
            if carts.exists():
                cart = carts.first()
                cart.number = cart.number + 1
                cart.save()
            else:
                cart = Cart()
                cart.user = user
                cart.goods = goods
                cart.number = 1
                cart.save()
            response_data['status'] = 1
            response_data['number'] = cart.number
            response_data['msg'] = '添加{}购物车成功:{}'.format(cart.goods.specifics, cart.number)
            return JsonResponse(response_data)
    # 未登录
    response_data['status'] = -1
    response_data['msg'] = '请登录后操作'
    return JsonResponse(response_data)


def subcart(request):
    # 商品
    goodsid = request.GET.get('goodsid')
    goods = Goods.objects.get(pk=goodsid)
    # 用户
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    # 获取对应的购物车信息
    cart = Cart.objects.filter(user=user).filter(goods=goods).first()
    cart.number = cart.number - 1
    cart.save()
    response_data = {
        'msg': '删减商品成功',
        'status': 1,
        'number': cart.number,
    }
    return JsonResponse(response_data)


def changecartselect(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    cart.isselect = not cart.isselect
    cart.save()
    response_data = {
        'msg': '状态修改成功',
        'status': 1,
        'isselect': cart.isselect
    }
    return JsonResponse(response_data)


def changecartall(request):
    isall = request.GET.get('isall')
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    carts = user.cart_set.all()
    if isall == 'true':
        isall = True
    else:
        isall = False
    for cart in carts:
        cart.isselect = isall
        cart.save()
    response_data = {
        'msg': '全选/取消全选 成功',
        'status': 1
    }
    return JsonResponse(response_data)