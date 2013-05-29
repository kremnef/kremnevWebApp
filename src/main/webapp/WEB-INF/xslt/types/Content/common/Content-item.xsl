<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                exclude-result-prefixes="ems">

    <xsl:import href="Content-templates.xsl"/>
    <xsl:import href="../../functions.xsl"/>
    <!--<xsl:import href="../../documentType/document-types.xsl"/>-->

    <ems:templ name="showContents-showHTML"/>
    <ems:templ name="showContentBriefly-showHTML"/>

    <xsl:template match="ems:templ[@name='showContents-showHTML']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:call-template name="showContents">
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="ems:templ[@name='showContentBriefly-showHTML']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:call-template name="showContentBriefly">
            <xsl:with-param name="content" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="value[typeAction/name='showHTML' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>
        <xsl:variable name="position" select="../key"/>
        <xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="''"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>




</xsl:stylesheet>