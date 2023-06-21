from django.contrib.auth.models import User
from django.db import models



# Create your models here.
class Category(models.Model):
    slug = models.SlugField()
    title = models.CharField(max_length=255, db_index=True)

    def __str__(self):
        return str(self.title)

    class Meta:
        db_table = "menu_catagory"
        ordering = ["title"]
        verbose_name = "category"
        verbose_name_plural = "catagories"


class MenuItems(models.Model):
    title = models.CharField(max_length=255, db_index=True)
    price = models.DecimalField(max_digits=6, decimal_places=2, db_index=True)
    featured = models.BooleanField(db_index=True)
    category = models.ForeignKey(Category, on_delete=models.PROTECT)

    def __str__(self):
        return f"{self.title} ({self.category})"
    
    class Meta:
        db_table = "menu_items"
        ordering = ["category","title"]
        verbose_name = "menu item"
        verbose_name_plural = "menu items"
        # permissions = (
        #     ('add_menu_items', 'Add Menu Items'),
        # )


class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    menuitems = models.ForeignKey(MenuItems, on_delete=models.CASCADE)
    quantity = models.SmallIntegerField()
    unit_price = models.DecimalField(max_digits=6, decimal_places=2)
    price = models.DecimalField(max_digits=6, decimal_places=2, null=True)
    class Meta:
        unique_together = ("menuitems", "user")
        db_table = "user_carts"
        ordering = ["user"]
        verbose_name = "cart"
        verbose_name_plural = "carts"


    class Meta:
        unique_together = ("menuitems", "user")

    def __str__(self):
        return f"{self.user} - {self.price}"


class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    delivery_crew = models.ForeignKey(
        User, on_delete=models.SET_NULL, related_name="delivery_crew", null=True
    )
    status = models.BooleanField(db_index=True, default=0)
    total = models.DecimalField(max_digits=6, decimal_places=2)
    date = models.DateField(db_index=True)
    price = models.DecimalField(max_digits=6, decimal_places=2, null=True)


    def __str__(self):
        return f"{self.user} - {self.date} - {self.total} ({self.status})"

        
    class Meta:
        db_table = "orders"
        ordering = ["user","date", "status"]
        verbose_name = "order"
        verbose_name_plural = "orders"



class OrderItem(models.Model):
    order = models.ForeignKey(User, on_delete=models.CASCADE)
    menuitem = models.ForeignKey(MenuItems, on_delete=models.CASCADE)
    quantity = models.SmallIntegerField()
    unit_price = models.DecimalField(max_digits=6, decimal_places=2)
    price = models.DecimalField(max_digits=6, decimal_places=2, null=True)

    def __str__(self):
        return f"{self.order} ({self.menuitem})"

        class Meta:
            unique_together = ('order', 'menuitem')
            db_table = "order_items"
            ordering = ["order"]
            verbose_name = "order item"
            verbose_name_plural = "order items"
    price = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return f"{self.order} ({self.menuitem})"
