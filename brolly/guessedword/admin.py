from django.contrib import admin
from django_summernote.admin import SummernoteModelAdmin, SummernoteInlineModelAdmin
from super_inlines.admin import SuperInlineModelAdmin, SuperModelAdmin
from .models import *
        
class GuessedWordAdmin(SuperModelAdmin, SummernoteModelAdmin):
    model = GuessedWord
    list_display = ['pk', 'word', 'asker', 'guesser', 'completed']

admin.site.register(GuessedWord, GuessedWordAdmin)

