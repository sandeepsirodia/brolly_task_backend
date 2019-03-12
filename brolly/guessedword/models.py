import os
import random
import datetime
from datetime import timedelta
from django.utils import timezone
from django.db import models
from all_users.models import *


class GuessedWord(models.Model):

	word = models.CharField(blank = True, null = True, max_length = 50)
	asker =  models.ForeignKey('all_users.User', on_delete=models.CASCADE, blank = True, null = True, related_name='asker')
	guesser =  models.ForeignKey('all_users.User', on_delete=models.CASCADE, blank = True, null = True, related_name='guesser')
	winner =  models.ForeignKey('all_users.User', on_delete=models.CASCADE, blank = True, null = True, related_name='winner')
	completed = models.BooleanField(default = False)
	ended_asker = models.BooleanField(default = False)
	ended_guesser = models.BooleanField(default = False)

	is_deleted = models.BooleanField(default = False)
	created_at = models.DateTimeField(null = True, blank = True, default = datetime.datetime.now)

	def __str__(self):
	    return str(self.word)

	class Meta:
	    verbose_name_plural = "GuessedWord"
