<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../types/Content/Content-templates.xsl"/>
    <xsl:import href="../types/functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showLease' and typifiedObject/objectType/name='Content']">
        <link media="screen" href="/ems/resource/js/jquery-plugin/apprise/apprise.min.css" type="text/css"
              rel="stylesheet"/>
        <script src="/ems/resource/js/jquery-plugin/apprise/apprise-1.5.min.js" type="text/javascript"/>
        <link media="all" href="/ems/resource/js/jquery-plugin/notify/ui.notify.css" type="text/css" rel="stylesheet"/>
        <script src="/ems/resource/js/jquery-plugin/notify/jquery.notify.min.js" type="text/javascript"/>
        <script type="text/javascript">
            function notes(text1)
            {
            $("#container").notify("create", {
            text: text1},{
            expires: false,
            speed: 1000
            });
            }

            function tryit(string, args)
            {
            apprise(string, args, function(r)
            {
            if(r)
            {
            if(typeof(r)=='string')
            { $('#returns-'+args).text(r); }
            else
            { $('#returns-'+args).text('True'); }
            }
            else
            { $('#returns-'+args).text('False'); }
            });
            }

        </script>
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <h1>
                    <xsl:call-template name="getLocalName">
                        <xsl:with-param name="typifiedObject" select="typifiedObject"/>
                    </xsl:call-template>
                </h1>
               <!-- <xsl:variable name="maxVersion">
                    <xsl:call-template name="maxVersion">
                        <xsl:with-param name="obj" select="typifiedObject"/>
                    </xsl:call-template>
                </xsl:variable>-->
                <!--<xsl:variable name="document" select="typifiedObject/documents[language/code=$locale and version=$maxVersion]"/>-->
                <xsl:variable name="document" select="typifiedObject/documents"/>
                <xsl:call-template name="rents">
                    <xsl:with-param name="items" select="$document/xmlSource/Rent/Rent-table/item"/>
                </xsl:call-template>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="rents">
        <xsl:param name="items"/>
        <xsl:if test="count($items) &gt; 0">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>Адрес объекта</th>
                        <th>Объект</th>
                        <th>Здание, помещение</th>
                        <th>Категория помещений</th>
                        <th>Площадь (кв.м.)</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$items">
                        <xsl:sort select="@position"/>
                        <tr>
                            <td class="address">
                                <xsl:value-of select="address"/>
                            </td>
                            <td class="object">
                                <div id="#info-{@position}" style="display:none">
                                    <xsl:value-of select="object-description"/>
                                    <!--
                                    Later on, you can choose which template to use by referring to the
                                    ID assigned to each template.  Alternatively, you could refer
                                    to each template by index, so in this example, "basic-tempate" is
                                    index 0 and "advanced-template" is index 1.
                                    -->
                                    <!--<div id="basic-template">
                                        <a class="ui-notify-cross ui-notify-close" href="#">x</a>
                                        &lt;!&ndash;<h1>#{title}</h1>&ndash;&gt;
                                        <p>#{text}</p>
                                    </div>-->

                                </div>

                                <!--<a href="#" onClick="tryit('{object-description}')"><xsl:value-of select="object"/></a>-->
                                <!--('{object-description}')-->
                                <span style="cursor:pointer" onClick="$('#info-{@position}').show();"><xsl:value-of select="object"/></span>
                            </td>
                            <td>
                                <xsl:value-of select="building"/>
                            </td>
                            <td>
                                <xsl:value-of select="category"/>
                            </td>
                            <td class="area">
                                <xsl:value-of select="area"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>