from django.urls import path
from . import views
urlpatterns =[
    path("",views.index,name="index"),path("vac",views.vac,name="vac"),path("home",views.index,name="home")
]