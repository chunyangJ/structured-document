<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!--exo14_XQuery_q2_0 Compter le nombre d’opérations de réécriture par copie-->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO14-XQUERY-Q2_0</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Récapitulatif de la base<br/>ECRISCOL</h1>
          <h2>nombre d’opérations de réécriture par copie</h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
          <table class="alt">
            <tbody>
              <tr class="forme" style="text-align:center; font-weight: bold">
                <td width="10%">id</td>
                <td width="30%">nom de copie</td>
                <td width="15%">remplacement</td>
                <td width="15%">insertion</td>
                <td width="15%">suppression</td>
                <td width="15%">correction</td>
              </tr>
              <xsl:apply-templates select="statECRISCOL"/>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="copie">
    <tr style="text-align:center">
      <td>
        <xsl:value-of select="@id"/>
      </td>
      <td>
        <xsl:value-of select="@nom"/>
      </td>
      <td>
        <xsl:value-of select="remplacement"/>
      </td>
      <td>
        <xsl:value-of select="insertion"/>
      </td>
      <td>
        <xsl:value-of select="suppression"/>
      </td>
      <td>
        <xsl:value-of select="correction"/>
      </td>
    </tr>
  </xsl:template>

</xsl:stylesheet>
