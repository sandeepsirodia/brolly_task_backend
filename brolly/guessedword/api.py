import hashlib

from django.contrib.auth.models import User

from django.contrib.auth import login as django_login
from django.utils.decorators import method_decorator

from django.contrib.auth import logout as auth_logout

from rest_framework import status, mixins
from rest_framework.permissions import IsAuthenticated, AllowAny, BasePermission

from rest_framework.authentication import TokenAuthentication, BasicAuthentication, SessionAuthentication
from rest_framework.decorators import detail_route, list_route
from rest_framework.response import Response
from rest_framework import viewsets
from .models import *

class GuessedWordViewSet(viewsets.ViewSet):

	@list_route(methods = ['post'])
	def start_game(self, request):
		response = {}
		token = request.data["token"]
		guesser_id = request.data["guesser_id"]
		guess_word = request.data["guess_word"]

		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if User.objects.filter(pk=guesser_id, is_deleted=False, in_game=False).exists():
				guesser = User.objects.get(pk=guesser_id, is_deleted=False, in_game=False)
				guessed_word = GuessedWord(word=guess_word, guesser=guesser, asker=user)
				guessed_word.save()
				guesser.user_type = 'guess'
				guesser.in_game = True
				guesser.save()
				user.in_game = True
				user.user_type = 'ask'
				user.save()
				response["result"] = 1
				response["data"] = "successfully started game"
				return Response(response, status=status.HTTP_200_OK)
			else:
				response["result"] = 0
				response["errors"] = ["User either in other game or not exist"]
				return Response(response, status=status.HTTP_200_OK)					
		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	