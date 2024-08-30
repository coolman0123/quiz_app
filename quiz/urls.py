from django.urls import path, include
from .views import startAPI, randomQuiz

#myapi urls > 전체 프로젝트 url 관리
#quiz urls > quiz app에 대한 url 관리
# django-cors-headers: cors에러 방지
# gunicorn: 배포를 위한 도구
# psycopg2-binary: heroku에서 사용하는 db인 postgresql 사용을 위한 것
# whitenoise: 정적 파일의 사용을 위한 미들 웨어
# dj-database-url: heroku에서 사용하는 db인 postgresql 사용을 위한 것

urlpatterns = [
    path("start/", startAPI),
    path("<int:id>/", randomQuiz),

]

