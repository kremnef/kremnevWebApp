<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                exclude-result-prefixes="ems">

    <xsl:import href="Content-templates.xsl"/>
    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showFirstNewsItem' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="typifiedObject"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>


    <ems:templ name="showContents-showFirstNewsItem" />
    <ems:templ name="showContentBriefly-showFirstNewsItem" />

    <xsl:template match="ems:templ[@name='showContents-showFirstNewsItem']" >
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:choose>
            <xsl:when test="$typeActionName = 'showFirstNewsItem'">
                <ul>

                    <xsl:for-each select="$contents">
                        <!--<xsl:variable name="sortBy" select="documents/createdDateTime/xmlSource/News/date"/>-->
                        <!--<xsl:variable name="sortBy2" select="documents/createdDateTime"/>-->
                        <!--<xsl:sort select="documents/createdDateTime" data-type="number" order="descending"/>-->
                        <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                        <xsl:if test="position() = 1">
                            <li>
                                <!--<xsl:value-of select="$sortBy2"/>-->
                                <!--<xsl:value-of select="//News/date"/>-->
                                <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
                                <!--<xsl:variable name="sName" select="emsObject/systemName" />
                                <xsl:if test="$childrenCount &gt; 0">

                                </xsl:if>-->
                                <xsl:call-template name="caller">
                                    <xsl:with-param name="name" select="'showContentBriefly'"/>
                                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                    <xsl:with-param name="contents" select="."/>
                                    <xsl:with-param name="path" select="$path"/>
                                </xsl:call-template>

                                <!--<xsl:call-template name="showContentBriefly">-->
                                    <!--<xsl:with-param name="content" select="."/>-->
                                    <!--<xsl:with-param name="path" select="$path"/>-->
                                    <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                                <!--</xsl:call-template>-->

                                <xsl:variable name="sName" select="emsObject/systemName"/>
                                <xsl:if test="$childrenCount &gt; 0">
                                    <ol>
                                        <xsl:call-template name="showContents">
                                            <xsl:with-param name="contents"
                                                            select="/root/childrenMap/children/entry[key=$sName]/value/item"/>
                                            <xsl:with-param name="path" select="concat($path, '/', $sName)"/>
                                            <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        </xsl:call-template>
                                    </ol>
                                </xsl:if>
                            </li>
                        </xsl:if>
                    </xsl:for-each>
                </ul>
                <div class="showAllNews"><a href="{$path}">Весь список</a></div>

            </xsl:when>
            <xsl:otherwise><xsl:apply-imports/></xsl:otherwise>
        </xsl:choose>

    </xsl:template>



    <!--<xsl:template name="showContents">-->
        <!--<xsl:param name="contents"/>-->
        <!--<xsl:param name="path"/>-->
        <!--<xsl:param name="typeActionName"/>-->
        <!--###showFirstNewsItem###-->
        <!--<xsl:choose>-->
            <!--<xsl:when test="$typeActionName = 'showFirstNewsItem'">-->
                <!--<ul>-->
                    <!--<xsl:for-each select="$contents">-->
                        <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                        <!--<xsl:if test="position() = 1">-->
                            <!--<li>-->
                                <!--<xsl:variable name="childrenCount" select="emsObject/childrenCount"/>-->
                                <!--&lt;!&ndash;<xsl:variable name="sName" select="emsObject/systemName" />-->
                                <!--<xsl:if test="$childrenCount &gt; 0">-->

                                <!--</xsl:if>&ndash;&gt;-->
                                <!--<xsl:call-template name="showContentBriefly">-->
                                    <!--<xsl:with-param name="content" select="."/>-->
                                    <!--<xsl:with-param name="path" select="$path"/>-->
                                    <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                                <!--</xsl:call-template>-->

                                <!--<xsl:variable name="sName" select="emsObject/systemName"/>-->
                                <!--<xsl:if test="$childrenCount &gt; 0">-->
                                    <!--<ol>-->
                                        <!--<xsl:call-template name="showContents">-->
                                            <!--<xsl:with-param name="contents"-->
                                                            <!--select="/root/childrenMap/children/entry[key=$sName]/value/item"/>-->
                                            <!--<xsl:with-param name="path" select="concat($path, '/', $sName)"/>-->
                                            <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                                        <!--</xsl:call-template>-->
                                    <!--</ol>-->
                                <!--</xsl:if>-->
                            <!--</li>-->
                        <!--</xsl:if>-->
                    <!--</xsl:for-each>-->
                <!--</ul>-->
                <!--<div class="all"><a href="{$path}">Весь список</a></div>-->

            <!--</xsl:when>-->
            <!--<xsl:otherwise><xsl:apply-imports/></xsl:otherwise>-->
        <!--</xsl:choose>-->
    <!--</xsl:template>-->


    <xsl:template match="ems:templ[@name='showContentBriefly-showFirstNewsItem']" >
    <!--<xsl:template name="showContentBriefly">-->
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>

        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>
       <!-- <xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>-->
        <div class="news-block">
            <!--<xsl:variable name="document" select="$contents/documents[language/code=$locale and version=$maxVersion]"/>-->
            <xsl:variable name="document" select="$contents/documents"/>
            <xsl:if test="$document">
                <div class="date">
                    <xsl:value-of select="$document/xmlSource/SMI/publications/item[@position=0]/date"/>
                </div>
            </xsl:if>

            <div class="title"><a href="{$servletPath}/{$sitemapPath}{concat($path,'/',$contents/emsObject/systemName)}">
                <xsl:value-of select="$name"/>
            </a></div>
        </div>

    </xsl:template>


    <xsl:template match="SMI/publications/item">
        <div class="news-item">
            <h1>
                <xsl:value-of select="title" disable-output-escaping="yes"/>
            </h1>
            <!--p>
                <strong>
                    <xsl:value-of select="author" disable-output-escaping="yes"/>
                </strong>
            </p-->
            <div class="date"><xsl:value-of select="date" disable-output-escaping="yes"/></div>
            <!--p>
                <a href="{url}">
                    <xsl:value-of select="url" disable-output-escaping="yes"/>
                </a>
            </p-->
            <p>
                <xsl:value-of select="text" disable-output-escaping="yes"/>
            </p>
        </div>

    </xsl:template>

</xsl:stylesheet>