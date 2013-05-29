<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="../types/Content/Content-templates.xsl"/>
    <xsl:import href="../types/functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='Vacancy' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>
        <xsl:variable name="id" select="typifiedObject/id"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="Vacancy">

                <xsl:variable name="areas" select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item"/>
                <xsl:variable name="areasCount" select="count($areas) div 2"/>
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>
                <h1><xsl:value-of select="$name"/></h1>
                <table cellspacing="0" border="0" cellpadding="0">
                    <tr>
                        <xsl:call-template name="showAreas">
                            <xsl:with-param name="areas" select="$areas"/>
                            <xsl:with-param name="areasCount" select="$areasCount"/>
                            <xsl:with-param name="blockNumber" select="0"/>
                            <xsl:with-param name="baseURL" select="typifiedObject/baseURL"/>
                        </xsl:call-template>
                    </tr>
                    <tr>
                        <xsl:call-template name="showAreas">
                            <xsl:with-param name="areas" select="$areas"/>
                            <xsl:with-param name="areasCount" select="$areasCount"/>
                            <xsl:with-param name="blockNumber" select="1"/>
                            <xsl:with-param name="baseURL" select="typifiedObject/baseURL"/>
                        </xsl:call-template>
                    </tr>
                </table>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="showAreas">
        <xsl:param name="areas"/>
        <xsl:param name="areasCount"/>
        <xsl:param name="blockNumber"/>
        <xsl:param name="baseURL"/>
        <xsl:for-each select="$areas">
            <xsl:if test="$blockNumber * $areasCount &lt; position() and position() &lt;= ($blockNumber + 1) * $areasCount">
                <td>
                    <xsl:if test="$blockNumber = 0">
                        <xsl:attribute name="class">first</xsl:attribute>
                    </xsl:if>
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>
                    <a href="{$servletPath}/{$sitemapPath}{concat($baseURL,systemName)}">
                        <xsl:value-of select="$name"/>
                    </a>
                    <xsl:variable name="id" select="id"/>
                    <xsl:variable name="systemName" select="systemName"/>
                    <xsl:variable name="children" select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item"/>
                    <xsl:call-template name="showChildren">
                        <xsl:with-param name="children" select="$children"/>
                        <xsl:with-param name="baseURL" select="concat($baseURL,systemName,'/')"/>
                    </xsl:call-template>
                </td>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>


    <xsl:template name="showChildren">
        <xsl:param name="children"/>
        <xsl:param name="baseURL"/>
        <xsl:choose>
            <xsl:when test="count($children) &gt; 0">
                <ul>
                    <xsl:for-each select="$children">
                        <li>
                            <xsl:variable name="name">
                                <xsl:call-template name="getLocalName">
                                    <xsl:with-param name="typifiedObject" select="."/>
                                </xsl:call-template>
                            </xsl:variable>
                            <a href="{$servletPath}/{$sitemapPath}{concat($baseURL,systemName)}">
                                <xsl:value-of select="$name"/>
                            </a>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
            <xsl:otherwise><ul><li>Вакансий нет</li></ul></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>