<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://ems.strela.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="../../ext/date.format-date.template.xsl"/>
    <xsl:import href="Content-templates.xsl"/>
    <xsl:import href="../functions.xsl"/>
    <xsl:import href="../document-types.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='renderAsList' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <xsl:call-template name="render-as-list">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="''"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>








</xsl:stylesheet>