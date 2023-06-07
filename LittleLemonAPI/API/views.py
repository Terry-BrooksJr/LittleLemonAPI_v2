from . import models
from . import serializers
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework import status




# Create your views here.
class Cart(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Cart.objects.all()
    serializer_class = serializers.CartSerializer
    permission_classes = (IsAuthenticated)

    def get_queryset(self):
        return Response(
            models.Cart.object.all()
            .filter(user=self.request.user)
            .select_related("menuitems"), status=status.HTTP_200_OK
        )
    def put(self, request):
        serializer = serializers.CartSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            ic(dir(serializer))
            return Response(serializer.data, status=status.HTTP_200_OK)
        else: 
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    def delete(self):
        pass

class ActivateUser(generics.GenericAPIView):
    
    def get(self, request, uid, token, format = None):
        payload = {'uid': uid, 'token': token}

        url = "http://localhost:8000/api/auth/users/activation/"
        response = requests.post(url, data = payload)

        if response.status_code == 204:
            return Response({}, response.status_code)
        else:
            return Response(response.json())
#Class based view to register user
class RegisterUserAPIView(generics.CreateAPIView):
  permission_classes = (AllowAny,)
  serializer_class = serializers.RegisterSerializer



