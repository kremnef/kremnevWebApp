<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="yoxview">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>

        <xsl:variable name="previewPath" select="substring-before($fileObjects/path, $fileObjects/name)"/>
        <xsl:variable name="simpleName" select="substring-before($fileObjects/name,'.')"/>
        <h1>2222</h1>
        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/yoxview/yoxview-init.js"></script>
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

    <xsl:template name="slideShow">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript" src="{$prefix}js/jquery/jquery.cycle.lite.min.js"/>
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
                            <img alt="" src="{$prefix}{path}"/>
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
</xsl:stylesheet>