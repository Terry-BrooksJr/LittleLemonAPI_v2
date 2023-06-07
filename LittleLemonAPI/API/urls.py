from rest_framework.routers import DefaultRouter

from . import views

app_name = "api"
router = DefaultRouter(trailing_slash=False)


urlpatterns = []
