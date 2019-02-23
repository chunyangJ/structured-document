<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
<xsl:template match="/">
    <html>
        <head>
            <title>EXERCICE 5 : QUESTION 7</title>
        </head>
        <body>
            <table border="1px" align="center"><xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/></table>
        </body>
    </html>
</xsl:template>

<xsl:template match="lg">
    <xsl:for-each select="l">
        <tr><td><xsl:value-of select="."/></td></tr>
    </xsl:for-each>
    <xsl:if test="position()!=last()"><tr><td><br/></td></tr></xsl:if>
</xsl:template>
</xsl:stylesheet>
