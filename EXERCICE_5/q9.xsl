<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
    <xsl:template match="/">
        <html>
            <head><title>EXERCICE 5 : QUESTION 9</title></head>
            <body>
                <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="lg[count(child::l)=4]">
        <p>
        <xsl:for-each select="l">
            <b><xsl:value-of select="."/></b><br />
        </xsl:for-each>
        </p>
    </xsl:template>
    <xsl:template match="lg[count(child::l)=3]">
        <p>
        <xsl:for-each select="l">
            <i><xsl:value-of select="."/></i><br />
        </xsl:for-each>
        </p>
    </xsl:template>
</xsl:stylesheet>
