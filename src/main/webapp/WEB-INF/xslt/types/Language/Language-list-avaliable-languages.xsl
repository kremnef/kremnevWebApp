<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">


    <xsl:template match="value[objectType/name='Language' and typeAction/name = 'list-avaliable-languages']">
    <!--<xsl:template match="value[typifiedObject/objectType/name='Language' and typeAction/name = 'list-dropdown']">-->
        <xsl:variable name="systemName" select="objectType/name"/>
        <xsl:variable name="id" select="objectType/@id"/>
        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <xsl:variable name="languages"
                          select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item"/>
            <xsl:if test="count($languages) &gt; 0">

                <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.selectbox-0.5.js"/>
                <script type="text/javascript">
                    jQuery(document).ready(function() {
                    jQuery('#select-<xsl:value-of select="concat($systemName, '-', $position)"/>').selectbox();
                    });
                </script>
                <select id="select-{$systemName}-{$position}" name="select-{$systemName}">
                    <xsl:for-each select="$languages">


                        <!--<option value="{systemName}">-->
                        <option >
                            <xsl:variable name="path" select="concat(/root/params/request/param[@name='requestURI'], '?lang=', code)"/>
                            <xsl:if test="$path != ''">
                                <xsl:attribute name="value"><xsl:value-of select="$path"/></xsl:attribute>
                            </xsl:if>
                            <xsl:if test="code=$locale">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="$path != ''">
                            <!--<xsl:attribute name="onChange">document.location.href='<xsl:value-of select="$path"/>'</xsl:attribute>-->
                        </xsl:if>
                            <xsl:value-of select="name"/>
                        </option>
                    </xsl:for-each>
                </select>
            </xsl:if>
        </div>
    </xsl:template>


    <!--<xsl:template match="value[objectType/name='Language' and typeAction/name = 'list-avaliable-languages']">
        &lt;!&ndash;Define Variables&ndash;&gt;
        <xsl:variable name="systemName" select="objectType/name"/>
        <xsl:variable name="id" select="objectType/@id"/>
        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}" id="{$systemName}-{$position}">
            <xsl:variable name="languages"
                          select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item"/>
            &lt;!&ndash;<xsl:variable name="languages"
                          select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item[@isPublished='true']"/>&ndash;&gt;
              <xsl:if test="count($languages) &gt; 0">
                  <ul class="menu" id="ul-{$systemName}-{$position}" name="ul-{$systemName}">
                      <xsl:for-each select="$languages">
                          <li>
                              <a href="?lang={code}">
                                  <xsl:if test="code=$locale">
                                      <xsl:attribute name="class">selected</xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="name"/>
                              </a>
                          </li>
                      </xsl:for-each>
                  </ul>
              </xsl:if>
            &lt;!&ndash;<xsl:if test="count($languages) &gt; 0">
                <div class="languages">
                    <div class="dropdown" id="tagsDropDown">
                        <select id="select-languagesDropDown">
                            <xsl:for-each select="$languages">
                                <option value="{code}">
                                    <xsl:value-of select="name"/>
                                </option>
                                <xsl:if test="code=$locale">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>

                            </xsl:for-each>
                        </select>
                    </div>

                </div>
            </xsl:if>&ndash;&gt;
        </div>
    </xsl:template>-->

</xsl:stylesheet>