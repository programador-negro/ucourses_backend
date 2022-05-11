from .views import courses, questions
from django.conf.urls import url, re_path

urlpatterns = [  # pylint: disable=C0103
    # ADD OR SEARCH USER // REGISTRAR Y CONSULTAR USUARIOS
    url('courses/', courses.as_view()),
    url('questions/', questions.as_view()),
    url('questions/<int:id>/', questions.as_view()),
]