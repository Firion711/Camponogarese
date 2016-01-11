#!/usr/bin/perl

use CGI;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;
use CGI::Session ( '-ip_match' );
  
$session = CGI::Session->load();
$input = new CGI;
  
print $input->header(-cache_control=>"no-cache, no-store, must-revalidate");

if($session->is_empty){
    print $input->header(-cache_control=>"no-cache, no-store, must-revalidate");
    print "Accesso negato";
}

else{
  $session->delete();
  print "Logut effettuato con successo";
}