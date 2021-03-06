<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/2000/svg"
    exclude-result-prefixes="xs" version="3.0">

    <xsl:output method="xml" indent="yes"/>

    <!--create variable for sort-->
    <xsl:variable name="spacing" as="xs:double" select="100"/>


    <xsl:template match="/">

        <xsl:apply-templates select="//story">
            <xsl:sort select="@number" data-type="number"/>
        </xsl:apply-templates>

    </xsl:template>


    <xsl:template match="story">

        <xsl:variable name="currentStory" select="."/>
        <xsl:variable name="xAxisLength" as="xs:double"
            select="count(distinct-values(descendant::descriptor/@subject)) * $spacing + $spacing"/>

        <xsl:variable name="yAxisLength" as="xs:double"
            select="count(distinct-values(descendant::descriptor/@speaker)) * $spacing + $spacing"/>
        <xsl:result-document href="descriptor-graph-{@number}.svg" method="xml" indent="yes"
            omit-xml-declaration="yes">
            <svg height="{$yAxisLength + 150}" width="100%">
                <g transform="translate(150, {$yAxisLength}) scale(.7)">
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
                    <xsl:for-each select="sort(distinct-values(descendant::descriptor/@subject))">

                        <text x="{$spacing * position()}" y="20" text-anchor="middle"
                            transform="rotate(227, {$spacing * position()}, 45)" writing-mode="tb">
                            <xsl:value-of select="."/>
                        </text>

                        <line x1="{$spacing * position()}" x2="{$spacing * position()}" y1="0"
                            y2="-{$yAxisLength}" stroke="black" stroke-dasharray="8 4"
                            stroke-width="1"/>

                    </xsl:for-each>

                    <xsl:for-each select="sort(distinct-values(descendant::descriptor/@speaker))">
                        <text x="-40" y="-{$spacing * position()}" text-anchor="middle">
                            <xsl:value-of select="."/>
                        </text>

                        <line x1="0" x2="{$xAxisLength}" y1="-{$spacing * position()}"
                            y2="-{$spacing * position()}" stroke="black" stroke-dasharray="8 4"
                            stroke-width="1"/>
                    </xsl:for-each>

                    <text x="{$xAxisLength div 2}" y="-{$yAxisLength + 50}" font-size="40"
                        text-anchor="middle">
                        Relationships in Character Descriptors <!--<xsl:apply-templates select="title"/>-->
                    </text>

                    <text x="-110" y="-{$yAxisLength div 2}" font-size="35"
                        transform="rotate(-90 -110, -{$yAxisLength div 2})" text-anchor="middle">
                        Speakers </text>

                    <text x="{$xAxisLength div 2}" y="150" font-size="35" text-anchor="middle">
                        Subjects </text>

                    <!--*****************************-->
                    <!--Key                          -->
                    <!--*****************************-->

                    <rect x="{$xAxisLength + 50}" y="-90" width="30" height="30" fill-opacity="0.7"
                        fill="skyblue" stroke="black"/>
                    <rect x="{$xAxisLength + 50}" y="-150" width="30" height="30" fill-opacity="0.7"
                        fill="pink" stroke="black"/>

                    <rect x="{$xAxisLength + 50}" y="-30" width="30" height="30" fill-opacity="0.7"
                        fill="gold" stroke="black"/>

                    <text x="{$xAxisLength + 100}" y="-60" font-size="35" text-anchor="start"
                        >Positive</text>

                    <text x="{$xAxisLength + 100}" y="-120" font-size="35" text-anchor="start"
                        >Negative</text>

                    <text x="{$xAxisLength + 100}" y="-0" font-size="35" text-anchor="start"
                        >Neutral</text>

                    <!--************-->
                    <!--Circles -->
                    <!--************-->

                    <xsl:for-each-group select="descendant::descriptor" group-by="@subject">
                        <xsl:sort select="current-grouping-key()"/>
                        <xsl:variable name="currentSubject" select="current-grouping-key()"
                            as="xs:string"/>
                        <xsl:variable name="currentSubjectPosition" select="position()"
                            as="xs:integer"/>
                        <!--labels for subject-->

                        <!--<xsl:for-each select="sort(distinct-values(descendant::descriptor/@speaker))">  -->
                        <xsl:for-each
                            select="$currentStory//descriptor/@speaker => distinct-values() => sort()">
                            <!-- <xsl:message select="current-grouping-key()"/> -->
                            <xsl:variable name="currentSpeaker" select="." as="xs:string"/>
                            <xsl:variable name="currentSpeakerPosition" select="position()"
                                as="xs:integer"/>

                            <xsl:if test="$currentStory/@number eq '5'">
                                <xsl:message select="
                                        string-join(($currentSubject, $currentSubjectPosition, $currentSpeaker,
                                        $currentSpeakerPosition), ':')"
                                />
                            </xsl:if>
                            <!-- <xsl:if test="$currentSubjectPosition = 1">
                        
                    </xsl:if> 
                    -->


                            <xsl:variable name="positive">
                                <xsl:value-of
                                    select="count(current-group()[@sign = 'positive' and @speaker = $currentSpeaker])"
                                />
                            </xsl:variable>

                            <xsl:variable name="negative">
                                <xsl:value-of
                                    select="count(current-group()[@sign = 'negative' and @speaker = $currentSpeaker])"
                                />
                            </xsl:variable>

                            <xsl:variable name="radius" as="xs:double"
                                select="abs($positive - $negative)"/>

                            <!--NOTE: Eventually use area as opposed to radius to 
                            calculate more proportional size-->

                            <!--Change color of circle dependent on overall negative or positive relationship. 
                                        Size (radius) corresponds to strength of relationship.-->
                            <xsl:variable name="barColor" as="xs:string" select="
                                    if ($positive gt $negative) then
                                        'skyblue'
                                    else
                                        'pink'"/>



                            <xsl:if test="$radius eq 0">
                                <rect x="{$spacing * $currentSubjectPosition - 5}"
                                    y="-{$spacing * $currentSpeakerPosition  + 5}" width="10"
                                    height="10" fill="gold" fill-opacity=".7" stroke="black"
                                    transform="rotate(45 {$spacing * $currentSubjectPosition}, -{$spacing * $currentSpeakerPosition})"
                                />
                            </xsl:if>


                            <circle cx="{$spacing * $currentSubjectPosition}"
                                cy="-{$spacing * $currentSpeakerPosition}" r="{$radius * 20}"
                                fill="{$barColor}" fill-opacity=".7" stroke="black">
                                <!--<title><xsl:value-of select = "string-join(($currentSubject, $currentSpeaker, $positive, $negative), ':')"/></title>-->
                            </circle>




                        </xsl:for-each>



                    </xsl:for-each-group>



                </g>
            </svg>
        </xsl:result-document>
    </xsl:template>





</xsl:stylesheet>
