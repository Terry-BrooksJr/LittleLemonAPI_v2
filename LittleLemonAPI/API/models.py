from django.contrib.auth.models import AbstractUser
from django.contrib.auth import get_user_model
from django.db import models
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.base_user import BaseUserManager
from localflavor.us.models import USStateField
from localflavor.us.models import USZipCodeField
from creditcards.models import CardNumberField, CardExpiryField, SecurityCodeField


class LittleLemonerManager(BaseUserManager):
    """
    Custom user model manager where email is the unique identifiers
    for authentication instead of usernames.
    """

    def create_user(self, email, password, **extra_fields):
        """
        Creates a new user with the provided email, password, and any additional fields.

        Args:
            email (str): The email address of the user.
            password (str): The password for the user account.
            **extra_fields: Additional fields to be included in the user model.

        Returns:
            LittleLemoner: The newly created user object.

        Raises:
            ValueError: If the email is not provided.

        Example:
            user = create_user(email='example@email.com', password='password123', first_name='John', last_name='Doe')
        """
        if not email:
            raise ValueError(_("The Email must be set"))
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save()
        return user

    def create_superuser(self, email, password, **extra_fields):
        """
        Creates a new superuser with the provided email, password, and any additional fields.

        Args:
            email (str): The email address of the superuser.
            password (str): The password for the superuser account.
            **extra_fields: Additional fields to be included in the superuser model.

        Returns:
            LittleLemoner: The newly created superuser object.

        Raises:
            ValueError: If the is_staff or is_superuser fields are not set to True.

        Example:
            superuser = create_superuser(email='admin@email.com', password='admin123', is_staff=True, is_superuser=True)
        """
        extra_fields.setdefault("is_staff", True)
        extra_fields.setdefault("is_superuser", True)
        extra_fields.setdefault("is_active", True)

        if extra_fields.get("is_staff") is not True:
            raise ValueError(_("Superuser must have is_staff=True."))
        if extra_fields.get("is_superuser") is not True:
            raise ValueError(_("Superuser must have is_superuser=True."))
        return self.create_user(email, password, **extra_fields)


class CustomerPayment(models.Model):
    customer = models.ForeignKey("LittleLemoner", on_delete=models.CASCADE)
    cc_number = CardNumberField(_("card number"))
    cc_expiry = CardExpiryField(_("expiration date"))
    cc_code = SecurityCodeField(_("security code"))


class LittleLemoner(AbstractUser):
    objects = LittleLemonerManager()
    home_address = models.CharField(max_length=255, null=True, blank=True)
    city = models.CharField(max_length=255, null=True, blank=True)
    state = USStateField(max_length=2, null=True, blank=True)
    zipcode = USZipCodeField(null=True, blank=True)
    payment = models.ForeignKey(
        CustomerPayment, on_delete=models.CASCADE, null=True, blank=True
    )

    def __str__(self):
        if self.is_staff:
            return f"{self.last_name}, {self.first_name} (Internal User)"
        else:
            return f"{self.last_name}, {self.first_name} (Customer)"

    class Meta:
        db_table = "customers_staff"
        ordering = ["last_name", "first_name"]
        verbose_name = "customer and staff"
        verbose_name_plural = "customers and staff"


# class Category(models.Model):


#     title = models.CharField(choices=CATEGORY.choices, max_length=255, db_index=True)

#     def __str__(self):
#         return str(self.title)

#     class Meta:
#         db_table = "menu_catagory"
#         ordering = ["title"]
#         verbose_name = "category"
#         verbose_name_plural = "catagories"


class MenuItems(models.Model):
    class CATEGORY(models.TextChoices):
        appetizer = 1, _("Appetizer")
        dessert = 2, _("Dessert")
        entree = 3, _("Entree")
        drink = 4, _("Drink")
        side_orders = 5, _("Side Order")

    title = models.CharField(max_length=255, db_index=True)
    price = models.DecimalField(max_digits=6, decimal_places=2, db_index=True)
    featured = models.BooleanField(db_index=True)
    category = models.CharField(max_length=1, choices=CATEGORY.choices)

    def __str__(self):
        return f"{self.title} ({self.get_category_display()})"

    class Meta:
        db_table = "menu_items"
        ordering = ["category", "title"]
        verbose_name = "menu item"
        verbose_name_plural = "menu items"


class Cart(models.Model):
    user = models.ForeignKey(LittleLemoner, on_delete=models.CASCADE)
    menuitems = models.ForeignKey(MenuItems, on_delete=models.PROTECT)
    quantity = models.SmallIntegerField()
    unit_price = models.DecimalField(max_digits=6, decimal_places=2, null=True)
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
    user = models.ForeignKey(LittleLemoner, on_delete=models.CASCADE)
    delivery_crew = models.ForeignKey(
        LittleLemoner,
        on_delete=models.SET_NULL,
        related_name="delivery_crew",
        null=True,
    )
    status = models.BooleanField(db_index=True, default=0)
    total = models.DecimalField(max_digits=6, decimal_places=2)
    date = models.DateField(db_index=True)
    price = models.DecimalField(max_digits=6, decimal_places=2, null=True)

    def __str__(self):
        return f"{self.user} - {self.date} - {self.total} ({self.status})"

    class Meta:
        db_table = "orders"
        ordering = ["user", "date", "status"]
        verbose_name = "order"
        verbose_name_plural = "orders"


class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE)
    menuitem = models.ForeignKey(MenuItems, on_delete=models.CASCADE)
    quantity = models.SmallIntegerField()
    unit_price = models.DecimalField(max_digits=6, decimal_places=2)
    price = models.DecimalField(max_digits=6, decimal_places=2, null=True)

    def __str__(self):
        return f"{self.order} ({self.menuitem})"

        class Meta:
            unique_together = ("order", "menuitem")
            db_table = "order_items"
            ordering = ["order"]
            verbose_name = "order item"
            verbose_name_plural = "order items"

    price = models.DecimalField(max_digits=6, decimal_places=2)

    def __str__(self):
        return f"{self.order} ({self.menuitem})"
