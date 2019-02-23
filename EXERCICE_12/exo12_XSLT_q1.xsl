<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <!--EXO12_XSLT_Q1 Construire une feuille de styles pour afficher les contenus étiquetés avec TreeTagger des
rubriques traitées dans le cours Projet-->
  <xsl:variable name="rubrique" select="base/@rubrique"/>
  <xsl:variable name="auteur1" select="base/entete/auteur[1]"/>
  <xsl:variable name="auteur2" select="base/entete/auteur[2]"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO12_XSLT_Q1</title>
        <xsl:apply-templates select="base" mode="head"/>
      </head>
      <body>
        <xsl:apply-templates select="base/etiquetage" mode="contenu"/>
      </body>
    </html>
  </xsl:template>
  <!-- entete -->
  <xsl:template match="base[@rubrique]" mode="head">
    <meta name="auteur" content="{$auteur1}"/>
    <meta name="auteur" content="{$auteur2}"/>
  </xsl:template>
  <xsl:template match="etiquetage" mode="contenu">
    <div class="header" align="center">
      <h1>
        <xsl:value-of
          select="concat('Etiquetage du Rubrique-',$rubrique,' du Fils RSS du Monde 2017')"/>
      </h1>
      <h2>
        <xsl:value-of select="concat('Auteurs : ',$auteur1,', ',$auteur2)"/>
      </h2>
    </div>
    <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
      <table class="alt">
        <tbody>
          <tr style="text-align:center">
            <td width="30%">
              <h2>Fichier initial</h2>
            </td>
            <td width="70%">
              <h2><span class="forme">Forme</span>[<span class="lemme">Lemme</span>-<span
                  class="pos">Catégorie</span>]</h2>
            </td>
          </tr>
          <xsl:apply-templates select="fichier" mode="contenu"/>
        </tbody>
      </table>
    </div>
  </xsl:template>
  <xsl:template match="fichier" mode="contenu">
    <tr style="text-align:left">
      <td>
        <strong>
          <xsl:value-of select="@nom"/>
        </strong>
      </td>
      <td>
        <xsl:apply-templates select="element" mode="contenu"/>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="element" mode="contenu">
    <xsl:variable name="pos" select="./data[1]"/>
    <xsl:variable name="lemme" select="./data[2]"/>
    <xsl:variable name="forme" select="./data[3]"/>
    <span class="forme">
      <xsl:value-of select="$forme"/>
    </span>
    <xsl:text>[</xsl:text>
    <span class="lemme">
      <xsl:value-of select="$lemme"/>
    </span>
    <xsl:text>-</xsl:text>
    <xsl:choose>
      <xsl:when test="$pos[contains(.,'SENT')]">
        <span class="pos">
          <xsl:value-of select="$pos"/>
        </span>
        <xsl:text>]
    </xsl:text>
        <br/>
      </xsl:when>
      <xsl:otherwise>
        <span class="pos">
          <xsl:value-of select="$pos"/>
        </span>
        <xsl:text>] </xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
