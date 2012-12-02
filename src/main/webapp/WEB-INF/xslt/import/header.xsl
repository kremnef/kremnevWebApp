<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <!--<xsl:apply-templates select="systemNode/objects[position = 1]" />-->
    <xsl:template name="header">
        <div class="header">
            <div class="logo">
            <a href="{$servletPath}">
                    <img alt="Logo" src="{$servletPath}/img/kremnevAtelier_logo.png"/>
                </a>
            </div>
            <div class="instruments">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 0]/value"/>
            </div>
            <div class="clear"></div>
            <div class="main-menu">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 1]/value"/>
            </div>
            <div class="clear"></div>

        </div>

        <!--<div class="breadcrumb">
            <script src="/js/jquery/jquery.js" language="javascript"></script>
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
                setTimeout("hideMenu('" + menuId + "')", 300);

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


        </div>-->
    </xsl:template>

</xsl:stylesheet>