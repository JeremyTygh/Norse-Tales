<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs" version="3.0">
    
    <xsl:output method="xml" indent="yes"/>
    
    <!--create variable for sort-->
    <xsl:variable name="spacing" as="xs:double" select="100"/>
    <xsl:variable name="xAxisLength" as="xs:double"
        select="count(distinct-values(//descriptor/@subject)) * $spacing + $spacing"/>
    
    <xsl:variable name="yAxisLength" as="xs:double"
        select="count(distinct-values(//descriptor/@speaker)) * $spacing + $spacing"/>
    
    
    <xsl:template match="/">
        <svg height="100%" width="100%">
            <g transform="translate(600, 800)">
                <!--************-->
                <!--Axes        -->
                <!--************-->
                
                <line x1="0" x2="{$xAxisLength}" y1="0" y2="0" stroke="black" stroke-width="1"
                    stroke-linecap="square"/>
                <line x1="0" x2="0" y1="0" y2="-{$yAxisLength}" stroke="black" stroke-width="1"
                    stroke-linecap="square"/>
                
                
                <!--*****************************-->
                <!--Labels and Ruling Lines      -->
                <!--*****************************-->
                <xsl:for-each select="sort(distinct-values(//descriptor/@subject))">
                    
                    <text x="{$spacing * position()}" y="20" text-anchor="middle">
                        <xsl:value-of select="."/>
                    </text>
                    
                    <line x1="{$spacing * position()}" x2="{$spacing * position()}" y1="0"
                        y2="-{$yAxisLength}" stroke="black" stroke-dasharray="8 4" stroke-width="1"/>
                    
                </xsl:for-each>
                
                <xsl:for-each select="sort(distinct-values(//descriptor/@speaker))">
                    <text x="-40" y="-{$spacing * position()}" text-anchor="middle">
                        <xsl:value-of select="."/>
                    </text>
                    
                    <line x1="0" x2="{$xAxisLength}" y1="-{$spacing * position()}"
                        y2="-{$spacing * position()}" stroke="black" stroke-dasharray="8 4"
                        stroke-width="1"/>
                </xsl:for-each>
                
                <text x="600" y="-725" font-size = "40" text-anchor="middle">
                    Relationships in Character Descriptors
                </text>
                
                <text x="-110" y="-350" font-size = "35" transform="rotate(-90 -110, -350)" text-anchor="middle">
                    Speakers
                </text>
                
                <text x="600" y="80" font-size = "35" text-anchor="middle">
                    Subjects
                </text>
                
                <!--*****************************-->
                <!--Key                          -->
                <!--*****************************-->
                
                <rect x="0" y = "160" width = "30" height= "30" fill-opacity = "0.7" 
                    fill = "#3E6E63" stroke = "black"/>
                <rect x="0" y = "220" width = "30" height= "30" fill-opacity = "0.7" 
                    fill = "red" stroke = "black"/>
                
                <text x="110" y="185" font-size = "35"  text-anchor="middle">
                    Positive
                </text>
                
                <text x="110" y="245" font-size = "35"  text-anchor="middle">
                    Negative
                </text>
                
                <!--************-->
                <!--Circles -->
                <!--************-->
                
                <xsl:for-each-group select="//descriptor" group-by="@subject">
                    <xsl:sort select = "current-grouping-key()"/>
                    <xsl:variable name="currentSubject" select="current-grouping-key()"
                        as="xs:string"/>
                    <xsl:variable name="currentSubjectPosition" select="position()" as="xs:integer"/>
                    <!--labels for subject-->
                    <xsl:for-each select="sort( distinct-values(//descriptor/@speaker) )">
                        <xsl:variable name="currentSpeaker" select="."
                            as="xs:string"/>
                        <xsl:variable name="currentSpeakerPosition" select="position()"
                            as="xs:integer"/>
                        <xsl:if test="$currentSubjectPosition = 1">
                            <!-- labels for speaker-->
                        </xsl:if>
                        
                        
                        <xsl:variable name="positive">
                            <xsl:value-of select="count(current-group()[@sign = 'positive' and @speaker = $currentSpeaker])"/>
                        </xsl:variable>
                        
                        <xsl:variable name="negative">
                            <xsl:value-of select="count(current-group()[@sign = 'negative' and @speaker = $currentSpeaker])"/>
                        </xsl:variable>
                        
                        <xsl:variable name="radius" as="xs:double"
                            select="abs($positive - $negative)"/>
                        
                        <!--NOTE: Eventually use area as opposed to radius to 
                            calculate more proportional size-->
                        
                        <!--Change color of circle dependent on overall negative or positive relationship. 
                                        Size (radius) corresponds to strength of relationship.-->
                        <xsl:variable name="barColor" as="xs:string" select="
                            if ($positive gt $negative) then
                            '#3E6E63'
                            else
                            'red'"/>
                        
                        <circle cx="{$spacing * $currentSubjectPosition}"
                            cy="-{$spacing * $currentSpeakerPosition}" r="{$radius * 20}"
                            fill="{$barColor}" fill-opacity=".7" stroke="black"/>
                        <xsl:if test = "$currentSubject = 'Prince'"><xsl:message
                            select="string-join(($positive, $negative, $currentSubjectPosition, 
                            $currentSubject, $currentSpeakerPosition, $currentSpeaker, $radius), ':')"/></xsl:if>
                        
                        
                    </xsl:for-each>
                    
                    
                    
                </xsl:for-each-group>
                
                
                
            </g>
        </svg>
    </xsl:template>
    
    
    
    
    
</xsl:stylesheet>
