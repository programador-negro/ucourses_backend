from email import utils
import json
import requests
from datetime import datetime as dt
from .utilities import utils

from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated

from django.core import serializers
from django.contrib.auth import authenticate
from django.conf import settings
from django.db import connection

from .models import Courses, Questions, Exam_Answers, Topics, Exams, User_Courses, User_Answers

class courses(APIView):
    def post(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            data = Courses.objects.all()
            return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class questions(APIView):
    def post(self, request):
        try:
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})

    def get_object(self, pk):
        try:
            return Questions.objects.get(pk=pk)
        except Questions.DoesNotExist:
            raise "doesn't exist"

    def get(self, request):
        try:
            
            data = Questions.objects.all()
            return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class exam_answers(APIView):
    def post(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class user(APIView):
    def post(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class topics(APIView):
    def post(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
class exams(APIView):
    def post(self, request):
        try:
            data = Exams.objects.all()
            return Response({'type': 'ok', 'detail': utils.json_serializer(data)})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})
    def get(self, request):
        try:
            
            return Response({'type': 'ok', 'detail': ''})
        except Exception as ex:
            return Response({'type': 'error', 'detail': ex})