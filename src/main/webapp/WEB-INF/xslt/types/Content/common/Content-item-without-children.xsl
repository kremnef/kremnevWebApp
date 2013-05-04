<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="ems i18n">

    <xsl:import href="../../functions.xsl"/>
    <xsl:import href="Content-ems-typifiedobject-template.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>



    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>


    <!--EMS showContent One default for attached to page-->
    <xsl:template name="item-without-children">
        <xsl:param name="content"/>
        <xsl:param name="initialContent"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="position"/>

        <!--variables-->
        <xsl:variable name="systemName" select="$content/emsObject/systemName"/>
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
            <!--Variables-->
            <xsl:variable name="childrenCount"
                          select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
            <xsl:variable name="doc" select="$content/documents"/>
            <xsl:variable name="name">
                <xsl:call-template name="getLocalName">
                    <xsl:with-param name="typifiedObject" select="$content"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="filesInFolders"
                          select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/emsObject/systemName and key/blockNumber=$position]/value/item"/>
            <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
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
                        <h1>
                            <xsl:value-of select="$name"/>
                        </h1>
                        <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource"/>
                        <!--<xsl:apply-templates select="$doc/xmlSource">
                            <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                        </xsl:apply-templates>-->
                    </div>

                    <div class="attachements">
                        !!!!!!! attach widget
                        <!--<xsl:call-template name="yoxview">
                            <xsl:with-param name="fileObjects" select="$fileObjects"/>
                            <xsl:with-param name="systemName" select="$systemName"/>
                        </xsl:call-template>-->
                    </div>
                </div>
            </div>
        </div>

    </xsl:template>





</xsl:stylesheet>