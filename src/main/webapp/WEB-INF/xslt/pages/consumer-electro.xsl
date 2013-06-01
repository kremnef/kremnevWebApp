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

    <xsl:template name="scripts">
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.js"/>
    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">
        <div class="header">
            <div class="logo">
                <img alt="Logo" src="{$servletPath}/img/kremnevAtelier_logo.png"/>
            </div>
            <div class="instruments">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 1]/value"/>
            </div>

        </div>
        <!--<div class="navigation">-->

        <!--<a href=""><img src="{$servletPath}/img/home.gif" alt="Home"/></a>-->
        <!--<span>/</span>-->
        <!--<a href="">Инвесторам</a>-->
        <!--</div>-->
        <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 4]/value"/>-->
        <div class="breadcrumb">
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
            <div class="item first">
                <div class="left"></div>
                <a href="/">Главная</a>
                <div class="right"></div>
            </div>
            <div class="separator"></div>
            <div class="item" id="N11EDB">
                <div class="left"></div>
                <a href="/press-center">Пресс-центр</a>
                <div class="right"></div>
            </div>
            <div class="separator"></div>
            <div class="item selected" id="N11EF3">
                <div class="left"></div>
                <a href="/press-center/press-releases">Пресс-релизы</a>
                <div class="right"></div>
            </div>
        </div>
        <div class="content">
            <div class="top">
                <div class="left">
                    <div class="right">

                        <div class="center">
                            <img src="{$servletPath}/{$sitemapPath}img/spacer.gif" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="middle">
                <div class="left">
                    <div class="right">
                        <div class="center">

                            <div class="info">
                                <!--контакты потребителям-->
                                <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 7]/value"/>-->
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 6]/value"/>

                                <!--контакты потребителям-->
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 5]/value"/>

                            </div>
                            <div class="main">

                                <!--Меню 2 уровня -->
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 7]/value"/>
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 8]/value"/>
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 9]/value"/>
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 10]/value"/>


                                <div class="clear"></div>

                            </div>
                            <div class="extra">
                                <!--Тарифы-->
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 11]/value"/>


                                <div class="clear"></div>
                            </div>
                            <!--Справочная инфа-->
                            <div class="help">
                                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 17]/value"/>
                            </div>
                            <div class="print">
                                <a href="#">
                                    <i18n:text key="Page.printVersion"/>
                                </a>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom">
                <div class="left">
                    <div class="right">

                        <div class="center">
                            <img src="{$servletPath}/{$sitemapPath}img/spacer.gif" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <xsl:apply-templates select="systemNodeObjects/object/entry[key = 18]/value"/>

        <!--<div class="official">-->
        <!--<div class="smi">Свидетельство о регистрации СМИ Эл № ФС77-31186 от 07.02.08</div>-->
        <!--<div class="copyright">&copy; ОАО "ТГК-2" 2005-2011</div>-->

        <!--</div>-->
        <xsl:apply-templates select="systemNodeObjects/object/entry[key = 19]/value"/>

    </xsl:template>

</xsl:stylesheet>