<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01.xsl
    Created on : 9 de abril de 2024, 10:34
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
        syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/edificio">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>01.xsl</title>
            </head>
            <body>
                <header>
                    <h1>Informacion de las viviendas</h1>
                </header>
                <main>                    
                    <xsl:apply-templates select="vivienda"/>                                            
                </main>                                
                <footer>
                    <p>Numero de viviendas: <xsl:value-of select="count(//vivienda)"/></p>
                    <p>Numero total de vecinos: <xsl:value-of select="count(//nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="vivienda">
        <p>Piso: <xsl:value-of select="piso"/> Puerta: <xsl:value-of select="puerta"/></p>
        <ol>
            <!--<xsl:apply-templates select="vecinos/nombre">-->
            <xsl:apply-templates select="vecinos/nombre">
                <xsl:sort/>
            </xsl:apply-templates>
        </ol>
    </xsl:template>
    
    <xsl:template match="vecinos/nombre">
        <li> <xsl:value-of select="text()"/> </li>
    </xsl:template>
</xsl:stylesheet>
