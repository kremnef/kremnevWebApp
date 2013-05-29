<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="ems i18n">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>


    <!--EMS typifiedObject-->
    <xsl:template name="typifiedObject">
        <xsl:param name="obj"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="position"/>

        <xsl:variable name="systemName" select="$obj/systemName"/>
        <xsl:variable name="parentId" select="$obj/id"/>

        <xsl:variable name="items"
                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[objectType/name='FileObject']"/>
        <xsl:if test="count($items) &gt; 0">
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

            <ul>
                <xsl:for-each select="$items">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    <li>
                        <xsl:attribute name="class">
                            <xsl:text>menuItem</xsl:text>
                            <xsl:if test="systemName = $objectURLPrefix">selected</xsl:if>
                        </xsl:attribute>
                        <xsl:variable name="path">
                            <xsl:choose>
                                <xsl:when test="starts-with(path, '/')">
                                    <xsl:value-of select="substring-after(path, '/')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="path"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <a target="_blank" href="{$servletPath}/{$sitemapPath}{$path}">
                            <xsl:value-of select="$name"/>
                        </a>
                        <xsl:variable name="extension">
                            <xsl:call-template name="getExtension">
                                <xsl:with-param name="name" select="$path"/>
                                <xsl:with-param name="fullName" select="1"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <a class="img">
                            <img alt="" src="{$servletPath}/{$sitemapPath}img/icons/{$extension}_icon.png"/>
                        </a>
                        <span>Формат<xsl:value-of select="$extension"/>,
                            <xsl:call-template name="formatSize">
                                <xsl:with-param
                                        name="size" select="size"/>
                            </xsl:call-template>
                            .
                        </span>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

    </xsl:template>


</xsl:stylesheet>