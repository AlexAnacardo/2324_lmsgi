<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 02.xsl.xsl
    Created on : 15 de abril de 2024, 12:02
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/listatickets">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text>&#10;</xsl:text>
        <xsl:apply-templates select="comment()"/>
        <html>
            <head>                
                <title>02 XSLT Alex Asensio Sanchez</title>                
                <meta name="description" content="informacion de tickets"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Alex Asensio Sanchez"/>
                <link href="css/estilos.css"  rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/> 
            </head>
            <body>
                <header>
                    <h1>Informacion de tickets</h1>
                </header>
                <main>
                    <xsl:apply-templates select="ticket"/>
                </main>
                <footer>
                    <div>Numero de tickets <xsl:value-of select="count(ticket)"/></div>
                    <div>Total de tickets <xsl:value-of select="sum(ticket/total)"/></div>
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="comment()">
        <xsl:comment>
            <xsl:value-of select="current()"/>
            <xsl:text>&#10;</xsl:text>
        </xsl:comment>
    </xsl:template>
    
    <!--Mostrar informacion de cada ticket-->
    <xsl:template match="ticket">
        <article>
            <h3>Tickets: <xsl:value-of select="numero"/></h3>
            <table>
                <caption>Fecha del ticket: <xsl:value-of select="fecha"/></caption>
                <thead>
                    <tr>
                        <th></th>
                        <th>Profucto</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="producto"/>
                </tbody>
                <tfot>
                    <tr>
                        <td colspan="2">Total</td> 
                        <td><xsl:value-of select="total"/></td>
                    </tr>
                </tfot>
            </table>
        </article>
    </xsl:template>
    
    <xsl:template match="producto">
        <tr>
            <td><xsl:value-of select="nombre/text()"/></td>
            <td><xsl:value-of select="precio/text()"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
