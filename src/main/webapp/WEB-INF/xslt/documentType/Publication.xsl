<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:import href="../types/Content/Content.xsl"/>

   
    <xsl:template match="SMI/publications/item">
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h1>
        <p>
            <strong>
                <xsl:value-of select="author" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <strong>
                <xsl:value-of select="date" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <a href="{url}">
                <xsl:value-of select="url" disable-output-escaping="yes"/>
            </a>
        </p>
        <p>
            <xsl:value-of select="text" disable-output-escaping="yes"/>
        </p>
        <a href="{url}">вернуться</a>
</xsl:template>


</xsl:stylesheet>