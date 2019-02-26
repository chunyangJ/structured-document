<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"
                encoding="UTF-8"
                doctype-system="about:legacy-compat"
                indent="yes"/>
    <xsl:variable name="index" select="document('index.xml')/cours" />
    <xsl:variable name="no_exo" select="substring-after(/exercice/@id,'_')" />
    <xsl:include href="index.xsl" />
    
    <xsl:template match="/">
        <!--
                Phantom by HTML5 UP
                html5up.net | @ajlkn
                Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
        -->
        <html>
            <head>
                <title><xsl:value-of select="concat('EXERCICE ',$no_exo)" /></title>
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
                <link rel="stylesheet" href="assets/css/main.css" />
                <link rel="stylesheet" href="assets/css/prism.css" />
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
                            <a href="index.xml" class="logo">
                                <span class="symbol"><img src="images/icon.png" alt="" /></span><span class="title"><xsl:value-of select="$index/info/titre" /></span>
                            </a>
                            <!-- Nav -->
                            <nav><ul><li><a href="#menu">Menu</a></li></ul></nav>
                        </div>
                    </header>
                    <!-- Menu -->
                    <nav id="menu">
                        <xsl:apply-templates select="$index/exercices" mode="menu" />
                    </nav>
                    <!-- Main -->
                    <div id="main">
                        <div class="inner">
                            <xsl:apply-templates select="exercice" />
                        </div>
                    </div>
                    <!-- Footer -->
                    <footer id="footer">
                        <div class="inner">
                            <ul class="copyright">
                                <li> &#169; XU Yizhou &amp; JIANG Chunyang. All rights reserved</li>
                                <li><a href="{$url}" target="_blank">pluriTAL</a></li>
                                <li>DESIGN : <a href="http://html5up.net" target="_blank">HTML5 UP</a></li>
                            </ul>
                        </div>
                    </footer>
                </div>

                <!-- Scripts -->
                <script src="assets/js/prism.js"></script>
                <script src="assets/js/jquery.min.js"></script>
                <script src="assets/js/skel.min.js"></script>
                <script src="assets/js/util.js"></script>
                <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
                <script src="assets/js/main.js"></script>
                <script src="assets/js/myScript.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="exercice">
        <h1 style="margin-bottom: 10pt;">
            <xsl:value-of select="concat('EXERCICE ', $no_exo)" />
        </h1>
        <h2 style="text-transform: none; font-size: 150%;"><xsl:value-of select="titre" /></h2>
        <hr class="separation" />
        <xsl:choose>
            <xsl:when test="phase">
                <xsl:apply-templates select="phase" />
            </xsl:when>
            <xsl:when test="partie">
                <xsl:apply-templates select="partie" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="question" />
            </xsl:otherwise>
        </xsl:choose>
        <xsl:if test="appendice">
            <xsl:apply-templates select="appendice" />
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="phase">
        <h2 class="question-titre">
            <xsl:value-of select="concat('Phase ',substring-after(@id,'_'))" />
            <xsl:if test="@titre"> : <xsl:value-of select="@titre" /></xsl:if>
        </h2>
        <xsl:choose>
            <xsl:when test="etape">
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="question" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="partie">
        <xsl:choose>
            <xsl:when test="@titre">
                <h2 class="question-titre"><xsl:value-of select="@titre" /></h2>
            </xsl:when>
            <xsl:when test="@id">
                <h2 class="question-titre"><xsl:value-of select="concat('Partie ',substring-after(@id,'_'))" /></h2>
            </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="souspartie">
                <xsl:apply-templates select="souspartie" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="question" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template match="souspartie">
        <h3 class="question-titre"><em><xsl:value-of select="@titre" /></em></h3>
        <xsl:apply-templates select="question" />
    </xsl:template>
    
    <xsl:template match="question">
        <div class="qr">
            <xsl:if test="@titre"><h3 class="question-titre"><xsl:value-of select="@titre" /></h3></xsl:if>
            <xsl:if test="@id"><h3 class="question-titre"><xsl:value-of select="concat('Question ',substring-after(@id,'_'))" /></h3></xsl:if>
            <xsl:apply-templates select="consignes" />
            <xsl:if test="reponse">
                <h3 class="reponse-titre">Reponse</h3>
                <xsl:apply-templates select="reponse" />
            </xsl:if>
        </div>
    </xsl:template>
    
    <xsl:template match="consignes">
        <xsl:for-each select="consigne">
            <xsl:choose>
                <xsl:when  test="@type='simple'">
                    <xsl:if test="@titre"><h3 class="question-titre"><xsl:value-of select="@titre" /></h3></xsl:if>
                    <p><xsl:apply-templates /></p>
                </xsl:when>
                <xsl:when  test="@type='texte'">
                    <blockquote style="width: 80%; text-align: justify;">
                        <xsl:apply-templates />
                    </blockquote>
                </xsl:when>
                <xsl:when  test="@type='code'">
                    <xsl:variable name="langage" select="@langage" />
                    <pre style="width: 80%;  max-height: 25em; margin-bottom: 3em;"><code  class="language-{$langage}" style="width: 100%;">
                        <xsl:value-of select="." />
                    </code></pre>
                </xsl:when>
                <xsl:when test="@type='liste'">
                    <xsl:if test="@titre"><h3 class="question-titre"><xsl:value-of select="@titre" /></h3></xsl:if>
                    <xsl:if test="text()"><xsl:value-of select="text()" /></xsl:if>
                    <ul style="margin-bottom: 20pt;">
                        <xsl:for-each select="item"><li><xsl:value-of select="." /></li></xsl:for-each>
                    </ul>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>    

    <xsl:template match="reponse[@type='code-resultat']">
        <xsl:variable name="src" select="resultat/@fichier" />
        <xsl:variable name="id" select="count(preceding::reponse)+1" />
        <xsl:variable name="langage" select="code/@langage" />
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <xsl:apply-templates select="note" /></xsl:if>
        <div class="result-wrapper">
            <div id="r_{$id}_a">
                <div class="browser-container browser-frame">
                    <iframe src="EXERCICE_{$no_exo}/{$src}" style="frameborder: 0; width: 100%; height: 20em; block; margin: auto;"></iframe>
                </div>
            </div>
            <div  id="r_{$id}_b" style="display: none;">
                <pre style="height: 100pt; height: 24.6em;">
                <code class="language-{$langage}"><xsl:value-of select="code" /></code>
                </pre>
            </div>
            <button id="bt_{$id}" class="icon fa-code" style="margin-top: 2em; width: 20%;" onclick="switchPresentation({$id},1)" value="b">Code</button>
        </div>
    </xsl:template>

    <xsl:template match="reponse[@type='code-resultat-2']">
        <xsl:variable name="src" select="resultat/@fichier" />
        <xsl:variable name="langage" select="code/@langage" />
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <xsl:apply-templates select="note" /></xsl:if>
        <div class="result-wrapper">
            <div>
                <pre style="height: 100pt; height: 24.6em;">
                    <code class="language-{$langage}"><xsl:value-of select="code" /></code>
                </pre>
            </div>
            <a class="button icon fa-code" style="margin-top: 2em; width: 20%;" href="EXERCICE_{$no_exo}/{$src}" target="_blank">Résultat</a>
        </div>
    </xsl:template>
    
    <xsl:template match="reponse[@type='multiple-query']">
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <p><xsl:apply-templates select="note" /></p></xsl:if>
        <div class="acc-container">
        <xsl:for-each select="query">
            <xsl:variable name="id" select="count(preceding::query)+1" />
            <xsl:variable name="src" select="resultat/@src" />
            <div class="acc-btn"><h4><xsl:value-of select="requete" /></h4></div>
            <div class="acc-content">
                <div class="acc-content-inner">                
                <div class="query-bar">
                    <i class="queryButton fa fa-play-circle" onclick="showResult({$id})"></i>
                    <div class="queryTerm">
                        <xsl:for-each select="solution/l"><xsl:value-of select="." /><br /></xsl:for-each>
                    </div>
                </div>
                <div style="height: 20em; text-align: center;">
                    <iframe id="query_result_{$id}" src="EXERCICE_{$no_exo}/{$src}" style="frameborder: 0; width: 90%; height: 0; block; margin: auto;"></iframe>
                </div>
                </div>
            </div>
        </xsl:for-each>
        </div>
    </xsl:template>
    
    <xsl:template match="reponse[@type='image-code']">
        <xsl:variable name="src" select="image/@src" />
        <xsl:variable name="alt" select="image/text()" />
        <xsl:variable name="langage" select="code/@langage" />
        <xsl:variable name="id" select="count(preceding::reponse)+1" />
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <xsl:apply-templates select="note" /></xsl:if>
        <div class="result-wrapper">
            <div id="r_{$id}_a">
                <img src="EXERCICE_{$no_exo}/{$src}" alt="{$alt}" width="100%" height="auto" />
            </div>
            <div  id="r_{$id}_b" style="display: none;">
                <pre style="height: 100pt; height: 24.6em;">
                    <code class="language-{$langage}"><xsl:value-of select="code" /></code>
                </pre>
            </div>
            <button id="bt_{$id}" class="icon fa-code" style="margin-top: 2em; width: 20%;" onclick="switchPresentation({$id}, 2)" value="b">XML</button>
        </div>
    </xsl:template>
    
    <xsl:template match="reponse[@type='code-valide']">
        <xsl:variable name="langage" select="code/@langage" />
        <xsl:variable name="id" select="count(preceding::reponse)+1" />
        <xsl:variable name="src" select="code[@type='xml']/@src" />
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <xsl:apply-templates select="note" /></xsl:if>
        <div class="result-wrapper">
            <div id="r_{$id}_a">
                <pre style="height: 100pt; height: 24.6em;">
                    <code class="language-{$langage}"><xsl:value-of select="code[@type='dtd']" /></code>
                </pre>
            </div>
            <div id="r_{$id}_b" style="display: none;">
                <pre style="height: 100pt; height: 24.6em;">
                    <a href="EXERCICE_{$no_exo}/{$src}" class="button special fit icon fa-globe" target="_blank">navigateur</a>
                    <code class="language-{$langage}" style="height: 23.3em;"><xsl:value-of select="code[@type='xml']" /></code>
                </pre>
            </div>
            <button id="bt_{$id}" class="icon fa-code" style="margin-top: 2em; width: 20%;" onclick="switchPresentation({$id}, 3)" value="b">XML</button>
        </div>
    </xsl:template>
    
    <xsl:template match="reponse[@type='1-m']">
        <xsl:variable name="src" select="resultat/@fichier[1]" />
        <xsl:variable name="id" select="count(preceding::reponse)+1" />
        <xsl:variable name="langage" select="code/@langage" />
        <xsl:if test="note"><strong style="color: purple;">Note</strong> : <xsl:apply-templates select="note" /></xsl:if>
        <div class="result-wrapper">
            <div id="r_{$id}_a"  style="display: none;">
                <div class="browser-container browser-frame">
                    <iframe id="{$id}_frame" src="EXERCICE_{$no_exo}/{$src}" style="frameborder: 0; width: 100%; height: 17.3em; block; margin: auto;"></iframe>
                </div>
                <xsl:for-each select="resultat">
                    <xsl:variable name="src_res" select="@fichier" />
                    <button id="bt_{$id}_frame" class="small" style="margin: 1em 1em 0 1em; width: 15%;letter-spacing : 0;" onclick="switchContent('{$id}_frame','EXERCICE_{$no_exo}/{$src_res}')"><xsl:value-of select="@id" /></button>
                </xsl:for-each> 
            </div>
            <div  id="r_{$id}_b">
                <pre style="height: 100pt; height: 24.6em;">
                <code class="language-{$langage}"><xsl:value-of select="code" /></code>
                </pre>
            </div>
            <button id="bt_{$id}" class="icon special fa-code" style="margin-top: 2em; width: 20%;" onclick="switchPresentation({$id},1)" value="a">Résultat</button>
        </div>
    </xsl:template>
    
    <xsl:template match="note">
        <xsl:apply-templates />
    </xsl:template>
    
    <xsl:template match="appendice">
        <div style="margin-top: 2em; width: 80%; text-align: center; display: block;">
            <ul class="actions">
                <xsl:for-each select="fichier">
                <xsl:variable name="src" select="@src"/>
                <li>
                    <a class="button icon fa-download" href="EXERCICE_{$no_exo}/{$src}" download=""><xsl:value-of select="@type" /></a>
                </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template match="p">
        <p><xsl:apply-templates /></p>
    </xsl:template>
    <xsl:template match="i">
        <i><xsl:value-of select="." /></i>
    </xsl:template>
    <xsl:template match="b">
        <b><xsl:value-of select="." /></b>
    </xsl:template>
    <xsl:template match="br">
        <br />
    </xsl:template>
    <xsl:template match="c">
        <code><xsl:value-of select="." /></code>
    </xsl:template>
    <xsl:template match="em">
        <em><xsl:value-of select="." /></em>
    </xsl:template>
</xsl:stylesheet>