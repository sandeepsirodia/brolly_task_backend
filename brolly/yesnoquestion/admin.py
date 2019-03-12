from django.contrib import admin
from django_summernote.admin import SummernoteModelAdmin, SummernoteInlineModelAdmin
from super_inlines.admin import SuperInlineModelAdmin, SuperModelAdmin
from .models import *

        
class YesNoQuestionAdmin(SuperModelAdmin, SummernoteModelAdmin):
    model = YesNoQuestion
    list_display = ['pk', 'question', 'responded', 'response', 'guessedword']

        
class GuessedAnswerAdmin(SuperModelAdmin, SummernoteModelAdmin):
    model = GuessedAnswer
    list_display = ['pk', 'guessedanswer', 'guessedword']

 

admin.site.register(YesNoQuestion, YesNoQuestionAdmin)
admin.site.register(GuessedAnswer, GuessedAnswerAdmin)

