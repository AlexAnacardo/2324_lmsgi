<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : pregunta1.xsl
    Created on : 6 de junio de 2024, 11:56
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/datos">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <xsl:text> &#10;</xsl:text>
        <html lang="es">
            <head>
                <meta name="description" content="informacion de tickets"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta name="author" content="Alex Asensio Sanchez"/>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>
                <title>Examen Alex Asensio Sanchez</title>
            </head>
            <body>
                <div id="botones">
                    <p><a href="#prov">Proveedor</a></p>
                    <p><a href="#prod">Productos</a></p>
                    <p><a href="#proy">Proyectos</a></p>
                    <p><a href="#sumi">Suministros</a></p>
                    <p><a href="#estad">Estadistica</a></p>
                </div>
                <div id="contenido">
                    <article id="prov">
                        <header>
                            <h2>Proveedores</h2>                                
                        </header>
                        <xsl:apply-templates select="proveedores"/>
                    </article>
                    
                    <article id="prod">
                        <header>
                            <h2>Productos</h2>                                
                        </header>
                        <xsl:apply-templates select="productos"/>
                    </article>
                    
                    <article id="proy">
                        <header>
                            <h2>Proyectos</h2>                                
                        </header>
                        <xsl:apply-templates select="proyectos"/>
                    </article>
                    
                    <article id="sumi">
                        <header>
                            <h2>Suministra</h2>                                
                        </header>
                        <xsl:apply-templates select="suministros" mode="tabla1"/>
                    </article>
                    
                    <article id="estad">
                        <header>
                            <h2>Numero de productos / vendedor</h2>                                
                        </header>
                        <xsl:apply-templates select="suministros" mode="tabla2"/>
                    </article>
                </div>
                
            </body>
        </html>
    </xsl:template>
    
    
    
    
    <xsl:template match="proveedores">
        <table>
            <thead>                
                <tr>
                    <th>Nombre(Num Proveedor)</th>
                    <th>Estado</th>
                    <th>Ciudad</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="proveedor">
                    <tr>
                        <td><xsl:value-of select="concat(nombreprov,'(',@numprov,')')"/></td>
                        <td><xsl:value-of select="estado"/></td>
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>
                </xsl:for-each>
            </tbody>            
        </table>
    </xsl:template>


    <xsl:template match="productos">
        <table>
            <thead>                
                <tr>
                    <th>Nombre(Num Producto)</th>
                    <th>Color</th>
                    <th>Peso</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="producto">
                    <tr>
                        <td><xsl:value-of select="concat(nombreproducto,'(',@numproducto,')')"/></td>
                        <td><xsl:value-of select="color"/></td>
                        <td><xsl:value-of select="peso"/></td>
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>
                </xsl:for-each>
            </tbody>            
        </table>
    </xsl:template>


    <xsl:template match="proyectos">
        <table>
            <thead>                
                <tr>
                    <th>Nombre(Num Proyecto)</th>
                    <th>Ciudad</th>                    
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="proyecto">
                    <tr>
                        <td><xsl:value-of select="concat(nombreproyecto,'(',@numproyecto,')')"/></td>                        
                        <td><xsl:value-of select="ciudad"/></td>
                    </tr>
                </xsl:for-each>
            </tbody>            
        </table>
    </xsl:template>


    <xsl:template match="suministros" mode="tabla1">
        <table>
            <thead>                
                <tr>
                    <th>Nombre(Num Proyecto)</th>
                    <th>Producto(Num Prod)</th>
                    <th>Proyecto(Num Proy)</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <xsl:for-each select="suministra">
                    <xsl:variable name="provee" select="numprov"/>
                    <xsl:variable name="prod" select="numproducto"/>
                    <xsl:variable name="proy" select="numproyecto"/>
                    <tr>                    
                        <td><xsl:value-of select="concat(../../proveedores/proveedor[@numprov=$provee]/nombreprov,'(',$provee,')')"/></td>
                        <td><xsl:value-of select="concat(../../productos/producto[@numproducto=$prod]/nombreproducto,'(',$prod,')')"/></td>
                        <td><xsl:value-of select="concat(../../proyectos/proyecto[@numproyecto=$proy]/nombreproyecto,'(',$proy,')')"/></td>                                                                 
                        <td><xsl:value-of select="cantidad"/></td>
                    </tr>
                </xsl:for-each>
            </tbody>        
            <tfoot>
                <tr>
                    <td><xsl:value-of select="concat('x','/',count(suministra/numprov))"/></td>
                    <td><xsl:value-of select="concat('x','/',count(suministra/numproducto))"/></td>
                    <td><xsl:value-of select="concat('x','/',count(suministra/numproyecto))"/></td>
                    <td><xsl:value-of select="sum(suministra/cantidad)"/></td>
                </tr>
            </tfoot>    
        </table>
    </xsl:template>
    
    
    <xsl:template match="suministros" mode="tabla2">
        <p>v1: <xsl:value-of select="count(suministra[numprov='v1'])"/> suministros</p> 
        <p>v2: <xsl:value-of select="count(suministra[numprov='v2'])"/> suministros</p> 
        <p>v3: <xsl:value-of select="count(suministra[numprov='v3'])"/> suministros</p> 
        <p>v4: <xsl:value-of select="count(suministra[numprov='v4'])"/> suministros</p> 
        <p>v5: <xsl:value-of select="count(suministra[numprov='v5'])"/> suministros</p> 
        
    </xsl:template>
</xsl:stylesheet>
