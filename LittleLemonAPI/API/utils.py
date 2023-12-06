from rest_framework import status
from rest_framework.response import Response
from loguru import logger


def process_menu_item_update(body, serializer_class):
    logger.debug(body)
    if body is not None and body != {}:
        if body["title"] != " ":
            if body["price"] > 0.00:
                new_item = serializer_class()
                new_item.save()
            else:
                return Response(
                    {"ERROR": "price must be greater than 0.00"},
                    status=status.HTTP_400_BAD_REQUEST,
                )
        else:
            return Response(
                {"ERROR": "title key is required"}, status=status.HTTP_400_BAD_REQUEST
            )
    else:
        response = Response(
            {"ERROR": "POST body cannot be empty"}, status=status.HTTP_400_BAD_REQUEST
        )
        logger.debug(response)
        return response
