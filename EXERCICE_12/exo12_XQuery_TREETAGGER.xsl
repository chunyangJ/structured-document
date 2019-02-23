<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- exo12_XQuery_TREETAGGER_patrons-->
    <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
    <xsl:template match="/">

        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="exo.css"/>
                <title>
                    <xsl:value-of
                        select="concat('EXO12_XQUERY_TREETAGGER_patrons_',@rubrique,'_',@type)"/>
                </title>
            </head>
            <body>
                <div class="header" align="center">
                    <h1>
                        <xsl:value-of
                            select="concat( 'Fils RSS du Monde 2017 : Rubrique ', patrons/@rubrique )"
                        />
                    </h1>
                    <h2>
                        <xsl:value-of
                            select="concat('Les patrons morpho-syntaxiques := ', patrons/@type)"
                        />
                    </h2>
                </div>
                <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:50%">
                    <table class="alt">
                        <tbody>
                            <xsl:apply-templates select="patrons"/>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="patron">
        <tr style="text-align:center">
            <td>
                <xsl:value-of select="."/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
