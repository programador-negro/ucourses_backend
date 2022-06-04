from .views import practice, courses, questions, UserAuthentication, user, exams, topics, user_answers
from django.conf.urls import url
from rest_framework.urlpatterns import format_suffix_patterns

urlpatterns = [  # pylint: disable=C0103
    # ADD OR SEARCH USER // REGISTRAR Y CONSULTAR USUARIOS
    url('courses/', courses.as_view()),
    url('questions/', questions.as_view()),
    url('authentication/', UserAuthentication.as_view()),
    url('user/', user.as_view()),
    url('exams/', exams.as_view()),
    url('topics/', topics.as_view()),
    url('user-answers/', user_answers.as_view()),
    url('practice/', practice.as_view()),
]
urlpatterns = format_suffix_patterns(urlpatterns)