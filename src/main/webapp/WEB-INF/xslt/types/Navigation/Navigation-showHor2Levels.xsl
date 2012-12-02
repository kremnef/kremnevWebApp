<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'showHor2Levels']">

        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName" />
        <xsl:variable name="baseURL" select="typifiedObject/baseURL" />
        <xsl:variable name="pathURL" select="typifiedObject/pathURL" />
        <xsl:variable name="parentId" select="typifiedObject/id" />

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="horMenu2Levels">
                <ul class="level1">
                    <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                        <xsl:variable name="name">
                            <xsl:call-template name="getLocalName">
                                <xsl:with-param name="typifiedObject" select="."/>
                            </xsl:call-template>
                        </xsl:variable>

                        <xsl:variable name="itemId" select="id"/>
                        <xsl:variable name="itemSystemName" select="emsObject/systemName"/>
                        <xsl:variable name="selected" select="$pathURL and starts-with($baseURL, $pathURL)"/>
                        <xsl:choose>
                            <xsl:when test="$selected">
                                <li class="parent selected">
                                    <h3 class="selected">

                                        <xsl:variable name="systemNodeId" select="systemNodeId"/>
                                        <xsl:variable name="outerURL" select="outerURL"/>

                                        <xsl:choose>
                                            <xsl:when test="$systemNodeId">
                                                <a href="{$servletPath}/{$sitemapPath}{pathURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:when test="$outerURL">
                                                <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                                        </xsl:choose>
                                    </h3>
                                    <ul class="level2">
                                        <xsl:apply-templates select="/root/childrenMap/children/entry[key/parentId=$itemId and key/systemName=$itemSystemName]/value/item"/>
                                    </ul>
                                </li>
                            </xsl:when>
                            <xsl:otherwise>
                                <li class="parent">
                                    <h3>
                                        <xsl:variable name="systemNodeId" select="systemNodeId"/>
                                        <xsl:variable name="outerURL" select="outerURL"/>

                                        <xsl:choose>
                                            <xsl:when test="$systemNodeId">
                                                <a href="{$servletPath}/{$sitemapPath}{pathURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:when test="$outerURL">
                                                <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                                        </xsl:choose>
                                    </h3>
                                    <ul class="level2">
                                        <xsl:apply-templates select="/root/childrenMap/children/entry[key/parentId=$itemId and key/systemName=$itemSystemName]/value/item"/>
                                    </ul>
                                </li>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ul>
            </div>
        </div>
    </xsl:template>


    <xsl:template match="item">
        <li>
            <xsl:variable name="name">
                <xsl:call-template name="getLocalName">
                    <xsl:with-param name="typifiedObject" select="."/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="selected" select="pathURL and starts-with(baseURL, pathURL)"/>
            <xsl:if test="$selected">
                <xsl:attribute name="class">selected</xsl:attribute>
            </xsl:if>
            <xsl:variable name="systemNodeId" select="systemNodeId"/>
            <xsl:variable name="outerURL" select="outerURL"/>
            <xsl:choose>
                <xsl:when test="$systemNodeId">
                    <a href="{$servletPath}/{$sitemapPath}{pathURL}"><xsl:value-of select="$name" /></a>
                </xsl:when>
                <xsl:when test="$outerURL">
                    <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                </xsl:when>
                <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
            </xsl:choose>
        </li>
    </xsl:template>


</xsl:stylesheet>