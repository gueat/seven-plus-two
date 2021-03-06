# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2019-03-15 13:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0003_detail'),
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('productid', models.CharField(max_length=10)),
                ('img', models.CharField(max_length=256)),
                ('name', models.CharField(max_length=100)),
                ('specifics', models.CharField(max_length=100)),
                ('price', models.FloatField()),
                ('marketprice', models.FloatField()),
            ],
            options={
                'db_table': 'seven_goods',
            },
        ),
    ]
