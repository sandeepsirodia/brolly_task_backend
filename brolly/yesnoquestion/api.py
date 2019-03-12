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
from guessedword.serializers import *
from .serializers import *
from .models import *

class YesNoQuestionViewSet(viewsets.ViewSet):

	@list_route(methods = ['post'])
	def list_guessed_words(self, request):
		response = {}
		token = request.data["token"]
		co_user_id = request.data["co_user_id"]
		guessed_answer = []
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if user.user_type == 'ask':
				if GuessedWord.objects.filter(asker=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(asker=user, completed=False, is_deleted=False)	
					guessed_answer = GuessedAnswer.objects.filter(guessedword=guessedword, is_deleted=False)
			
			elif user.user_type == 'guess':
				if GuessedWord.objects.filter(guesser=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(guesser=user, completed=False, is_deleted=False)	
					guessed_answer = GuessedAnswer.objects.filter(guessedword=guessedword, is_deleted=False)			

			else:
				response["result"] = 0
				response["errors"] = ["user type is not set"]
				return Response(response, status=status.HTTP_200_OK)

			serializer = GuessedAnswerSerializer(guessed_answer, many = True).data
			response["result"] = 1
			response["data"] = serializer
			return Response(response, status=status.HTTP_200_OK)

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	

	@list_route(methods = ['post'])
	def list_question_guessed_words(self, request):
		response = {}
		token = request.data["token"]
		guessed_answer = []
		yes_no_question = []
		guessedword = {}
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if user.user_type == 'ask':
				if GuessedWord.objects.filter(asker=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(asker=user, completed=False, is_deleted=False)	
					guessed_answer = GuessedAnswer.objects.filter(guessedword=guessedword, is_deleted=False)
					yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, is_deleted=False)
					response["guess_word_id"] = guessedword.pk
				elif GuessedWord.objects.filter(asker=user, completed=True, ended_asker=False, is_deleted=False).exists():
					guessed_word_latest = GuessedWord.objects.filter(asker=user, completed=True, ended_asker=False, is_deleted=False)[0]
					response["winner"] = str(guessed_word_latest.winner.name)
					response["guess_word_id"] = guessed_word_latest.pk
			
			elif user.user_type == 'guess':
				if GuessedWord.objects.filter(guesser=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(guesser=user, completed=False, is_deleted=False)	
					guessed_answer = GuessedAnswer.objects.filter(guessedword=guessedword, is_deleted=False)
					yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, is_deleted=False)
					response["guess_word_id"] = guessedword.pk
				elif GuessedWord.objects.filter(guesser=user, completed=True, ended_guesser=False, is_deleted=False).exists():
					guessed_word_latest = GuessedWord.objects.filter(guesser=user, completed=True, ended_guesser=False, is_deleted=False)[0]
					response["winner"] = str(guessed_word_latest.winner.name)
					response["guess_word_id"] = guessed_word_latest.pk


			else:
				response["result"] = 0
				response["errors"] = ["user type is not set"]
				return Response(response, status=status.HTTP_200_OK)

			questionserializer = YesNoQuestionSerializer(yes_no_question, many = True).data
			guesswordserializer = GuessedAnswerSerializer(guessed_answer, many = True).data
			response["result"] = 1
			response["all_question"] = questionserializer
			response["all_answer"] = guesswordserializer
			response["can_ask_question"] = True
			
			if YesNoQuestion.objects.filter(guessedword=guessedword, responded=False, is_deleted=False).exists():
				response["can_ask_question"] = False
			if len(YesNoQuestion.objects.filter(guessedword=guessedword, responded=True, is_deleted=False)) >= 20:
				response["can_ask_question"] = False
			
			return Response(response, status=status.HTTP_200_OK)

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	

	@list_route(methods = ['post'])
	def submit_answer(self, request):
		response = {}
		token = request.data["token"]
		guess_answer = request.data["guess_answer"]
		guess_word_id = request.data["guess_word_id"]
		guessed_answer = []
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if GuessedWord.objects.filter(pk=guess_word_id, completed=False, is_deleted=False).exists():
				guessed_word = GuessedWord.objects.get(pk=guess_word_id, completed=False, is_deleted=False)	
				if not GuessedAnswer.objects.filter(guessedword=guessed_word, guessedanswer=guess_answer, is_deleted=False).exists():
					if guess_answer.lower() == guessed_word.word.lower():
						guessed_word.completed = True
						guessed_word.winner = user
						guessed_word.save()
						response["result"] = 2
						response["winner"] = str(guessed_word.winner.name)
						return Response(response, status=status.HTTP_200_OK)
					guessed_answer = GuessedAnswer(guessedword=guessed_word, guessedanswer=guess_answer)
					guessed_answer.save()

					if len(YesNoQuestion.objects.filter(guessedword__pk=guess_word_id, is_deleted=False)) == 20:
						guessed_word.completed = True
						guessed_word.winner = guessed_word.asker
						guessed_word.save()
						response["result"] = 2
						response["winner"] = str(guessed_word.winner.name)
						return Response(response, status=status.HTTP_200_OK)
				else:
					response["result"] = 0
					response["errors"] = ["answer already exist"]
					return Response(response, status=status.HTTP_200_OK)							

			else:
				response["result"] = 0
				response["errors"] = ["game doesnot exists"]
				return Response(response, status=status.HTTP_200_OK)

			response["result"] = 1
			return Response(response, status=status.HTTP_200_OK)

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	@list_route(methods = ['post'])
	def end_game(self, request):
		response = {}
		token = request.data["token"]
		guessed_answer = []
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if user.user_type == 'ask':
				guessed_word_latest = GuessedWord.objects.get(asker=user, completed=True, ended_asker=False, is_deleted=False)
				guessed_word_latest.ended_asker = True
				guessed_word_latest.save()
			elif user.user_type == 'guess':
				guessed_word_latest = GuessedWord.objects.get(guesser=user, completed=True, ended_guesser=False, is_deleted=False)
				guessed_word_latest.ended_guesser = True
				guessed_word_latest.save()
			user.in_game = False
			user.save()
			response["result"] = 1
			return Response(response, status=status.HTTP_200_OK)

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	@list_route(methods = ['post'])
	def list_questions(self, request):
		response = {}
		token = request.data["token"]
		yes_no_question = {}
		responded_yes_no_question = []
		guessedword={}
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			if user.user_type == 'ask':
				if GuessedWord.objects.filter(asker=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(asker=user, completed=False, is_deleted=False)	
					responded_yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, responded=True, is_deleted=False)
					yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, responded=False, is_deleted=False)	
				elif GuessedWord.objects.filter(asker=user, completed=True, ended_asker=False, is_deleted=False).exists():
					guessed_word_latest = GuessedWord.objects.filter(asker=user, completed=True, ended_asker=False, is_deleted=False)[0]
					response["winner"] = str(guessed_word_latest.winner.name)
					response["guess_word_id"] = guessed_word_latest.pk		
			
			elif user.user_type == 'guess':
				if GuessedWord.objects.filter(guesser=user, completed=False, is_deleted=False).exists():
					guessedword = GuessedWord.objects.get(guesser=user, completed=False, is_deleted=False)	
					responded_yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, responded=True, is_deleted=False)
					yes_no_question = YesNoQuestion.objects.filter(guessedword=guessedword, responded=False, is_deleted=False)	
				elif GuessedWord.objects.filter(guesser=user, completed=True, ended_guesser=False, is_deleted=False).exists():
					guessed_word_latest = GuessedWord.objects.filter(guesser=user, completed=True, ended_guesser=False, is_deleted=False)[0]
					response["winner"] = str(guessed_word_latest.winner.name)
					response["guess_word_id"] = guessed_word_latest.pk		

			else:
				response["result"] = 0
				response["errors"] = ["user type is not set"]
				return Response(response, status=status.HTTP_200_OK)

			responded_serializer = YesNoQuestionSerializer(responded_yes_no_question, many = True).data
			response["result"] = 1
			response["data"] = {}
			response["data"]["guessed_word"] = GuessedWordSerializer(guessedword, many=False).data
			response["data"]["responded_yes_no_question"] = responded_serializer
			if yes_no_question:
				serializer = YesNoQuestionSerializer(yes_no_question, many =True).data
				print('serializer', serializer)
				response["data"]["yes_no_question"] = serializer
			return Response(response, status=status.HTTP_200_OK)

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	@list_route(methods = ['post'])
	def ask_question(self, request):
		response = {}
		token = request.data["token"]
		guess_word_id = request.data["guess_word_id"]
		question = request.data["question"]
		print('guess_word_id', guess_word_id)
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			
			if GuessedWord.objects.filter(pk=guess_word_id, is_deleted=False).exists():
				guess_word = GuessedWord.objects.get(pk=guess_word_id, is_deleted=False)
				if len(YesNoQuestion.objects.filter(guessedword__pk=guess_word_id, is_deleted=False)) < 20:
					if YesNoQuestion.objects.filter(guessedword__pk=guess_word_id, responded=False, is_deleted=False).exists():
						response["result"] = 0
						response["errors"] = ["you can ask one question at a time"]
						return Response(response, status=status.HTTP_200_OK)

					yes_no_question = YesNoQuestion(guessedword=guess_word, question=question)
					yes_no_question.save()

					response["result"] = 1
					response["data"] = ["successfully asked question"]
					return Response(response, status=status.HTTP_200_OK)
				else:
					response["result"] = 0
					response["errors"] = ["already asked 20 question"]
					return Response(response, status=status.HTTP_200_OK)	
			else:
				response["result"] = 0
				response["errors"] = ["either game is over"]
				return Response(response, status=status.HTTP_200_OK)	

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	

	
	@list_route(methods = ['post'])
	def respond_to_question(self, request):
		response = {}
		token = request.data["token"]
		given_response = request.data["given_response"]
		question_id = request.data["question_id"]
		print('given_response', given_response)
		if UserToken.objects.filter(token = token).exists():
			user = UserToken.objects.get(token = token).user
			
			if YesNoQuestion.objects.filter(pk=question_id, is_deleted=False).exists():
				yes_no_question = YesNoQuestion.objects.get(pk=question_id, is_deleted=False)
				yes_no_question.response = given_response
				yes_no_question.responded = True
				yes_no_question.save()
				print('YesNoQuestion')

				response["result"] = 1
				response["data"] = ["successfully responded to question"]
				return Response(response, status=status.HTTP_200_OK)
				
			else:
				response["result"] = 0
				response["errors"] = ["either game is over"]
				return Response(response, status=status.HTTP_200_OK)	

		else:
			response["result"] = 0
			response["errors"] = ["Invalid token"]
			return Response(response, status=status.HTTP_200_OK)	


	