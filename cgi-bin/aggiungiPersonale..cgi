#!/usr/bin/perl

use CGI;
use CGI::Carp qw(fatalsToBrowser);
use XML::LibXML;


#input
my $pagina= new CGI;

my $grado=$pagina->param("grado");
$nome =~ s/[<>&]/*/g;

my $ruolo=$pagina->param("ruolo");
$ruolo =~ s/[<>&]/*/g;

my $nome=$pagina->param("nome");
$nome =~ s/[<>&]/*/g;

my $cognome=$pagina->param("cognome");
$cognome =~ s/[<>&]/*/g;

my $data=$pagina->param("data");
$data =~ s[<>&]/*/g;

my $telefono=$pagina->param("telefono");
$telefono =~ s/[<>&]/*/g;

#controllo coerenza ruolo-grado
if  (($grado eq 'amministratore' && $ruolo eq 'allenatore')||($grado eq 'dipendente' && $ruolo eq 'manager')) {die("Mismatch grado/ruolo");}


#controllo coerenza dati letti

	if (length($nome)<2) {die("Nome troppo corto");}
	if (length($cognome)<2) {die("Cognome troppo corto");}
	if (length($data)!=10) {die("Data non valida");}
	if (length($telefono)<6) {die("Telefono troppo corto");}


#my $file="../xml/organizzazione.xml";
#open(my $riuscito, '>>', $file) || die "Impossibile aprire il file";
#flock($riuscito, LOCK_EX) || die "Impossibile ottenere il lock";


my $file="../xml/organizzazione.xml";
my $parser=XML::LibXML->new();
my $doc=$parser->parse_file($file);
my $radice=$doc->getDocumentElement;
my @organizzazione=$radice->getElementsByTagName('organizzazione');
$nuovoPersonale=
"
<nome>$nome</nome>
<cognome>$cognome</cognome>
<data>$data</data>
<telefono>$telefono</telefono>
";
my $frammento=$parser->parse_balanced_chunks($nuovoPersonale);
if ($ruolo eq 'manager')
{
my $padre=$doc->findnodes('//manager');
$padre->[0]->appendChild($nuovoPersonale);
}

if ($ruolo eq 'allenatore')
{
my $padre=$doc->findnodes('//allenatori');
$padre->[0]->appendChild($nuovoPersonale);
}

my $file="../xml/organizzazione.xml";
open(OUT, ">$file") || die "Impossibile aprire il file";
print OUT $doc->toString;
close (OUT);
