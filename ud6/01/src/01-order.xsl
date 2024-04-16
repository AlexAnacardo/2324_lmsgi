<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 01-for-each.xsl
    Created on : 11 de abril de 2024, 11:42
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
                <title>01-for-each.xsl</title>
            </head>
            <body>
                <header>
                    <h1>Informacion de viviendas</h1>
                </header>
                <main>
                    <xsl:for-each select="edificio/vivienda">
                        <!--Para ordenar hay que estar justo encima o directamente en lo que queramos ordenar-->
                        <xsl:sort select="piso" data-type="number"/>                        
                        <xsl:sort select="puerta"/>                                             
                        <p>
                            <xsl:value-of select="concat('Piso: ',piso,'Puerta: ',puerta)"/>
                        </p>
                        <ol>
                           <xsl:for-each select="vecinos/nombre">
                               <!--Este sort ordena los nombres, no hay select porque estamos justo en ellos-->
                               <xsl:sort/>   
                               <li><xsl:value-of select="text()"/></li>
                           </xsl:for-each>
                        </ol>
                    </xsl:for-each>
                </main>
                <footer>
                    <p>Numero de viviendas: <xsl:value-of select="count(//vivienda)"/></p>
                    <p>Numero total de vecinos: <xsl:value-of select="count(//nombre)"/></p>
                </footer>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>