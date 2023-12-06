"""
URL configuration for LittleLemonAPI project.
"""
from API import urls
from django.contrib import admin
from django.contrib.auth import get_user_model
from django.shortcuts import redirect, reverse
from django.http import request
from API import views
from django.views.generic.base import TemplateView
from django.urls import include, path, re_path
from rest_framework import routers, serializers, viewsets


#   Welcome  Page View
class WelcomePage(TemplateView):
    template_name = "welcome.html"


user = get_user_model()


# Serializers define the API representation.
class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = user
        fields = ["url", "username", "email", "is_staff"]


# ViewSets define the view behavior.
class UserViewSet(viewsets.ModelViewSet):
    queryset = user.objects.all()
    serializer_class = UserSerializer


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r"users", UserViewSet)

urlpatterns = [
    path("admin/", admin.site.urls),
    path("__debug__/", include("debug_toolbar.urls")),
    path("", include("djoser.urls.authtoken")),
    path("api/", include("djoser.urls")),
    path("api/", include("API.urls")),
    path("", WelcomePage.as_view(), name="welcome"),
]
