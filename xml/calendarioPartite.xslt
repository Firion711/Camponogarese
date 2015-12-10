<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.camponogarese.it">
<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes'
doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" />

	<xsl:template match="/">
<!-- qua ci andrà la parte in comune definitiva -->

		<body>
	<!-- menu -->

			<div id="section">
				<div id="calendario">
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