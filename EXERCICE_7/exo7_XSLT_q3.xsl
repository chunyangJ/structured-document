<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <!-- exo7_XSLT_q3 Définir une feuille de styles de telle sorte : 
    nom des éléments = catégorie grammaticale; 
    valeur des éléments = forme des tokens-->
  <xsl:output method="xml" encoding="utf-8" indent="yes"/>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="node()|@*"/>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="taggertoken[@*]">
    <xsl:variable name="cat">
      <xsl:choose>
        <xsl:when test="string-length(@pos)=0">
          <xsl:text>UNKNOWN</xsl:text>
        </xsl:when>
        <xsl:when test="string-length(@pos) gt 3">
          <xsl:value-of select="substring-before(@pos,':')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="@pos"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="gram">
      <xsl:choose>
        <xsl:when test="string-length(@pos) gt 3">
          <xsl:value-of select="substring-after(@pos,':')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:element name="{$cat}">
      <xsl:attribute name="gram">
        <xsl:value-of select="$gram"/>
      </xsl:attribute>
      <xsl:value-of select="@wordform"/>
    </xsl:element>

  </xsl:template>
</xsl:stylesheet>
