<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- exo7_XSLT_q2 Définir une feuille de styles de telle sorte que les déterminants au féminin apparaîtront en
rouge et les déterminants masculins en bleu-->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>EXO7_XSLT_Q2</title>
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
        <xsl:choose>
          <xsl:when test="starts-with(@pos,'DET:femi')">
            <span style="color:red">
              <xsl:value-of select="@wordform"/>
            </span>
            <xsl:text> </xsl:text>
          </xsl:when>
          <xsl:when test="starts-with(@pos,'DET:masc')">
            <span style="color:blue">
              <xsl:value-of select="@wordform"/>
            </span>
            <xsl:text> </xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat(@wordform,' ')"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </p>

  </xsl:template>

</xsl:stylesheet>
