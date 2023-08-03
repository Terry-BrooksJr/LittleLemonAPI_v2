from django.contrib.auth.models import Group
from rest_framework import permissions


def _is_in_group(user, group_name):
    """
    Takes a user and a group name, and returns `True` if the user is in that group.
    """
    try:
        return Group.objects.get(name=group_name).user_set.filter(id=user.id).exists()
    except Group.DoesNotExist:
        return None


def _has_group_permission(user, required_groups):
    return any([_is_in_group(user, group_name) for group_name in required_groups])
