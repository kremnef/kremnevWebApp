<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'list-horisontal']">

        <xsl:variable name="systemName" select="typifiedObject/systemName" />
        <xsl:variable name="languageCodePrefix" select="//request/param[@name='languageCodePrefix']" />
        <xsl:variable name="parentId" select="typifiedObject/@id" />

        <xsl:variable name="position" select="../key"/>
        <xsl:comment><xsl:value-of select="typifiedObject/objectType/name"/>-<xsl:value-of select="typeAction/name"/></xsl:comment>
        <div class="widget-{$position}">
            <ul id="{$systemName}" class="nav list horisontal">
                <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="selected" select="pathURL and starts-with(baseURL, pathURL)"/>
                    <xsl:choose>
                        <xsl:when test="$selected">
                            <li>
                                <xsl:attribute name="class">
                                    <xsl:text>selected</xsl:text>
                                    <xsl:if test="position() = 1"> first</xsl:if>
                                    <xsl:if test="position() = last()"> last</xsl:if>
                                </xsl:attribute>
                                <xsl:variable name="systemNodeId" select="@systemNodeId"/>
                                <xsl:variable name="outerURL" select="outerURL"/>

                                <xsl:choose>
                                    <xsl:when test="$systemNodeId">
                                        <a href="{$servletPath}/{$sitemapPath}/{$languageCodePrefix}/{pathURL}"><xsl:value-of select="$name" /></a>
                                    </xsl:when>
                                    <xsl:when test="$outerURL">
                                        <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                                    </xsl:when>
                                    <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                                </xsl:choose>
                            </li>
                        </xsl:when>
                        <xsl:otherwise>
                            <li>
                                <xsl:if test="position() = 1">
                                    <xsl:attribute name="class">first</xsl:attribute>
                                </xsl:if>
                                <xsl:if test="position() = last()">
                                    <xsl:attribute name="class">last</xsl:attribute>
                                </xsl:if>
                                <xsl:variable name="systemNodeId" select="@systemNodeId"/>
                                <xsl:variable name="outerURL" select="outerURL"/>

                                <xsl:choose>
                                    <xsl:when test="$systemNodeId">
                                        <a href="{$servletPath}/{$sitemapPath}{$languageCodePrefix}/{pathURL}"><xsl:value-of select="$name" /></a>
                                    </xsl:when>
                                    <xsl:when test="$outerURL">
                                        <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                                    </xsl:when>
                                    <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                                </xsl:choose>
                            </li>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>


</xsl:stylesheet>