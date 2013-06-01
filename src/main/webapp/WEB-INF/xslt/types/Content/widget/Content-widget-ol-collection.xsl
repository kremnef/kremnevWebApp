<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
    <!ENTITY lt "<">
]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:import href="../types/Content/Content.xsl" />

    <xsl:template name="showContents">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>

        <script language="javascript">
            $(document).ready(function(){

                $('.collections-description').mouseleave(function(event) {
                    $(this).hide();
                });
            });
        </script>
        <xsl:for-each select="$contents">
            <xsl:sort select="position" data-type="number" order="ascending"/>
            <li>
                <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
                <xsl:call-template name="showContentBriefly">
                    <xsl:with-param name="content" select="."/>
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="pos" select="position()"/>
                </xsl:call-template>

                <xsl:variable name="sName" select="systemName"/>
                <xsl:if test="$childrenCount &gt; 0">
                    <ol>
                        <xsl:call-template name="showContents">
                            <xsl:with-param name="contents"
                                            select="/root/childrenMap/children/entry[key=$sName]/value/item"/>
                            <xsl:with-param name="path" select="concat($path, '/', $sName)"/>
                        </xsl:call-template>
                    </ol>
                </xsl:if>
            </li>
        </xsl:for-each>
    </xsl:template>


    <xsl:template name="showContentBriefly">
        <xsl:param name="content"/>
        <xsl:param name="path"/>
        <xsl:param name="pos"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$content"/>
            </xsl:call-template>
        </xsl:variable>
        <!--<xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$content"/>
            </xsl:call-template>
        </xsl:variable>-->
        <xsl:variable name="systemName" select="$content/systemName" />
        <script language="javascript" type="text/javascript">
            $(document).ready(function(){
                $("#<xsl:value-of select="$systemName"/>-item").mouseenter(function(event){
                    $('.collections-description').hide();
                    $this = $(this);
            <xsl:choose>
                <xsl:when test="$pos = 1">
                    var offset = $this.offset();
                    var width = $this.width();
                    var height = $this.height();
                    var openObj = $("#<xsl:value-of select="$systemName"/>-item-open");
                    openObj.offset({ top: offset.top + height - openObj.height(), left: offset.left + width - openObj.width() })
                    openObj.show();
                    openObj.offset({ top: offset.top + height - openObj.height(), left: offset.left + width - openObj.width() })
                </xsl:when>
                <xsl:when test="$pos=2">
                    var offset = $this.offset();
                    var height = $this.height();
                    var openObj = $("#<xsl:value-of select="$systemName"/>-item-open");
                    openObj.offset({ top: offset.top + height - openObj.height(), left: offset.left })
                    openObj.show();
                    openObj.offset({ top: offset.top + height - openObj.height(), left: offset.left })
                </xsl:when>
                <xsl:when test="$pos=3">
                    var offset = $this.offset();
                    var width = $this.width();
                    var openObj = $("#<xsl:value-of select="$systemName"/>-item-open");
                    openObj.offset({ top: offset.top, left: offset.left + width - openObj.width() })
                    openObj.show();
                    openObj.offset({ top: offset.top, left: offset.left + width - openObj.width() })
                </xsl:when>
                <xsl:when test="$pos=4">
                    var offset = $this.offset();
                    var openObj = $("#<xsl:value-of select="$systemName"/>-item-open");
                    openObj.offset({ top: offset.top, left: offset.left })
                    openObj.show();
                    openObj.offset({ top: offset.top, left: offset.left })
                </xsl:when>
            </xsl:choose>
                });
            });
        </script>
        <div id="{$systemName}-item" class="collections-menu-item"><img alt="{$name}" src="{$servletPath}/img/img-{$systemName}.jpg"/></div>
        <xsl:variable name="sideClass">
            <xsl:choose>
                <xsl:when test="$pos=1 or $pos=3">left</xsl:when>
                <xsl:otherwise>right</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div id="{$systemName}-item-open" class="collections-description {$sideClass}">
            <xsl:variable name="document" select="$content/document"/>
            <!--<xsl:variable name="document" select="$content/document[language/code=$locale and version=$maxVersion]"/>-->
            <xsl:if test="$document">
                <h3><xsl:value-of select="$name"/></h3>
                <p><xsl:value-of select="$document/description"/></p>
                <a href="{$servletPath}/{$sitemapPath}{concat($path,'/',$systemName)}">Подробнее</a>
            </xsl:if>
        </div>
    </xsl:template>


    <xsl:template match="HtmlCode">
        <xsl:value-of select="html" disable-output-escaping="yes"/>
    </xsl:template>

</xsl:stylesheet>