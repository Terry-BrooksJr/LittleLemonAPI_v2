from . import models
from . import serializers
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status



# Create your views here.
class Cart(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Cart.objects.all()
    serializer_class = serializers.CartSerializer
    permission_classes = [IsAuthenticated]

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