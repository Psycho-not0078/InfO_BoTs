from django.shortcuts import render
from django.http import HttpResponse
from . import functions

# Create your views here.
def index(request):
    response={}

    if request.method == "POST":
        data=request.POST.copy()
        data['Action']=request.headers['Action']
        if(data['Action']=="Sign_Up" or data['Action']=="Sign_In"):
            response=functions.Api_Start(data)
        
        else:
            if(data['Action']=="Profile_Edit"):
                response=functions.Profile_Edit(data)
            elif(data['Action']=="Msg"):
                response=functions.Msg(data)

        return HttpResponse(response)  


    elif request.method == "GET":

        return HttpResponse(response)   
 