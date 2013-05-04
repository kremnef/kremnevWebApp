<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:m="http://foo.com"
                xmlns:t="http://foo.com"
                xmlns:d="http://2foo.com" exclude-result-prefixes="m d t">
    <!--<xsl:output indent="yes"/>рпрпропроо-->
    <m:months>
        <month name="Январь" value="1"/>
        <month name="Февраль" value="2"/>
        <month name="Март" value="3"/>
        <month name="Апрель" value="4"/>
        <month name="Май" value="5"/>
        <month name="Июнь" value="6"/>
        <month name="Июль" value="7"/>
        <month name="Август" value="8"/>
        <month name="Сентябрь" value="9"/>
        <month name="Октябрь" value="10"/>
        <month name="Ноябрь" value="11"/>
        <month name="Декабрь" value="12"/>
    </m:months>
    <t:types>
        <type name="Все" value="all"/>
        <type name="Выставка" value="exhibition"/>
        <type name="Форум" value="forum"/>
        <type name="Лекция" value="lection"/>
        <type name="Экскурсия" value="excursion"/>
        <type name="Другое" value="another"/>
        <type name="Инсталляция" value="installation"/>
        <type name="Галерея" value="gallery"/>
    </t:types>
    <d:days>
        <day name="Пн" value="1"/>
        <day name="Вт" value="2"/>
        <day name="Ср" value="3"/>
        <day name="Чт" value="4"/>
        <day name="Пт" value="5"/>
        <day name="Сб" value="6"/>
        <day name="Вс" value="7"/>
    </d:days>
    <xsl:import href="../types/Content/Content.xsl"/>
    <!--<xsl:param name="request"/>-->
    <xsl:key name="month-key" match="Calendar/events/item" use="substring(date, 4, 2)"/>
    <xsl:key name="type-key" match="Calendar/events/item" use="type"/>
    <xsl:variable name="types" select="document('')//t:types"/>
    <xsl:template match="Calendar">
        <script>

            function hideText(divId){
            <!--alert(divId);-->
            <!--var text-id = 'text-'+ divId;-->
            <!--var main-id = 'main-'+ divId;-->

            document.getElementById('main-'+ divId).style.display ="block";
            document.getElementById('text-'+ divId).style.display ="none";
            }
            function showText(divId){
            <!--var text-id = 'text-'+ divId;-->
            <!--var main-id = 'main-'+ divId;-->
            document.getElementById('main-'+ divId).style.display ="none";
            document.getElementById('text-'+ divId).style.display ="block";
            }

        </script>
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
            <!--<xsl:value-of select="/http:request/http:requestParameters/
http:parameter/http:value"/>-->
        </h1>

        <xsl:variable name="selectedTypeName" select="$types/type[@value =$page]/@name"/>
        <xsl:variable name="selectedTypeValue">
            <xsl:choose>
                <xsl:when test="$selectedTypeName != ''">
                    <xsl:value-of select="$page"/>
                </xsl:when>
                <xsl:otherwise>all</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>


        <div id="calendar-menu">
            <a>
                <xsl:choose>
                    <xsl:when test="$selectedTypeValue='all'">
                        <xsl:attribute name="class">active</xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="href">?page=all</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                Все</a>
            <xsl:apply-templates mode="type" select="events/item[generate-id(.) = generate-id(key('type-key',type))]">
                <xsl:with-param name="selectedTypeValue" select="$selectedTypeValue"/>
            </xsl:apply-templates>
        </div>

        <xsl:apply-templates
                select="events/item[generate-id(.)=generate-id(key('month-key',substring(date, 4, 2)))]">
            <xsl:with-param name="selectedTypeValue" select="$selectedTypeValue"/>
        </xsl:apply-templates>

        <!--<div class="tour">
            <a href="">
                <img alt="tour" border="0" height="25px" width="80px"
                     src="{$servletPath}/images/tour.gif"/>
            </a>
        </div>-->

    </xsl:template>

    <xsl:template match="events/item" mode="type">
        <xsl:param name="selectedTypeValue"/>
        <xsl:variable name="this_type" select="type"/>

        <a>
            <xsl:choose>
                <xsl:when test="$selectedTypeValue=$this_type">
                    <xsl:attribute name="class">active</xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:attribute name="href">?page=<xsl:value-of select="$this_type"/> </xsl:attribute>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="$types/type[@value =$this_type]/@name"/>
        </a>

        <!--<xsl:value-of select="$types/type[value ='$this_type']/@name"/>-->

        <!--<xsl:for-each select="key('group',@group)">
            <item name="{@id}"/>
        </xsl:for-each>-->

    </xsl:template>

    <xsl:template match="events/item">
        <xsl:param name="selectedTypeValue"/>
        <xsl:variable name="months" select="document('')//m:months"/>
        <xsl:variable name="this_month" select="substring(date, 4, 2)"/>

        <h3>
            <xsl:value-of select="$months/month[$this_month]/@name"/>
        </h3>
        <xsl:variable name="selectedTypeName" select="$types/type[@value=$page]/@name"/>
        <div id="calendar-content">
            <xsl:choose>
                <xsl:when test="$selectedTypeValue != 'all'">
                    <xsl:apply-templates mode="next" select="key('month-key',substring(date, 4, 2))[type=$page]">
                        <xsl:sort select="substring(date, 7, 4)" data-type="number" order="ascending"/>
                        <xsl:sort select="substring(date, 4, 2)" data-type="number" order="ascending"/>
                        <xsl:sort select="substring(date, 1, 2)" data-type="number" order="ascending"/>
                        <!--<xsl:sort select="substring(time, 1, 2)" data-type="number" order="ascending"/>-->
                        <!--<xsl:sort select="substring(time, 3, 2)" data-type="number" order="ascending"/>-->
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates mode="next" select="key('month-key',substring(date, 4, 2))">
                        <xsl:sort select="substring(date, 7, 4)" data-type="number" order="ascending"/>
                        <xsl:sort select="substring(date, 4, 2)" data-type="number" order="ascending"/>
                        <xsl:sort select="substring(date, 1, 2)" data-type="number" order="ascending"/>
                        <!--<xsl:sort select="substring(time, 1, 2)" data-type="number" order="ascending"/>-->
                        <!--<xsl:sort select="substring(time, 3, 2)" data-type="number" order="ascending"/>-->
                    </xsl:apply-templates>
                </xsl:otherwise>
            </xsl:choose>
        </div>
    </xsl:template>
    <xsl:template match="events/item" mode="next">
        <!--<xsl:variable name="this_day">

                </xsl:variable>
        -->
        <!--<xsl:for-each select=".">-->
        <!-- <xsl:choose>
            <xsl:when test="$page == type">

            </xsl:when>
            <xsl:otherwise>

            </xsl:otherwise>
        </xsl:choose>-->

        <div class="event-block" onmouseover="showText('{substring(date, 4, 2)}-{position()}')"
             onmouseout="hideText('{substring(date, 4, 2)}-{position()}')">

            <xsl:choose>
                <xsl:when test="url !=''">
                    <div class="bullet">
                        <a href="{url}" title="Посмотреть проект">
                            <img alt="event bullet" border="0" height="21px" width="15px"
                                 src="{$servletPath}/images/event_bullet.gif"/>
                        </a>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="bullet">
                        <img alt="event bullet" border="0" height="21px" width="15px"
                             src="{$servletPath}/images/event_bullet-no.gif"/>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
            <div class="datetime">
                <span class="dayofweek">
                    <xsl:call-template name="get_week_day_by_date">
                        <xsl:with-param name="iYear" select="substring(date, 7, 4)"/>
                        <xsl:with-param name="iMonth" select="substring(date, 4, 2)"/>
                        <xsl:with-param name="iDay" select="substring(date, 1, 2)"/>
                    </xsl:call-template>
                </span>
                <xsl:value-of select="concat(substring(date, 1, 5),' ', time)"/>
            </div>
            <div id="main-{substring(date, 4, 2)}-{position()}">
                <div class="image">
                    <xsl:choose>
                        <xsl:when test="image !='' and contains(image,'mediateka')">
                            <img alt="event image" border="0" height="150px" width="150px"
                                 src="{$servletPath}"/>
                        </xsl:when>
                        <xsl:when test="image !='' and not(contains(image, 'mediateka'))">
                            <img alt="event image" border="0" height="150px" width="150px"
                                 src="{$servletPath}/mediateka/images/event/forCalendar/{image}"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <img alt="event image" border="0" height="150px" width="150px"
                                 src="{$servletPath}/images/event_preview.jpg"/>
                        </xsl:otherwise>
                    </xsl:choose>


                </div>
                <!--</xsl:if>-->

                <div class="name">
                    <!--<a >-->
                    <xsl:value-of select="name"/>
                    <!--</a>-->
                </div>
                <xsl:if test="place !=''">
                    <div class="place">
                        <xsl:value-of select="place"/>
                    </div>
                </xsl:if>

                <div class="type">
                    <xsl:variable name="this_type" select="type"/>
                    <xsl:value-of select="$types/type[@value =$this_type]/@name"/>
                </div>


            </div>
            <div id="text-{substring(date, 4, 2)}-{position()}" style="display:none">
                <xsl:if test="description !=''">
                    <div class="description">
                        <xsl:value-of select="description" disable-output-escaping="yes"/>
                    </div>
                </xsl:if>
            </div>
        </div>
        <!--</xsl:for-each>-->
    </xsl:template>


    <!--art lebedev (с)-->
    <xsl:template name="get_week_day_by_date">
        <xsl:param name="iYear"/>
        <xsl:param name="iMonth"/>
        <xsl:param name="iDay"/>
        <xsl:variable name="days" select="document('')//d:days"/>

        <xsl:variable name="y">
            <xsl:choose>
                <xsl:when test="number($iMonth) &lt; 3">
                    <xsl:value-of select="$iYear - 1"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$iYear"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="m">
            <xsl:choose>
                <xsl:when test="number($iMonth) &lt; 3">
                    <xsl:value-of select="number($iMonth) + 12"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="number($iMonth)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="d">
            <xsl:value-of select="number($iDay)"/>
        </xsl:variable>
        <xsl:variable name="wd"
                      select="(2 - floor($y div 100) + floor (floor ($y div 100) div 4) + floor(365.25 * $y)
        + floor(30.6001 * ($m+1)) + 1720996 + $d) mod 7"
                />
        <!--<xsl:variable name="this_Day>">-->
        <xsl:choose>
            <xsl:when test="$wd = 0">
                <xsl:value-of select="$days/day[7]/@name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$days/day[$wd]/@name"/>
                <!--<xsl:value-of select="$wd"/>-->
            </xsl:otherwise>
        </xsl:choose>
        <!--</xsl:variable>-->
        <!--<xsl:value-of select="$days/day[$this_day]/@name"/>-->
    </xsl:template>
    <!--art lebedev (с)-->
    <xsl:template name="get_month_length_by_date">
        <xsl:param name="iMonth"/>
        <xsl:param name="iYear"/>

        <xsl:value-of select="30+number($iMonth - number(boolean(number($iMonth) > 7))) mod 2
        - number(boolean(number($iMonth) = 2)) * 2
        + number(boolean(number($iMonth) = 2)) * (number(not(boolean($iYear mod 4))) * 2)"
                />
    </xsl:template>
</xsl:stylesheet>