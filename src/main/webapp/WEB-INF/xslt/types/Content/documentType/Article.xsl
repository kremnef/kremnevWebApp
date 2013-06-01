<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

                exclude-result-prefixes="ems">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>



    <xsl:template match="value[typeAction/name='Article' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="id" select="typifiedObject/@id"/>
        <xsl:variable name="path" select="typifiedObject/baseURL"/>
        <xsl:variable name="contents" select="typifiedObject"/>
        <xsl:variable name="documentType" select="typifiedObject/documentType/name"/>



        <xsl:call-template name="documentTypeImport">
            <xsl:with-param name="documentType" select="$documentType"/>
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="mode" select="'item'"/>
            <xsl:with-param name="miniatureSize" select="'medium'"/>
        </xsl:call-template>

    </xsl:template>

    <ems:templ name="Article-item"/>
    <ems:templ name="Article-list"/>


    <xsl:template match="ems:templ[@name='Article-item']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="miniatureSize"/>

        <!--<xsl:variable name="id" select="$contents/@id"/>
        <h4>path - <xsl:value-of select="$path"/></h4>
        <h4>id - <xsl:value-of select="$path"/></h4>
        <span class="xmlSource">
            <xsl:variable name="doc" select="$contents/document"/>
            <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource/Article/text"/>
        </span>-->



        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>

        <xsl:variable name="position" select="../key"/>
        <div class="widget-{$position}">
            <h3>
                <xsl:value-of select="$name"/>
            </h3>
            <span class="date">
                <xsl:call-template name="date:format-date">
                    <xsl:with-param name="date-time" select="$contents/@publishDateTime"/>
                    <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
                </xsl:call-template>
            </span>
            <xsl:if test="$imagePath != ''">
                <xsl:call-template name="miniature">
                    <xsl:with-param name="name" select="$name"/>
                    <xsl:with-param name="contents" select="$contents"/>
                    <xsl:with-param name="imagePath" select="$imagePath"/>
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
                </xsl:call-template>
            </xsl:if>
            <span class="xmlSource">
                <xsl:variable name="doc" select="$contents/document"/>
                <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource/Article/text"/>
            </span>

        </div>


    </xsl:template>


    <xsl:template match="ems:templ[@name='Article-list']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="miniatureSize"/>


        <!--Define Variables-->
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="document" select="$contents/document"/>

        <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>

        <div class="title">
            <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/systemName)}">
                <xsl:value-of select="$name"/>
            </a>
        </div>
        <xsl:if test="$imagePath != ''">
            <xsl:call-template name="miniature">
                <xsl:with-param name="name" select="$name"/>
                <xsl:with-param name="contents" select="$contents"/>
                <xsl:with-param name="imagePath" select="$imagePath"/>
                <xsl:with-param name="path" select="$path"/>
                <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:variable name="description" select="$contents/metaInfo/description"/>
        <xsl:if test="$description !=''">
            <span class="metaInfo">
                <!--<div id="{$systemName}-{$position}" class="{$typeActionName}">-->

                <xsl:value-of disable-output-escaping="yes" select="$description"/>
                <!--</div>-->
            </span>
        </xsl:if>


    </xsl:template>


</xsl:stylesheet>