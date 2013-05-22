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
        <div class="container">

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
                    <img alt="Logo" src="{$servletPath}/img/kremnevAtelier_logo.png"/>
                </a>
            </div>

            <!--Languages-->
            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 0]/value"/>

            <!--Main menu-->
            <div class="main-menu">
                    <xsl:apply-templates select="systemNodeObjects/object/entry[key = 1]/value"/>
            </div>

            <!-- <div class="mainbar">
                 <div class="srch " data-toggle="collapse" data-target="#accordionSearch">
                     <h4>Top</h4>
                 </div>
                 <div class="mnubutton " data-toggle="collapse" data-target="#option">
                     &lt;!&ndash;<div class="mnubutton " data-toggle="collapse" data-target="level2">&ndash;&gt;
                     <h4>Option</h4>
                 </div>
             </div>

             <div class="clear"></div>
    -->
        </div>


    </xsl:template>

</xsl:stylesheet>