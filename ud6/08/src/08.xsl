<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 08.xsl
    Created on : 3 de junio de 2024, 11:27
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>    

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/prediccion">
        <html>
            <head>
                <meta name="description" content="informacion de tickets"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Alex Asensio Sanchez"/>
                <link href="estilos/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
                <title>Alex Asensio Sanchez</title>
            </head>
            <body>
                <header>
                    <h1>Predicción por municipios</h1>                    
                </header>
                <div>
                    <header>
                        <h2>El tiempo. <xsl:value-of select="municipio/nombre"/> (<xsl:value-of select="municipio/provincia"/>)</h2>
                    </header>
                    <table>
                        <thead>
                            <tr>
                                <td>Dia</td>
                                <td>Prob. precip.</td>
                                <td>Estado del cielo</td>
                                <td>Temperatura (ºC)</td>
                                <td>Viento (km/h)</td>                                
                            </tr>                        
                        </thead>
                        <tbody>
                            <xsl:for-each select="dia">
                                <xsl:variable name="clima" select="estado_cielo"/>
                                <xsl:variable name="direccion" select="viento/direccion"/>
                                <tr>                                
                                    <td><xsl:value-of select="substring(@fecha, 9, 10)"/></td>
                                    <td><xsl:value-of select="prob_precipitacion"/>%</td>
                                    <td><img src="images/{$clima}.gif"/></td>
                                    
                                    <td>
                                        <span class="min"><xsl:value-of select="temperatura/minima"/></span>
                                        /
                                        <span class="max"><xsl:value-of select="temperatura/maxima"/></span>
                                    </td>
                                    <td>
                                        <img src="images/{$direccion}.gif"/> <xsl:value-of select="viento/velocidad"/>                                                                                
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
