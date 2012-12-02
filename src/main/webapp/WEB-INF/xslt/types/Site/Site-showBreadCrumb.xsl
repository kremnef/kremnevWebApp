<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[objectType/name='SiteMap' and typeAction/name = 'showBreadCrumb']">

        <div class="breadcrumb">
            <script language="javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.js"/>
            <script language="javascript">

                var linksIn = {};
                var menusIn = {};


                function hideMenu(menuId) {
                    if (!menusIn[menuId] &amp;&amp; !linksIn[menuId.replace('others','')]) {
                        $('#' + menuId).hide();
                    }
                    else {
                        closeMenu(menuId);
                    }
                }


                function closeMenu(menuId) {
                    setTimeout("hideMenu('" +  menuId + "')", 300);

                }


                $(document).ready(function(){
                    $(".breadcrumb .few").hover(
                        function() {
                            linksIn[this.id] = true;
                            $this = $(this);
                            var offset = $this.offset();
                            var menuId = 'others' + this.id;
                            var menuObj = $('#' + menuId);
                            menuObj.offset({top:(offset.top + 20),left:(offset.left + 10)});
                            $('#' + menuId).css('display', 'block');
                            menuObj.offset({top:(offset.top + 20),left:(offset.left + 10)});
                        },
                        function() {
                            linksIn[this.id] = false;
                            closeMenu('others' + this.id);
                        }
                    );
                    $('.others').hover(
                        function() {
                            menusIn[this.id] = true;
                        },
                        function() {
                            menusIn[this.id] = false;
                            closeMenu(this.id);
                        }
                    );
                });
            </script>
            <xsl:variable name="pathPrefix" select="concat($servletPath, '/', $sitemapPath)"/>
            <div class="item first">
                <div class="left"/>
                <a href="{$pathPrefix}">Главная</a>
                <div class="right"/>
            </div>
            <xsl:variable name="requestURI" select="/root/params/src/param[@name='src']"/>
            <!--<xsl:variable name="tempRequestURI" select="substring($requestURI, string-length($pathPrefix) + 1, string-length($requestURI) - string-length($pathPrefix))"/>-->
            <xsl:variable name="clearRequestURI">
                <xsl:choose>
                    <xsl:when test="starts-with($requestURI, '/')"><xsl:value-of select="substring($requestURI, 2, string-length($requestURI) - 1)"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$requestURI"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:variable name="uriPrefix">
                <xsl:choose>
                    <xsl:when test="contains($clearRequestURI, '/')"><xsl:value-of select="substring-before($clearRequestURI, '/')"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$clearRequestURI"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="items">
                <xsl:with-param name="pathPrefix" select="$pathPrefix"/>
                <xsl:with-param name="uriPrefix" select="$uriPrefix"/>
                <xsl:with-param name="uriSuffix" select="substring-after($clearRequestURI, '/')"/>
                <xsl:with-param name="level" select="1"/>
            </xsl:call-template>
        </div>
    </xsl:template>


    <xsl:template name="items">
        <xsl:param name="pathPrefix"/>
        <xsl:param name="uriPrefix"/>
        <xsl:param name="uriSuffix"/>
        <xsl:param name="level"/>

        <xsl:if test="string-length($uriPrefix) &gt; 0 and /root/siteMapViewList/siteMapViews[url=$uriPrefix]">
            <xsl:variable name="siteMap" select="/root/siteMapViewList/siteMapViews[url=$uriPrefix]"/>
            <xsl:variable name="siteMapId" select="generate-id($siteMap)"/>
            <xsl:variable name="parentId" select="$siteMap/parentId"/>
            <xsl:variable name="others" select="/root/siteMapViewList/siteMapViews[parentId=$parentId]"/>
            <xsl:variable name="classes">
                <xsl:if test="string-length($uriSuffix) = 0"><xsl:text> selected</xsl:text></xsl:if>
                <xsl:if test="count($others) &gt; 1 and $level &gt; 2"><xsl:text> few</xsl:text></xsl:if>
            </xsl:variable>
            <div class="separator"/>
            <div id="{$siteMapId}" class="item{$classes}">
                <div class="left"/>
                <a href="{$pathPrefix}{$uriPrefix}"><xsl:value-of select="$siteMap/objectName"/></a>
                <div class="right"/>
            </div>
            <!--<xsl:if test="$level &gt; 2">
                <xsl:call-template name="othersTemplate">
                    <xsl:with-param name="pathPrefix" select="$pathPrefix"/>
                    <xsl:with-param name="others" select="$others"/>
                    <xsl:with-param name="siteMapId" select="$siteMapId"/>
                </xsl:call-template>
            </xsl:if>-->
            <xsl:variable name="currentUriPrefix">
                <xsl:choose>
                    <xsl:when test="contains($uriSuffix, '/')"><xsl:value-of select="substring-before($uriSuffix, '/')"/></xsl:when>
                    <xsl:otherwise><xsl:value-of select="$uriSuffix"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:call-template name="items">
                <xsl:with-param name="pathPrefix" select="$pathPrefix"/>
                <xsl:with-param name="uriPrefix" select="concat($uriPrefix, '/', $currentUriPrefix)"/>
                <xsl:with-param name="uriSuffix" select="substring-after($uriSuffix, '/')"/>
                <xsl:with-param name="level" select="$level + 1"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>


   <!-- <xsl:template name="othersTemplate">
        <xsl:param name="pathPrefix"/>
        <xsl:param name="others"/>
        <xsl:param name="siteMapId"/>
        <table id="others{$siteMapId}" class="others">
            <tr class="header">
                <td class="left"/>
                <td class="center"/>
                <td class="right"/>
            </tr>
            <xsl:for-each select="$others">
                <tr>
                    <td colspan="3">
                        <xsl:if test="generate-id() = $siteMapId">
                            <xsl:attribute name="class">selected</xsl:attribute>
                        </xsl:if>
                        <a href="{$pathPrefix}{url}"><xsl:value-of select="objectName"/></a>
                    </td>
                </tr>
            </xsl:for-each>
            <tr class="footer">
                <td class="left"/>
                <td class="center"/>
                <td class="right"/>
            </tr>
        </table>
    </xsl:template>-->

</xsl:stylesheet>