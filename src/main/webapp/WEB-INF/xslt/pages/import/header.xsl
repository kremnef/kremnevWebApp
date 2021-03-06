<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">


    <xsl:template name="header">
        <div class="container head">
            <!-- START of fixed header -->
           <!-- <div id="header">
                <div id="headerwrapper">
                    <div id="headertop">

                        <ul id="languages">
                            <li>
                                <a href="/ru">Russian</a>
                            </li>
                            <li>
                                <a href="/en">English</a>
                            </li>
                        </ul>
                    </div>




                    &lt;!&ndash;<ul class="mainmenu float-wrap">
                        <li>
                            <a href="/ru/blog">Блог</a>
                        </li>
                        <li>
                            <a href="/ru/festival">Фестиваль</a>
                        </li>
                        <li>
                            <a href="/ru/program">Программа</a>
                        </li>
                        <li>
                            <a href="/ru/media">Медиа</a>
                        </li>
                    </ul>&ndash;&gt;

                    <a href="#" class="dashboardlink dashboardlink-active">Change language</a>
                    <a href="#" class="dashboardlink dashboardlink-active" id="dashboard-label">Войти /
                        Зарегистрироваться
                    </a>

                    &lt;!&ndash;<div id="headerbottom">

                    </div>&ndash;&gt;
                </div>
            </div>-->
            <!-- END of fixed header -->


            <!--Search Form-->
            <div class="search collapse " id="accordionSearch">
                <div class="soc">
                    <div class="tw16 soc"></div>
                    <div class="fb16 soc"></div>
                    <div class="li16 soc"></div>
                    <div class="yt16 soc"></div>
                    <div class="we16 soc"></div>
                    <div class="rss16 soc"></div>
                </div>
                <form method="get" action="/ems/service/search" id="searchNews">
                    <div class="ui-widget">
                        <form method="get" action="/ems/service/search" id="searchForm">
                            <input value="Поиск" id="ems-search" resulte="10" name="query" type="text" class="text"/>
                        </form>
                    </div>

                </form>
            </div>

            <!--Logo-->
            <div class="logo">
                <a href="{$servletPath}/{$sitemapPath}">
                    <img alt="Logo" src="{$servletPath}/img/kremnevAtelier_logo_onWhite.png"/>
                    <!--<img alt="Logo" src="{$servletPath}/img/kremnevAtelier_logo_onWhite_big.png"/>-->
                </a>
            </div>

            <!--Languages-->
            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 0]/value"/>


            <!--<div class="hidebox">
                <div class="srch " data-toggle="collapse" data-target="#accordionSearch">
                    <span>Top</span>
                </div>
                <div class="mnubutton " data-toggle="collapse" data-target="#option">
                    <span>Option</span>
                </div>
            </div>-->

        </div>
        <div class="container main-menu">
            <!--Main menu-->
            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 1]/value"/>
        </div>

    </xsl:template>

</xsl:stylesheet>