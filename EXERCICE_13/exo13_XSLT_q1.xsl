<?xml version="1.0" encoding="UTF-8"?>
<!-- Oxygen, Saxon-PE 9.5.1.7-->
<!--exo13_XSLT_q1.xsl Construire une feuille de styles pour afficher uniquement le texte (sortie TXT)-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="text" encoding="utf-8"/>
  <xsl:template match="/">
    <xsl:apply-templates select="baselexicometrique/trame/items/item"/>
  </xsl:template>
  <xsl:template match="item">
    <xsl:choose>
      <xsl:when test="c='RETURN'">
        <xsl:text>
</xsl:text>
      </xsl:when>
      <xsl:when test="f='£' or f='#'">
      </xsl:when>
      <xsl:when test="preceding-sibling::f[1]='£' or preceding-sibling::f[1]='#'">
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="f"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
