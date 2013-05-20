<?xml version="1.0" encoding="UTF-8"?>
<!--render list of items like : scrollable-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                exclude-result-prefixes="ems">






    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='scrollable' and typifiedObject/objectType/name='Content']">

        <!--Define Variables-->
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>
        <xsl:variable name="documentType" select="typifiedObject/documentType/name"/>
        <!--<xsl:variable name="typeActionName" select="typeAction/name"/>-->
        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="parentId" select="typifiedObject/id"/>
        <!--Define JS-->
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>


        <xsl:comment><xsl:value-of select="typifiedObject/objectType/name"/>-<xsl:value-of select="typeAction/name"/></xsl:comment>

        <div class="widget-{$position}">
            <xsl:comment>widget-list-scrollable</xsl:comment>
            <div id="{$systemName}-{$position}" class="list-scrollable">



                <xsl:if test="$objectURL != ''">
                    <xsl:variable name="child"
                                  select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item[emsObject/systemName = $objectURL]"/>
                    <xsl:if test="$child">
                        <div class="item-content">
                            <xsl:call-template name="showItem">
                                <xsl:with-param name="item" select="$child"/>
                            </xsl:call-template>
                        </div>
                    </xsl:if>
                </xsl:if>

                <!-- required CSS files -->
                <style>
                    .scrollItem .miniature{
                        width: 340px;
                        height:200px;
                        overflow: hidden;
                        -webkit-mask-image: url(<xsl:value-of select="$servletPath"/>/<xsl:value-of select="$sitemapPath"/>img/scrollable/scrollable_filter_mask.png);

                    }

                </style>

                <!-- wrapper for navigator elements -->
                <!--<div class="navi">
                    <a href="#0" class="active"></a>
                    <a href="#1" class=""></a>
                    <a href="#2" class=""></a>
                </div>-->


                <!-- "previous page" action -->
                <a class="prev browse leftButton disabled"/>

                <!-- "next page" action -->
                <a class="next browse rightButton"/>

                <!-- root element for scrollable -->
                <div class="scrollable" id="browsable">

                    <!-- root element for the items -->
                    <div class="items" style="left: 0px; ">
                        <xsl:for-each
                                select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                            <div class="scrollItem">
                                <xsl:call-template name="ScrollItems">
                                    <xsl:with-param name="contents" select="."/>
                                    <xsl:with-param name="objectURL" select="$objectURL"/>
                                    <xsl:with-param name="path" select="$baseURL"/>
                                    <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                                    <xsl:with-param name="documentType" select="$documentType"/>
                                </xsl:call-template>
                            </div>
                        </xsl:for-each>

                    </div>

                </div>


                <br clear="all"/>

                <!-- javascript coding -->
                <script>
                    // What is $(document).ready ? See:
                    http://flowplayer.org/tools/documentation/basics.html#document_ready
                    $(document).ready(function() {

                    // initialize scrollable together with the navigator plugin
                    $("#browsable").scrollable().navigator();
                    });
                </script>


            </div>

        </div>
    </xsl:template>

    <xsl:template name="ScrollItems">
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
             <xsl:with-param name="miniatureSize" select="'medium'"/>
         </xsl:call-template>


    </xsl:template>

    <xsl:template name="showItem">
        <xsl:param name="item"/>
        <xsl:apply-templates select="$item/documents/xmlSource"/>
    </xsl:template>
</xsl:stylesheet>