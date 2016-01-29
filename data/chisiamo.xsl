<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:x="http://www.camponogarese.it" exclude-result-prefixes="x">
<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" /> 

<xsl:template match="/">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
<head>
	<title>Squadra Calcio</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="Content-Script-Type" content="text/javascript" />
	<meta name="title" content="Home page - Associazione calcistica dilettantistica Camponogarese" />
	<meta name="description" content="Pagina principale del sito A.C.D. Camponogarese" />
	<meta name="keywords" content="Camponogarese, associazione, sport, calcio, squadra, partita, piccoli amici camponogara, esordienti camponogara, giovanissimi camponogara" />
	<meta name="language" content="italian it" />
	<meta name="author" content="Daniel De Gaspari, Davide Santimaria, Emanuele Carraro, Jordan Gottardo" />
	<link rel="stylesheet" type="text/css" href="../public_html/css/style.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../public_html/css/print.css" media="print" />
	<link rel="icon" href="immagini/logo.png" type="image/png" />
</head>

<body>
	<div id="header">
		
		<span id="logo"></span>

		<!-- link "nascosto" che porta direttamente al contenuto della pagina -->
			<a href="#contenutopagina" class="nascosto">Vai al contenuto della pagina</a>

		<h1><abbr title="Associazione calcistica dilettantistica">A.C.D.</abbr> Camponogarese</h1>
	</div>

	<div id="path">
		<p>Ti trovi in: <a href="../public_html/index.html" xml:lang="en">Home</a> &gt;&gt; Chi Siamo</p>
	</div>

	<!-- menu laterale sotto al logo, orientamento verticale -->
	<div id="menu">
	<!-- link "nascosto" del menù -->
		<a name="menuNascosto" class="nascosto">Menù</a>
		<ul>
			<li><a href="../public_html/index.html"><span xml:lang="en">Home</span></a></li>
			<li id="CurrentLink">Chi siamo</li>
			<li><a href="../public_html/squadre.html">Squadre</a></li>
			<li><a href="../public_html/orario.html">Orari</a></li>
			<li><a href="calendarioPartite.xml">Risultati partite</a></li>
			<li><a href="../public_html/photogallery.html"> <span xml:lang="en">Photo Gallery </span></a></li>
			<li><a href="../public_html/dovesiamo.html">Dove siamo</a></li>

		</ul>
	</div>

	<div id="section">

		<h1 class="titolo">Chi siamo</h1>
		<p id="chiSiamo"><strong> Elenco del personale </strong></p>
		
		<ul id="ulChiSiamo">
						<li><strong>Amministratori</strong></li>
							<ul>
								<li xml:lang="en"><strong>Manager</strong></li>
								<ul>
									<xsl:for-each select="x:organizzazione/x:amministratori/x:manager">
										<li><xsl:value-of select="x:nome" />&#160;
										<xsl:value-of select="x:cognome" />&#160;
										<xsl:value-of select="x:dataNascita" />&#160;
										<xsl:value-of select="x:telefono" />
										</li>
									</xsl:for-each>
								</ul>
							</ul>
						<li><strong>Dipendenti</strong></li>						
							<ul>
								<li><strong>Allenatori</strong></li>
								<ul>
									<xsl:for-each select="x:organizzazione/x:dipendenti/x:allenatori">
										<li><xsl:value-of select="x:nome" />&#160;
										<xsl:value-of select="x:cognome" />&#160;
										<xsl:value-of select="x:dataNascita" />&#160;
										<xsl:value-of select="x:telefono" />
										</li>
									</xsl:for-each>
								</ul>
							</ul>						
					</ul>
					
	<p> Se avessi bisogno di contattarci puoi chiamare uno qualsiasi dei numeri riportati nell'elenco. </p>
	
	</div>

	<div id="footer">
		<img class="imgValidCode" src="../public_html/immagini/valid-xhtml10.png" alt="XHTML valido" /><img class="imgValidCode" 
		src="../public_html/immagini/vcss.gif" alt="CSS valido" /><img class="imgValidCode" src="../public_html/immagini/valid_wcag_aaa.gif" alt="WCAG valido" />
	</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>
