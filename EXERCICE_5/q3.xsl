<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
<xsl:template match="/">
    <html>
        <head><title>EXERCICE 5 : QUESTION 3</title></head>
        <body>
            <xsl:apply-templates select="TEI/text/group/text/body/lg/lg"/>
        </body>
    </html>

    </xsl:template>
    
    <xsl:template match="lg">
        <p><xsl:value-of select="l[3]"/></p>
    </xsl:template>
 
</xsl:stylesheet>
