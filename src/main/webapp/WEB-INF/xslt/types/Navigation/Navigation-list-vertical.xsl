<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>
    
    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:variable name="prefix">
        <!--<xsl:choose>-->
            <!--<xsl:when test="$servletPath = '' and $sitemapPath = ''"><xsl:value-of-->
                    <!--select="''"/></xsl:when>-->
            <!--<xsl:otherwise>-->
                <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
            <!--</xsl:otherwise>-->
        <!--</xsl:choose>-->
    </xsl:variable>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'list-vertical']">

        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="levels" select="levels"/>

        <div class="widget-{$position}">
            <div id="{typifiedObject/emsObject/systemName}-{$position}" position="{$position}" class="verMenu">
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>


                <h2>
                    <xsl:variable name="systemNodeId" select="typifiedObject/systemNodeId"/>
                    <xsl:variable name="outerURL" select="typifiedObject/outerURL"/>
                    <xsl:choose>
                        <xsl:when test="$systemNodeId">
                            <a class="selected" href="{$prefix}{typifiedObject/pathURL}"><xsl:value-of select="$name" /></a>
                        </xsl:when>
                        <xsl:when test="$outerURL">
                            <a class="selected" href="{$outerURL}"><xsl:value-of select="$name" /></a>
                        </xsl:when>
                        <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                    </xsl:choose>
                </h2>
                <xsl:call-template name="typifiedObjectNav">
                    <xsl:with-param name="obj" select="typifiedObject"/>
                    <xsl:with-param name="position" select="$position"/>
                    <xsl:with-param name="level" select="1"/>
                    <xsl:with-param name="levels" select="$levels"/>
                    </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="typifiedObjectNav">
        <xsl:param name="obj"/>
        <xsl:param name="position"/>
        <xsl:param name="level"/>
        <xsl:param name="levels"/>

        <xsl:variable name="systemName" select="$obj/emsObject/systemName" />
        <xsl:variable name="parentId" select="$obj/id" />

        <xsl:variable name="items" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber = $position]/value/item" />
        <xsl:if test="count($items) &gt; 0 and $level &lt;= $levels">
            <ul>
                <xsl:for-each select="$items">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="selected" select="pathURL and starts-with(baseURL, pathURL)"/>
                    <li id="{emsObject/systemName}-{$position}" position="{$position}">
                        <xsl:attribute name="class">
                            <xsl:text>menuItem level-</xsl:text><xsl:value-of select="$level"/> position-<xsl:value-of
                                select="position()"/><xsl:text> </xsl:text>
                            <xsl:if test="$selected">
                                <xsl:text>selected </xsl:text>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="position() = 1">first</xsl:when>
                                <xsl:when test="position() = last()">last</xsl:when>
                            </xsl:choose>
                        </xsl:attribute>
                        <div class="img"/>
                        <xsl:variable name="systemNodeId" select="systemNodeId"/>
                        <xsl:variable name="outerURL" select="outerURL"/>
                        <xsl:choose>
                            <xsl:when test="$systemNodeId">
                                <a href="{$prefix}{pathURL}"><xsl:value-of select="$name" /></a>
                            </xsl:when>
                            <xsl:when test="$outerURL">
                                <a href="{$outerURL}"><xsl:value-of select="$name" /></a>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                        </xsl:choose>
                        <xsl:call-template name="typifiedObjectNav">
                            <xsl:with-param name="obj" select="."/>
                            <xsl:with-param name="position" select="$position"/>
                            <xsl:with-param name="level" select="$level + 1"/>
                            <xsl:with-param name="levels" select="$levels"/>
                        </xsl:call-template>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>