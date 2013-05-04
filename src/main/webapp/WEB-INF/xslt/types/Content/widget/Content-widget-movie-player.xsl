<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:import href="../types/Content/Content.xsl" />

    <xsl:template match="Movie">
        <xsl:variable name="link" select="string(link)"/>
        <xsl:variable name="width" select="width"/>
        <xsl:variable name="height" select="height"/>
        <h1><xsl:value-of select="title" /></h1>
        <h2><xsl:value-of select="description" /></h2>
        <xsl:variable name="lowerCaseLink" select="fn:to-lower-case($link)"/>

        <xsl:choose>
            <xsl:when test="fn:ends-with($lowerCaseLink, 'wma')">
                <object id="MediaPlayer" width="{$width}" height="{$height}" classid="CLSID:22D6f312-B0F6-11D0-94AB-0080C74C7E95" standby="Loading Windows Media Player components..." type="application/x-oleobject" codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,4,7,1112">
                    <param name="filename" value="{$link}" />
                    <param name="Showcontrols" value="True" />
                    <embed type="application/x-mplayer2" src="{$link}" name="MediaPlayer" width="{$width}" height="{$height}"/>
                    <param name="autoStart" value="False"/>
                </object>
            </xsl:when>
            <!--<xsl:when test="fn:ends-with($lowerCaseLink, 'm4v')">-->
                <!--<applet width="{$width}" height="{$height}" code="M4Applet.class" codebase="{$servletPath}/resource/m4player" id="m4player" name="m4player" alt="IBM MPEG4 Applet" archive="IBMAppletForMpeg4.jar">-->
                     <!--<param name="url" value="{$link}" />-->
                     <!--<param name="panel" value="basic" />-->
                     <!--<param name="panelBGColor" value="#ededff" />-->
                     <!--<param name="atDuration" value="Stop" />-->
                 <!--</applet>-->
            <!--</xsl:when>-->
            <xsl:otherwise>
                <script type="text/javascript" src="{$servletPath}/js/flowplayer/flowplayer-3.2.4.min.js"/>
                <link rel="stylesheet" type="text/css" href="{$servletPath}/js/flowplayer/css/style.css"/>
                <a
                     href="{$link}"
                     style="display:block;width:{$width}px;height:{$height}px"
                     id="player">
                </a>
                <script>
                    flowplayer("player", "<xsl:value-of select="$servletPath"/>/flowplayer/flowplayer-3.2.5.swf");
                </script>
                
            </xsl:otherwise>
        </xsl:choose>
        <!--<div class="movie">-->
            <!--<object width="{$width}" height="{$height}"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="{$link}" /><embed src="{$link}" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="{$width}" height="{$height}"></embed></object>-->
        <!--</div>-->
    </xsl:template>


</xsl:stylesheet>