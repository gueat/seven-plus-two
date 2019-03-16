from django.conf.urls import url

from app import views

urlpatterns = [
    url(r'^$', views.index, name='index'),   # 主页
    url(r'^mycart/$', views.mycart, name='mycart'),   # 购物车
    url(r'^login/$', views.login, name='login'),   # 登录
    url(r'^register/$', views.register, name='register'),   # 注册
    url(r'^detail/$', views.detail, name='detailbase'),  #商品详情
    url(r'^detail/(?P<num>\d+)/$', views.detail, name='detail'),
    url(r'^logout/$', views.logout, name='logout'),  # 注销
    url(r'^checkusername/$', views.checkusername, name='checkusername'),  # 验证帐号
]