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

