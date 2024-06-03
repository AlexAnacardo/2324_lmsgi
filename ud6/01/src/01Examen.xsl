<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01Examen.xsl
    Created on : 3 de junio de 2024, 8:45
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <html>
            <head>
                <title>01Examen.xsl</title>
            </head>
            <body>
                <header>
                    <h1>Listado de viviendas</h1>
                </header>                
                <xsl:for-each select="edificio/vivienda">
                    <p>Piso: <xsl:value-of select="piso"/> Puerta: <xsl:value-of select="puerta"/></p>
                    <ol>
                        <xsl:for-each select="vecinos/nombre">
                            <li><xsl:value-of select="current()"/></li>
                        </xsl:for-each>
                    </ol>                    
                </xsl:for-each>
                <footer>
                    <p>Numero de viviendas: <xsl:value-of select="count(//vivienda)"/></p>
                    <p>Numero total de vecinos: <xsl:value-of select="count(//nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
