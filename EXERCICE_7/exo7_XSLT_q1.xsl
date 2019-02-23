<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- exo7_XSLT_q1 Définir une feuille de styles minimale pour formater le document XML fourni en HTML-->
  <xsl:output method="html" encoding="utf-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>EXO7_XSLT_Q1</title>
      </head>
      <body>
        <h1>Recommandation XSLT 1.0</h1>
        <xsl:apply-templates select="doc/taggersent"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="taggersent">
    <p>
      <xsl:for-each select="taggertoken">
        <xsl:value-of select="concat(@wordform,' ')"/>
      </xsl:for-each>
    </p>
  </xsl:template>

</xsl:stylesheet>
