from django.db import models

class Wheel(models.Model):
    img = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    trackid = models.CharField(max_length=20)
    class Meta:
        db_table = 'seven_wheel'


class User(models.Model):
    username = models.CharField(max_length=40)
    password = models.CharField(max_length=256)
    phone = models.CharField(max_length=20)
    class Meta:
        db_table = 'seven_user'


class Detail(models.Model):
    img = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    price = models.FloatField()
    class Meta:
        db_table = 'seven_detail'


class Goods(models.Model):
    productid = models.CharField(max_length=10)  # 图片ID
    img = models.CharField(max_length=256)  # 图片
    name = models.CharField(max_length=100)  # 图片名
    specifics = models.CharField(max_length=100)  # 详情
    price = models.FloatField()  # 价格
    marketprice = models.FloatField()  # 原价
    class Meta:
        db_table = 'seven_goods'


class Cart(models.Model):
    # 用户[添加的这个商品属于哪个用户]
    user = models.ForeignKey(User)
    # 商品[添加的是哪个商品]
    goods = models.ForeignKey(Goods)
    # 商品数量
    number = models.IntegerField()
    # 是否选中
    isselect = models.BooleanField(default=True)
    # 是否删除
    isdelete = models.BooleanField(default=False)
    class Meta:
        db_table = 'seven_cart'

