<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:math="java.lang.Math">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typifiedObject/objectType/name='Folder' and typeAction/name = 'showRandomImage']">
        <xsl:variable name="systemName" select="typifiedObject/systemName" />
        <xsl:variable name="parentId" select="typifiedObject/id" />
        <xsl:variable name="fileObjects" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item"/>
        <xsl:variable name="imageObjects" select="$fileObjects[starts-with(contentType, 'image/')]"/>
        <!--<xsl:variable name="randomFileObject" select="/root/childrenMap/children/entry[key=$systemName]/value/item"/>-->
        <xsl:variable name="random" select="floor(math:random() * count($imageObjects)) + 1"/>
        <xsl:apply-templates select="$imageObjects[position() = $random]" mode="randomImage"/>

    </xsl:template>

    <xsl:template match="item" mode="randomImage">
        <img alt="" src="{$servletPath}{path}"/>
    </xsl:template>

</xsl:stylesheet>