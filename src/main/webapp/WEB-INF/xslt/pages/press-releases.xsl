<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <!--<xsl:apply-templates select="systemNode/objects[position = 1]" />-->
    <xsl:import href="import/header.xsl"/>
    <xsl:import href="import/footer.xsl"/>
    <xsl:template name="scripts">
        <!--<script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.min.js"/>-->

        <!--<script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery-ui-1.8.11.custom.min.js" />-->
        <!--<script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>-->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>

    </xsl:template>

    <xsl:template name="styles">
        <link rel="stylesheet" type="text/css" href="/js/flowplayer/css/form.css"/>
        <link rel="stylesheet" type="text/css" href="{$servletPath}/{$sitemapPath}js/flowplayer/css/flight.css"/>

        <!-- calendar styling -->
        <link rel="stylesheet" type="text/css"
              href="{$servletPath}/{$sitemapPath}js/flowplayer/css/flight-calendar.css"/>
    </xsl:template>

    <xsl:template match="root">
        <xsl:call-template name="header"/>

        <div class="container">
            <h1><xsl:value-of select="/root/systemNode/objectLabel/label"/></h1>
            <!--Скролл-->
            <div id="release-search-form">


                <form method="get" action="/ems/service/search" id="searchNews">
                    <div id="keys">
                        <label>
                            Keywords
                            <br/>
                            <input value="" id="ems-search" resulte="10" name="query"
                                   type="text"/>

                        </label>
                        <!--<label>
                            Tag
                            <br/>
                            <div class="dropdown" id="tagsDropDown">
                                &lt;!&ndash;     <script src="/js/jquery/jquery.selectbox-0.5.js"
                                type="text/javascript"></script>
                                <script type="text/javascript">
                                $(document).ready(function() {
                                $('#select-tagsDropDown').selectbox();
                                });
                                </script>&ndash;&gt;

                                <select id="select-tagsDropDown">
                                    <option value="1">Ярославский</option>
                                    <option value="2">Новгородский</option>
                                    <option value="3">Тверской</option>
                                    <option value="4">Костромской</option>
                                    <option value="5">Архангельский</option>
                                </select>
                            </div>
                        </label>-->
                    </div>
                    <div id="flight">
                        <label>
                            Start
                            <br/>
                            <input type="date" class="date" name="arrival"
                                   value="Today"></input>
                        </label>

                        <label>
                            End
                            <br/>
                            <input type="date" class="date" name="departure" data-value="7"
                                   value="After one week"></input>
                        </label>

                    </div>
                </form>

                <script language="javascript">

                    // the french localization
                    $.tools.dateinput.localize("ru", {
                    months: 'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,' +
                    'Сентябрь,Октябрь,Ноябрь,Декабрь',
                    shortMonths: 'jan,feb,mar,avr,mai,jun,jul,aug;,sep,oct,nov,dec',
                    days: 'dimanche,lundi,mardi,mercredi,jeudi,vendredi,samedi',
                    shortDays: 'dim,lun,mar,mer,jeu,ven,sam'
                    });
                    <!--$(document).ready(function(){-->
                    <!--$(function() {
                    var dates = $( "#date-from, #date-to" ).datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 3,
                    onSelect: function( selectedDate ) {
                    var option = this.id == "from" ? "minDate" : "maxDate",
                    instance = $( this ).data( "datepicker" ),
                    date = $.datepicker.parseDate(
                    instance.settings.dateFormat ||
                    $.datepicker._defaults.dateFormat,
                    selectedDate, instance.settings );
                    dates.not( this ).datepicker( "option", option, date );
                    }
                    });-->
                    <!--});-->

                    $(".date").dateinput({ trigger: true, format: 'dd mmmm yyyy', min: -1 });


                    // use the same callback for two different events. possible with bind
                    $(".date1").bind("onShow onHide", function() {
                    $(this).parent().toggleClass("active");
                    });


                    // when first date input is changed
                    $(".date:first").data("dateinput").change(function() {

                    // we use it's value for the seconds input min option
                    $(".date:last").data("dateinput").setMin(this.getValue(), true);
                    });
                    <!--});-->

                </script>
            </div>

            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
        </div>


        <xsl:call-template name="footer"/>

    </xsl:template>

</xsl:stylesheet>