#!/usr/bin/perl
print "Content-Type: text/html\n\n";

use CGI;
use XML::LibXML;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;
use CGI::Session ( '-ip_match' );

$session = CGI::Session->load();#Permesso negato.
if($session->is_expired or $session->is_empty)
{
print <<ENDHTML;
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
	<head>
	  <title>Error Sign In</title>
	  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	  <meta http-equiv="Content-Script-Type" content="text/javascript" />
	  <meta name="title" content="Error Login page - Associazione calcistica dilettantistica Camponogarese" />
	  <meta name="description" content="Pagina error login A.C.D. Camponogarese" />
	  <meta name="keywords" content="Camponogarese,login" />
	  <meta name="language" content="italian it" />
	  <meta name="author" content="Daniel De Gaspari, Davide Santimaria, Emanuele Carraro, Jordan Gottardo" />
	  <link rel="stylesheet" type="text/css" href="../public_html/css/style.css" media="screen" />
	  <link rel="stylesheet" type="text/css" href="../public_html/css/print.css" media="print" />
	  <link rel="icon" href="../public_html/immagini/logo.png" type="image/png" />
	</head>
<body>
	<div id="header">
		<span id="logo"></span>
		<h1><abbr title="Associazione calcistica dilettantistica">A.C.D.</abbr> Camponogarese</h1>
	</div>
  <div id="path"><p>Ti trovi in: <span xml:lang="en"><a href="../public_html/index.html">Home</a></span>&gt Error Login</p></div>
  <div id="fail"> <img src="../public_html/immagini/failLog.jpg" ></img></div>
	<div id="section">
	<h1>La sessione e' scaduta o non hai effettuato l'accesso!</h1>
	<p>Effettuare nuovamente il login.</p>
		<form action="accesso.cgi" method="post">
			<fieldset>
				<legend>Login amministratore</legend>
				<label for="username">Username</label>
				<input class="casella_input" name="username" id="user" value="user" maxlength="20" />
				<label for="password">Password</label>
				<input class="casella_input" type="password" name="pwd" id="password" value="pwd" maxlength="20" />
				<input type="submit" value="Accedi"></input>
			</fieldset>
		</form>
</div>
</body>
</html>

ENDHTML
}
else { #Accesso consentito;

#input
my $input= new CGI;

#Se arrivo dalla pagina di disambiguazione;
if ($input->param("aggiungiPartita")) {

	#stampare pagina "vergine" senza errori 
	#
	#
	#
	#
}

else #Ho provato ad inserire un dato;
{

my $categoria=$input->param("categoria");
$categoria=~ s/[<>&]//g;
chomp($categoria);

my $casa=$input->param("casa"); #squadra in casa 
$casa=~ s/[<>&]//g;


my $trasferta=$input->param("trasferta"); #squadra in trasferta
$trasferta=~ s/[<>&]//g;

my $data=$input->param("data");
$data =~ s[<>&]//g;


my $goalCasa=$input->param("goalCasa");
$goalCasa=~ s[<>&]//g;

my $goalTrasf=$input->param("goalTrasf");
$goalTrasf=~ s[<>&]//g;

my $filepath="../data/calendarioPartite.xml";


my $errore=0;
my $errCategoria;
my $errCasa;
my $errTrasf;
my $errData;
my $errGoalCasa;
my $errGoalTrasf;

#Controllo dati letti

if ( !(($categoria eq 'piccoliAmici')|| ($categoria eq 'esordienti') || ($categoria eq 'giovanissimi')) )
{
	$errore=1;
	$errCategoria="Scegliere categoria corretta"; #Non potrà mai accadere ma per sicurezza c'è
}

	if ($casa!~/^[A-Z][a-z]+(\s([A-Z][a-z]+))?$/ || length($casa)>100 || $casa eq "Inserire squadra di casa")
	{
		$errore=1;
		$errCasa="Inserire nome squadra di casa, almeno due lettere e prima lettera maiuscola, nomi con spazio consentiti";
	}
	
	if ($trasf!~/^[A-Z][a-z]+(\s([A-Z][a-z]+))?$/ || length($trasf)>100 || $trasf eq "Inserire squadra in trasferta")
	{
		$errore=1;
		$errTrasf="Inserire nome squadra in trasferta, almeno due lettere e prima lettera maiuscola, nomi con spazio consentiti";
	}
	
	if ($data!~/^([0-3]{1}[0-9]{1}\/[0,1]{1}[0-9]{1}\/[0-9]{4})|([0-3]{1}[0-9]{1}\-[0,1]{1}[0-9]{1}\-[0-9]{4})$/ || $data eq "Inserire data") 
	{
		$errore=1;
		$errData="Inserire data, formati consentiti DD/MM/AAAA oppure DD-MM-AAAA";
	}
	
	if ($goalCasa!~/^[0-9]{1,2}$/  || $goalCasa eq "Inserire goal della squadra di casa")
	{
		$errore=1;
		$errGoalCasa="Inserire goal squadra di casa, 0-99";
	}
	
		if ($goalTrasf!~/^[0-9]{1,2}$/  || $goalTrasf	eq "Inserire goal della squadra in trasferta"
	{
		$errore=1;
		$errGoalCasa="Inserire goal squadra in trasferta, 0-99";
	}
	
	
	
	
	
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
		<squadraDiCasa>$casa</squadraDiCasa>
		<squadraInTrasferta>$trasf</squadraInTrasferta>
		<dataPartita>$data/</dataPartita>
		<goalSquadCasa>$goalCasa</goalSquadCasa>
		<goalSquadTrasf>$goalTrasf</goalSquadTrasf>
		";
		
			#creo un nuovo nodo + controllo;
		my $fragment = $parser->parse_balanced_chunk($elemento);

		my @categorie = $radice->getElementsByTagName($categoria);
		$categoria[0]->appendChild($fragment);
		
		#apro il file su cui serializzare
		open(OUT, ">$filepath") or die ("Errore nel salvataggio del file");
		#scrivo sul file
		print OUT $doc->toString;
		#chiudo il file
		close(OUT);
		
		
		#RISTAMPARE FORM AGGIUNTA CON SUCCESSO
		#
		#
		#
		#
		#
		
	}
	else
	{
	
		#RISTAMPARE FORM ERRORI (INIZIO)
		#
		#
		#
		#
			if (length($errCategoria)>0)
			{
				print "<li>$errCategoria</li>";
			}
	
			if (length($errCasa)>0)
			{
				print "<li>$errCasa</li>";
			}
			if (length($errTrasf)>0)
			{
				print "<li>$errTrasf</li>";
			}
			if (length($errData)>0)
			{
				print "<li>$errData</li>";
			}
			
			if (length($errGoalCasa)>0)
			{
				print "<li>$errGoalCasa</li>";
			}
			
			if (length($errGoalTrasf)>0)
			{
				print "<li>$errGoalTrasf</li>";
			}
			
		#RISTAMPARE RESTO FORM ERRORI
		#
		#
		#
		#
		

	}
}
}

