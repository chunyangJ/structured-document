<?xml version="1.0" encoding="UTF-8"?>
<!--exo13_XQuery_q2_OBJ.xsl -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO13_XQUERY_Q2_OBJ</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Base TrameurFromRhapsodie</h1>
          <h2>Items en relation de dépendance syntaxique de type OBJ</h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:50%">
          <table class="alt" style="text-align:center">
            <tbody>
              <tr><td><span class="forme">Gouverneur</span>&lt;----<span class="forme">Dependant</span></td></tr>
              <xsl:apply-templates select="base/dependance"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="dependance">
    <tr>
      <td><span class="forme"><xsl:value-of select="gouverneur/f"/></span> [<span class="lemme"
            ><xsl:value-of select="gouverneur/l"/>] </span>&lt;----<span class="forme"><xsl:value-of
            select="dependant/f"/></span> [<span class="lemme"><xsl:value-of select="dependant/l"
          /></span>] </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
