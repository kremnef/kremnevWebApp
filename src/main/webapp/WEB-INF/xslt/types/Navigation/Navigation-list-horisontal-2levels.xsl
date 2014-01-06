<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template
            match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'list-horisontal-2levels']">

        <xsl:variable name="languageCodePrefix" select="//request/param[@name='languageCodePrefix']"/>
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

        <xsl:variable name="parentId" select="typifiedObject/@id"/>
        <xsl:variable name="widgetPosition" select="../key"/>
        <xsl:comment><xsl:value-of select="typifiedObject/objectType/name"/>-<xsl:value-of select="typeAction/name"/></xsl:comment>
        <div class="widget-{$widgetPosition}" id="{$systemName}-{$widgetPosition}">

            <!--<ul class="nav nav-list submenu level1">-->

            <xsl:for-each
                    select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">

                <!--Define Variables-->
                <xsl:variable name="pathURL" select="typifiedObject/pathURL"/>
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="."/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="itemId" select="@id"/>
                <xsl:variable name="itemSystemName" select="systemName"/>
                <xsl:variable name="selected" select="$pathURL and starts-with($baseURL, $pathURL)"/>

                <!--Columns-->
                <div class="span level1">
                    <ul class="nav nav-list submenu">
                        <xsl:choose>
                            <xsl:when test="$selected">
                                <li class="parent selected nav-header">

                                    <xsl:variable name="systemNodeId" select="@systemNodeId"/>
                                    <xsl:variable name="outerURL" select="outerURL"/>

                                    <xsl:choose>
                                        <xsl:when test="$systemNodeId">
                                            <a href="{$servletPath}/{$sitemapPath}{$languageCodePrefix}/{pathURL}" class="selected">
                                                <xsl:value-of select="$name"/>
                                            </a>
                                        </xsl:when>
                                        <xsl:when test="$outerURL">
                                            <a href="{$outerURL}" class="selected">
                                                <xsl:value-of select="$name"/>
                                            </a>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:value-of select="$name"/>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                    <!--<ul class="nav level2">-->
                                        <xsl:apply-templates
                                                select="/root/childrenMap/children/entry[key/parentId=$itemId and key/systemName=$itemSystemName]/value/item"/>
                                    <!--</ul>-->
                                </li>
                            </xsl:when>
                            <xsl:otherwise>
                                <li class="parent nav-header">
                                    <xsl:variable name="systemNodeId" select="@systemNodeId"/>
                                    <xsl:variable name="outerURL" select="outerURL"/>

                                    <xsl:choose>
                                        <xsl:when test="$systemNodeId">
                                            <a href="{$servletPath}/{$sitemapPath}{$languageCodePrefix}/{pathURL}">
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
                                    <!--<ul class="level2">-->
                                        <xsl:apply-templates
                                                select="/root/childrenMap/children/entry[key/parentId=$itemId and key/systemName=$itemSystemName]/value/item"/>
                                    <!--</ul>-->
                                </li>
                            </xsl:otherwise>
                        </xsl:choose>
                    </ul>
                </div>
            </xsl:for-each>
            <!--</ul>-->

        </div>
    </xsl:template>


    <xsl:template match="item">
        <xsl:variable name="languageCodePrefix" select="//request/param[@name='languageCodePrefix']"/>
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
            <xsl:variable name="systemNodeId" select="@systemNodeId"/>
            <xsl:variable name="outerURL" select="outerURL"/>
            <xsl:choose>
                <xsl:when test="$systemNodeId">
                    <a href="{$servletPath}/{$sitemapPath}{$languageCodePrefix}/{pathURL}">
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
        </li>
    </xsl:template>


</xsl:stylesheet>