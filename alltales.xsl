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
                    <xsl:apply-templates select="//story" mode="toc">
                        <xsl:sort select="title"/>
                    </xsl:apply-templates>
                </ul>
                <hr/>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="tales">
        <xsl:apply-templates>
            <xsl:sort select="@number" data-type="number"/>
        </xsl:apply-templates>
    </xsl:template>
    <xsl:template match="story">
        <section id="{replace(title, '\s','')}">
        <h2>
            <xsl:apply-templates select="title"/>
        </h2>
        <article>
            <xsl:apply-templates select="body"/>
        </article><br/>
        </section>
    </xsl:template>
    <xsl:template match="p">
        <p>
        <xsl:apply-templates/>
        </p>
    </xsl:template>
    <xsl:template match="//story" mode="toc">
        <li>
            <a href="#{replace(title, '\s','')}">
            <xsl:apply-templates select="title"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>