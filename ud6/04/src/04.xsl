<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : 04.xsl.xsl
    Created on : 2 de mayo de 2024, 11:50
    Author     : daw1
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../../lib/plantillahtml.xsl"/>
    <xsl:output method="html"/>

    <!-- TODO customize transformation rules 
         syntax recommendation http://www.w3.org/TR/xslt 
    -->
    <xsl:template match="/">
        <xsl:call-template name="escribirDoctype"/>
        <html>
            <head>
                <xsl:call-template name="escribirMeta"/>
                <link href="css/estilos.css" rel="stylesheet" type="text/css"/>
                <link rel="icon" href="images/favicon.ico" type="image/x-icon"/>     
                <xsl:call-template name="escribirTitulo">
                    <!--Al pasar cadena debe ser asi " ' aaa ' " para numeros y expresiones solo se usan comillas dobles-->
                    <xsl:with-param name="titulo" select="'04 XSLT Alex Asensio Sanchez'"/>
                </xsl:call-template>   
            </head>
            <body>
                <table>
                    <thead>
                        <tr>
                            <th colspan="4">FACTURA NUMERO <xsl:value-of select="factura/@n_factura"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">DATOS EMISOR</td>
                        </tr>
                        <xsl:apply-templates select="factura/datos_emisor"/>
                        <tr>
                            <td colspan="4">DATOS RECEPTOR</td>
                        </tr>
                        <xsl:apply-templates select="factura/datos_receptor"/>
                        <tr>
                            <td colspan="4">RESUMEN FACTURA</td>
                        </tr>
                        <xsl:apply-templates select="factura/datos_factura" mode="datos"/>                                                                                                
                        <tr>
                            <td colspan="4">IMPORTES FACTURA</td>
                        </tr>
                        <xsl:apply-templates select="factura/datos_factura" mode="total"/>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="factura/datos_emisor">
        <tr>
            <td colspan="2"><span class="negrita">Razon social</span>: <xsl:value-of select="nombre"/></td>
            <td colspan="2"><span>NIF/CIF</span> <xsl:value-of select="cif"/></td>
        </tr>
        <tr>
            <td rowspan="3" colspan="2"><span class="negrita">Direccion</span></td>
            <td colspan="2" ><xsl:value-of select="dir"/></td>
        </tr>
        <tr>
            <td colspan="2"><xsl:value-of select="poblacion/@cod_postal"/><xsl:value-of select="poblacion"/></td>
        </tr>
        <tr>
            <td colspan="2"><xsl:value-of select="provincia"/></td>
        </tr>
        <tr>
            <td colspan="4">DATOS DE CONTACTO</td>
        </tr>
        <tr>
            <td colspan="2"><span class="negrita">Telefono: </span><xsl:value-of select="telefono"/></td>
            <td colspan="2"><span class="negrita">FAX: </span><xsl:value-of select="fax"/></td>
        </tr>        
    </xsl:template>
    <xsl:template match="factura/datos_receptor">
        <tr>
            <td><span class="negrita"/><xsl:value-of select="@n_ci"/></td>
        </tr>
        <tr>
            <td rowspan="3" colspan="2"><span class="negrita">Direccion</span></td>
            <td colspan="2"><xsl:value-of select="dir_env"/></td>
        </tr>
        <tr>
            <td colspan="2"><xsl:value-of select="poblacion/@cod_postal"/><xsl:value-of select="poblacion"/></td>
        </tr>
        <tr>
            <td colspan="2"><xsl:value-of select="provincia"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="factura/datos_factura" mode="datos">
        <tr>
            <td colspan="2"><span class="negrita">Numero pedido</span>: <xsl:value-of select="@n_ped"/></td>
            <td><span class="negrita">Iva: </span><xsl:value-of select="@iva"/>%</td>
            <td><span class="negrita">Forma de pago: </span><xsl:value-of select="@f_pago"/></td>
        </tr>
    </xsl:template>
    
    
    <xsl:template match="factura/datos_factura" mode="total">
        <tr>
            <td colspan="2"><span class="negrita">Base:</span><xsl:value-of select="base"/></td>
            <td><span class="negrita">Cuota IVA: </span><xsl:value-of select="cuota_iva"/></td>
            <td><span class="negrita">Total factura: </span><xsl:value-of select="total"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>
