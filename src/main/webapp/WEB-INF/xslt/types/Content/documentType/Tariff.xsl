<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showTariff' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <!--<xsl:variable name="content" select="."/>-->
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="typifiedObject"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="position" select="../key"/>
        <xsl:variable name="document" select="typifiedObject/document"/>

        <div class="widget-{$position}">
            <h2><xsl:value-of select="$name"/></h2>
            <script type="text/javascript"
                    src="/js/flowplayer/jquery.tools.min.js"/>
            <link media="screen"
                  href="/js/flowplayer/css/form.css"
                  type="text/css"
                  rel="stylesheet"/>

            <!--  <style type="text/css">
                .panes { width:100%; float:right; }
                .tabs { width:150px; border 1 }
                .tabs ul { width:150px; float:left; margin:0; padding:0; }
                .tabs ul li { width:150px; display:block; margin:0; padding:0; }
            </style>-->
            <xsl:variable name="parentId" select="typifiedObject/id"/>


            <!--<script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.selectbox-0.5-tabs.js"/>-->
            <script type="text/javascript">
                <!--var api = $("ul.tabs").data("tabs");-->

                $(document).ready(function() {

                    $("ul.tabs").tabs("div.panes > div", {effect: 'slide'});
                    <!--$("ul.selectbox-wrapper-ul").tabs("div.panes > div", {effect: 'slide'});-->

                });

            </script>
            <!--<select id="select-{$systemName}-{$position}" name="select-{$systemName}" class="tabs">
                <xsl:for-each
                        select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                    <xsl:variable name="item-name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    &lt;!&ndash;<option value="{systemName}">&ndash;&gt;
                    <option>
                        <xsl:attribute name="index">
                            <xsl:value-of select="position()"/>
                        </xsl:attribute>
                        <xsl:if test="baseURL = concat(pathURL, '/')">
                            <xsl:attribute name="selected"/>
                        </xsl:if>
                        &lt;!&ndash;<xsl:if test="$path != ''">
                            <xsl:attribute name="onchange">document.location.href='<xsl:value-of select="$path"/>'</xsl:attribute>
                        </xsl:if>&ndash;&gt;
                        <xsl:value-of select="$item-name"/>
                    </option>
                </xsl:for-each>
            </select>-->
            <ul class="tabs">

                <xsl:for-each
                        select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                 <xsl:variable name="item-name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>
                    <li>
                        <a href="#">
                            <xsl:value-of select="$item-name"/>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>


            <!--<h2>заполнить форму или <a>Загрузить резюме</a></h2>-->
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <div class="panes">
                    <xsl:for-each
                            select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item">
                        <div>

                            <xsl:call-template name="tariffs">
                                <xsl:with-param name="items"
                                                select="./document/xmlSource/Tariffs/Tariffs-termal/item"/>
                            </xsl:call-template>
                        </div>
                    </xsl:for-each>
                </div>


            </div>
        </div>
    </xsl:template>





    <!--#panes     { width:XXXpx; float:right; }
#nav       { width:YYYpx; }
#nav ul    { width:YYYpx; float:left; margin:0; padding:0; }
#nav ul li { width:YYYpx; display:block; margin:0; padding:0; } /* no float! */
X-->


</xsl:stylesheet>