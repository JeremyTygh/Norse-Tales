<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math" version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Norse Tales</title>
            </head>
            <body>
                <h1>Norse Tales</h1>
                <h2>Contents</h2>
                <ul>
                    <xsl:apply-templates select="//story" mode="toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="story">
        <h2>
            <xsl:apply-templates select="title"/>
        </h2>
        <p>
            <xsl:apply-templates select="body"/>
        </p>
        <br/>
    </xsl:template>
    <xsl:template match="p">
        <xsl:apply-templates/><br/><br/>
    </xsl:template>
    <xsl:template match="//story" mode="toc">
        <li>
            <xsl:apply-templates select="title"/>
        </li>
    </xsl:template>
</xsl:stylesheet>