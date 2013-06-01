<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:variable name="prefix">
                <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>

        <xsl:template match="value[typifiedObject/objectType/name='Navigation' and typeAction/name = 'list-dropdown']">

            <xsl:variable name="position" select="../key"/>

            <div class="widget-{$position}">
                <div id="{typifiedObject/systemName}-{$position}" class="dropdown">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                        </xsl:call-template>
                    </xsl:variable>

                    <h2>
                        <xsl:variable name="systemNodeId" select="typifiedObject/@systemNodeId"/>
                        <xsl:variable name="outerURL" select="typifiedObject/outerURL"/>
                        <xsl:choose>
                            <xsl:when test="$systemNodeId">
                                <a class="selected" href="{$prefix}{typifiedObject/pathURL}"><xsl:value-of select="$name" /></a>
                            </xsl:when>
                            <xsl:when test="$outerURL">
                                <a class="selected" href="{$outerURL}"><xsl:value-of select="$name" /></a>
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="$name" /></xsl:otherwise>
                        </xsl:choose>
                    </h2>
                    <xsl:call-template name="typifiedObjectDropDown">
                        <xsl:with-param name="obj" select="typifiedObject"/>
                        <xsl:with-param name="position" select="$position"/>
                    </xsl:call-template>
                </div>
            </div>
    </xsl:template>


    <xsl:template name="typifiedObjectDropDown">
        <xsl:param name="obj"/>
        <xsl:param name="position"/>

        <xsl:variable name="systemName" select="$obj/systemName" />
        <xsl:variable name="parentId" select="$obj/id" />

        <xsl:variable name="items" select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item" />
        <xsl:if test="count($items) &gt; 0">

            <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.selectbox-0.5.js"/>
            <script type="text/javascript">
                 $(document).ready(function() {
                     $('#select-<xsl:value-of select="concat($systemName, '-', $position)"/>').selectbox();
                 });
            </script>
            <select id="select-{$systemName}-{$position}" name="select-{$systemName}">
                <xsl:for-each select="$items">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    <!--<option value="{systemName}">-->
                    <option >

                        <xsl:variable name="systemNodeId" select="@systemNodeId"/>
                        <xsl:variable name="outerURL" select="outerURL"/>
                        <xsl:variable name="path">
                            <xsl:choose>
                                <xsl:when test="$systemNodeId">
                                    <xsl:value-of select="concat($prefix, pathURL)"/>
                                </xsl:when>
                                <xsl:when test="$outerURL">
                                    <xsl:value-of select="$outerURL"/>
                                </xsl:when>
                                <xsl:otherwise><xsl:text/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:if test="$path != ''">
                            <xsl:attribute name="value"><xsl:value-of select="$path"/></xsl:attribute>
                        </xsl:if>
                         <xsl:if test="baseURL = concat(pathURL, '/')">
                            <xsl:attribute name="selected"/>
                        </xsl:if><!--<xsl:if test="$path != ''">
                            <xsl:attribute name="onchange">document.location.href='<xsl:value-of select="$path"/>'</xsl:attribute>
                        </xsl:if>-->
                        <xsl:value-of select="$name"/>
                    </option>
                </xsl:for-each>
            </select>
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>