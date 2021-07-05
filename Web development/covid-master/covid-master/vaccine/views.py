from django.shortcuts import render,HttpResponse
from .models import vaccines
import sqlite3,ast
from cowin_api import CoWinAPI
import json,threading
# Create your views here.
def details(n,age):
    district_id = str(n)
    date = '09-05-2021' 
    print(age) # Optional. Takes today's date by default
    min_age_limit = int(age)  # Optional. By default returns centers without filtering by min_age_limit
    cowin = CoWinAPI()
    available_centers = cowin.get_availability_by_district(district_id, date, min_age_limit)
    f = open("details.txt", "w")
    f.write(str(available_centers))
    f.close()
   
def get_data(sql):
    conn = sqlite3.connect('covid.db')
    #Creating a cursor object using the cursor() method
    cursor = conn.cursor()
    #Retrieving data 
    cursor.execute(sql)
    #Fetching 1st row from the table
    value = cursor.fetchall();
    #Commit your changes in the database
    conn.commit()
    #Closing the connection
    conn.close()
    return value
def index(request):
    return render(request,"info.html")
def vac(request):
    sql = "select state_name from states"
    lt,ls = [],[]
    states = get_data(sql)
    sql = "select district_name from districts"
    districts = get_data(sql)
    for i in range(len(states)):
        lt.append(states[i][0])
    for j in range(len(districts)):
        ls.append(districts[j][0])
    if request.method == "POST":
        state = request.POST['state']
        number = request.POST['num']
        district = request.POST['dist']
        age = request.POST['age']
        if age =="45+":
            age = 45
        elif age == "18-44":
            age = 18
        vaccine_name = request.POST['vaccine']
        sql = "select distinct district_id from districts where district_name ='"+district+"'"
        id = get_data(sql)
        id = id[0][0]
        x = threading.Thread(target=details,args=(id,age))
        x.start()
        f = open("details.txt", "r")
        res = ast.literal_eval(f.read())
        res = res.get('centers')
        datas = []
        for hos in res:
            aa = hos.get('sessions')
            for jj in aa:
                if(jj.get('vaccine')==vaccine_name):
                    datas.append({'date':jj.get('date'),'add':hos.get('address'),'hos':hos.get('name'),'aval':jj.get('available_capacity')})
        print(datas)
        while True:
            if x.is_alive() != True:
                return render(request,"vaccine2.html",{'send':datas})
    else:
        return render(request,"vaccine.html",{'state':lt,'dist':ls})