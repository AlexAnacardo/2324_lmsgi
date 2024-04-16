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
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html/&gt;</xsl:text>
        <html>
            <head>
                
                <title>02 XSLT Alex Asensio Sanchez</title>
            </head>
            <body>
                
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
