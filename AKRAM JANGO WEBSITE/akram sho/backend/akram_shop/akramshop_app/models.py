from django.db import models

# Create your models here.

# table product
class product(models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()
    description = models.TextField(max_length=500)
    id_category = models.ForeignKey(
        "category", on_delete=models.CASCADE)

class images(models.Model):
    image = models.ImageField(upload_to=None, height_field=None, width_field=None, max_length=100)
    id_product = models.ForeignKey(
        "product", on_delete=models.CASCADE)

# table category
class category(models.Model):
    name = models.CharField(max_length=30)

# table size
class size(models.Model):
    name = models.CharField(max_length=10)
    id_product = models.ForeignKey(
        "product", on_delete=models.CASCADE)

# table color
class color(models.Model):
    name = models.CharField(max_length=30)
    color_code = models.CharField(max_length=20)
    id_product = models.ForeignKey(
        "product", on_delete=models.CASCADE)

# table order
class order(models.Model):
    clinet_name = models.CharField(max_length=70)
    phone = models.IntegerField()
    email = models.CharField(max_length=100)
    address = models.CharField(max_length=200)
    name_card = models.CharField(max_length=100)
    number_card = models.IntegerField()
    cvc_card = models.IntegerField()
    product = models.ForeignKey(
        "product", on_delete=models.CASCADE)

# table detail_order
class detail_order(models.Model):
        product = models.ForeignKey(
        "product", on_delete=models.CASCADE)
        size = models.ForeignKey(
        "size", on_delete=models.CASCADE)
        color = models.ForeignKey(
        "color", on_delete=models.CASCADE)
        date = models.DateField() 



class Meta:  
    db_table = "category"

class Meta:  
    db_table = "images"

class Meta:  
    db_table = "product"

def __str__(self):
    return self.name
