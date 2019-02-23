<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- exo12_XQuery_RSS_q2-->
    <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1"/>
                <link rel="stylesheet" href="exo.css"/>
                <title>EXO12_XQUERY_RSS_Q2</title>
            </head>
            <body>
                <div class="header" align="center">
                    <h1>
                        <xsl:value-of select="base/@nom"/>
                    </h1>
                    <h2>
                        <xsl:text>Description</xsl:text>
                    </h2>
                </div>
                <div class="table-wrapper" style="margin-left:auto; margin-right:auto;width:70%">
                    <table class="alt" >
                        <tbody>
                            <xsl:apply-templates select="base"/>
                        </tbody>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="description">
        <tr><td><xsl:value-of select="."/></td></tr>
    </xsl:template>
    
</xsl:stylesheet>