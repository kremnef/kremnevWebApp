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


    <xsl:template name="documentTypeImport">
        <xsl:param name="documentType"/>
        <xsl:param name="mode"/>
        <xsl:param name="path"/>
        <xsl:param name="contents"/>
        <xsl:param name="miniatureSize"/>
        <xsl:variable name="documentTypeTemplate"
                              select="document(concat('../documentType/', $documentType, '.xsl'))"/>
        <xsl:comment>
            <xsl:value-of select="$documentType"/>
        </xsl:comment>
        <xsl:choose>
            <xsl:when test="$mode ='list'">
                <xsl:apply-templates select="$documentTypeTemplate//ems:templ[@name=concat($documentType, '-list')]">
                    <xsl:with-param name="contents" select="$contents"/>
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="$documentTypeTemplate//ems:templ[@name=concat($documentType, '-item')]">
                    <xsl:with-param name="contents" select="$contents"/>
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>



        <!--<xsl:comment>
            <xsl:value-of select="$documentType"/>
        </xsl:comment>
        <xsl:choose>
            <xsl:when test="$mode ='list'">
                <xsl:apply-templates select="ems:templ[@name=concat($documentType, '-item')]">
                    <xsl:with-param name="contents" select="$contents"/>
                    <xsl:with-param name="path" select="$path"/>
                    <xsl:with-param name="miniatureSize" select="$miniatureSize"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="ems:templ[@name=concat($documentType, '-item')]">
                    <xsl:with-param name="contents" select="$contents"/>
                    <xsl:with-param name="path" select="$path"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>-->


    </xsl:template>


</xsl:stylesheet>