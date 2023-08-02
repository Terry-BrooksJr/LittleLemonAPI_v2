from django.test import TestCase, TransactionTestCase
from loguru import logger
from requests.auth import HTTPBasicAuth
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIClient, APITestCase, RequestsClient
from django.contrib.auth.models import User


class DeliveryCrewMenuItemsTests(TestCase):    
   def test_GET_menu_items (self):
        request_user = User.objects.get_or_create(username='tenston3')[0]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION='Token ' + token)
        test_request = client.get('/api/menu-items/?format=json')
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 200)

   def test_POST_menu_items (self):
        request_user = User.objects.get_or_create(username='tenston3')[0]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION='Token ' + token)
        test_request = client.post('/api/menu-items/', {
                "title": "TestFramework",
                "price": 3.00,
                "featured": False,
                "category": {
                    "title": 5
                }, 
            }, format="json")
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 403)

class ManagerMenuItemsTests(TestCase):
   def test_GET_menu_items (self):
        request_user = User.objects.get_or_create(username='anunson17')[0]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION='Token ' + token)
        test_request = client.get('/api/menu-items/?format=json')
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 200)

   def test_POST_menu_items (self):
        request_user = User.objects.get_or_create(username='anunson17')[0]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION='Token ' + token)
        test_request = client.post('/api/menu-items/', {
                "title": "TestFramework",
                "price": 3.00,
                "featured": False,
                "category": {
                    "title": 5
                }, 
            }, format="json")
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 201)