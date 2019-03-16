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
    response_dir = {
        'user': None,
    }
    if userid:
        user = User.objects.get(pk=userid)
        response_dir['user'] = user
    return render(request, 'mycat/mycart.html', context=response_dir)


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
    goods_list = Goods.objects.filter(productid=num).first()

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