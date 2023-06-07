import models
import serializers
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated


# Create your views here.
class Cart(generics.RetrieveUpdateDestroyAPIView):
    queryset = models.Cart.objects.all()
    serializer_class = serializers.CartSerializer
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        return (
            Cart.objects.all()
            .filter(user=self.request.user)
            .select_related("menuitems")
        )
