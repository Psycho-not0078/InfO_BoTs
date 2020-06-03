
from .models import User
from django.db.models import *

def Api_Start(data):
    status={}
    if(data['Action']=="Sign_In"):
        status=Sign_In(data)
    #elif(data['Action']=="Sign_Up"):
    #    status=Sign_Up(data)
    elif(data['Action']=="Verify"):
        status=Verify(data)
    elif(data['Action']=="Renew"):
        status=Renew(data)

    return status



def Renew(data):
    status={}

    return status

def Verify(data):
    status={}

    return status

#def Sign_Up(data):
#    status={}
#    Sign_Up=User.make(username=data['Username'],passwd=data['Password'],name=)
#    return status


def Sign_In(data):
    status={}
    qu=Count(Case(When(Q(username__exact=data['Username']) | Q(password__exact=data['Password']),then=1)))
    if(qu==1):
        status['status']=1
        usr=User.objects.filter(Q(username__exact=data['Username'])|Q(password__exact=data['Username']))
        


    return status

def Msg(data):
    status={}

    return status


def Profile_Edit(data):
    status={}

    return status


