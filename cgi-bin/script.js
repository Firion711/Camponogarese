//creo array associativo
var form_personale =
{
	"nome": ["Inserire nome", /[A-Z][a-z]+/, "Inserire un nome lungo almeno 2, prima lettera maiuscola"],
	"cognome": ["Inserire cognome", /[A-Z][a-z]+(\s([A-Z][a-z]+))?/, "Inserire un cognome lungo almeno 2, prima lettera maiuscola (cognomi con spazio consentiti)"],
	"data":["Inserire data", /([0-3]{1}[0-9]{1}\/[0,1]{1}[0-9]{1}\/[0-9]{4})|([0-3]{1}[0-9]{1}\-[0,1]{1}[0-9]{1}\-[0-9]{4})/, "Inserire data, formati consentiti DD/MM/AAAA oppure DD-MM-AAAA"],
	"telefono":["Inserire telefono", /(0?[0-9]{2,3}\-[0-9]+)|(0?[0-9]{2,3}[0-9]+)/, "Inserire numero di telefono valido, formati consentiti 111-111111 oppure 111111111"]
	
}

var form_partite=
{
	"casa": ["Inserire squadra di casa", /[A-Z][a-z]+(\s([A-Z][a-z]+))?/, "Inserire nome squadra di casa, almeno due lettere e prima lettera maiuscola, nomi con spazio consentiti"],
	"trasf": ["Inserire squadra in trasferta", /[A-Z][a-z]+(\s([A-Z][a-z]+))?/, "Inserire nome squadra in trasferta, almeno due lettere e prima lettera maiuscola, nomi con spazio consentiti"],
	"data":["Inserire data", /([0-3]{1}[0-9]{1}\/[0,1]{1}[0-9]{1}\/[0-9]{4})|([0-3]{1}[0-9]{1}\-[0,1]{1}[0-9]{1}\-[0-9]{4})/, "Inserire data, formati consentiti DD/MM/AAAA oppure DD-MM-AAAA"],
	"goalCasa": ["Inserire goal della squadra di casa", /[0-9]{1,2}/, "Inserire goal squadra di casa, 0-99"],
	"goalTrasf": ["Inserire goal della squadra in trasferta", /[0-9]{1,2}/, "Inserire goal squadra di casa, 0-99"]
	
}

function caricamentoPersonale() //carica i dati nei campi
{
for (var key in form_personale)
	{
		var input=document.getElementById(key);
		campoDefault(input);

		input.onfocus=function(){campoPerInput(this);}; //toglie l'aiuto
		input.onblur=function(){validazioneCampo(this);}; //fa la validazione del campo
	}
}

function caricamentoPartite() //carica i dati nei campi
{
for (var key in form_partite)
	{
		var input=document.getElementById(key);
		campoDefault(input);

		input.onfocus=function(){campoPerInput(this);}; //toglie l'aiuto
		input.onblur=function(){validazioneCampo(this);}; //fa la validazione del campo
	}
}





function campoDefault(input)
{
	if (input.value=="")
	{
		input.className="default-text";
		input.value=dettagli_form[input.id][0];
	}
}


function campoPerInput(input)
{
	if (input.value==dettagli_form[input.id][0])
	{
		input.value="";
		input.className="";
	}
}


function validazioneCampo(input)
{
	var p=input.parentNode; //prende lo span

var errore=document.getElementById(input.id+"errore");

if (errore)
{
	p.removeChild(errore)
}

	var regex=dettagli_form[input.id][1];
	var text=input.value;
	if ((text==dettagli_form[input.id][0]) || text.search(regex)!=0) //occhio! controllo che l'input sia diverso dal placeholder (con il primo check)
	{
		mostraErrore(input);
		return false;
	}
	return true;
}

function validazioneForm()
{
	var corretto=true;
	for (var key in dettagli_form)
	{
		var input=document.getElementById(key);
		var risultato=validazioneCampo(input);
		corretto=corretto&&risultato;
	}
	return corretto;
}


function mostraErrore(input)
{
	console.log(input);
	var p=input.parentNode;
	var e=document.createElement("strong");
	e.className="errorSuggestion";
	e.id=input.id+"errore";
	//
	//input.id="errore";

	e.appendChild(document.createTextNode(dettagli_form[input.id][2]));
	p.appendChild(e);
}
