<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>

    <xsl:variable name="url" select="cours/info/filiere/@url" />
    
    <xsl:template match="/cours">
        <!--
                Phantom by HTML5 UP
                html5up.net | @ajlkn
                Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
        -->
        <html>
            <head>
                <title><xsl:value-of select="info/titre"/> : <xsl:value-of select="exercices/titre"/></title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
                <link rel="stylesheet" href="assets/css/main.css" />
                <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
                <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
            </head>
            <body>
                <!-- Wrapper -->
                <div id="wrapper">
                    <!-- Header -->
                    <header id="header">
                        <div class="inner">
                            <!-- Logo -->
                            <a href="{$url}" class="logo" target="_blank">
                                <span class="symbol"><img src="images/logo.png" alt="" /></span><span class="title"><xsl:value-of select="info/filiere" /></span>
                            </a>
                            <!-- Nav -->
                            <nav><ul><li><a href="#menu">Menu</a></li></ul></nav>
                        </div>
                    </header>
                    <!-- Menu -->
                    <nav id="menu">
                        <xsl:apply-templates select="exercices" mode="menu" />
                    </nav>
                    <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <xsl:apply-templates select="info" />
                            <xsl:apply-templates select="exercices" />
                        </div>
                    </div>
                    <!-- Footer -->
                    <footer id="footer">
                        <div class="inner">
                            <section><xsl:apply-templates select="auteurs" /></section>
                            <ul class="copyright">
                                <li> &#169; XU Yizhou &amp; JIANG Chunyang. All rights reserved</li>
                                <li><a href="{$url}" target="_blank">pluriTAL</a></li>
                                <li>DESIGN : <a href="http://html5up.net" target="_blank">HTML5 UP</a></li>
                            </ul>
                        </div>
                    </footer>
                </div>

                <!-- Scripts -->
                <script src="assets/js/jquery.min.js"></script>
                <script src="assets/js/skel.min.js"></script>
                <script src="assets/js/util.js"></script>
                <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
                <script src="assets/js/main.js"></script>
                
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="info">
        <header>
            <h1 style="text-align: center; text-transform: uppercase; margin: 10pt;"><xsl:value-of select="titre" /></h1>
            <h2 style="text-align: center; text-transform: none; font-size: 160%;">
                <a href="{$url}" target="_blank"><xsl:value-of select="filiere" /></a>&#160;<xsl:value-of select="promotion" />
            </h2>
            <p><xsl:value-of select="descCours" /></p>
            <p><xsl:value-of select="remarque"/></p>
        </header>
    </xsl:template>
    
    <xsl:template match="exercices">
        <h2 style="text-align: center; text-transform: none; font-size: 120%;">
            <xsl:value-of select="titre" />
        </h2>
        <section class="tiles">
            <xsl:for-each select="exercice">
            <xsl:variable name="id" select="@id" />
            <xsl:variable name="num" select="number(substring-after(@id,'_')) mod 6 + 1" />
            <article class="style{$num}">
                <span class="image">
                    <img src="images/{$id}.jpg" alt="" />
                </span>
                <a href="{$id}.xml" target="_blank">
                    <h2><xsl:value-of select="document/@titre" /></h2>
                    <div class="content">
                        <p style="font-weight: 600;"><xsl:value-of select="descExo" /></p>
                    </div>
                </a>
            </article>
            </xsl:for-each>
        </section>
    </xsl:template>

    <xsl:template match="exercices" mode="menu">
        <h2>Menu</h2>
        <ul>
            <li><a href="index.xml">ACCUEIL</a></li>
            <xsl:for-each select="exercice">
            <xsl:variable name="id" select="@id" />
            <li><a href="{$id}.xml"><xsl:value-of select="document/@titre" /></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="auteurs">
        <h2 style="margin-bottom: 1em; font-size: 120%;">Auteurs</h2>
        <div class="row">
        <xsl:for-each select="auteur">
            <xsl:variable name="mel" select="mel" />
            <xsl:variable name="github" select="github" />
            <xsl:variable name="site" select="sitePerso" />
            <div class="6u 12u$(medium)">
            <h2 style="margin-bottom: 1em;"><xsl:value-of select="nom" /></h2>
            <ul class="icons">
                <li><a href="mailto:{$mel}" class="icon style2 fa-envelope"><span class="label">Mel</span></a></li>
                <li><a href="{$github}" target="_blank" class="icon style2 fa-github"><span class="label">Github</span></a></li>
                <li><a href="{$site}" target="_blank" class="icon style2 fa-globe"><span class="label">Site</span></a></li>
            </ul>
            </div>
        </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>