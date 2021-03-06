import hashlib
import random
import time
from urllib.parse import parse_qs

from django.core.cache import cache
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.views.decorators.csrf import csrf_exempt

from alipay import alipay
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
    money = 0
    if userid:  # 有登录才显示
        user = User.objects.get(pk=userid)
        carts = user.cart_set.filter(number__gt=0)
        isall = True
        for cart in carts:
            money += int(cart.goods.price) * int(cart.number)
            if not cart.isselect:
                isall = False
        response_dir = {
            'user': None,
            'carts': carts,
            'isall': isall,
            'money': money,
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
    if cart.number >= 2:
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


def generate_identifier():
    temp = str(int(time.time())) + str(random.randrange(1000, 10000))
    return temp


def mkorder(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifier()
    order.save()
    # 订单商品(购物车中选中)
    carts = user.cart_set.filter(isselect=True)
    for cart in carts:
        orderGoods = OrderGoods()
        orderGoods.order = order
        orderGoods.goods = cart.goods
        orderGoods.number = cart.number
        orderGoods.save()
        # 购物车中移除
        carts.delete()

    return render(request, 'order/orderdetail.html', context={'order': order})


def orderlist(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)

    orders = user.order_set.all()

    return render(request, 'order/orderlist.html', context={'orders':orders})


def orderdetail(request, identifier):
    order = Order.objects.filter(identifier=identifier).first()

    return render(request, 'order/orderdetail.html', context={'order': order})


def deletecart(request):
    cartid = request.GET.get('cartid')
    cart = Cart.objects.get(pk=cartid)
    # 购物车中移除
    cart.delete()
    response_data = {
        'msg': '删除成功',
        'status': 1
    }

    return JsonResponse(response_data)


def newbuy(request):
    token = request.session.get('token')
    userid = cache.get(token)
    user = User.objects.get(pk=userid)
    num = Cart.objects.get('number')
    goods = Goods.objects.get()
    # 订单
    order = Order()
    order.user = user
    order.identifier = generate_identifier()
    order.save()
    # 订单商品(购物车中选中)

    orderGoods = OrderGoods()
    orderGoods.order = order
    orderGoods.goods = goods
    orderGoods.number = num
    orderGoods.save()

    return render(request, 'order/orderdetail.html', context={'order': order})


def returnurl(request):
    return redirect('seven:index')


# 支付宝异步回调是post请求
@csrf_exempt
def appnotifyurl(request):
    if request.method == 'POST':
        # 获取到参数
        body_str = request.body.decode('utf-8')

        # 通过parse_qs函数
        post_data = parse_qs(body_str)

        # 转换为字典
        post_dic = {}
        for k,v in post_data.items():
            post_dic[k] = v[0]

        # 获取订单号
        out_trade_no = post_dic['out_trade_no']

        # 更新状态
        Order.objects.filter(identifier=out_trade_no).update(status=1)


    return JsonResponse({'msg':'success'})


def pay(request):
    # print(request.GET.get('orderid'))

    orderid = request.GET.get('orderid')
    order = Order.objects.get(pk=orderid)

    sum = 0
    for orderGoods in order.ordergoods_set.all():
        sum += orderGoods.goods.price * orderGoods.number

    # 支付地址信息
    data = alipay.direct_pay(
        subject='seven puls two', # 显示标题
        out_trade_no=order.identifier,    # 订单号
        total_amount=str(sum),   # 支付金额
        return_url='http://http://47.112.195.186/returnurl/'
    )

    # 支付地址
    alipay_url = 'https://openapi.alipaydev.com/gateway.do?{data}'.format(data=data)

    response_data = {
        'msg': '调用支付接口',
        'alipayurl': alipay_url,
        'status': 1
    }

    return JsonResponse(response_data)