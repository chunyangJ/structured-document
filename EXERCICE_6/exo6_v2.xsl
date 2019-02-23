<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--Oxygen Saxon-PE 9.5.1.7 -->
  <!--solution 2 : xslt version 2.0, fonction for-each-group(), processeur de navigateur ne fonctionne-->
  <xsl:output method="html" encoding="utf-8" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="widtd=device-widtd, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO6_XSLT_SOLUTION_VERSION2.0</title>
      </head>
      <body>
        <h1 align="center">Infirmières</h1>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
          <table class="alt">
            <tbody>
              <tr class="forme" style="text-align:center">
                <td>Numéro</td>
                <td>Âge</td>
                <td>Années d'études</td>
                <td>Diplôme</td>
                <td>Ancienneté</td>
                <td>Service</td>
              </tr>
              <xsl:apply-templates/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="table">
    <xsl:for-each-group select="ligne" group-by="classe_anciennete">
      <tr style="text-align:center">
        <td colspan="6">
          <h2>
            <xsl:value-of select="current-grouping-key()"/>
          </h2>
        </td>
      </tr>
      <xsl:for-each select="current-group()">
        <tr style="text-align:center">
          <td>
            <xsl:value-of select="infirmiere"/>
          </td>
          <td>
            <xsl:value-of select="age"/>
          </td>
          <td>
            <xsl:value-of select="annees_etudes"/>
          </td>
          <td>
            <xsl:value-of select="diplome"/>
          </td>
          <td>
            <xsl:value-of select="anciennete_neonatalite"/>
          </td>
          <td>
            <xsl:value-of select="service"/>
          </td>
        </tr>
      </xsl:for-each>
    </xsl:for-each-group>
  </xsl:template>

</xsl:stylesheet>
