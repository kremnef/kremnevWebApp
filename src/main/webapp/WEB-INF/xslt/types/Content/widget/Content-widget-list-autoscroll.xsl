<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="../ext/date.format-date.template.xsl"/>
    <xsl:import href="../types/Content/Content-templates.xsl"/>
    <xsl:import href="../types/functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='list-autoscroll' and typifiedObject/objectType/name='Content']">
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="list-autoscroll">

                <!-- required CSS files -->


                <!-- wrapper for navigator elements -->
                <!--<div class="navi">
                    <a href="#0" class="active"></a>
                    <a href="#1" class=""></a>
                    <a href="#2" class=""></a>
                </div>-->


                <!-- "previous page" action -->
                <!--<a class="prev browse leftButton disabled"/>-->

                <!-- "next page" action -->
                <!--<a class="next browse rightButton"/>-->

                <!-- root element for scrollable -->
                <div class="scrollable" id="browsable">

                    <!-- root element for the items -->
                    <div class="items" style="left: 0px; ">
                        <xsl:variable name="parentId" select="typifiedObject/@id"/>
                        <xsl:for-each
                                select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                            <div class="scrollItem">
                                <xsl:call-template name="ScrollItems">
                                    <xsl:with-param name="contents" select="."/>
                                    <xsl:with-param name="width" select="'400px'"/>
                                    <!--<xsl:with-param name="objectURL" select="$objectURL"/>-->
                                    <xsl:with-param name="path" select="$baseURL"/>
                                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                    <xsl:with-param name="documentType" select="$typeActionName"/>
                                </xsl:call-template>
                            </div>
                        </xsl:for-each>

                    </div>

                </div>


                <br clear="all"/>

                <!-- javascript coding -->
                <script>
                    // What is $(document).ready ? See: http://flowplayer.org/tools/documentation/basics.html#document_ready
                    $(document).ready(function() {

                    // initialize scrollable together with the navigator plugin
                    $("#browsable").scrollable({circular: true}).autoscroll(6000,{ autoplay: true}, { autopause: true});
                    });
                </script>


            </div>
        </div>
    </xsl:template>

    <xsl:template name="ScrollItems">
        <xsl:param name="contents"/>
        <xsl:param name="width"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="documentType"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="post-link" select="date"/>
        <xsl:variable name="post-title" select="$name"/>

        <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
        <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

        <!--<xsl:variable name="document" select="$contents/documents[language/code=$locale and version=$maxVersion]"/>-->
        <xsl:variable name="document" select="$contents/documents"/>

        <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>
        <!--<xsl:variable name="imagePath" select="$document/xmlSource/*[name()=$documentTypeName]/image"/>-->
        <xsl:choose>
            <xsl:when test="$imagePath and $imagePath != ''">
            <xsl:variable name="slashLastIndex">
                <xsl:call-template name="getLastIndex">
                    <xsl:with-param name="str" select="$imagePath"/>
                    <xsl:with-param name="search" select="'/'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="imageName">
                <xsl:choose>
                    <xsl:when test="$slashLastIndex = 0">
                        <xsl:value-of select="$imagePath"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                                select="substring($imagePath, $slashLastIndex + 1, string-length($imagePath) - $slashLastIndex)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="folderPath">
                <xsl:choose>
                    <xsl:when test="$slashLastIndex = 0">
                        <xsl:value-of select="''"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="substring($imagePath, 1, $slashLastIndex)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="dotLastIndex">
                <xsl:call-template name="getLastIndex">
                    <xsl:with-param name="search" select="'.'"/>
                    <xsl:with-param name="str" select="$imageName"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="smallImageName">
                <xsl:choose>
                    <xsl:when test="$dotLastIndex = 0">
                        <xsl:value-of select="concat($imageName, '-medium')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat(substring($imageName, 1, $dotLastIndex - 1), '-medium.jpg')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="miniature">
                <a width="{$width}" href="{$servletPath}/{$sitemapPath}{concat($path,$contents/systemName)}">
                    <img width="{$width}" alt="{$name}"
                         src="{$servletPath}/{$sitemapPath}{$folderPath}thumbnails/{$smallImageName}"/>
                </a>
            </div>
        </xsl:when>
            <xsl:otherwise>
                <div class="miniature">
                    <img alt="{$name}" border="0" src="{$servletPath}/img/spacer.gif" width="340px" height="200px"/>
                </div>
            </xsl:otherwise>
        </xsl:choose>

        <div class="date">
            <xsl:call-template name="date:format-date">
                <xsl:with-param name="date-time" select="$contents/@publishDateTime"/>
                <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
            </xsl:call-template>
        </div>

        <div class="title" width="{$width}">
            <a width="{$width}" href="{$servletPath}/{$sitemapPath}{concat($path,$contents/systemName)}">
                <xsl:value-of select="$name"/>
            </a>
        </div>

        <div class="description" width="{$width}">
                <xsl:value-of select="$document/description"/>
        </div>


    </xsl:template>


</xsl:stylesheet>