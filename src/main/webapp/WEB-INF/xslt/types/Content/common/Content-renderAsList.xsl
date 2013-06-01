<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems i18n">

    <xsl:import href="../../../ext/date.format-date.template.xsl"/>
    <xsl:import href="../../functions.xsl"/>
    <!--<xsl:import href="../../documentType/document-types.xsl"/>-->
    <xsl:import href="Content-ems-typifiedobject-template.xsl"/>


    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='renderAsList' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <xsl:call-template name="render-as-list">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="''"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>

    <!--EMS Render LiST -->
    <xsl:template name="render-as-list">
        <xsl:param name="content"/>
        <xsl:param name="initialContent"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="position"/>

        <!--variables-->
        <xsl:variable name="systemName" select="$content/systemName"/>
        <xsl:variable name="parentId" select="$content/id"/>
        <xsl:variable name="objectURLPrefix">
            <xsl:choose>
                <xsl:when test="contains($objectURL, '/')">
                    <xsl:value-of select="substring-before($objectURL, '/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$objectURL"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="objectURLSuffix">
            <xsl:choose>
                <xsl:when test="contains($objectURL, '/')">
                    <xsl:value-of select="substring-after($objectURL, '/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>


        <div class="widget-{$position}">
            <xsl:comment>widget-list-render</xsl:comment>
            <!--Variables-->
            <xsl:variable name="child"
                          select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[systemName = $objectURLPrefix]"/>

            <xsl:variable name="childrenCount"
                          select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
            <xsl:variable name="doc" select="$content/document"/>
            <xsl:variable name="name">
                <xsl:call-template name="getLocalName">
                    <xsl:with-param name="typifiedObject" select="$content"/>
                </xsl:call-template>
            </xsl:variable>


            <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

            <!-- Content item-->
            <div id="{$systemName}-item">
                <div id="{$systemName}-{$position}" class="{$typeActionName}">

                    <xsl:call-template name="typifiedObject">
                        <xsl:with-param name="obj" select="typifiedObject"/>
                        <xsl:with-param name="objectURL" select="$objectURL"/>
                        <xsl:with-param name="position" select="$position"/>
                    </xsl:call-template>
                    <div class="item-content">
                        <h1>Заголовок!!!
                            <xsl:value-of select="$name"/>
                        </h1>

                    </div>

                </div>
            </div>
            <!--Children List-->
            <div id="{$systemName}-list">
                <xsl:choose>
                    <xsl:when test="$childrenCount &gt; 0">
                        <xsl:variable name="contents"
                                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                        <!--<xsl:call-template name="caller">
                            <xsl:with-param name="name" select="'showContents'"/>
                            <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            <xsl:with-param name="contents"
                                            select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                            <xsl:with-param name="path" select="$path"/>
                        </xsl:call-template>-->
                        <ul>
                            <xsl:for-each select="$contents">
                                <xsl:variable name="item-name">
                                    <xsl:call-template name="getLocalName">
                                        <xsl:with-param name="typifiedObject" select="."/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                                <!--<xsl:sort select="document/createdDateTime" data-type="number" order="descending"/>-->
                                <li>
                                    <!--<xsl:variable name="emsObjectChildrenCount" select="emsObject/childrenCount"/>
                                    <xsl:if test="emsObjectChildrenCount >0">
                                         <xsl:value-of select="emsObjectChildrenCount"/> = emsObjectChildrenCount;
                                    </xsl:if>-->
                                    <xsl:variable name="pId" select="id"/>
                                    <xsl:variable name="sName" select="systemName"/>
                                    <a href="{$servletPath}/{$sitemapPath}{concat($path,$sName)}">
                                        <xsl:value-of select="$item-name"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                        <xsl:variable name="showAll" select="concat($contents/documentType/name, '.showAll')"/>
                        <div class="all">
                            <a href="{$path}">
                                <!--<i18n:text key="{$showAll}"/>-->
                                <i18n:text key="PressRelease.showAll"/>
                            </a>
                        </div>
                    </xsl:when>
                </xsl:choose>
            </div>

        </div>

    </xsl:template>


</xsl:stylesheet>