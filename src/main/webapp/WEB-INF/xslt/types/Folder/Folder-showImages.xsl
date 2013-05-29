<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>


    <xsl:template match="value[typifiedObject/objectType/name='Folder' and typeAction/name = 'showImages']">

        <xsl:variable name="systemName" select="typifiedObject/systemName" />
        <xsl:variable name="objectURL" select="typifiedObject/objectURL" />
        <xsl:variable name="objectURLSuffix">
            <xsl:choose>
                <xsl:when test="contains($objectURL, '/')">
                    <xsl:value-of select="substring-after($objectURL, '/')" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of  select="''" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="fileObjects" select="/root/childrenMap/children/entry[key=$objectURLSuffix]/value/item"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">

            <div id="{$systemName}-{$position}" class="imageGallery">
                <xsl:variable name="currentPage">
                    <xsl:choose>
                        <xsl:when test="$page and $page &lt;= count($fileObjects)">
                            <xsl:value-of select="$page"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="1"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="itemsOnPage" select="10"/>
                <xsl:call-template name="pager">
                    <xsl:with-param name="items" select="$fileObjects"/>
                    <xsl:with-param name="currentPage" select="$currentPage"/>
                    <xsl:with-param name="itemsOnPage" select="$itemsOnPage"/>
                </xsl:call-template>

                <div class="pictoteca">
                    <xsl:variable name="minBound" select="($currentPage - 1) * $itemsOnPage"/>
                    <xsl:variable name="maxBound" select="$currentPage * $itemsOnPage"/>
                    <xsl:for-each select="$fileObjects">
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:if test="$minBound &lt; $pos and $pos &lt;= $maxBound">
                            <xsl:variable name="path" select="path"/>
                            <xsl:variable name="lastSubstringBefore">
                                <xsl:call-template name="lastSubstringBefore">
                                    <xsl:with-param name="str" select="$path"/>
                                    <xsl:with-param name="subj" select="'/'"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <a class="zoom" href="{$prefix}{$path}" title="{name}"><img src="{$prefix}{$lastSubstringBefore}/{systemName}.png" alt=""/></a>
                        </xsl:if>
                    </xsl:for-each>
                </div>

                <xsl:call-template name="pager">
                    <xsl:with-param name="items" select="$fileObjects"/>
                    <xsl:with-param name="currentPage" select="$currentPage"/>
                    <xsl:with-param name="itemsOnPage" select="$itemsOnPage"/>
                </xsl:call-template>

            </div>
        </div>
    </xsl:template>

    <xsl:template name="pager">
        <xsl:param name="items"/>
        <xsl:param name="currentPage"/>
        <xsl:param name="itemsOnPage"/>
        <xsl:if test="count($items) &gt; $itemsOnPage" >
            <div class="pager pictopager">
                <ul>
                    <xsl:call-template name="for">
                        <xsl:with-param name="n" select="ceiling(count($items) div $itemsOnPage) + 1"/>
                        <xsl:with-param name="currentPage" select="$currentPage"/>
                    </xsl:call-template>
                </ul>
            </div>
        </xsl:if>
    </xsl:template>


    <xsl:template name="for">
        <xsl:param name="i" select="1"/>
        <xsl:param name="n"/>
        <xsl:param name="currentPage"/>

        <xsl:if test="$i &lt; $n">

            <xsl:choose>
                <xsl:when test="$i=$currentPage">
                    <li class="selected"><a /></li>
                </xsl:when>
                <xsl:otherwise>
                    <li><a href="?page={$i}"></a></li>
                </xsl:otherwise>
            </xsl:choose>

            <xsl:call-template name="for">
                <xsl:with-param name="i" select="$i + 1"/>
                <xsl:with-param name="n" select="$n"/>
                <xsl:with-param name="currentPage" select="$currentPage"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>