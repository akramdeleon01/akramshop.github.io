from django import forms  
from akramshop_app.models import order  
  
class order_form(forms.ModelForm):  
    class Meta:  
        model = order
        fields = "__all__" 