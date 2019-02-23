<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--solution 1 xslt version 1.0-->
  <xsl:output method="html" encoding="utf-8" indent="yes"/>
  <xsl:template match="/table">
    <html>
      <head>
        <meta name="viewport" content="widtd=device-widtd, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO6_XSLT_SOLUTION_VERSION1.0</title>
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
              <xsl:for-each select="ligne">
                <xsl:if test="not(preceding-sibling::ligne/classe_anciennete=./classe_anciennete)">
                  <tr style="text-align:center">
                    <td colspan="6">
                      <h2>
                        <xsl:value-of select="./classe_anciennete"/>
                      </h2>
                    </td>
                  </tr>
                </xsl:if>
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
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
