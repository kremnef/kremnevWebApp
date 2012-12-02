<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>


    <xsl:template match="value[typifiedObject/objectType/name='Content' and typeAction/name='cycle']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName" />
        <xsl:variable name="typeActionName" select="typeAction/name" />

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <!--<script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.js"/>-->
                <script type="text/javascript" src="{$prefix}js/jquery/jquery.cycle.lite.min.js"/>

                <script type="text/javascript">
                    $(document).ready(function() {
                        $('.slideshow').cycle({
                            fx: 'fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
                        });
                    });
                </script>
                <div class="slideshow">
                    <xsl:variable name="parentId" select="typifiedObject/id"/>
                    <xsl:for-each select="/root/childrenMap/children/entry[key/systemName=$systemName and key/parentId=$parentId]/value/item">
                        <xsl:variable name="doc" select="documents/xmlSource"/>
                        <div id="{emsObject/systemName}">
                            <xsl:value-of select="$doc/HtmlCode/html" disable-output-escaping="yes"/>
                        </div>
                    </xsl:for-each>
                </div>
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>