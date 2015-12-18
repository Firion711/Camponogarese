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
	<meta name="title" content="Dove siamo - Camponogarese Associazione calcistica dilettantistica" />
	<meta name="description" content="Indicazioni per raggiungere la sede dell'associazione sportiva Camponogarese" />
	<!-- Aggiungere categorie? es: pulcini camponogara, esordienti camponogara... -->
	<meta name="keywords" content="Camponogarese, associazione, sport, calcio, squadra, piccoli amici camponogara, esordienti camponogara, giovanissimi camponogara, dove siamo" />
	<meta name="language" content="italian it" />
	<!-- Come mettere più author? 1 meta con più nomi, separati da virgola, o più meta (valida)-->
	<meta name="author" content="Daniel De Gaspari" />
	<meta name="author" content="Davide Santimaria" />
	<meta name="author" content="Emanuele Carraro" />
	<meta name="author" content="Jordan Gottardo" />
	<link rel="stylesheet" type="text/css" href="../css/style.css" />
	
</head>

<body>
	<div id="header">
		<!-- questo span viola la divisione tra presentazione e struttura -->
		<span id="logo"></span>

		<!-- link "nascosto" che porta direttamente al contenuto della pagina -->
			<a tabindex="1" href="#contenutopagina" class="nascosto">Vai al contenuto della pagina</a>

		<h1><abbr title="Associazione calcistica dilettantistica">A.C.D.</abbr> Camponogarese</h1>
	</div>

	<div id="path">
		<p>Ti trovi in: <a href="../html/index.html" xml:lang="en">Home</a> &gt;&gt; Chi Siamo</p>
	</div>

	<!-- menu laterale sotto al logo, orientamento verticale -->
	<div id="menu">
	<!-- link "nascosto" del menù -->
		<a name="menuNascosto" class="nascosto">Menù</a>
		<ul>
			<li><a tabindex="2" href="../html/index.html"><span xml:lang="en">Home Page</span></a></li>
			<li id="CurrentLink">Chi siamo</li>
			<li><a tabindex="4" href="../html/squadre.html">Squadre</a></li>
			<li><a tabindex="5" href="../html/orario.html">Orari</a></li>
			<li><a tabindex="6" href="../html/photogallery.html"> <span xml:lang="en">Photo Gallery </span></a></li>
			<li><a tabindex="7" href="../html/dovesiamo.html">Dove siamo</a></li>
			<li><a tabindex="7" href="../html/contatti.html">Contatti</a></li>
		</ul>
	</div>

	<div id="section">
		<form method="post" action="">
			<fieldset id="ricerca">
				<input class="casella_input" id="cerca" value="Cerca... " />
			</fieldset>
		</form>
		<h1>Chi siamo</h1>
		<p> Ecco un elenco del personale che lavora presso la nostra associazione. Nell'elenco potrai trovare, oltre a nome e cognome, anche la data di nascita e il numero di telefono, in caso ci fosse bisogno di contatto diretto. Sono tutti appassionati e ci mettono anima e corpo, non esitare a contattarli! XxXxXx
		</p>
		
		<ul id="ulChiSiamo">
						<li>Amministratori</li>
							<ul>
								<li xml:lang="en">Manager</li>
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
						<li>Dipendenti</li>						
							<ul>
								<li>Allenatori</li>
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
	</div>

	<div id="footer">
		<img class="imgValidCode" src="../immagini/valid-xhtml10.png" alt="XHTML valido" /><img class="imgValidCode" 
		src="../immagini/vcss.gif" alt="CSS valido" />
	</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>