<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'showOL']">

        <xsl:variable name="parentId" select="typifiedObject/id" />
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName" />

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="olMenu">
                <div id="menu-container" class="menu-container">
                    <ul id="top-menu" class="top-menu">
                        <li><img alt="" src="{$prefix}img/bg-menu-left.png" /></li>
                        <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                            <xsl:variable name="name">
                                <xsl:call-template name="getLocalName">
                                    <xsl:with-param name="typifiedObject" select="."/>
                                </xsl:call-template>
                            </xsl:variable>

                            <xsl:variable name="selected" select="pathURL and starts-with(baseURL, pathURL)"/>
                            <xsl:choose>
                                <xsl:when test="$selected">
                                    <li class="menu-item menu-item-left"><img alt="" src="{$prefix}img/bg-menu-item-left.png" /></li>
                                    <li class="menu-item selected"><a><xsl:value-of select="$name" /></a></li>
                                    <li class="menu-item menu-item-right"><img alt="" src="{$prefix}img/bg-menu-item-right.png" /></li>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:variable name="systemNodeId" select="systemNodeId"/>
                                    <xsl:variable name="outerURL" select="outerURL"/>

                                    <li class="menu-item menu-item-left" />
                                    <li class="menu-item">

                                        <xsl:choose>
                                            <xsl:when test="$systemNodeId">
                                                <a href="{$prefix}{pathURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:when test="$outerURL">
                                                <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                                            </xsl:when>
                                            <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                                        </xsl:choose>
                                        </li>
                                        <li class="menu-item menu-item-right" />
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <li><img alt="" src="{$prefix}img/bg-menu-right.png"/></li>
                    </ul>
                </div>
            </div>
        </div>
    </xsl:template>


</xsl:stylesheet>