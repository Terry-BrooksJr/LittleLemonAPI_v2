from django.forms import forms
from creditcards.forms import CardNumberField, CardExpiryField, SecurityCodeField
from localflavor.us.forms import USZipCodeField, USStateField
from crispy_forms.helper import FormHelper
from crispy_forms.layout import Column
from crispy_forms.layout import HTML
from crispy_forms.layout import Layout, Div
from django.utils.translation import gettext_lazy as _
from crispy_forms.layout import Row, Field, Button
from crispy_forms.bootstrap import FormActions, Modal


class SignupForm(forms.Form):
    username = forms.CharField("Desired Username", max_length=22, required=True)
    password = forms.CharField(
        "Password", max_length=256, required=True, widget=forms.PasswordInput()
    )
    confirm_password = forms.CharField(
        "Confirm Password", max_length=256, required=False, widget=forms.PasswordInput()
    )
    email = forms.EmailField()
    first_name = forms.CharField("First Name", max_lenght=255, required=True)
    last_name = forms.CharField("First Name", max_lenght=255, required=True)
    delivery_customer = forms.BooleanField(
        "Would You Like To Signup For Delivery?", required=True
    )
    delivery_street_address = forms.CharField(
        "Street Address", max_length=255, required=False
    )
    delivery_city = forms.CharField("Street Address", max_length=255, required=False)
    delivery_zipcode = USZipCodeField(null=True, blank=True)
    delivery_state = USStateField(null=True, blank=True)

    def clean(self):
        cleaned_data = super().clean()
        delivery_customer = cleaned_data.get("delivery_customer")
        delivery_street_address = cleaned_data.get("delivery_street_address")
        delivery_city = cleaned_data.get("delivery_city")
        delivery_zipcode = cleaned_data.get("delivery_zipcode")
        delivery_state = cleaned_data.get("delivery_state")

        if self.delivery_customer:
            if (
                self.delivery_city
                or self.delivery_zipcode
                or self.delivery_state is None
            ):
                raise ValidationError(
                    _(
                        msg="You have selected to enroll in delivery, city, state and address and zipcodes must be provided."
                    ),
                    code="NoAddress",
                )

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.helper = FormHelper()
        self.helper.form_id = "user-signup"
        self.helper.form_method = "post"
        self.helper.form_action = "/"
        self.helper.form_class = "form-horizontal"
        self.helper.layout = Layout(
            Modal(
                Div(
                    Row(
                        Column("first_name", css_class="form-group col-md-6 mb-0"),
                        Column("last_name", css_class="form-group col-md-6 mb-0"),
                        css_class="form-row",
                    ),
                    Row(
                        Column("email", css_class="form-group mb-9"),
                        Column("delivery_customer", css_class="form-group mb-3"),
                        css_class="form-row",
                    ),
                    Row(
                        Column("username", css_class="form-group mb-12"),
                        css_class="form-row",
                    ),
                    Row(
                        Column("password", css_class="form-group col-md-6 mb-0"),
                        Column(
                            "confirm_password", css_class="form-group col-md-6 mb-0"
                        ),
                        css_class="form-row",
                    ),
                ),
                css_id="signup-modal",
                title="New Little Lover Signup",
            )
        )
