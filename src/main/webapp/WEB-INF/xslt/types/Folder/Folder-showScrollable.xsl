<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://ems.strela.ru/"
                exclude-result-prefixes="ems">


    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showScrollable' and typifiedObject/objectType/name='Folder']">

        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="showScrollable">
                <div class="scroll-container" style="margin:20px -15px">
                    <!-- required CSS files -->
                    <!-- wrapper for navigator elements -->
                    <!--<div class="navi"/>-->
                    <!-- "previous page" action -->
                    <a class="prev browse leftButton"/>
                    <!-- "next page" action -->
                    <a class="next browse rightButton"/>
                    <!-- root element for scrollable -->
                    <div class="scrollable" id="browsable">

                        <!-- root element for the items -->
                        <div class="items" style="left: 0px; ">
                            <xsl:variable name="parentId" select="typifiedObject/id" />
                            <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                                <div class="scrollItem">
                                    <xsl:call-template name="ScrollItems">
                                        <xsl:with-param name="node" select="."/>
                                        <!--<xsl:with-param name="objectURL" select="$objectURL"/>-->
                                        <xsl:with-param name="path" select="$baseURL"/>
                                        <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        <xsl:with-param name="documentType" select="$typeActionName"/>
                                    </xsl:call-template>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>

                    <!-- javascript coding -->
                    <script>
                        // What is $(document).ready ? See: http://flowplayer.org/tools/documentation/basics.html#document_ready
                        $(document).ready(function() {

                        // initialize scrollable together with the navigator plugin
                        <!--$("#browsable").scrollable().navigator();-->
                        $("#browsable").scrollable({circular: true}).autoscroll(4000,{ autoplay: true}, { autopause: true});

                        });
                    </script>


                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="ScrollItems">
        <!--<xsl:template name="showFolderBriefly">-->
        <xsl:param name="node"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="documentType"/>
        <xsl:variable name="previewPath" select="substring-before($node/path, concat($node/id, '-', $node/name))"/>
        <!--<xsl:variable name="simpleName" select="substring-before($node/name,'.')"/>-->
        <div class="miniature">
            <img width="340px" src="{$previewPath}thumbnails/{$node/id}-{$node/name}-medium.jpg"/>
        </div>
    </xsl:template>


</xsl:stylesheet>