from django.contrib import admin
from django_summernote.admin import SummernoteModelAdmin, SummernoteInlineModelAdmin
from super_inlines.admin import SuperInlineModelAdmin, SuperModelAdmin
from .models import *

        
class UserAdmin(SuperModelAdmin, SummernoteModelAdmin):
    model = User
    list_display = ['pk', 'name']

        
class UserTokenAdmin(SuperModelAdmin, SummernoteModelAdmin):
    model = UserToken
    list_display = ['pk', 'user', 'token']

 

admin.site.register(User, UserAdmin)
admin.site.register(UserToken, UserTokenAdmin)

