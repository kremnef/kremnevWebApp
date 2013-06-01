<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="ems i18n">

    <!--<xsl:import href="../functions.xsl"/>-->

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>
    <!--<xsl:strip-space elements="typeActionName"/>-->

    <!--EMS call template-->




    <!--EMS showContent One default for attached to page-->
    <xsl:template name="showContent">
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
        <xsl:variable name="child"
                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[systemName = $objectURLPrefix]"/>

        <xsl:choose>
            <xsl:when test="$child and $initialContent != ''">
                <xsl:call-template name="showContent">
                    <xsl:with-param name="content" select="$child"/>
                    <xsl:with-param name="initialContent" select="$initialContent"/>
                    <xsl:with-param name="objectURL" select="$objectURLSuffix"/>
                    <xsl:with-param name="path" select="concat($path, $objectURLPrefix, '/')"/>
                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                    <xsl:with-param name="position" select="$position"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <div class="widget-{$position}">
                    <!--Variables-->
                    <xsl:variable name="childrenCount"
                                  select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
                    <xsl:variable name="doc" select="$content/document"/>
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="$content"/>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="filesInFolders"
                                  select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/systemName and key/blockNumber=$position]/value/item"/>
                    <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                    <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

                    <!--Children List-->
                    <div id="{$systemName}-list">
                        <xsl:choose>
                            <xsl:when test="$childrenCount &gt; 0">

                                <xsl:call-template name="caller">
                                    <xsl:with-param name="name" select="'showContents'"/>
                                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                    <xsl:with-param name="contents"
                                                    select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                                    <xsl:with-param name="path" select="$path"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="item-content">
                                    <xsl:apply-templates
                                            select="$doc/xmlSource">
                                        <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                    </xsl:apply-templates>
                                </div>
                                <xsl:if test="$initialContent != ''">
                                    <xsl:call-template name="showContent">
                                        <xsl:with-param name="content" select="$initialContent"/>
                                        <xsl:with-param name="initialContent" select="''"/>
                                        <xsl:with-param name="objectURL" select="$initialContent/objectURL"/>
                                        <xsl:with-param name="path" select="$initialContent/baseURL"/>
                                        <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        <xsl:with-param name="position" select="$position"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <!-- Content item-->
                    <div id="{$systemName}-item">
                        <div id="{$systemName}-{$position}" class="{$typeActionName}">

                            <xsl:call-template name="typifiedObject">
                                <xsl:with-param name="obj" select="typifiedObject"/>
                                <xsl:with-param name="objectURL" select="$objectURL"/>
                                <xsl:with-param name="position" select="$position"/>
                            </xsl:call-template>
                            <div class="item-content">
                                <h1>
                                    <xsl:value-of select="$name"/>
                                </h1>
                                <xsl:apply-templates
                                        select="$doc/xmlSource">
                                    <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                </xsl:apply-templates>
                            </div>
                            <!--<xsl:if test="$initialContent != ''">-->
                            <!--<xsl:call-template name="showContent">-->
                            <!--<xsl:with-param name="content" select="$initialContent"/>-->
                            <!--<xsl:with-param name="initialContent" select="''"/>-->
                            <!--<xsl:with-param name="objectURL" select="$initialContent/objectURL"/>-->
                            <!--<xsl:with-param name="path" select="$initialContent/baseURL"/>-->
                            <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                            <!--<xsl:with-param name="position" select="$position"/>-->
                            <!--</xsl:call-template>-->
                            <!--</xsl:if>-->
                            <!--<xsl:call-template name="slideShow">
                                <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                <xsl:with-param name="systemName" select="$systemName"/>
                                <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            </xsl:call-template>-->
                            <div class="attachements">
                                <xsl:call-template name="yoxview">
                                    <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                    <xsl:with-param name="systemName" select="$systemName"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--EMS showContent One Briefly-->
    <xsl:template name="showContentBriefly">
        <xsl:param name="content"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$content"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
        <xsl:choose>
            <xsl:when test="$childrenCount &gt; 0">
                <h3>
                    <xsl:value-of select="$name"/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h3>
                    <a href="{$servletPath}/{$sitemapPath}{concat($path,'/',$content/systemName)}">
                        <xsl:value-of select="$name"/>
                    </a>
                </h3>
            </xsl:otherwise>
        </xsl:choose>


        <!-- <xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$content"/>
            </xsl:call-template>
        </xsl:variable>-->
        <!--<xsl:if test="$content/document[language/code=$locale and version=$maxVersion]/description !=''">-->
        <xsl:if test="$content/document/description !=''">
            <span class="description">
                <xsl:value-of select="$content/document/description"/>
            </span>
        </xsl:if>
    </xsl:template>


    <!--EMS showContents Many-->
    <xsl:template name="showContents">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <ul>
            <xsl:for-each select="$contents">
                <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                <xsl:sort select="document/createdDateTime" data-type="number" order="descending"/>
                <li>
                    <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
                    <!--<xsl:variable name="sName" select="systemName" />
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

                    <xsl:variable name="pId" select="id"/>
                    <xsl:variable name="sName" select="systemName"/>
                    <xsl:if test="$childrenCount &gt; 0">
                        <ol>
                            <xsl:call-template name="showContents">
                                <xsl:with-param name="contents"
                                                select="/root/childrenMap/children/entry[key/parentId=$pId and key/systemName=$sName]/value/item"/>
                                <xsl:with-param name="path" select="concat($path, '/', $sName)"/>
                                <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            </xsl:call-template>
                        </ol>
                    </xsl:if>
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
    </xsl:template>





</xsl:stylesheet>