#from django.contrib import admin

from django.urls import path, include
from . import views

urlpatterns = [
    path('',views.home),
    path('DentCare',views.home),
    path('appointment',views.appointment),
    path('service',views.service),
    path('contact',views.contact),
    path('about',views.about),
    path('testimonial',views.testimonial)
 
]
