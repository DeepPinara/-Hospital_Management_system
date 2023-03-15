import datetime
from datetime import date
from django.shortcuts import render,redirect 
from django.http import HttpResponse
# Create your views here.

import mysql.connector as mcdb
conn = mcdb.connect(host="localhost", user="root", passwd="", database='hms')
#print('Successfully connected to database')
cur = conn.cursor()




def login(request):
    if request.method == 'POST':
        adminNAME = request.POST['adminNAME']
        adminPASSWORD = request.POST['adminPASSWORD']
        cur.execute("SELECT * FROM `admin` where adminNAME='{}' and adminPASSWORD='{}'".format(adminNAME,adminPASSWORD))
        admin = cur.fetchall()

        if not admin:
            return render(request, 'login.html')
        else:
            request.session['adminID'] = admin[0]
            return redirect(dashboard) 
    else:
        return render(request, 'login.html')

def logout(request):
    if 'adminID' in request.session:
        del request.session['adminID']
    return render(request, 'login.html')

def dashboard(request):
    if 'adminID' in request.session:
        adminID = request.session.get('adminID')
        cur.execute("SELECT * FROM `admin` where adminID='{}'".format(adminID[0]))
        admin = cur.fetchall()

        cur.execute("SELECT COUNT(`doctorID`) FROM `doctor`")
        doctorcount = cur.fetchall()
        cur.execute("SELECT COUNT(`patientID`) FROM `patient` WHERE `patientDATE`=CURRENT_DATE()")
        appointment = cur.fetchall()
        #return list(data)
        # print(list(data))
        return render(request, 'dashboard.html',{'doctorcount': doctorcount,'admin':admin,'appointment':appointment})
    else:
        return redirect(login) 
        

def inD(request):
    return render(request, 'insertdoctor.html')


def viD(request):
    cur.execute("SELECT * FROM `doctor`")
    doctor = cur.fetchall()
    return render(request, 'viewdoctor.html',{'doctor': doctor})


def viA(request):
    index = 0
    cur.execute("SELECT * FROM `patient` WHERE `patientDATE`=CURRENT_DATE()")
    patient = cur.fetchall()
    return render(request, 'viewappointment.html',{'patient': patient,'index' :index})


def viP(request):
    cur.execute("SELECT * FROM `patient` p INNER JOIN service s on p.patientSERVICEID=s.serviceID INNER join doctor d on p.patientDOCTORID=d.doctorID ")
    patient = cur.fetchall()
    return render(request, 'viewpatient.html',{'patient': patient})


def viS(request):
    cur.execute("SELECT * FROM `service`")
    service = cur.fetchall()
    return render(request, 'viewservice.html',{'service': service})

def inS(request):
    return render(request, 'insertservice.html')



def dlogin(request):
    if request.method == 'POST':
        EMAIL = request.POST['EMAIL']
        PASSWORD = request.POST['PASSWORD']

        cur.execute("SELECT doctorID FROM `doctor` where doctorEMAIL='{}' and doctorPASSWORD='{}'".format(EMAIL,PASSWORD))
        doctor = cur.fetchall()

        if not doctor:
            cur.execute("SELECT receptionistID FROM `receptionist` where receptionistEMAIL='{}' and receptionistPASSWORD='{}'".format(EMAIL,PASSWORD))
            receptionist = cur.fetchall()
            if not receptionist:
                return render(request, 'doctorlogin.html')
            else:
                 request.session['receptionistID'] = receptionist[0]
                 return redirect(ddashboard) 
        else:
             request.session['doctorID'] = doctor[0]
             return redirect(ddashboard) 
    else:
        return render(request,'doctorlogin.html')


def ddashboard(request):

    doctorID = request.session.get('doctorID')
    receptionistID = request.session.get('receptionistID')
    cur.execute("SELECT COUNT(`doctorID`) FROM `doctor`")
    doctorcount = cur.fetchall()
    cur.execute("SELECT COUNT(`patientID`) FROM `patient` WHERE `patientDATE`=CURRENT_DATE()")
    appointment = cur.fetchall()
    cur.execute("SELECT COUNT(`patientID`) FROM `patient`")
    patientcount = cur.fetchall()
    print(appointment)
    if not doctorID:
       cur.execute("SELECT * FROM `receptionist` where receptionistID='{}'".format(receptionistID[0]))
       receptionist = cur.fetchall()
       return render(request, 'rdashboard.html',{'receptionist':receptionist,'doctorcount': doctorcount,'appointment':appointment,'patientcount':patientcount})
    else:
       cur.execute("SELECT * FROM `doctor` where doctorID='{}'".format(doctorID[0]))
       doctor = cur.fetchall()
       return render(request, 'ddashboard.html',{'doctor':doctor,'doctorcount': doctorcount,'appointment':appointment,'patientcount':patientcount})



def drlogout(request):
    
    if 'doctorID' in request.session:
        del request.session['doctorID']
    if 'receptionistID' in request.session:
        del request.session['receptionistID']

    return render(request,'doctorlogin.html')


def viAR(request):
    cur.execute("SELECT * FROM `patient` p INNER JOIN service s on p.patientSERVICEID=s.serviceID INNER join doctor d on p.patientDOCTORID=d.doctorID WHERE p.patientDATE=CURRENT_DATE();")
    patient = cur.fetchall()
    return render(request,'viewRappointment.html',{'patient': patient})

def inAR(request):
    if request.method == 'POST':
        patientSERVICEID=request.POST['patientSERVICEID']
        patientDOCTORID=request.POST['patientDOCTORID']
        patientNAME=request.POST['patientNAME']
        patientEMAIL=request.POST['patientEMAIL']
        patientCONSULTANCYFEES=request.POST['patientCONSULTANCYFEES']
        patientGENDER=request.POST['patientGENDER']
        patientHEIGHT=request.POST['patientHEIGHT']
        patientWEIGHT=request.POST['patientWEIGHT']
        patientAGE=request.POST['patientAGE']
        patientPHONE=request.POST['patientPHONE']
        patientOFFERID=request.POST['patientOFFERID']
        patientDATE=request.POST['patientDATE']
        patientTIMEING=request.POST['patientTIMEING']
        patientONILNE_OFFLINE=1
        patientADDRESS=request.POST['patientADDRESS']

        # x=(patientSERVICEID,patientDOCTORID,patientNAME,patientEMAIL,patientCONSULTANCYFEES,patientGENDER,patientHEIGHT,patientWEIGHT,patientAGE,patientPHONE,patientOFFERID,patientDATE,patientTIMEING,patientONILNE_OFFLINE,patientADDRESS)
    
        # cur.execute("INSERT INTO `patient`(`patientSERVICEID`, `patientDOCTORID`, `patientNAME`, `patientEMAIL`, `patientCONSULTANCYFEES`, `patientGENDER`, `patientHEIGHT`, `patientWEIGHT`, `patientAGE`, `patientPHONE`, `patientOFFERID`, `patientDATE`, `patientTIMEING`, `patientONILNE_OFFLINE`, `patientADDRESS`) VALUES ('{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}','{}')".format(patientSERVICEID,patientDOCTORID,patientNAME,patientEMAIL,patientCONSULTANCYFEES,patientGENDER,patientHEIGHT,patientWEIGHT,patientAGE,patientPHONE,patientOFFERID,patientDATE,patientTIMEING,patientONILNE_OFFLINE,patientADDRESS))
        # conn.commit()
        return render(request,'test.html',{'patientPHONE':patientPHONE})
        return redirect(viAR)

    cur.execute("SELECT * FROM `service` WHERE `serviceSHOW`=1")
    service = cur.fetchall()
    cur.execute("SELECT * FROM `doctor`")
    doctor = cur.fetchall()
    cur.execute("SELECT * FROM `offer`WHERE `offerSHOW`=1")
    offer = cur.fetchall()
    x = datetime.datetime.now()
    currentdate=x.strftime("%Y-%m-%d")
    # print(x.strftime("%d-%m-%Y"))
    return render(request,'insertappointment.html',{'service':service,'doctor':doctor,'offer':offer,'currentdate':currentdate})


def viAD(request):
    cur.execute("SELECT * FROM `patient` p INNER JOIN service s on p.patientSERVICEID=s.serviceID INNER join doctor d on p.patientDOCTORID=d.doctorID WHERE p.patientDATE=CURRENT_DATE();")
    patient = cur.fetchall()
    return render(request,'viewDappointment.html',{'patient': patient}) 