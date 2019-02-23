<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- Construire une feuille de styles pour afficher les contenus étiquetés avec TreeTagger des
rubriques traitées dans le cours Projet en mettant au jour un patron morphosyntaxique. NOM PRP NOM -->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <xsl:variable name="rubrique" select="base/@rubrique"/>
  <xsl:variable name="auteur1" select="base/entete/auteur[1]"/>
  <xsl:variable name="auteur2" select="base/entete/auteur[2]"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO12_XSLT_Q3</title>
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
  <!--contenu-->
  <xsl:template match="etiquetage" mode="contenu">
    <div class="header" align="center">
      <h1>
        <xsl:value-of
          select="concat('Rubrique-',$rubrique,' du Fils RSS du Monde 2017')"
        />
      </h1>
      <h2><xsl:text>Les séquences NOM PRP NOM</xsl:text></h2>
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
    <xsl:variable name="ele1" select="."/>
    <xsl:variable name="pos" select="./data[1]"/>
    <xsl:variable name="lemme" select="./data[2]"/>
    <xsl:variable name="forme" select="./data[3]"/>
    <xsl:choose>
      <xsl:when
        test="($ele1/data[1]='NOM') and (following-sibling::element[1]/data[1][contains(.,'PRP')]) and (following-sibling::element[2]/data[1]='NOM')">
        <span class="forme">
          <mark>
            <xsl:value-of select="$forme"/>
          </mark>
        </span>
      </xsl:when>
      <xsl:when
        test="($ele1/data[1][contains(.,'PRP')]) and (preceding-sibling::element[1]/data[1]='NOM') and (following-sibling::element[1]/data[1]='NOM')">
        <span class="forme">
          <mark>
            <xsl:value-of select="$forme"/>
          </mark>
        </span>
      </xsl:when>
      <xsl:when
        test="($ele1/data[1]='NOM') and (preceding-sibling::element[1]/data[1][contains(.,'PRP')]) and (preceding-sibling::element[2]/data[1]='NOM')">
        <span class="forme">
          <mark>
            <xsl:value-of select="$forme"/>
          </mark>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <span class="forme">
          <xsl:value-of select="$forme"/>
        </span>
      </xsl:otherwise>
    </xsl:choose>
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
