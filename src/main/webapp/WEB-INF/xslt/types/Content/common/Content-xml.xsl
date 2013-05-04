<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template match="objects[emsObject/@xsi:type='content']">
        <xsl:apply-templates mode="showXMLObject" select="." />
    </xsl:template>

</xsl:stylesheet>
