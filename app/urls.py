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
    url(r'^addcart/$', views.addcart, name='addcart'),  # 加入购物车
    url(r'^subcart/$', views.subcart, name='subcart'),  # 删减购物车
    url(r'^changecartselect/$', views.changecartselect, name='changecartselect'),  # 购物车商品选中状态
    url(r'^changecartall/$', views.changecartall, name='changecartall'),  # 全选/取消全选
    url(r'^mkorder/$', views.mkorder, name='mkorder'),    # 生成订单
    url(r'orderlist/$', views.orderlist, name='orderlist'), # 订单列表
    url(r'^orderdetail/(?P<identifier>[\d.]+)/$', views.orderdetail, name='orderdetail'),  # 订单详情
    url(r'^deletecart/$', views.deletecart, name='deletecart'),  # 删除单个物品
    url(r'^newbuy/$', views.newbuy, name='newbuy'),  # 立即购买
    url(r'^returnurl/$', views.returnurl, name='returnurl'),  # 支付成功后，客户端的显示
    url(r'^appnotifyurl/$', views.appnotifyurl, name='appnotifyurl'),  # 支付成功后，订单的处理
    url(r'^pay/$', views.pay, name='pay'),  # 支付
]