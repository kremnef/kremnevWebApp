<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">





    <xsl:template match="value[objectType/name='Language' and typeAction/name = 'list-avaliable-languages']">
        <!--Define Variables-->
        <xsl:variable name="systemName" select="objectType/name"/>
        <xsl:variable name="id" select="objectType/@id"/>
        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}" id="{$systemName}-{$position}">
            <xsl:variable name="languages"
                          select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item"/>
            <!--<xsl:variable name="languages"
                          select="/root/childrenMap/children/entry[key/parentId=$id and key/systemName=$systemName]/value/item[@isPublished='true']"/>-->
              <xsl:if test="count($languages) &gt; 0">
                  <ul class="avaliable-languages" id="ul-{$systemName}-{$position}" name="ul-{$systemName}">
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
            <!--<xsl:if test="count($languages) &gt; 0">
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
            </xsl:if>-->
        </div>
    </xsl:template>

</xsl:stylesheet>