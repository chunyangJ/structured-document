<?xml version="1.0" encoding="UTF-8"?>
<!--exo13_XQuery_q1_OBJ.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="utf-8"/>
<!--  <xsl:key name="forme" match="base/item" use="f"/>-->
  <xsl:template match="/">
    
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO13_XQUERY_Q1_OBJ</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Base TrameurFromRhapsodie</h1>
          <h2>Items portant une relation de dépendance syntaxique de type OBJ</h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:50%">
          <table class="alt" style="text-align:center">
            <tbody>
              <tr><td><b>Position</b></td><td><span class="forme">Forme</span>[<span class="lemme">Lemme</span>-<span class="pos"
                >Catégorie</span>]</td></tr>
              
                  <xsl:apply-templates select="base/item"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item">
    <tr><td><b><xsl:value-of select="@pos"/></b></td>
    <td><span class="forme"><xsl:value-of select="f"/></span> [<span class="lemme"><xsl:value-of
      select="l"/></span>-<span class="pos"><xsl:value-of select="c"/></span>]
      </td>
      </tr>
    
  </xsl:template>

</xsl:stylesheet>
