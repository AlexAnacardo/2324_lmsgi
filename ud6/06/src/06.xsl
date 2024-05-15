<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 06.xsl
    Created on : 7 de mayo de 2024, 9:25
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>    
    <xsl:param name="corregido" select="'no'"/>
    
    <xsl:template match="/examen">  
        <xsl:call-template name="escribirDoctype"/>      
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/> 
                <xsl:call-template name="escribirTitulo">
                    <!--Al pasar cadena debe ser asi " ' aaa ' " para numeros y expresiones solo se usan comillas dobles-->
                    <xsl:with-param name="titulo" select="'06 XSLT Alex Asensio Sanchez'"/>
                </xsl:call-template>
            </head>
            <body>                
                <header>
                    <xsl:apply-templates select="datos"/>
                </header>
                <main>                    
                    <form action="examen.php" method="get">                        
                        <xsl:apply-templates select="preguntas/pregunta"/> 
                        <xsl:if test="$corregido='no'">
                            <fieldset class="botones">
                                <input type="submit" value="Enviar formulario"/>
                                <input type="reset" value="limpiar"/>
                            </fieldset>
                        </xsl:if>                     
                    </form>
                </main>               
            </body>
        </html>
    </xsl:template>

    <xsl:template match="datos">
        <h1><xsl:value-of select="nombreCiclo"/></h1>
        <h2><xsl:value-of select="document('../data/modulosdaw1.xml')/modulos/modulo[@codM=current()/nombreModulo]"/></h2>        
        <h3><xsl:value-of select="concat('Fecha: ',fecha/dia,' de ',document('../data/meses.xml')/meses/mes[@id=current()/fecha/dia],' de ',fecha/anyo)"/></h3>
    </xsl:template>
    <xsl:template match="preguntas/pregunta">  <!--Como hay mas de un elemento pregunta, esto funciona como un bucle-->
        <fieldset>
            <p><xsl:value-of select="concat(@id,'.-',enunciado)"/></p>
            <xsl:apply-templates select="respuestas/respuesta"/> <!--Como hay mas de un elemento pregunta, esto funciona como un bucle-->            
        </fieldset>
    </xsl:template>
    
    <xsl:template match="respuestas/respuesta">
        <xsl:variable name="idPregunta" select="../../@id"/>
        <div>
            <label>
                <input type="radio" name="{concat('p',$idPregunta)}" value="{concat($idPregunta,position())}">                
                    <xsl:if test="$corregido='si'">
                        <xsl:attribute name="disabled"/>
                        <xsl:if test="@correcta='correcta'">
                            <xsl:attribute name="checked"/>
                        </xsl:if>
                    </xsl:if>
                </input>
                <xsl:value-of select="current()"/>
            </label>
        </div>
    </xsl:template>
</xsl:stylesheet>
