

var all = document.getElementsByClassName('price');
var total = 0;


for(var i=0;i<all.length;i++){

 console.log(all.item(i));
 total = total+parseInt(all.item(i).textContent);
 document.getElementById('result_price').innerText = total;

}
