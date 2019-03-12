import os
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

SECRET_KEY = 'vf-u%bj@f(ytd))6bi*3@*pxdo*fcp^=_$bddapf034njp_w$7'

DATABASES = {
   'default': {
      'ENGINE': 'django.db.backends.mysql',
      'NAME': 'miglig',
      'USER': 'miglig',
      'PASSWORD': 'testing',
      'HOST': 'localhost',
      'PORT': '',
   }
}

CORS_ORIGIN_ALLOW_ALL = True
# CORS_ALLOW_HEADERS = (
#     'accept',
#     'accept-encoding',
#     'authorization',
#     'content-type',
#     'dnt',
#     'origin',
#     'user-agent',
#     'x-csrftoken',
#     'x-requested-with',
# )
# CORS_ORIGIN_WHITELIST = [
#     'http://127.0.0.1:8000',
#     'http://127.0.0.1:3000',
#     'localhost:4200',
#     'localhost:3000',
#     'http://localhost:4200',
#     'http://localhost:3000',
#     'localhost:8000',
#     'localhost:3000',
#     'localhost',
#     'http://127.0.0.1',
# ]

STATIC_ROOT =  os.path.join(BASE_DIR, 'static')