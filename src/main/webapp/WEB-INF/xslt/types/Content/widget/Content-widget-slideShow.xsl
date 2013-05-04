<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <!--todo:Choose render AS > widget function > plugin appereance -->

    <!--JQuery Yoxview Plugin-->
    <xsl:template name="yoxview">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>

        <xsl:variable name="previewPath" select="substring-before($fileObjects/path, $fileObjects/name)"/>
        <xsl:variable name="simpleName" select="substring-before($fileObjects/name,'.')"/>
        <h1>2222</h1>
        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript"
                        src="{$servletPath}/{$sitemapPath}js/jquery/yoxview/yoxview-init.js"></script>
                <script language="javascript">
                    $(document).ready(function() {
                    $("#<xsl:value-of select="$systemName"/>").yoxview({
                    backgroundColor: 'black',
                    playDelay: 5000
                    });
                    });
                </script>
                <div id="{$systemName}-yoxview" class="yoxview">
                    <xsl:for-each select="$fileObjects">
                        <xsl:if test="starts-with(contentType, 'image/')">
                            <img alt="" src="{$prefix}{$previewPath}{$simpleName}-small.jpeg"/>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$prefix}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <!--JQuery Cycle Plugin-->



    <!--Plugin-->



<!--


    <xsl:template name="slideShow">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        <xsl:param name="typeActionName"/>
        <xsl:variable name="imagesCount" select="count($fileObjects[starts-with(contentType, 'image/')])"/>
        <xsl:choose>
            <xsl:when test="$imagesCount &gt; 1">
                <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.cycle.lite.min.js"/>
                <script language="javascript">
                    $(document).ready(function() {
                    var height = 0;
                    $('#<xsl:value-of select="$systemName"/>-slide-show img').each(function() {
                    if ($(this).height() > height) {
                    height = $(this).height();
                    }
                    });
                    $('#<xsl:value-of select="$systemName"/>-slide-show').height(height);
                    $('#<xsl:value-of select="$systemName"/>-slide-show').cycle();
                    });
                </script>
                <div id="{$systemName}-slide-show" class="slide-show">
                    <xsl:for-each select="$fileObjects">
                        <xsl:if test="starts-with(contentType, 'image/')">
                            <img alt="" src="{$servletPath}/{$sitemapPath}{path}"/>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="$imagesCount &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$servletPath}/{$sitemapPath}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <ul class="files">
                    <xsl:for-each select="$fileObjects">
                        <xsl:variable name="extension">
                            <xsl:call-template name="getExtension">
                                <xsl:with-param name="name" select="name"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <li>
                            <xsl:attribute name="class">
                                <xsl:value-of select="$extension"/>
                            </xsl:attribute>
                            <a href="{$servletPath}/{$sitemapPath}{path}">
                                <xsl:value-of select="name"/>
                            </a>
                            <span class="size">
                                <xsl:call-template name="formatSize">
                                    <xsl:with-param name="size" select="size"/>
                                </xsl:call-template>
                            </span>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>-->
</xsl:stylesheet>