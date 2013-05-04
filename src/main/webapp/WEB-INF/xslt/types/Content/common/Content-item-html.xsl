<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:template match="value[typeAction/name='showHTMLSimple' and typifiedObject/objectType/name='Content']">

        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>

        <xsl:variable name="content" select="typifiedObject"/>

        <xsl:variable name="position" select="../key"/>
        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <xsl:variable name="doc" select="$content/documents"/>
                <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource"/>
            </div>
        </div>

    </xsl:template>
</xsl:stylesheet>