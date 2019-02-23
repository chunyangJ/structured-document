<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Oxygen, Saxon-PE 9.5.1.7-->
  <!--exo13_XSLT_q2.xsl Construire une feuille de styles pour afficher (au format HTML) le texte en insérant sur
chaque item sa POS-->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO13-XSLT-Q2</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Le texte de la base <br/>TrameurFromRhapsodie</h1>
          <h2><span class="forme">Forme</span> [<span class="pos">Catégorie</span>]</h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
          <table class="alt" style="text-align:justify">
            <tbody>
              <tr>
                <td>
                  <xsl:apply-templates select="baselexicometrique/trame/items/item" mode="pos"/>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item" mode="pos">
    <xsl:choose>
      <xsl:when test="c='RETURN'">
        <xsl:text>
</xsl:text>
        <br/>
      </xsl:when>
      <xsl:when test="f='£' or f='#'"> </xsl:when>
      <xsl:when test="f=' ' or following-sibling::f=' '"> </xsl:when>
      <xsl:otherwise>
        <span class="forme"><xsl:value-of select="f"/></span>[<span class="pos"><xsl:value-of
            select="c"/></span>] </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
