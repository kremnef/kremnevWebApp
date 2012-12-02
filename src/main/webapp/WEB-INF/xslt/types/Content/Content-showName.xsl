<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="Content-templates.xsl"/>
    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showName' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <h1 id="{$systemName}-{$position}" class="{$typeActionName}">
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$name"/>
            </h1>
        </div>
    </xsl:template>


</xsl:stylesheet>