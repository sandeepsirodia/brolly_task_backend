from rest_framework import serializers
from .models import *

class GuessedWordSerializer(serializers.ModelSerializer):
    class Meta:
        model = GuessedWord
        fields = ('pk', 'completed', 'word')
