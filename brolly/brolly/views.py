# from django.shortcuts import render
# from rest_framework_swagger.renderers import OpenAPIRenderer, SwaggerUIRenderer
# from rest_framework.decorators import api_view, renderer_classes
# from rest_framework import response, schemas
# from miglig import urls

# @api_view()
# @renderer_classes([SwaggerUIRenderer, OpenAPIRenderer])
# def schema_view(request):
#     generator = schemas.SchemaGenerator(title='Pastebin API', url='')
#     return response.Response(generator.get_schema())