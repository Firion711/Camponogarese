#!/usr/bin/perl
print "Content-Type: text/html\n\n";

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use XML::LibXML;

#input
my $input= new CGI;

my $grado=$input->param("grado");

my $ruolo=$input->param("ruolo");

my $nome=$input->param("nome");

my $cognome=$input->param("cognome");

my $data=$input->param("data");

my $telefono=$input->param("telefono");

my $filepath="../perl/organizzazione.xml";


#creo l'oggetto parser;
my $parser=XML::LibXML->new();

#apertura file + lettura input
my $doc=$parser->parse_file($filepath);

#estrazione elemento radice;
my $radice=$doc->getDocumentElement;

#definisco il nuovo elemento da inserire;
my $elemento =
"
<nome>$nome</nome>
<cognome>$cognome</cognome>
<data>$data</data>
<telefono>$telefono</telefono>
";

#creo un nuovo nodo + controllo;
my $fragment = $parser->parse_balanced_chunk($elemento);

#se è un'admin, memorizzo tra gli amministratori
if ($grado eq 'amministratore')
{
	my @amministratori = $radice->getElementsByTagName('amministratori');

#modificare: suddividere nei vari ruoli;
#	if ($ruolo eq 'manager')
#	{
		$amministratori[0]->appendChild($fragment);
#	}
}	

if ($grado eq 'dipendente')
{
	my @dipendenti = $radice->getElementsByTagName('dipendenti');
	$dipendenti[0]->appendChild($fragment);
}


#apro il file su cui serializzare
open(OUT, ">$filepath") or die ("Errore nel salvataggio del file");
#scrivo sul file
print OUT $doc->toString;
#chiudo il file
close(OUT);
