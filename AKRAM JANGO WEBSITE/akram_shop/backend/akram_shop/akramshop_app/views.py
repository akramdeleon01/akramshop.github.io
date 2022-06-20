from ast import And
from ctypes.wintypes import HFONT
import this
from django.shortcuts import render,redirect
from django.http import HttpResponse
from django.template import loader  
from akramshop_app.models import category as category_
from akramshop_app.models import product as product_
from akramshop_app.models import images as images_
from akramshop_app.models import color as color_
from akramshop_app.models import size as sizes_
from akramshop_app.models import order as order_
from decimal import Decimal as D
from django.db.models import Q
from .form import order_form
from django.core.mail import send_mail
from django.contrib import messages


#this code for get number itmes storge in session like itmes
def session_cart(request):
   if request.session.get('ID_product'):
      itmes = len(request.session.get('ID_product', False))
   else:
      itmes = 0

   return itmes

#this code for get all products and category and images to show in shop page
def all(request):
    itmes = session_cart(request)
    categorys = category_.objects.all()
    products = product_.objects.all()
    images = images_.objects.all()
    return render(request,"shop.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes})

#this code for get all products by category to show in shop page
def shop(request, id):
   itmes = session_cart(request)#we call this function for dispaly number products added in cart
   categorys = category_.objects.all()
   products = product_.objects.filter(id_category_id = id)
   images = images_.objects.all()
   return render(request,"shop.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes})

#this code for search in db using name product price rang and category
def search(request):

   p_name = "LIKE '%"+request.GET.get("name")+"'"  
   p_category = request.GET.get("id_cat")
   price1 = D(request.GET.get('min_price', 0)) 
   price2 = D(request.GET.get('max_price', 0))

   if  request.GET.get("id_cat") == 0:
      products = product_.objects.filter(name = p_name)
   else: 
      products = product_.objects.filter( Q(name = p_name) | Q(id_category_id = p_category))

   itmes = session_cart(request)#we call this function for dispaly number products added in cart
   categorys = category_.objects.all()
   images = images_.objects.all()
   return render(request,"shop.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes})

#this code for get all info about product like color size and images 
def product(request,id):
   itmes = session_cart(request)#we call this function for dispaly number products added in cart
   products = product_.objects.filter(id = id)
   categorys = category_.objects.all()
   colors = color_.objects.filter(id_product_id = id)
   sizes = sizes_.objects.filter(id_product_id = id)
   images = images_.objects.filter(id_product_id = id)
   return render(request,"detail_product.html",{'Category':categorys,'Product':products,'Image':images,'color':colors,'Size':sizes,"itmes":itmes})

#this code for all product and display in home page
def index(request):
    itmes = session_cart(request)#we call this function for dispaly number products added in cart
    categorys = category_.objects.all()
    products = product_.objects.all()
    images = images_.objects.all()
    return render(request,"index.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes})

#contact page
def contact(request):

    itmes = session_cart(request)#we call this function for dispaly number products added in cart
    categorys = category_.objects.all()
    return render(request,"contact.html",{'Category':categorys,"itmes":itmes})


#this code for send email conatct
def contactform(request):
    email = request.POST['Email']
    subject = request.POST['Subject']
    message = request.POST['message']
    messages.success(request, 'email send successful')
    send_mail(
      subject,
      message,
      email,
    [email],
    )
    return contact(request)
    

#this code for get all id storge in session and pass to cart page for show product py this IDs
def cart(request):
    saved_lis = request.session.get('ID_product')
    products = product_.objects.all()
    itmes = session_cart(request)#we call this function for dispaly number products added in cart
    categorys = category_.objects.all()
    images = images_.objects.all()
    return render(request,"cart.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes,"itmes_id":saved_lis})

#add to cart function for get id in url and store it in session
def add_to_cart(request,id):
      if not request.session.get('ID_product'):
         saved_list = []
         request.session['ID_product'] = [id]
         saved_list = request.session['ID_product']
      else:
         saved_list = request.session.get('ID_product')
         saved_list.append(id)
         request.session['ID_product'] = saved_list

      return cart(request)

#this code for clear session ids
def clear_cart(request):
    request.session.clear()
    itmes = session_cart(request)#we call this function for dispaly number products added in cart
    categorys = category_.objects.all()
    images = images_.objects.all()
    products = product_.objects.all()

    return render(request,"cart.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes})


#this code for get all id storge in session and pass to cart page for show product py this IDs
def CHECKOUT(request):
    saved_lis = request.session.get('ID_product')
    products = product_.objects.all()
    itmes = session_cart(request)#we call this function for dispaly number products added in cart
    categorys = category_.objects.all()
    images = images_.objects.all()
    return render(request,"checkout.html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes,"itmes_id":saved_lis})

def delete_itmes(request,id,url):
   saved_list = request.session.get('ID_product')

   for itmes in saved_list:
    if itmes == id:
      saved_list.remove(itmes)
      
   request.session['ID_product'] = saved_list
   products = product_.objects.all()
   itmes = session_cart(request)#we call this function for dispaly number products added in cart
   categorys = category_.objects.all()
   images = images_.objects.all()
   return render(request,url+".html",{'Category':categorys,'Product':products,'Image':images,"itmes":itmes,"itmes_id":saved_list})


def order(request):

      form = order_form(request.POST)
    
      name = request.POST["NAME"]
      address = request.POST["ADDRESS"]
      phone = request.POST["PHONE"]
      email = request.POST["EMAIL"]
      name_card = request.POST["NAME CART"]
      number_card = request.POST["NUMBER CART"]
      date_card = request.POST["DATE CART"]
      cvc = request.POST["CVC"]

      order_.objects.create(clinet_name = name, phone = phone,email = email,address = address,name_card = name_card,number_card = number_card,cvc_card = cvc,product_id = 2)

      send_mail(
      'AKRAM SHOP',
      'THANCK YOU FOR SHOP AT AKRAMSHOP',
      'akramshop@gmail.com',
      [email],
      )
    
      messages.success(request, 'Order successful')
      itmes = session_cart(request)#we call this function for dispaly number products added in cart
      categorys = category_.objects.all()
      return render(request,"thankyou.html",{'Category':categorys,"itmes":itmes})
 