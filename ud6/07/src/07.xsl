<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 07.xsl
    Created on : 9 de mayo de 2024, 11:30
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" omit-xml-declaration="yes"/>

    <xsl:variable name="newline" select="'&#10;'"/>
    <xsl:variable name="tab" select="'    '"/>
    
    <xsl:template match="/network">
        <xsl:value-of select="name()"/>:<xsl:value-of select="$newline"/>
        <xsl:value-of select="concat($tab,'ethernets:',$newline)"/>
        <xsl:for-each select="ethernets">                        
            <xsl:value-of select="concat($tab,$tab,name,':',$newline)"/>           
            <xsl:value-of select="concat($tab,$tab,$tab,'addresses:',$newline)"/>
            <xsl:value-of select="concat($tab,$tab,$tab,$tab,addresses,$newline)"/>
            <xsl:if test="gateway4">                
                <xsl:value-of select="concat($tab,$tab,'routes:',$newline)"/>                
                <xsl:value-of select="concat($tab,$tab,$tab,'to: default',$newline)"/>                
                <xsl:value-of select="concat($tab,$tab,$tab,'via: ',gateway4,$newline)"/>
            </xsl:if>
            <xsl:if test="nameservers">
                <xsl:apply-templates select="nameservers"/>
            </xsl:if>
            <xsl:value-of select="$newline"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="nameservers">        
        <xsl:value-of select="concat($tab,$tab,name(),$newline)"/>              
        <xsl:value-of select="concat($tab,$tab,$tab,'addresses: ',$newline)"/>
        <xsl:for-each select="addresses">            
            <xsl:value-of select="concat($tab,$tab,$tab,$tab,current(),$newline)"/>
        </xsl:for-each>
    </xsl:template>   
</xsl:stylesheet>
