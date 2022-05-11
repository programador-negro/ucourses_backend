from dataclasses import field
from django.contrib import admin
from .models import Questions, Courses, Topics, Exams, Posible_Answers, User_Courses, User_Answers 

class QuestionsAdmin(admin.ModelAdmin):
    fields = (
        'question',
        'created_at',
        'updated_at'
    )

class CoursesAdmin(admin.ModelAdmin):
    fields = (
        'title',
        'duration',
        'author',
        'created_at',
        'updated_at'
    )
    list_display = (
        'title',
        'duration',
        'author',
        'created_at',
        'updated_at'
    )
class TopicsAdmin(admin.ModelAdmin):
    fields = (
        'course_id',
        'title',
        'content',
        'author',
        'created_at',
        'updated_at'
    )
class ExamsAdmin(admin.ModelAdmin):
    fields = (
        'title',
        'course_id',
        'time',
        'minimun_correct_answers',
        'created_at',
        'updated_at'
    )
class Posible_AnswersAdmin(admin.ModelAdmin):
    fields = (
        'question_id',
        'answer',
        'type',
        'created_at',
        'updated_at'
    )
class User_CoursesAdmin(admin.ModelAdmin):
    fields = (
        'user_id',
        'course_id',
        'course_state'
    )
class User_AnswersAdmin(admin.ModelAdmin):
    fields = (
        'user_id',
        'exam_id',
        'question_id',
        'answer_id'
    )



admin.site.register(Questions, QuestionsAdmin)
admin.site.register(Courses, CoursesAdmin)
admin.site.register(Topics, TopicsAdmin)
admin.site.register(Exams, ExamsAdmin)
admin.site.register(Posible_Answers, Posible_AnswersAdmin)
admin.site.register(User_Courses, User_CoursesAdmin)
admin.site.register(User_Answers, User_AnswersAdmin)