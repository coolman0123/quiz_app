from django.db import models

class Quiz(models.Model):
    title = models.CharField(max_length=200)
    body = models.TextField()
    answer = models.IntegerField()

#quiz 모델 생성 
#serializer 장고의 모델형태 데이터를 json형태로 직렬화 해줌
#api 통신을 위해 json으로 바꿔야함
