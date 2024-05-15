<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/root">
        <root>
            <xsl:for-each select="row">
                <row>
                    <Anyo><xsl:value-of select="@Anyo"/></Anyo>
                    <Concepto><xsl:value-of select="@Concepto"/></Concepto>
                    <Usuarios_registrados><xsl:value-of select="@Usuarios_registrados"/></Usuarios_registrados>
                </row>
            </xsl:for-each>
        </root>
    </xsl:template>  
</xsl:stylesheet>
