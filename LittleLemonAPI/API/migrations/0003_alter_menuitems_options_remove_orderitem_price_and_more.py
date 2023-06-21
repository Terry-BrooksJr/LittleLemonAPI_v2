# Generated by Django 4.2.1 on 2023-06-07 15:24

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("API", "0002_alter_menuitems_options_remove_cart_price"),
    ]

    operations = [
        migrations.AlterModelOptions(
            name="menuitems",
            options={
                "ordering": ["category", "title"],
                "verbose_name": "menu item",
                "verbose_name_plural": "menu items",
            },
        ),
        migrations.RemoveField(
            model_name="orderitem",
            name="price",
        ),
        migrations.AddField(
            model_name="cart",
            name="price",
            field=models.DecimalField(decimal_places=2, max_digits=6, null=True),
        ),
    ]