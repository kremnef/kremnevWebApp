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
        <div class="item">
            <xsl:call-template name="documentTypeImport">
                       <xsl:with-param name="documentType" select="$documentType"/>
                       <xsl:with-param name="contents" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item"/>
                       <xsl:with-param name="path" select="$baseURL"/>
                       <xsl:with-param name="mode" select="'item'"/>
                       <!--<xsl:with-param name="miniatureSize" select="'small'"/>-->
                       <xsl:with-param name="miniatureSize" select="'none'"/>
                   </xsl:call-template>


        </div>



    </xsl:template>

</xsl:stylesheet>