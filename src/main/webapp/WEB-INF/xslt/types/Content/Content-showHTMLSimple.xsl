<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://ems.strela.ru/"
                exclude-result-prefixes="ems">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <!--<xsl:import href="Content-templates.xsl"/>-->

    <xsl:template match="value[typeAction/name='showOneContentWithOutChildren' and typifiedObject/objectType/name='Content']">

        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>
        <xsl:call-template name="showContentSimple">
            <xsl:with-param name="content" select="typifiedObject"/>
            <!--<xsl:with-param name="objectURL" select="$objectURL"/>-->
            <!--<xsl:with-param name="path" select="$baseURL"/>-->
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="showContentSimple">
        <xsl:param name="content"/>

        <xsl:param name="typeActionName"/>

        <xsl:variable name="systemName" select="$content/emsObject/systemName"/>

        <xsl:variable name="position" select="../key"/>
        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <xsl:variable name="doc" select="$content/documents"/>
                <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource"/>
            </div>
        </div>

    </xsl:template>
</xsl:stylesheet>