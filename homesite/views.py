from django.shortcuts import render,redirect 
from django.http import HttpResponse
# Create your views here.

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='hms')
#print('Successfully connected to database')
cur = conn.cursor()

def home(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()
    cur.execute("SELECT * FROM `service`")
    service = cur.fetchall()
    cur.execute("SELECT * FROM `doctor`")
    doctor = cur.fetchall()
    #return list(data)
    # print(list(data))
    return render(request, 'index.html', {'about': about,'service' : service,'doctor' : doctor})


def appointment(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()
    cur.execute("SELECT * FROM `service`")
    service = cur.fetchall()
    cur.execute("SELECT * FROM `doctor`")
    doctor = cur.fetchall()
    #return list(data)
    # print(list(data))
    return render(request, 'appointment.html', {'about': about,'service' : service,'doctor' : doctor})

def service(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()
    cur.execute(" SELECT * FROM `service` LIMIT 50 OFFSET 2 ")
    service = cur.fetchall()
    cur.execute("SELECT * FROM `doctor`")
    doctor = cur.fetchall()

    cur.execute("SELECT * FROM `service` LIMIT 2")
    service2 = cur.fetchall()
    #return list(data)
    print(list(service2))
    # return render(request, 'test.html', {'about': about,'service' : service,'doctor' : doctor,'service2' :service2})
    return render(request, 'service.html', {'about': about,'service' : service,'doctor' : doctor,'service2' :service2})


def contact(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()

    #return list(data)
    # print(list(data))
    return render(request, 'contact.html', {'about': about})


def about(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()

    #return list(data)
    # print(list(data))
    return render(request, 'about.html', {'about': about})


def testimonial(request):
    cur.execute("SELECT * FROM `about`")
    about = cur.fetchall()
    cur.execute("SELECT * FROM `testimonial` where `testmonialSHOW` = 'yes'")
    testimonial = cur.fetchall()

    #return list(data)
    # print(list(data))
    return render(request, 'testimonial.html', {'about': about,'testimonial': testimonial})