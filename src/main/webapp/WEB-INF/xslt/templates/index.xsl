<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">
<!--<!DOCTYPE xsl:stylesheet SYSTEM "/xhtml.ent">-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">
    <!--<xsl:apply-templates select="systemNode/objects[position = 1]" />-->
    <xsl:import href="../import/header.xsl"/>
    <xsl:import href="../import/footer.xsl"/>

    <xsl:template name="scripts">
        <script type="text/javascript" src="{$servletPath}/js/jquery/jquery.js"/>
        <xsl:comment><![CDATA[[if IE 6]><script src="]]><xsl:value-of select="$servletPath"/><![CDATA[/js/DD_belatedPNG.js"/>
			<script  type="text/javascript">
				DD_belatedPNG.fix("img");
			</script>
		<![endif]]]>
        </xsl:comment>


    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">
        <xsl:variable name="serverName" select="/root/params/request/param[@name='serverName']"/>
        <xsl:variable name="serverPort" select="/root/params/request/param[@name='serverPort']"/>

         <xsl:call-template name="header"/>

        <div class="content">
            <div class="clear"></div>
            <div class="main">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 4]/value"/>
            </div>
            <!--news-->



            <!--brands-->
            <div class="brands">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 2]/value"/>
            </div>

            <!--<iframe width="100%" height="166" scrolling="no" frameborder="no"
                    src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F17250280&amp;show_artwork=true"></iframe>-->
            <!--instruments-->


            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 19]/value"/>
            <div class="news-block">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
            </div>
            <iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F20412712&amp;auto_play=false&amp;show_artwork=false&amp;color=b5ef5d"></iframe>
        </div>

        <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 18]/value"/>-->
        <xsl:call-template name="footer"/>
    </xsl:template>

</xsl:stylesheet>