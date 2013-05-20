<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

                exclude-result-prefixes="ems">



    <ems:templ name="Article-item"/>
    <ems:templ name="Article-list"/>


    <xsl:template match="ems:templ[@name='Article-item']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>


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

         <xsl:variable name="document" select="$contents/documents"/>

         <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>-->

        <div class="item">
            <h1>
                <xsl:value-of select="$name"/>
            </h1>
            <span class="date">
                <xsl:call-template name="date:format-date">
                    <xsl:with-param name="date-time" select="$contents/publishDateTime"/>
                    <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
                </xsl:call-template>
            </span>
            <xsl:call-template name="miniature">
                <xsl:with-param name="name" select="$name"/>
                <xsl:with-param name="contents" select="$contents"/>
                <xsl:with-param name="imagePath" select="$imagePath"/>
                <xsl:with-param name="path" select="$path"/>
            </xsl:call-template>
            <p>
                SOME TEXT
            </p>

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

        <!--
                <xsl:variable name="post-link" select="date"/>
                <xsl:variable name="post-title" select="$name"/>

                <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
                <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

        -->
        <!--<xsl:variable name="document" select="$contents/documents[language/code=$locale and version=$maxVersion]"/>-->
        <xsl:variable name="document" select="$contents/documents"/>

        <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>
        <!--<xsl:variable name="imagePath" select="$document/xmlSource/*[name()=$documentTypeName]/image"/>-->

        <div class="date">
            <xsl:call-template name="date:format-date">
                <xsl:with-param name="date-time" select="$contents/publishDateTime"/>
                <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
            </xsl:call-template>
        </div>

        <div class="title">
            <a  href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
                <xsl:value-of select="$name"/>
            </a>
        </div>

        <xsl:call-template name="miniature">
                  <xsl:with-param name="name" select="$name"/>
                  <xsl:with-param name="contents" select="$contents"/>
                  <xsl:with-param name="imagePath" select="$imagePath"/>
                  <xsl:with-param name="path" select="$path"/>
                  <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
              </xsl:call-template>
    </xsl:template>




</xsl:stylesheet>