#!/usr/bin/perl

use CGI;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;
use CGI::Session ( '-ip_match' );
  
$session = CGI::Session->load();
$input = new CGI;
  
if($session->is_expired)
{
    print $input->header(-cache_control=>"no-cache, no-store, must-revalidate");
    print "La sessione è scaduta. Effettuare nuovamente il login";
    print "<br/><a href='accesso.cgi>Login</a>";
}

elsif($session->is_empty)
{
    print $input->header(-cache_control=>"no-cache, no-store, must-revalidate");
    print "Non hai effettuato l'accesso";
}

else
{
    print $input->header(-cache_control=>"no-cache, no-store, must-revalidate");
    print "<h2>Benvenuto";
    print " ";
    print "<a href='logout.cgi'>Logout";  
}
