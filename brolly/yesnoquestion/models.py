import os
import random
import datetime
from datetime import timedelta
from django.utils import timezone
from django.db import models
from all_users.models import *
from guessedword.models import *

RESPONSE_TYPE = (
    ('yes', 'yes'),
    ('no', 'no'),
)


class YesNoQuestion(models.Model):

	question = models.CharField(blank = True, null = True, max_length = 500)
	responded = models.BooleanField(default = False)
	response = models.CharField(blank = True, null = True, max_length = 5, choices=RESPONSE_TYPE)
	guessedword =  models.ForeignKey('guessedword.GuessedWord', on_delete=models.CASCADE, blank = True, null = True)

	is_deleted = models.BooleanField(default = False)
	created_at = models.DateTimeField(null = True, blank = True, default = datetime.datetime.now)

	def __str__(self):
	    return str(self.question)

	class Meta:
	    verbose_name_plural = "YesNoQuestion"


class GuessedAnswer(models.Model):

	guessedanswer = models.CharField(blank = True, null = True, max_length = 500)
	guessedword =  models.ForeignKey('guessedword.GuessedWord', on_delete=models.CASCADE, blank = True, null = True)

	is_deleted = models.BooleanField(default = False)
	created_at = models.DateTimeField(null = True, blank = True, default = datetime.datetime.now)

	def __str__(self):
	    return str(self.guessedanswer)

	class Meta:
	    verbose_name_plural = "GuessedAnswer"



