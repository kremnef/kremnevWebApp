<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typifiedObject/objectType/name='Folder' and typeAction/name = 'showHierarchy']">

        <xsl:variable name="systemName" select="typifiedObject/systemName" />
        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="showHierarchy">
                <xsl:variable name="name">
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>

                <h2><xsl:value-of select="$name"/></h2>

                <xsl:call-template name="typifiedObject">
                    <xsl:with-param name="obj" select="typifiedObject"/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="typifiedObject">
        <xsl:param name="obj"/>

        <xsl:variable name="systemName" select="$obj/systemName" />
        <xsl:variable name="parentId" select="$obj/id" />

        <xsl:variable name="items" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item[objectType/name='Folder' or objectType/name='FileObject']" />
        <xsl:if test="count($items) &gt; 0">
            <ul>
                <xsl:for-each select="$items">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                        <xsl:choose>
                            <xsl:otherwise>
                                <xsl:value-of select="name"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <li class="menuItem">
                        <xsl:variable name="path">
                            <xsl:choose>
                                <xsl:when test="starts-with(path, '/')">
                                    <xsl:value-of select="substring-after(path, '/')"/>
                                </xsl:when>
                                <xsl:otherwise><xsl:value-of select="path"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <a target="_blank" href="{$servletPath}/{$sitemapPath}{$path}"><xsl:value-of select="$name" /></a>
                        <xsl:variable name="extension">
                            <xsl:call-template name="getExtension">
                                <xsl:with-param name="name" select="$path"/>
                                <xsl:with-param name="fullName" select="1"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <a class="img"><img alt="" src="{$servletPath}{$sitemapPath}img/icons/{$extension}_icon.png"/></a>
                        <span>Формат <xsl:value-of select="$extension"/>, <xsl:call-template name="formatSize"><xsl:with-param
                                name="size" select="size"/></xsl:call-template>.</span>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>