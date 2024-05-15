<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01-xml.xsl
    Created on : 29 de abril de 2024, 11:52
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:element name="edificio">
            <xsl:apply-templates select="edificio/vivienda"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="edificio/vivienda">
        <!--
        <xsl:element name="vivienda">
            <xsl:attribute name="piso">
                <xsl:value-of select="piso"/>
            </xsl:attribute>
            <xsl:attribute name="puerta">
                <xsl:value-of select="puerta"/>
            </xsl:attribute>
        </xsl:element>
        -->
            <vivienda vivienda="{piso}" puerta="{puerta}"/>
            <xsl:copy-of select="vecinos"/>        
    </xsl:template>
</xsl:stylesheet>
