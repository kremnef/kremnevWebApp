<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="i18n">

    <xsl:import href="../functions.xsl"/>
    
    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>

    <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'breadcrumb']">

        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="levels" select="@levels"/>

        <div class="widget-{$position}">
            <div id="{typifiedObject/systemName}-{$position}" position="{$position}" class="breadcrumb">
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>

                <div class="item first">
                    <div class="left"/>
                    <a href="{$prefix}"><i18n:text key="Breadcrumb.home"/></a>
                    <div class="right"/>
                </div>

                <xsl:variable name="requestURI" select="/root/params/src/param[@name='src']"/>

                <xsl:call-template name="breadcrumb-items">
                    <xsl:with-param name="requestURI" select="$requestURI"/>
                    <xsl:with-param name="position" select="$position"/>
                    <xsl:with-param name="parent" select="typifiedObject"/>
                    <xsl:with-param name="level" select="1"/>
                    <xsl:with-param name="levels" select="$levels"/>
                </xsl:call-template>

            </div>
        </div>
    </xsl:template>


    <xsl:template name="breadcrumb-items">
        <xsl:param name="requestURI"/>
        <xsl:param name="position"/>
        <xsl:param name="parent"/>
        <xsl:param name="level"/>
        <xsl:param name="levels"/>

        <xsl:variable name="parentId" select="$parent/@id"/>
        <xsl:variable name="parentSystemName" select="$parent/systemName"/>

        <xsl:if test="$level &lt;= $levels">
            <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$parentSystemName and key/blockNumber = $position]/value/item">
                <xsl:if test="pathURL != '' and starts-with($requestURI, pathURL)">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>
                    <div class="separator"/>
                    <div id="{systemName}-{$level}-{$position}" class="item">
                        <div class="left"/>
                        <a href="{$prefix}{pathURL}"><xsl:value-of select="$name"/></a>
                        <div class="right"/>
                    </div>
                    <xsl:call-template name="breadcrumb-items">
                        <xsl:with-param name="requestURI" select="$requestURI"/>
                        <xsl:with-param name="position" select="$position"/>
                        <xsl:with-param name="parent" select="."/>
                        <xsl:with-param name="level" select="$level + 1"/>
                        <xsl:with-param name="levels" select="$levels"/>
                    </xsl:call-template>
                </xsl:if>

            </xsl:for-each>
        </xsl:if>
    </xsl:template>


</xsl:stylesheet>