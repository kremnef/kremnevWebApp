<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:template match="value[objectType/name='Language' and typeAction/name = 'list-avaliable-languages']">
        <xsl:variable name="systemName" select="objectType/name" />
        <xsl:variable name="id" select="objectType/id" />

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="showLanguages">
                <xsl:variable name="languages" select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item[isPublished='true']"/>
                <xsl:if test="count($languages) &gt; 0">
                    <ul id="nav nav-tabs ul-{$systemName}-{$position}" name="ul-{$systemName}">
                        <xsl:for-each select="$languages">
                            <li>
                                <a href="?lang={code}">
                                    <xsl:if test="code=$locale">
                                        <xsl:attribute name="class">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="name"/>
                                </a>
                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:if>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>