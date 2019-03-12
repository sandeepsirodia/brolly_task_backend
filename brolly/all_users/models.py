import os
import random
import datetime
from datetime import timedelta
from django.utils import timezone
from django.db import models
# from django.contrib.auth.models import User

USER_TYPE = (
    ('ask', 'ask'),
    ('guess', 'guess'),
)

class User(models.Model):

    name = models.CharField(blank = True, null = True, max_length = 50)
    password = models.CharField(blank = True, max_length = 100)
    user_type = models.CharField(max_length = 100, choices=USER_TYPE, blank = True, null = True)
    in_game = models.BooleanField(default = False)

    is_deleted = models.BooleanField(default = False)
    created_at = models.DateTimeField(null = True, blank = True, default = datetime.datetime.now)

    def __str__(self):
        return str(self.name)

    class Meta:
        verbose_name_plural = "User"


class UserToken(models.Model):
    """(Tokens reside here)"""
    user = models.ForeignKey('User', on_delete=models.CASCADE,)
    token  = models.CharField(blank = True, max_length = 100)
    created_at = models.DateTimeField(null=True, blank = True, default = datetime.datetime.now)

    def save(self, *args, **kwargs):
        self.token = "".join([random.choice("abcdefghijklmnopqrstuvwxyz1234567890") for i in range(32)])
        super(UserToken, self).save(*args, **kwargs)

    def __unicode__(self):
        return self.token

    class Meta:
        verbose_name_plural = "Tokens"





