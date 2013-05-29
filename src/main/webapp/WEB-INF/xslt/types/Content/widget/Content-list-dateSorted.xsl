<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">


    <!--<xsl:import href="../../../types/functions.xsl"/>
    <xsl:import href="../common/Content-ems-templates-documentTypeImport.xsl"/>-->

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>


    <xsl:template match="value[typeAction/name='dateSorted' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>
        <xsl:variable name="documentType" select="typifiedObject/documentType/name"/>
        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="parentId" select="typifiedObject/@id"/>


        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="typifiedObject"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:for-each
                select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
            <xsl:if test="objectURL = systemName">

                <!-- <h4>$systemName:
                        <xsl:value-of select="systemName"/>
                    </h4>
                    <h4>$objectURL:
                        <xsl:value-of select="objectURL"/>
                    </h4>-->
                <!--<h4>$baseURL:
                    <xsl:value-of select="$baseURL"/>
                </h4>-->
                <xsl:call-template name="documentTypeImport">
                    <xsl:with-param name="documentType" select="$documentType"/>
                    <xsl:with-param name="contents" select="."/>
                    <xsl:with-param name="path" select="$baseURL"/>
                    <xsl:with-param name="mode" select="'item'"/>
                    <xsl:with-param name="miniatureSize" select="'medium'"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>

        <h3>
            <xsl:value-of select="$name"/>
            <xsl:value-of select="$typeActionName"/>
        </h3>
        <div class="list-items">
            <xsl:for-each
                    select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">

                <xsl:if test="objectURL != systemName">
                    <xsl:call-template name="listItems">
                        <xsl:with-param name="contents" select="."/>
                        <xsl:with-param name="objectURL" select="$objectURL"/>
                        <xsl:with-param name="path" select="$baseURL"/>
                        <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                        <xsl:with-param name="documentType" select="$documentType"/>
                    </xsl:call-template>
                </xsl:if>


            </xsl:for-each>

        </div>
        <xsl:variable name="showAll" select="concat($documentType, '.showAll')"/>
        <div class="all">
            <a href="{$baseURL}">
                <i18n:text key="{$showAll}"/>
            </a>
        </div>


    </xsl:template>

    <xsl:template name="listItems">
        <xsl:param name="contents"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="documentType"/>

        <!--<h3>path: <xsl:value-of select="$path"/></h3>
        <h3>objectURL: <xsl:value-of select="$objectURL"/></h3>-->

        <xsl:call-template name="documentTypeImport">
            <xsl:with-param name="documentType" select="$documentType"/>
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="mode" select="'list'"/>
            <xsl:with-param name="miniatureSize" select="'small'"/>
            <!--<xsl:with-param name="miniatureSize" select="'none'"/>-->
        </xsl:call-template>


    </xsl:template>

</xsl:stylesheet>