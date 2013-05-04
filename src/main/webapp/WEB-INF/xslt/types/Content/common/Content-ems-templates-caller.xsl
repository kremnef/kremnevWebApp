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

    <!--EMS call template-->
    <xsl:template name="caller">
        <xsl:param name="name"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="contents"/>
        <xsl:param name="path"/>

        <xsl:variable name="templ"
                      select="document(concat('Content-', $typeActionName, '.xsl'))//ems:templ[@name=concat($name, '-', $typeActionName)]"/>
        <xsl:apply-templates select="$templ">
            <xsl:with-param name="contents"
                            select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:apply-templates>
    </xsl:template>



</xsl:stylesheet>