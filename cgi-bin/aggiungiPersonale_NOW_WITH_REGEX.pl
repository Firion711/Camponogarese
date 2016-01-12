#!/usr/bin/perl
print "Content-Type: text/html\n\n";

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use XML::LibXML;

#input
my $input= new CGI;

my $grado=$input->param("grado");
$grado =~ s/[<>&]//g;
chomp($grado);

my $ruolo=$input->param("ruolo");
$ruolo =~ s/[<>&]//g;
chomp($ruolo);

my $nome=$input->param("nome");
$nome =~ s/[<>&]//g;

my $cognome=$input->param("cognome");
$cognome =~ s/[<>&]//g;

my $data=$input->param("data");
$data =~ s[<>&]//g;

my $telefono=$input->param("telefono");
$telefono =~ s/[<>&]//g;


my $filepath="../xml/organizzazione.xml";

my $errore=0;
my $mismatch;
my $errNome;
my $errCognome;
my $errData;
my $errTelefono;

#Controllo ruolo-grado;
if  (( $grado eq 'amministratore' && $ruolo eq 'allenatore') || ($grado eq 'dipendente' && $ruolo eq 'manager')) {
	$errore=1;
	$mismatch="Mismatch grado-ruolo";
}

#Controllo dati letti
#controllo coerenza dati letti
if ($nome!~/^[A-Z][a-z]+/ || length($nome)>100 || $nome=="Inserire nome"){
	$errore=1;
	$errNome="Inserire un nome lungo almeno 2, prima lettera maiuscola";
}

if ($cognome!~/^[A-Z][a-z]+(([A-Z][a-z]+))?/ || length($cognome)>100 || $cognome=="Inserire cognome"){
	$errore=1;
	$errCognome="Inserire un cognome lungo almeno 2, prima lettera maiuscola (cognomi con spazio consentiti)";
}

#modificare: aggiungere controllo per il valore di default dato da JavaScript
if ($data!~/([0-3]{1}[0-9]{1}\/[0,1]{1}[0-9]{1}\/[0-9]{4})|([0-3]{1}[0-9]{1}\-[0,1]{1}[0-9]{1}\-[0-9]{4})/ || $data=="Inserire data" {
	$errore=1;
	$errData="Inserire data, formato DD/MM/AAAA";
}

#modificare: aggiungere controllo per il valore di default dato da JavaScript (e aggiungere trattino sul numero
#controllare se funziona  il trattino dopo l'aggiunta dell'escaping
if ( $telefono!~/(0?[0-9]{2,3}\-[0-9]+)|(0?[0-9]{2,3}[0-9]+)/ || length($telefono)>15 || $telefono=="Inserire telefono") {
	$errore=1;
	$errTelefono="Inserire numero di telefono valido";
}


#aggiungere lock?
if ($errore==0)
{
	#creo l'oggetto parser;
	my $parser=XML::LibXML->new();

	#apertura file + lettura input
	my $doc=$parser->parse_file($filepath);

	#estrazione elemento radice;
	my $radice=$doc->getDocumentElement;

	#definisco il nuovo elemento da inserire;
	my $elemento =
	"
		<$ruolo>
			<nome>$nome</nome>
			<cognome>$cognome</cognome>
			<data>$data</data>
			<telefono>$telefono</telefono>
		</$ruolo>
	";

	#creo un nuovo nodo + controllo;
	my $fragment = $parser->parse_balanced_chunk($elemento);

	#se è un'admin, memorizzo tra gli amministratori
	if ($grado eq 'amministratore')
	{
		if ($ruolo eq 'manager')
		{
			my @manager = $radice->getElementsByTagName('amministratori');
			$manager[0]->appendChild($fragment);
		}
	}

	if ($grado eq 'dipendente')
	{
		if ($ruolo eq 'allenatore')
		{
			my @allenatori = $radice->getElementsByTagName('dipendenti');
			$allenatori[0]->appendChild($fragment);
		}
	}



	#apro il file su cui serializzare
	open(OUT, ">$filepath") or die ("Errore nel salvataggio del file");
	#scrivo sul file
	print OUT $doc->toString;
	#chiudo il file
	close(OUT);
	
	
	
	
	#Ristampo la form dicendo "EHY BRO TUTTO OK NON HAI SPRECATO IL TUO TEMPO"
	print <<EOF;
	 <html><head>
	 <title>Amministratore</title>
	 <script type="text/javascript" src="script.js"></script>
	 </head>
	 <body onload="caricamento();">
	 <div>
	 <p>Inserimento avvenuto con successo!</p>
	 </div>
	 <form id="formPersonale" action="aggiungiPersonale.cgi" method="post">
	 <fieldset>
	 <legend>Aggiungi personale</legend>
	 <fieldset>
	 <legend>Scegli grado societario</legend>
	 <label for="amministratore">Amministratore</label>
	 <input type="radio" name="grado" id="amministratore" value="amministratore" checked="true" />
	 <label for="dipendente">Dipendente</label>
	 <input type="radio" name="grado" id="dipendente" value="dipendente" />
	 </fieldset>
	 <fieldset>
	 <legend>Scegli ruolo</legend>
	 <label for="manager">Manager</label>
	 <input type="radio" name="ruolo" id="manager" value="manager"  checked="true" />
	 <label for="allenatore">Allenatore</label>
	 <input type="radio" name="ruolo" id="allenatore" value="allenatore" />
	 </fieldset>
	 <fieldset>
	 <legend>Dati</legend>
	 <label for="nome">Nome</label>
	 <span><input type="text" id="nome" name="nome" maxlength="20" /></span>
	 <br />
	 <label for="cognome">Cognome</label>
	 <span><input type="text"  id="cognome" name="cognome" maxlength="20" /></span>
	 <br />
	 <label for="data">Data</label>
	 <span><input type="text" id="data" name="data" maxlength="10" /></span>
	 <br />
	 <label for="telefono">Telefono</label>
	 <span><input type="telefono" id="telefono" name="telefono" maxlength="10" /></span>
	 <br />
	 </fieldset>
	 </fieldset>
	 <input type="submit" value="Invia">
	 </form>
	 </body>
	 </html>
EOF
	
}
else
{
	print <<EOF;
	 <html><head>
	 <title>Amministratore</title>
	 <script type="text/javascript" src="script.js"></script>
	 </head>
	 <body onload="caricamento();">
	
	 <div>
	 <ul>
EOF
	if (length($mismatch)>0)
	{
		print "<li>$mismatch</li>";
	}
	
	if (length($errNome)>0)
	{
		print "<li>$errNome</li>";
	}
	if (length($errCognome)>0)
	{
		print "<li>$errCognome</li>";
	}
	if (length($errData)>0)
	{
		print "<li>$errData</li>";
	}
	if (length($errTelefono)>0)
	{
		print  "<li>$errTelefono</li>";
	}

	print <<EOF;
	 </ul>
	 </div>
	
	 <form id="formPersonale" action="aggiungiPersonale.cgi" method="post">
	 <fieldset>
	 <legend>Aggiungi personale</legend>
EOF
	if ($grado eq 'amministratore')
	{
		print <<EOF;
		 <fieldset>
		 <legend>Scegli grado societario</legend>
		 <label for="amministratore">Amministratore</label>
		 <input type="radio" name="grado" id="amministratore" value="amministratore" checked="true" />
		 <label for="dipendente">Dipendente</label>
		 <input type="radio" name="grado" id="dipendente" value="dipendente" />
		 </fieldset>
EOF
	}
	
	if ($grado eq 'dipendente')
	{
		print <<EOF;
		 <fieldset>
		 <legend>Scegli grado societario</legend>
		 <label for="amministratore">Amministratore</label>
		 <input type="radio" name="grado" id="amministratore" value="amministratore" />
		 <label for="dipendente">Dipendente</label>
		 <input type="radio" name="grado" id="dipendente" value="dipendente" checked="true" />
		 </fieldset>
EOF
	}
	
		if ($ruolo eq 'manager')
	{
		print <<EOF;
		 <fieldset>
		 <legend>Scegli ruolo</legend>
		 <label for="manager">Manager</label>
		 <input type="radio" name="ruolo" id="manager" value="manager"  checked="true" />
		 <label for="allenatore">Allenatore</label>
		 <input type="radio" name="ruolo" id="allenatore" value="allenatore" />
		 </fieldset>
EOF
	}
	
	if ($ruolo eq 'allenatore')
	{
		print <<EOF;
		 <fieldset>
		 <legend>Scegli ruolo</legend>
		 <label for="manager">Manager</label>
		 <input type="radio" name="ruolo" id="manager" value="manager"  />
		 <label for="allenatore">Allenatore</label>
		 <input type="radio" name="ruolo" id="allenatore" value="allenatore" checked="true" />
		 </fieldset>
EOF
	}
	print <<EOF;
	 <fieldset>
	 <legend>Dati</legend>
	 <label for="nome">Nome</label>
	 <span><input type="text" id="nome" name="nome" maxlength="20" value="$nome" /></span>
	 <br />
	 <label for="cognome">Cognome</label>
	 <span><input type="text" id="cognome" name="cognome" maxlength="20" value="$cognome" /></span>
	 <br />
	 <label for="data">Data</label>
	 <span><input type="text" id="data" name="data" maxlength="10" value="$data" /></span>
	 <br />
	 <label for="telefono">Telefono</label>
	 <span><input type="telefono" id="telefono" name="telefono" maxlength="10" value="$telefono" /></span>
	 <br />
	 </fieldset>
	 </fieldset>
	 <input type="submit" value="Invia">
	 </form>
	 </body>
	 </html>
EOF
}
