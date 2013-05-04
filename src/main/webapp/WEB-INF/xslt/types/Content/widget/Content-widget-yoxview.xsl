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


    <!--Plugin-->



<!--    <xsl:template name="yoxview">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        &lt;!&ndash;<h1><xsl:value-of select="$fileObjects"/></h1>&ndash;&gt;

        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript"
                        src="{$servletPath}/{$sitemapPath}js/jquery/yoxview/yoxview-init.js"></script>
                <script language="javascript">
                    $(document).ready(function() {
                    $("#<xsl:value-of select="$systemName"/>-yoxview").yoxview({
                    backgroundColor: '#000000',
                    backgroundOpacity: 0.5,
                    lang: 'ru',
                    playDelay: 5000
                    });
                    });
                </script>
                <div id="{$systemName}-yoxview" class="{$systemName} unspoken yoxview info">
                    <ul>
                        <xsl:for-each select="$fileObjects">
                            &lt;!&ndash;<xsl:variable name="fileId" select="$fileObjects/id"/>&ndash;&gt;
                            <xsl:variable name="fileId" select="id"/>
                            <xsl:variable name="fileName" select="name"/>
                            &lt;!&ndash;select="substring-before($fileObjects/path, concat($fileId,'-',$fileObjects/name))"/>&ndash;&gt;
                            &lt;!&ndash;<xsl:variable name="simpleName" select="substring-before($fileObjects/name,'.')"/>&ndash;&gt;
                            <xsl:variable name="previewPath"
                                          select="substring-before(path, concat(id,'-',name))"/>

                            &lt;!&ndash;<xsl:variable name="simpleName" select="substring-before(name,'.')"/>&ndash;&gt;

                            <xsl:if test="starts-with(contentType, 'image/')">
                                <li>
                                    &lt;!&ndash;<a href="{$servletPath}/{$sitemapPath}{$previewPath}thumbnails/{$fileId}-{$fileName}-large.jpg">&ndash;&gt;
                                    <a href="{$servletPath}/{$sitemapPath}{path}">
                                        <img alt="{$fileName}"
                                             src="{$servletPath}/{$sitemapPath}{$previewPath}thumbnails/{$fileId}-{$fileName}-small.jpg"/>
                                    </a>
                                </li>

                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$prefix}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


    -->
</xsl:stylesheet>