from django.test import TestCase, TransactionTestCase
from rest_framework.test import APITestCase, RequestsClient
from requests.auth import HTTPBasicAuth
from rest_framework import status
from LittleLemonAPI.settings import ic

# Create your tests here.
class UserRegistration(TestCase):
    client = RequestsClient()
    def UserRegistrationTest_HappyPath(self):
        test_request = self.client.post('/api/users/', {"username":"TestyMcTesterson", "password":"AisleNeverTell", "email": "Testing@Test.com"}, format='json')
        ic(test_request)
        self.assertEqual(test_request.status_code, status.HTTP_201_CREATED)
