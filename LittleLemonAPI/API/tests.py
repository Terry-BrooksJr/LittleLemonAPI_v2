from django.test import TestCase, TransactionTestCase
from loguru import logger
from requests.auth import HTTPBasicAuth
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.test import APIClient, APITestCase, RequestsClient
from django.contrib.auth.models import LittleLemoner, Group
from API.permissions import _is_in_group
import logging
from django.test import TestCase
from rest_framework.test import APIClient


class DeliveryCrewMenuItemsTests(TestCase):
    def setUp(self):
        # Set up the necessary variables and authentication token
        request_user = LittleLemoner.objects.get_or_create(username="DeliveryCrewUser")[
            0
        ]
        self.logger = logging.getLogger(__name__)
        self.token = Token.objects.get_or_create(user=request_user)[0].key

    def test_GET_menu_items(self):
        request_user = LittleLemoner.objects.get_or_create(username="DeliveryCrewUser")[
            0
        ]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION="Token " + token)
        test_request = client.get("/api/menu-items/?format=json")
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 200)

    def test_POST_menu_itemsblack(self):
        request_user = LittleLemoner.objects.get_or_create(username="DeliveryCrewUser")[
            0
        ]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION="Token " + token)
        test_request = client.post(
            "/api/menu-items/",
            {
                "title": "TestFramework",
                "price": 3.00,
                "featured": False,
                "category": {"title": 5},
            },
            format="json",
        )
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 403)


class ManagerMenuItemsTests(TestCase):
    def createUser(self) -> LittleLemoner:
        group_name = "Manager"
        self.group = Group(name=group_name)
        self.group.save()
        request_user = LittleLemoner.objects.get_or_create(username="ManagerTestUser")[
            0
        ]
        request_user.groups.add(self.group)
        request_user.save()
        return request_user

    def test_GET_menu_items(self):
        request
        logger.debug(request_user.groups)
        logger.debug(token)
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION="Token " + token)
        test_request = client.get("/api/menu-items/?format=json")
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 200)

    def test_POST_menu_items(self):
        request_user = LittleLemoner.objects.get_or_create(username="ManagerTestUser")[
            0
        ]
        token = Token.objects.get_or_create(user=request_user)[0].key
        client = APIClient()
        client.credentials(HTTP_AUTHORIZATION="Token " + token)
        test_request = client.post(
            "/api/menu-items/",
            {
                "title": "TestFramework",
                "price": 3.00,
                "featured": False,
                "category": {"title": 5},
            },
            format="json",
        )
        logger.debug(test_request)
        self.assertEqual(test_request.status_code, 201)
