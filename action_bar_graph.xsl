<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xml" indent="yes"/>
    <xsl:variable name="yscale" as="xs:integer" select="30"/>
    <xsl:variable name="xscale" as="xs:integer" select="10"/>
    
    <xsl:template match="/">
        <svg height="5200" width="700">
            <text x="350" y="50" text-anchor="middle" writing-mode="lr" font-weight="bold" font-size="20"> The Type of Actions Done by a Character in Norse-Tales</text>
            <line x1="-20" x2="700" y1="60" y2="60" stroke="black" stroke-width="2"/>
            <xsl:apply-templates select="//story">
                <xsl:sort select="@number" data-type="number"/>
            </xsl:apply-templates>
        </svg>
    </xsl:template>
    <xsl:template match="story">
        <xsl:variable name="actor_count" as="xs:integer" select="count(distinct-values(descendant::action/@actor))"/>
        <g transform="translate(180,{(position()*400)-250})" class="{@number}">
            <!-- Title -->
            <text x="100" y="-40" text-anchor="middle" writing-mode="lr" font-weight="bold" font-size="15"><xsl:apply-templates select="title"/></text>
            <!-- Labeled Axes -->
            <text x="-75" y="-20" text-anchor="middle" writing-mode="lr" font-size="12"># of Negative Actions</text>
            <text x="125" y="-20" text-anchor="middle" writing-mode="lr" font-size="12"># of Positive Actions</text>
            <text x="0" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">0</text>
            <line x1="-10" x2="-10" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1" opacity="0.7"/>
            <text x="-10" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">1</text>
            <line x1="-20" x2="-20" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-20" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">2</text>
            <line x1="-30" x2="-30" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-30" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">3</text>
            <line x1="-40" x2="-40" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-40" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">4</text>
            <line x1="-50" x2="-50" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-50" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">5</text>
            <line x1="-60" x2="-60" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-60" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">6</text>
            <line x1="-70" x2="-70" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-70" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">7</text>
            <line x1="-80" x2="-80" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-80" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">8</text>
            <line x1="-90" x2="-90" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-90" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">9</text>
            <line x1="-100" x2="-100" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="-100" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">10</text>
            
            <line x1="10" x2="10" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="10" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">1</text>
            <line x1="20" x2="20" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="20" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">2</text>
            <line x1="30" x2="30" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="30" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">3</text>
            <line x1="40" x2="40" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="40" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">4</text>
            <line x1="50" x2="50" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="50" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">5</text>
            <line x1="60" x2="60" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="60" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">6</text>
            <line x1="70" x2="70" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="70" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">7</text>
            <line x1="80" x2="80" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="80" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">8</text>
            <line x1="90" x2="90" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="90" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">9</text>
            <line x1="100" x2="100" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="100" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">10</text>
            <line x1="110" x2="110" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="110" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">11</text>
            <line x1="120" x2="120" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="120" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">12</text>
            <line x1="130" x2="130" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="130" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">13</text>
            <line x1="140" x2="140" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="140" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">14</text>
            <line x1="150" x2="150" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="150" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">15</text>
            <line x1="160" x2="160" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="160" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">16</text>
            <line x1="170" x2="170" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="170" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">17</text>
            <line x1="180" x2="180" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="180" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">18</text>
            <line x1="190" x2="190" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="190" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">19</text>
            <line x1="200" x2="200" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="200" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">20</text>
            <line x1="210" x2="210" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="210" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">21</text>
            <line x1="220" x2="220" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="220" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">22</text>
            <line x1="230" x2="230" y1="0" y2="{$actor_count*$yscale}" stroke="lightgray" stroke-width="1"/>
            <text x="230" y="-5" text-anchor="middle" writing-mode="lr" font-size="8">23</text>
            <line x1="240" x2="240" y1="-10" y2="{$actor_count*$yscale}" stroke="black" stroke-width="2"/>
            
            <xsl:for-each-group select="descendant::action" group-by="@actor">
                <xsl:variable name="pos_count" as="xs:integer" select="count(current-group()/@sign[.='positive'])"/>
                <xsl:variable name="neg_count" as="xs:integer" select="count(current-group()/@sign[.='negative'])"/>
                <xsl:variable name="yPosition" as="xs:integer" select="position()-1"/>
                <xsl:variable name="neu_count" as="xs:integer" select="count(current-group()/@sign[.='neutral'])"/>
                
                <!-- Negaitive rec -->
                <rect x="{-$neg_count*$xscale}" width="{$neg_count*$xscale}" y="{$yPosition*$yscale}" height="20" fill="pink" stroke-width="2" stroke="deeppink" opacity="0.6"/>
                
                <!-- Positive rec (down)-->
                <rect x="0" width="{$pos_count*$xscale}" y="{$yPosition*$yscale}" height="20" fill="skyblue" stroke-width="2" stroke="blue" opacity="0.6"/>
                
                <!-- Label and Label Lines -->
                <text x="250" y="{$yPosition*$yscale +15}" text-anchor="start" writing-mode="lr" font-size="12"><xsl:apply-templates select="distinct-values(current-group()/@actor)"/></text>
                <line x1="-125" x2="350" y1="{$yPosition*$yscale +25}" y2="{$yPosition*$yscale +25}" stroke="lightgray" stroke-dasharray="8 4"/>
                
                <!-- Neutral rec -->
                <rect x="{$pos_count*$xscale}" width="{$neu_count*$xscale}" y="{$yPosition*$yscale}" height="20" fill="gold" opacity="0.6" stroke-width="2" stroke="darkorange"></rect>
                
                <!-- Axes -->
                <line x1="-125" x2="350" y1="0" y2="0" stroke="black" stroke-width="2" stroke-linecap="square"/>
                <line x1="0" x2="0" y1="0" y2="{$actor_count*$yscale}" stroke="black" stroke-width="2" stroke-linecap="square"/>
                
                <!-- Key -->
                <rect x="375" width="125" y="0" height="100" fill="white" stroke="black" stroke-width="1"></rect>
                <text x="390" y="25" text-anchor="start" writing-mode="lr" font-size="20" font-weight="bold">Key</text>
                <line x1="390" x2="425" y1="27.5" y2="27.5" stroke="black" stroke-width="2"/>
                <rect x="400" width="12.5" y="37.5" height="12.5" fill="pink" stroke-width="2" stroke="deeppink" opacity="0.6"/>
                <text x="420" y="49" text-anchor="start" writing-mode="lr" font-size="15">Negative</text>
                <rect x="400" width="12.5" y="37.5" height="12.5" fill="skyblue" stroke-width="2" stroke="blue" transform="translate(0, 20)" opacity="0.6"/>
                <text x="420" y="49" text-anchor="start" writing-mode="lr" font-size="15" transform="translate(0,20)">Positive</text>
                <rect x="400" width="12.5" y="37.5" height="12.5" fill="gold" stroke-width="2" stroke="darkorange" transform="translate(0, 40)" opacity="0.6"/>
                <text x="420" y="49" text-anchor="start" writing-mode="lr" font-size="15" transform="translate(0,40)">Neutral</text>
                
            </xsl:for-each-group>
        </g>
    </xsl:template>
    
</xsl:stylesheet>