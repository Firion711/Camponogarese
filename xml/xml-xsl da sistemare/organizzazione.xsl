<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://www.camponogarese.it" exclude-result-prefixes="p">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
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
	<link rel="stylesheet" type="text/css" href="../../css/style.css" />
	<script type="text/javascript" src="../script/script.js"></script>
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
		<p>Ti trovi in: <a href="../index.html" xml:lang="en">Home</a> &gt;&gt; Dove Siamo</p>
	</div>

	<!-- menu laterale sotto al logo, orientamento verticale -->
	<div id="menu">
	<!-- link "nascosto" del menù -->
		<a name="menuNascosto" class="nascosto">Menù</a>
		<ul>
			<li><a tabindex="2" href="index.html"><span xml:lang="en">Home Page</span></a></li>
			<li id="CurrentLink">Chi siamo</li>
			<li><a tabindex="3" href="squadre.html">Squadre</a></li>
			<li><a tabindex="4" href="orario.html">Orari</a></li>
			<li><a tabindex="5" href="photogallery.html"> <span xml:lang="en">Photo Gallery </span></a></li>
			<li><a tabindex="6" href="dovesiamo.html">Dove siamo</a></li>
			<li><a tabindex="7" href="contatti.html">Contatti</a></li>
		</ul>
	</div>


	<div id="section">
	<ul>
						<li>Amministratori</li>
							<ul>
								<li xml:lang="en">Manager</li>
								<ul>
									<xsl:for-each select="organizzazione/amministratori/manager">
										<li><xsl:value-of select="nome" />&#160;
										<xsl:value-of select="cognome" />&#160;
										<xsl:value-of select="dataNascita" />&#160;
										<xsl:value-of select="telefono" />
										</li>
									</xsl:for-each>
								</ul>
							</ul>
						<li>Dipendenti</li>						
							<ul>
								<li>Allenatori</li>
								<ul>
									<xsl:for-each select="organizzazione/dipendenti/allenatori">
										<li><xsl:value-of select="nome" />&#160;
										<xsl:value-of select="cognome" />&#160;
										<xsl:value-of select="dataNascita" />&#160;
										<xsl:value-of select="telefono" />
										</li>
									</xsl:for-each>
								</ul>
							</ul>						
					</ul>
	</div>

	<div id="footer">
		<img class="imgValidCode" src="../../immagini/valid-xhtml10.png" alt="XHTML valido" /><img class="imgValidCode" 
		src="../../immagini/vcss.gif" alt="CSS valido" />
	</div>
	</body>
</html>

</xsl:template>
</xsl:stylesheet>
