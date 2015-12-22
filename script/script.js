// funzione per rendere a scomparsa il login dell'amministratore
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

//funzione che sostituisce l'immagine della mappa con la mappa in google maps
function replaceMap() {
	var map = document.getElementById("visualizzaMappa");
	map.innerHTML = "<iframe id='frameMappa' class='noprint' src='https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d2802.2613774296656!2d12.074978372917814!3d45.38389800197496!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x477ec7ace369e9db%3A0xfe2a4c9605f9ae2b!2sVia+Parolini%2C+11%2C+30010+Camponogara+VE!5e0!3m2!1sit!2sit!4v1450295245309'></iframe><img id=\"fotoMappa\" class=\"print\" src=\"../immagini/mappa.png\" alt=\"Mappa della posizione del campo\" />";
}

// funzione che verifica se javascript è abilitato e mostra due finestre diverse a seconda del risultato

function controlloJava() {
//salvo in 2 variabili i valori dei due id
	var jsd1 = document.getElementById("jsDisabilitato");
	var jsa1 = document.getElementById("jsAbilitato");
//se è abilitato java,sicuramente farà questo controllo e nasconderà il div con id= jsDisabilitato
			jsd.style.display=="none"
			jsa.style.display=="block"
		
}

/* funzione per modificare l'immagine grande sugli eventi */

function gallery(){
     var tutteLeImmagini = document.images; //salvo tutte le immagini in questa variabile
     for(var i=0; i<tutteLeImmagini.length; i++){

	tutteLeImmagini[i].onclick = CambiaImmagine; //ogni volta che si clicca sull'immagine,chiama la funzione CambiaImmagine
         
     }
}

//dichiarazione della funzione CambiaImmagine
function CambiaImmagine(){
     //cambia l'attributo src dell'immagine grande.
     document.getElementById('myPicture').src ="../immagini/"+this.id+".jpg";
}
