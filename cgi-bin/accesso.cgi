#!/usr/bin/perl

use CGI;
use CGI::Carp qw/fatalsToBrowser warningsToBrowser/;
use CGI::Session;
  
my $input = new CGI;
  
my $user = $input->param("user");

my $pwd = $input->param("pwd");
  
if($user ne '')
{
    if($user eq "camponogarese_user" and $pwd eq "camponogarese_pwd") {
        my $session = new CGI::Session();
#modificare: session->param("user", $user);
        print $session->header(-location=>"log.cgi");
    }
    else {
#modificare:
        print $input->header(-type=>"text/html",-location=>"accesso.cgi");
    }
}
else
{
	$page = new CGI;
    print $page->header,
	$page->start_html (
	-title => 'Sessione',
	),
	$page->p( "
        <form method=\"post\">
    	    Username: <input type=\"text\" name=\"user\">
    	    Password: <input type=\"password\" name=\"pwd\">  
	        <input type=\"submit\">
	")
  }
