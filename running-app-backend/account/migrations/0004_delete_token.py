# Generated by Django 3.2.7 on 2024-03-14 05:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0003_token'),
    ]

    operations = [
        migrations.DeleteModel(
            name='Token',
        ),
    ]
