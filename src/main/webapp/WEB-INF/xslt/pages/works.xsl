<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <xsl:import href="import/header.xsl"/>
    <xsl:import href="import/footer.xsl"/>
    <!--!!!requirement-->
    <xsl:template name="scripts">
        <!--
        <xsl:comment><![CDATA[[if IE 6]><script src="]]><xsl:value-of select="$servletPath"/><![CDATA[/js/DD_belatedPNG.js"/>
			<script  type="text/javascript">
				DD_belatedPNG.fix("img");
			</script>
		<![endif]]]>
        </xsl:comment>-->
    </xsl:template>
    <!--!!!requirement-->
    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
    </xsl:template>

    <xsl:template match="root">
        <xsl:call-template name="header"/>


        <div class="container">
            <div class="clear"></div>
            <div class="main">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
            </div>


        </div>

        <xsl:call-template name="footer"/>

    </xsl:template>

</xsl:stylesheet>