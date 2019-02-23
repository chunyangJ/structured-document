<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- Oxygen, Saxon-PE 9.5.1.7-->
  <!--exo13_XSLT_q6_solution2.xsl Question subsidiaire : Construire une feuille de styles pour afficher (au format HTML) tout le texte de la base en
mettant au jour une relation de dépendance syntaxique choisie (par exemple OBJ) : l’affichage
doit mettre au jour le dépendant et le gouverneur-->
  <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>

  <!-- la clé améliore significativement la performance par rapport à notre première solution-->
  <!-- Une clé sur des items de type OBJ en utilisant la pos entourée dans obj(pos)-->
  <xsl:key name="objPosCle" match="baselexicometrique/trame/items/item[starts-with(a[7],'OBJ')]"
    use="a[7]/replace(.,'OBJ\((\d+)\)','$1')"/>

  <xsl:template match="/">
    <html>
      <head>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="stylesheet" href="exo.css"/>
        <title>EXO13-XSLT-QuestionSubsidiaire</title>
      </head>
      <body>
        <div class="header" align="center">
          <h1>Le texte de la base <br/>TrameurFromRhapsodie</h1>
          <h2>une relation de dépendance syntaxique OBJ mise au jour</h2>
          <h2>
            <span class="governor">
              <span class="forme">Gouverneur</span>
            </span>
            <span class="dependant">
              <span class="forme">Dépendant</span>
            </span>
          </h2>
        </div>
        <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
          <table class="alt" style="text-align:justify">
            <tbody>
              <tr>
                <td>
                  <xsl:apply-templates select="baselexicometrique/trame/items/item" mode="obj"/>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="item" mode="obj">
    <xsl:choose>
      <!--dependant highlight-->
      <xsl:when test="starts-with(a[7],'OBJ')">
        <span class="dependant">
          <span class="forme">
            <xsl:value-of select="concat(f,'[',a[7],']')"/>
          </span>
        </span>
      </xsl:when>
      <!--governer hightlight-->
      <xsl:when test="key('objPosCle',@pos)">
        <span class="governor">
          <span class="forme">
            <xsl:value-of select="concat(f,'[',@pos,']')"/>
          </span>
        </span>
      </xsl:when>
      <!--normal output-->
      <xsl:otherwise>
        <xsl:choose>
          <xsl:when test="c='RETURN'">
            <br/>
          </xsl:when>
          <xsl:when test="f='£' or f='#'"> </xsl:when>
          <xsl:otherwise>
            <span class="forme">
              <xsl:value-of select="f"/>
            </span>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
