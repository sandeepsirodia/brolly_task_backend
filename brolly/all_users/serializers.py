from rest_framework import serializers

from all_users.models import *


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('pk', 'name', 'user_type', 'in_game')

