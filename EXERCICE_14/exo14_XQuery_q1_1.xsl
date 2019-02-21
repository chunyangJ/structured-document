<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--exo14_XQuery_q1_1 Compter le nombre de copies par niveaux d’étude-->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO14-XQUERY-Q1_1</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Récapitulatif de la base<br/>ECRISCOL</h1>
          <h2>Nombre de copies par niveaux d’étude</h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:50%">
          <table class="alt" style="text-align:justify">
            <thead>
              <xsl:apply-templates mode="thead"/>
            </thead>
            <tbody>

              <xsl:apply-templates select="statECRISCOL" mode="tbody"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="statECRISCOL" mode="thead">
    <tr class="forme">
      <td width="50%">
        <h2>
          <xsl:value-of select="@critere"/>
        </h2>
      </td>
      <td width="50%">
        <h2>
          <xsl:value-of select="concat(@type, ' de copies')"/>
        </h2>
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="niveau" mode="tbody">
    <tr style="text-align:center">
      <td width="50%">
        <xsl:value-of select="."/>
      </td>
      <td width="50%">
        <xsl:value-of select="@nombre"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
