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
        <xsl:variable name="parentId" select="typifiedObject/id"/>
        <div class="item">
            <xsl:call-template name="documentTypeImport">
                       <xsl:with-param name="documentType" select="$documentType"/>
                       <xsl:with-param name="contents" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item"/>
                       <xsl:with-param name="path" select="$baseURL"/>
                       <xsl:with-param name="mode" select="'item'"/>
                       <!--<xsl:with-param name="miniatureSize" select="'small'"/>-->
                       <xsl:with-param name="miniatureSize" select="'none'"/>
                   </xsl:call-template>

            <!--<xsl:for-each
                    select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">

                <xsl:call-template name="listItems">
                    <xsl:with-param name="contents" select="."/>
                    <xsl:with-param name="objectURL" select="$objectURL"/>
                    <xsl:with-param name="path" select="$baseURL"/>
                    &lt;!&ndash;<xsl:with-param name="typeActionName" select="$typeActionName"/>&ndash;&gt;
                    <xsl:with-param name="documentType" select="$documentType"/>
                </xsl:call-template>

            </xsl:for-each>-->

        </div>



    </xsl:template>

    <xsl:template name="listItems">
        <xsl:param name="contents"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="documentType"/>

        <!--<h3>path: <xsl:value-of select="$path"/></h3>
        <h3>objectURL: <xsl:value-of select="$objectURL"/></h3>-->



    </xsl:template>

</xsl:stylesheet>