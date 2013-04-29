<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'item']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="showItem">
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="selected" select="typifiedObject/pathURL and starts-with(typifiedObject/baseURL, typifiedObject/pathURL)"/>
                <xsl:variable name="systemNodeId" select="typifiedObject/systemNodeId"/>
                <xsl:variable name="outerURL" select="typifiedObject/outerURL"/>

                <xsl:choose>
                    <xsl:when test="$systemNodeId">
                        <a href="{$servletPath}/{$sitemapPath}{typifiedObject/pathURL}">
                            <xsl:if test="$selected">
                                <xsl:attribute name="class">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="$name"/>
                        </a>
                    </xsl:when>
                    <xsl:when test="$outerURL">
                        <a href="{$outerURL}">
                            <xsl:value-of select="$name"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>


</xsl:stylesheet>