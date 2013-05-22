<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"

                exclude-result-prefixes="ems">


    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='Article' and typifiedObject/objectType/name='Content']">
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
                <xsl:with-param name="contents"
                                select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item"/>
                <xsl:with-param name="path" select="$baseURL"/>
                <xsl:with-param name="mode" select="'item'"/>
                <!--<xsl:with-param name="miniatureSize" select="'small'"/>-->
                <xsl:with-param name="miniatureSize" select="'none'"/>
            </xsl:call-template>


        </div>


    </xsl:template>

    <xsl:template match="Article">
        <!--<h2>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h2>-->
        <xsl:value-of select="text" disable-output-escaping="yes"/>
    </xsl:template>

    <ems:templ name="Article-item"/>
    <ems:templ name="Article-list"/>


    <xsl:template match="ems:templ[@name='Article-item']">
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
                <xsl:variable name="doc" select="$contents/documents"/>
                <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource"/>
                <!--</div>-->
            </span>
            <!--<xsl:variable name="doc" select="$contents/documents"/>-->
            <!--<xsl:apply-templates
                    select="$contents/documents/xmlSource">
                &lt;!&ndash;<xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>&ndash;&gt;
            </xsl:apply-templates>-->
            <!--<xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource/Article/text"/>-->

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
            <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
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
    </xsl:template>


</xsl:stylesheet>