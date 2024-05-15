<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>
    
    <xsl:template name="escribirDoctype">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text> &#10;</xsl:text>
    </xsl:template>
    
    <xsl:template name="escribirMeta">
        <meta name="description" content="informacion de tickets"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta name="author" content="Alex Asensio Sanchez"/>
    </xsl:template>    
        
    <xsl:template name="escribirTitulo">
        <xsl:param name="titulo"/>        
        <title><xsl:value-of select="$titulo"/></title>
    </xsl:template>   
</xsl:stylesheet>