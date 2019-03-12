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
from .serializers import *

class UserViewSet(viewsets.ViewSet):

	@list_route(methods = ['post'])
	def all_users(self, request):
		response = {}
		token = request.data["token"]

		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			all_users_list = User.objects.filter(is_deleted=False, in_game=False).exclude(name=user.name)
			serializer = UserSerializer(all_users_list, many = True).data
			response["result"] = 1
			response["token"] = token
			response["data"] = serializer
			return Response(response, status=status.HTTP_200_OK)
		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	@list_route(methods = ['post'])
	def login(self, request):
		response = {}
		password = request.data["password"]
		name = request.data["name"]

		if User.objects.filter(password = password, name = name, is_deleted=False).exists():
			user = User.objects.get(password = password, name = name, is_deleted=False)
		else:
			response["result"] = 0
			response["errors"] = ["user doesn't exists"]
			return Response(response, status=status.HTTP_200_OK)

		user_token = UserToken(user = user)
		user_token.save()

		serializer = UserSerializer(user, many = False).data

		response["result"] = 1
		response["token"] = user_token.token
		response["data"] = serializer

		return Response(response, status=status.HTTP_200_OK)


	@list_route(methods = ['post'])
	def verify_user(self, request):
		response = {}
		token = request.data["token"]

		if UserToken.objects.filter(token = token).exists():
			User = UserToken.objects.get(token = token).user
			serializer = UserSerializer(User, many = False).data
			response["result"] = 1
			response["token"] = token
			response["data"] = serializer
			return Response(response, status=status.HTTP_200_OK)
		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	



	@list_route(methods = ['post'])
	def logout(self, request):
		response = {}
		token = request.data["token"]

		if UserToken.objects.filter(token = token).exists():
			UserToken.objects.get(token = token).delete()
			response["result"] = 1
			response["message"] = "logout succesfullt"
			return Response(response, status=status.HTTP_200_OK)
		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	

	
	@list_route(methods = ['post'])
	def register(self, request):
		response = {}
		print(request)
		print(request.data)
		name = request.data["name"]
		password = request.data["password"]
		re_password = request.data["repassword"]

		if password == re_password:
			if not User.objects.filter(name = name, is_deleted = False).exists():
				user = User(name = name, password=password)
				user.save()
				User_token = UserToken(user = user)
				User_token.save()

				serializer = UserSerializer(user, many = False).data

				response["result"] = 1
				response["token"] = User_token.token
				response["data"] = serializer
				return Response(response, status=status.HTTP_200_OK)

			else:
				response["result"] = 0
				response["errors"] = ["name already exists"]
				return Response(response, status=status.HTTP_200_OK)
		else:
			response["result"] = 0
			response["errors"] = ["Password doesn't matched"]
			return Response(response, status=status.HTTP_200_OK)

