#from django.contrib import admin

from django.urls import path, include
from . import views

urlpatterns = [
    path('admi',views.login,name ="login"),
    path('Dashboard',views.dashboard,name="dashboard"), 
    path('logout',views.logout), 
    path('viD',views.viD), 
    path('inD',views.inD), 
    path('viP',views.viP), 
    path('viS',views.viS), 
    path('inS',views.inS), 
    path('viA',views.viA), 

    path('login',views.dlogin,name="dlogin"), 
    path('dashboard',views.ddashboard,name="ddashboard"), 
    path('drlogout',views.drlogout), 
    path('viAR',views.viAR,name="viAR"), 
    path('viAD',views.viAD,name="viAD"), 
    path('inAR',views.inAR), 

]
 