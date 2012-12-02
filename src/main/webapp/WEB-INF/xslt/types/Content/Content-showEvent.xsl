<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
    <!ENTITY lt "<">
]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="Content.xsl" />
    <xsl:import href="../functions.xsl"/>

    <xsl:template match="xmlSource">
        <xsl:param name="fileObjects"/>
        <xsl:apply-templates select="Event">
            <xsl:with-param name="fileObjects" select="$fileObjects"/>
        </xsl:apply-templates>
    </xsl:template>

    <xsl:template match="Event">

        <xsl:param name="fileObjects"/>

        <xsl:variable name="title" select="title"/>
        <xsl:variable name="image" select="image"/>
        <xsl:variable name="issue" select="issue"/>
        <xsl:variable name="description" select="description"/>
        <xsl:variable name="datetime" select="datetime"/>
        <xsl:variable name="place" select="place"/>
        <xsl:variable name="video" select="video"/>
        <xsl:variable name="audio" select="audio"/>
        <xsl:if test="$title!=''">
            <h1><xsl:value-of select="$title"/></h1>
        </xsl:if>
        <xsl:if test="$datetime !=''">
            <div class="datetime">
                <xsl:value-of select="$datetime"/>
            </div>
        </xsl:if>
        <xsl:if test="$place !=''">
            <div class="place">
                <span class="placeTitle">Место:</span><xsl:value-of select="$place"/>
            </div>
        </xsl:if>

        <xsl:if test="$image !=''">
            <img src="{$servletPath}{$image}"/>
        </xsl:if>
        
        <xsl:if test="$description !=''">
            <h2><xsl:value-of select="$description"/></h2>
        </xsl:if>
        <xsl:if test="$issue !=''">
            <div class="issue"><xsl:value-of select="$issue" disable-output-escaping="yes"/></div>
        </xsl:if>

        <xsl:if test="count($fileObjects) &gt; 0">

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

            <div class="imageGallery">
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
                            <a class="zoom" href="{$servletPath}{$path}" title="{name}"><img src="{$servletPath}{$lastSubstringBefore}/{emsObject/systemName}.png" alt=""/></a>
                        </xsl:if>
                    </xsl:for-each>
                </div>

                <xsl:call-template name="pager">
                    <xsl:with-param name="items" select="$fileObjects"/>
                    <xsl:with-param name="currentPage" select="$currentPage"/>
                    <xsl:with-param name="itemsOnPage" select="$itemsOnPage"/>
                </xsl:call-template>
            </div>
        </xsl:if>

    </xsl:template>


    <xsl:template name="showContentBriefly">
        <xsl:param name="content"/>
        <xsl:param name="path"/>
        <xsl:param name="level"/>
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
                    <a href="{$servletPath}/{$sitemapPath}{concat($path, '/', $content/emsObject/systemName)}">
                        <xsl:value-of select="$name"/>
                    </a>
                </h3>
            </xsl:otherwise>
        </xsl:choose>


        <!--<xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$content"/>
            </xsl:call-template>
        </xsl:variable>-->
        <!--<xsl:variable name="doc" select="$content/documents[language/code=$locale and version=$maxVersion]"/>-->
        <xsl:variable name="doc" select="$content/documents"/>
        <xsl:if test="$doc/description !=''">
            <div class="description">
                <xsl:value-of select="$doc/description"/>
            </div>
        </xsl:if>
        <xsl:if test="$doc/xmlSource/Event/datetime !=''">
            <div class="datetime">
                <xsl:value-of select="$doc/xmlSource/Event/datetime"/>
            </div>
        </xsl:if>
        <xsl:if test="$doc/xmlSource/Event/place !=''">
            <div class="place">
                <span class="placeTitle">Место:</span><xsl:value-of select="$doc/xmlSource/Event/place"/>
            </div>
        </xsl:if>

        <xsl:if test="$doc/xmlSource/Event/description !=''">
            <div class="description">
                <xsl:value-of select="$doc/xmlSource/Event/description"/>
            </div><br/>
        </xsl:if>

        <xsl:if test="$doc/xmlSource/Event/image !=''">
            <img src="{$servletPath}{$doc/xmlSource/Event/image}"/>
        </xsl:if>

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