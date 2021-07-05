from django.db import models
from covid import settings
# Create your models here.
class vaccines(models.Model):
    uchc = models.CharField(max_length=30) #zone
    address = models.CharField(max_length=80)
    nodal_officer = models.CharField(max_length=40)
    number = models.CharField(max_length=10)
    aval = models.CharField(max_length=6)
class oxygen(models.Model):
    vender_name = models.CharField(max_length=30)
    num = models.CharField(max_length=10)
    aval = models.CharField(max_length=6)
    area = models.CharField(max_length=80)