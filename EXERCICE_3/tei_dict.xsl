<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
    <xsl:variable name="title" select="/*[local-name()='TEI']/*[local-name()='teiHeader']/*[local-name()='fileDesc']/*[local-name()='titleStmt']/*[local-name()='title']" />
    
    <xsl:template match="/*[local-name()='TEI']">
    <html>
        <head>
            <link rel="stylesheet" href="tei.css" />
            <title><xsl:value-of select="$title" /></title>
        </head>
        <body>
            <h1>
                <xsl:value-of select="substring-before($title,'(')" />
            </h1>
            <h2 >
                <em><xsl:value-of select="substring-after($title,':')" /></em>
            </h2>
            <xsl:apply-templates select="*[local-name()='text']/*[local-name()='body']"/>
        </body>
    </html>
    </xsl:template>
    
    <xsl:template match="*[local-name()='body']">
        <hr />
        <h2>
            <xsl:value-of select="translate(*[local-name()='div']/@n,'_',' ')" />
        </h2>
        <h2 style="font-size: 3em; font-weight: 900; margin: 0;"><xsl:value-of select="*[local-name()='div']/*[local-name()='div']/@n" /></h2>
        <h3><xsl:value-of select="*[local-name()='div']/*[local-name()='div']/*[local-name()='div']/@n" />
        [<span style="color: blue;"><xsl:value-of select="substring-after(substring-before($title,')'),'(Section')" /></span> ]</h3>
        <hr />
        <xsl:apply-templates select="*[local-name()='div']/*[local-name()='div']/*[local-name()='div']/*[local-name()='entry']" />
    </xsl:template>
    
    <xsl:template match="*[local-name()='entry']">
        <span style="font-weight: 900; font-size: 120%;"><xsl:value-of select="*[local-name()='form']/*[local-name()='orth']" />.</span>&#160;
        <xsl:for-each select="*[local-name()='gramGrp']/*">
            <xsl:value-of select="." />
        </xsl:for-each>
        &#160;
        <xsl:apply-templates select="*[local-name()='sense']" />
        <xsl:apply-templates select="*[local-name()='re']" />
        <hr />
    </xsl:template>
    
    <xsl:template match="*[local-name()='sense']">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="*[local-name()='sense'][@n and @n!='1']">
        <br /><br />
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="*[local-name()='re']">
        <br /><br />
        <xsl:if test="*[local-name()='form']">
            <xsl:value-of select="*[local-name()='form']/*[local-name()='orth']" />.&#160;
            <xsl:for-each select="*[local-name()='gramGrp']/*">
                <xsl:value-of select="." />
            </xsl:for-each>
            &#160;
        </xsl:if>
        <xsl:choose>
        <xsl:when test="*[local-name()='sense']">
            <xsl:apply-templates select="*[local-name()='sense']" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:value-of select="." />
        </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="*[local-name()='hi']">
        <span style="color: brown;"><em><xsl:value-of select="." /></em></span>
    </xsl:template>
</xsl:stylesheet>
