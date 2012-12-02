<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../../dtd/escape.dtd">
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                xmlns:fn="http://www.w3.org/2005/xpath-functions"
                xmlns:exslt="http://exslt.org/common"
                exclude-result-prefixes="i18n fn exslt">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[objectType/name='Site' and typeAction/name = 'searchResults']">
        <xsl:variable name="SEARCH_KEY" select="/root/search-results/query"/>
        <xsl:variable name="TEXT_KEY" select="xmlSource"/>
        <div class="searchResults">
            <h3><i18n:text key="Search.query"/> : <b><xsl:value-of select="/root/search-results/query"/></b></h3>
            <xsl:variable name="searchResults" select="/root/search-results/item"/>
            <xsl:variable name="searchResultsCount" select="count($searchResults)"/>
            <div class="count"><span><xsl:value-of select="$searchResultsCount"/></span>&nbsp;
                <xsl:choose>
                    <xsl:when test="$searchResultsCount = 1"><i18n:text key="Search.record"/></xsl:when>
                    <xsl:when test="fn:ends-with(string($searchResultsCount), '1') and $searchResultsCount != 11"><i18n:text key="Search.record21"/></xsl:when>
                    <xsl:when test="(fn:ends-with(string($searchResultsCount), '2') or
                    fn:ends-with(string($searchResultsCount), '3') or
                    fn:ends-with(string($searchResultsCount), '4')) and
                    ($searchResultsCount != 12 and $searchResultsCount != 13 and $searchResultsCount != 14)"><i18n:text key="Search.records2"/></xsl:when>
                    <xsl:otherwise><i18n:text key="Search.records"/></xsl:otherwise>
                </xsl:choose>
            </div>
            <xsl:if test="$searchResultsCount > 0">
                <xsl:for-each select="/root/search-results/item">
            <div class="search-item">
                <span class="hot">
                    <a href="{url}" title="{url}">
                        <xsl:value-of select="title"/>
                    </a>
                </span>

                <xsl:if test="contains(text, $SEARCH_KEY)">

                    <xsl:value-of select="substring-before($TEXT_KEY,$SEARCH_KEY)" disable-output-escaping="yes"/>
                    <font class="search-key">
                        <xsl:value-of select="$SEARCH_KEY"/>
                    </font>
                    <xsl:value-of select="substring-after($TEXT_KEY, $SEARCH_KEY)" disable-output-escaping="yes"/>
                </xsl:if>


            </div>


        </xsl:for-each>
               <!-- <ul>
                    <xsl:for-each select="$searchResults">
                        <li>
                            <div class="title"><xsl:value-of select="title"/></div>
                            <div class="content">
                                <xsl:value-of select="content" disable-output-escaping="yes"/>
                            </div>
                        </li>
                    </xsl:for-each>
                </ul>-->

            </xsl:if>
        </div>
    </xsl:template>

</xsl:stylesheet>