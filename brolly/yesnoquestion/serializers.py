from rest_framework import serializers
from guessedword.serializers import *
from .models import *


class GuessedAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = GuessedAnswer
        fields = ('pk', 'guessedanswer')


class YesNoQuestionSerializer(serializers.ModelSerializer):
	class Meta:
	    model = YesNoQuestion
	    fields = ('pk', 'question', 'responded', 'response')
