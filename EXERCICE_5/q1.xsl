<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
    <xsl:template match="/">
        <html>
            <head><title>EXERCICE 5 : QUESTION 1</title></head>
            <body>
                <p><strong>Auteur : </strong><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/author"/></p>
                <p><strong>Titre : </strong><xsl:value-of select="TEI/text/group/text/front/head"/></p>
                <p><strong>Date : </strong><xsl:value-of select="TEI/text/group/text/front/dateline"/></p>
                <p><strong>Recueil : </strong><xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title"/></p>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
