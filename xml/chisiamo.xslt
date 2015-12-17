<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:p="http://www.camponogarese.it" exclude-result-prefixes="p">
<xsl:output method="html" version="1.0" encoding="UTF-8" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" indent="no" /> 
<xsl:template match="/">
<!-- qua ci andrà la parte in comune definitiva -->

		<body>
	<!-- menu -->

			<div id="section">
				<div id="divstoria">
					<h1>Storia dell'associazione </h1>
						<p>Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.
						Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.
						Lorem Ipsum è un testo segnaposto utilizzato nel settore della tipografia e della stampa. Lorem Ipsum è considerato il testo segnaposto standard sin dal sedicesimo secolo, quando un anonimo tipografo prese una cassetta di caratteri e li assemblò per preparare un testo campione. È sopravvissuto non solo a più di cinque secoli, ma anche al passaggio alla videoimpaginazione, pervenendoci sostanzialmente inalterato. Fu reso popolare, negli anni ’60, con la diffusione dei fogli di caratteri trasferibili “Letraset”, che contenevano passaggi del Lorem Ipsum, e più recentemente da software di impaginazione come Aldus PageMaker, che includeva versioni del Lorem Ipsum.
						</p>
				</div>
				<div id="organigramma">
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
			</div>	

		</body>

	</xsl:template>

</xsl:stylesheet>