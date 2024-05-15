<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 03.xsl
    Created on : 30 de abril de 2024, 9:29
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>
    <!--Generar la estructura de la web-->    
    <xsl:template match="/">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>    
                <xsl:call-template name="escribirTitulo">
                    <!--Al pasar cadena debe ser asi " ' lalalal ' " para numeros y expresiones solo se usan comillas dobles-->
                    <xsl:with-param name="titulo" select="'03 XSLT Alex Asensio Sanchez'"/>
                </xsl:call-template>                            
            </head>
            <body>
                <header>                    
                    <h1>Horario del curso escolar<xsl:value-of select="horario/curso"/></h1>
                    <h2>CFGS Desarrollo de Aplicaciones Web <br/>Curso 1º</h2>
                </header>
                <nav>
                    <ul>
                        <xsl:apply-templates select="horario/modulos/modulo" mode="menu"/>
                    </ul>                    
                </nav>
                <main>
                    <xsl:apply-templates select="horario/modulos/modulo" mode="tablas"/>
                </main>
                <footer>
                    
                </footer>
            </body>
        </html>
    </xsl:template>
    
    <!--Plantillas para escribir los elementos del menu con las siglas de los modulos-->
    <xsl:template match="horario/modulos/modulo" mode="menu">
        <li>
            <a href="{concat('#',sigla)}">
                <xsl:value-of select="sigla"/>
            </a>            
        </li>
    </xsl:template>
    <!--Mode diferncia templates con las misma ruta-->
    <xsl:template match="horario/modulos/modulo" mode="tablas">
        <article id="{sigla}">
            <h3><xsl:value-of select="sigla"/></h3>
            <table>
                <thead>
                    <tr>
                        <th>Horario</th>
                        <th>Lunes</th>
                        <th>Martes</th>
                        <th>Miercoles</th>
                        <th>Jueves</th>
                        <th>Viernes</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="//dia">
                    <!--Name= nombre variable  select=asignar valor variable-->
                    <xsl:with-param name="pSigla" select="sigla"/>
                </xsl:apply-templates>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="6"><xsl:value-of select="profesor"/></th>
                    </tr>
                </tfoot>                                                    
            </table>
        </article>
    </xsl:template>
    <!--Escribir tabla segun el parametro sigla-->
    <xsl:template match="//dia">
        <xsl:param name="pSigla"/>
        <tr>
            <!--@ se usa para los atributos-->
            <td><xsl:value-of select="@hora"/></td>
            <xsl:for-each select="dia_sem">
                <td rowspan="{@num}">
                    <!--text() corresponde al texto de dentro de <dia_sem>, si coincide lo escribira, si no concide no lo escribira-->
                    <xsl:if test="text()=$pSigla">
                        <!--Este span añade una clase-->
                        <span class="{text()}"><xsl:value-of select="text()"/></span>
                    </xsl:if>
                </td>
            </xsl:for-each>
        </tr>
    </xsl:template>
</xsl:stylesheet>
