function nascondi(a){
//salvo sulla variabile nasc, lo style dell'elemento passato
var nasc=document.getElementById(a);
if(!nasc) return true;
if(nasc.style.display=="block"){
nasc.style.display="none"
}
else{
nasc.style.display="block"
}
return false;
}
