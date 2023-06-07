# Generated by Django 4.2.1 on 2023-06-07 18:26

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("API", "0004_order_price"),
    ]

    operations = [
        migrations.AddField(
            model_name="orderitem",
            name="price",
            field=models.DecimalField(decimal_places=2, max_digits=6, null=True),
        ),
    ]
