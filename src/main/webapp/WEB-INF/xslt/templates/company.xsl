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
    <xsl:import href="../import/header.xsl"/>
    <xsl:import href="../import/footer.xsl"/>
    <xsl:template name="scripts">
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.js"/>
    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">
        <xsl:call-template name="header"/>
        <!--<div class="navigation">-->

        <!--<a href=""><img src="{$servletPath}/img/home.gif" alt="Home"/></a>-->
        <!--<span>/</span>-->
        <!--<a href="">Инвесторам</a>-->
        <!--</div>-->

        <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 4]/value"/>-->
        <div class="content">
            <div class="main">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 2]/value"/>
                <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 6]/value"/>

                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 8]/value"/>

                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 9]/value"/>-->

            </div>
            <!--корп идентификация-->
            <!--<div id="iso">
                <img src="/img/company/iso_sertificates.png" border="0" alt="Сертификация ISO"/>
            </div>-->
            <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 7]/value"/>-->

            <!--<div class="info">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 2]/value"/>
                &lt;!&ndash;<div class="contacts"><a href="#">Контакты всех</a></div>&ndash;&gt;
            </div>-->
            <!--
            <div class="extra">
                &lt;!&ndash;Структура власти:&ndash;&gt;
                &lt;!&ndash;Ген дир&ndash;&gt;

                &lt;!&ndash;Меню структуры&ndash;&gt;
                <div class="general">
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 10]/value"/>
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 15]/value"/>
                </div>
                &lt;!&ndash;общие слова&ndash;&gt;
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 12]/value"/>
                &lt;!&ndash;открытое меню&ndash;&gt;
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 11]/value"/>

                <div class="clear"></div>
            </div>-->

            <div class="print">
                <!--    <a href="#">
                    <i18n:text key="Page.printVersion"/>
                </a>-->
            </div>


        </div>

        <xsl:call-template name="footer"/>

    </xsl:template>

</xsl:stylesheet>