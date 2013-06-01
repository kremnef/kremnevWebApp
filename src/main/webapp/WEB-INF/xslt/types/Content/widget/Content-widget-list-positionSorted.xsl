<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="../types/Content/Content-templates.xsl"/>
    <xsl:import href="../types/functions.xsl"/>
    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='list-positionSorted' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="typifiedObject"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>

    <ems:templ name="showContents-showItemsPositionSorted"/>
    <ems:templ name="showContentBriefly-showItemsPositionSorted"/>

    <xsl:template match="ems:templ[@name='showContents-showItemsPositionSorted']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:call-template name="showContents">
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="ems:templ[@name='showContentBriefly-showItemsPositionSorted']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>

        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>
        <!--<xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>-->
        <div class="news-block">
            <xsl:variable name="post-link" select="date"/>
            <xsl:variable name="post-title" select="$name"/>

            <!--<xsl:variable name="document" select="$contents/document[language/code=$locale and version=$maxVersion]"/>-->
            <xsl:variable name="document" select="$contents/document"/>
            <!--
            <xsl:if test="$document">
                <div class="date">
                    <script language="javascript">
                        var d = new Date('<xsl:value-of select="$document/createdDateTime"/>');
                        document.write(d.toLocaleString());
                    </script>
                </div>
            </xsl:if>-->

            <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
            <!--<xsl:variable name="imagePath" select="concat($document,'/xmlSource/' , $documentTypeName, '/image')"/>-->
            <xsl:variable name="imagePath" select="$document/thumbnail/path"/>
            <!--<xsl:variable name="imagePath" select="$document/xmlSource/*[name()=$documentTypeName]/image"/>-->

            <xsl:if test="$imagePath and $imagePath != ''">
                <xsl:variable name="slashLastIndex">
                    <xsl:call-template name="getLastIndex">
                        <xsl:with-param name="str" select="$imagePath"/>
                        <xsl:with-param name="search" select="'/'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="imageName">
                    <xsl:choose>
                        <xsl:when test="$slashLastIndex = 0"><xsl:value-of select="$imagePath"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="substring($imagePath, $slashLastIndex + 1, string-length($imagePath) - $slashLastIndex)"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="folderPath">
                    <xsl:choose>
                        <xsl:when test="$slashLastIndex = 0"><xsl:value-of select="''"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="substring($imagePath, 1, $slashLastIndex)"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <!--<xsl:variable name="extension">
                    <xsl:call-template name="getExtension">
                        <xsl:with-param name="name" select="$imageName"/>
                    </xsl:call-template>
                </xsl:variable>-->

                <xsl:variable name="dotLastIndex">
                    <xsl:call-template name="getLastIndex">
                        <xsl:with-param name="search" select="'.'"/>
                        <xsl:with-param name="str" select="$imageName"/>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="smallImageName">
                    <xsl:choose>
                        <xsl:when test="$dotLastIndex = 0"><xsl:value-of select="concat($imageName, '-small')"/></xsl:when>
                        <xsl:otherwise><xsl:value-of select="concat(substring($imageName, 1, $dotLastIndex - 1), '-small.jpg')"/></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <div class="image"><img alt="{$name}" src="{$servletPath}/{$sitemapPath}{$folderPath}thumbnails/{$smallImageName}"/></div>
            </xsl:if>



            <div class="title">
                <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/systemName)}">
                    <xsl:value-of select="$name"/>
                </a>
            </div>
            <!--<div class="text">
                <xsl:value-of select="$document/description" disable-output-escaping="yes"/>
            </div>-->
        </div>

    </xsl:template>


    

</xsl:stylesheet>