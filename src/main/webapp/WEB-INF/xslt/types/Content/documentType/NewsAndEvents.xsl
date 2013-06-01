<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

                exclude-result-prefixes="ems">


    <ems:templ name="NewsAndEvents-item"/>
    <ems:templ name="NewsAndEvents-list"/>


    <xsl:template match="ems:templ[@name='NewsAndEvents-item']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="miniatureSize"/>

        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>

        <!-- <xsl:variable name="post-link" select="date"/>
         <xsl:variable name="post-title" select="$name"/>

         <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
         <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

         <xsl:variable name="document" select="$contents/document"/>

         <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>-->
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
                <!--<div id="{$systemName}-{$position}" class="{$typeActionName}">-->
                <xsl:variable name="doc" select="$contents/document"/>
                <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource/NewsAndEvents/text"/>
                <!--</div>-->
            </span>

        </div>


    </xsl:template>


    <xsl:template match="ems:templ[@name='NewsAndEvents-list']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="miniatureSize"/>


        <!--Define Variables-->
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <!--
                <xsl:variable name="post-link" select="date"/>
                <xsl:variable name="post-title" select="$name"/>

                <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
                <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

        -->
        <!--<xsl:variable name="document" select="$contents/document[language/code=$locale and version=$maxVersion]"/>-->
        <xsl:variable name="document" select="$contents/document"/>

        <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>
        <!--<xsl:variable name="imagePath" select="$document/xmlSource/*[name()=$documentTypeName]/image"/>-->

        <div class="date">
            <xsl:call-template name="date:format-date">
                <xsl:with-param name="date-time" select="$contents/@publishDateTime"/>
                <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
            </xsl:call-template>
        </div>

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