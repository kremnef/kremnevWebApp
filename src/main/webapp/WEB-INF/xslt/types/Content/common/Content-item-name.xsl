<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='item-name' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="typifiedObject"/>
            </xsl:call-template>
        </xsl:variable>

        <div class="widget-{$position}">
            <span id="{$systemName}-{$position}" class="{$typeActionName}">
                <xsl:value-of select="$name"/>
            </span>
        </div>
    </xsl:template>


</xsl:stylesheet>