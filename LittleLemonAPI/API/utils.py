from rest_framework import status
from API.models import Category
from rest_framework.response import Response
from loguru import logger


def process_menu_item_update(body, serializer_class):
    logger.debug(body)
    if body is not None and body != {}:
        if body['title'] != " ":
            if body['price'] > 0.00:
                if body['category'] not in Category.CATEGORY.choices:
                    new_item = serializer_class()
                    new_item.save(body)
                else:
                    raise Response({"ERROR":"Category is an Enum Field and must Reference the correct key. Please make GET request to /api/category to get correct id values."}, status=status.HTTP_400_BAD_REQUEST)

            else:
                raise Response({"ERROR":"price must be greater than 0.00"}, status=status.HTTP_400_BAD_REQUEST)
        else: 
            raise Response({"ERROR": "title key is required"}, status=status.HTTP_400_BAD_REQUEST)
    else:
        response =  Response({"ERROR": "POST body cannot be empty"}, status=status.HTTP_400_BAD_REQUEST)
        logger.debug(response)
        raise response
            