<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://ems.strela.ru/"
                exclude-result-prefixes="ems">

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>

    <xsl:template match="value[typeAction/name='showProducts' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:call-template name="showContent-showProducts">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>

    </xsl:template>


    <xsl:template name="showContent-showProducts">
        <xsl:param name="content"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>

        <xsl:variable name="systemName" select="$content/emsObject/systemName"/>
        <xsl:variable name="parentId" select="$content/id"/>

        <xsl:variable name="objectURLPrefix">
            <xsl:choose>
                <xsl:when test="contains($objectURL, '/')">
                    <xsl:value-of select="substring-before($objectURL, '/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$objectURL"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="objectURLSuffix">
            <xsl:choose>
                <xsl:when test="contains($objectURL, '/')">
                    <xsl:value-of select="substring-after($objectURL, '/')"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="child"
                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName]/value/item[emsObject/systemName = $objectURLPrefix]"/>
        <xsl:choose>
            <xsl:when test="$child">
                <xsl:call-template name="showContent-showProducts">
                    <xsl:with-param name="content" select="$child"/>
                    <xsl:with-param name="objectURL" select="$objectURLSuffix"/>
                    <xsl:with-param name="path" select="concat($path, '/', $objectURLPrefix)"/>
                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <div id="{$systemName}" class="{$typeActionName}">
                    <xsl:variable name="childrenCount" select="$content/emsObject/childrenCount"/>

                    <xsl:choose>
                        <xsl:when test="$childrenCount &gt; 0">

                            <xsl:variable name="pId" select="$content/id"/>
                            <xsl:variable name="sName" select="$content/emsObject/systemName"/>
                            <ul id="{$sName}" class="parent">
                                <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$pId and key/systemName=$sName]/value/item">
                                    <li>
                                        <xsl:variable name="name">
                                            <xsl:call-template name="localizedName">
                                                <xsl:with-param name="obj" select="."/>
                                            </xsl:call-template>
                                        </xsl:variable>
                                       <!-- <xsl:variable name="maxVersion">
                                            <xsl:call-template name="maxVersion">
                                                <xsl:with-param name="obj" select="."/>
                                            </xsl:call-template>
                                        </xsl:variable>-->
                                        <xsl:variable name="doc" select="documents"/>
                                        <xsl:variable name="filesInFolders" select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/emsObject/systemName]/value/item"/>
                                        <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                        <xsl:call-template name="slideShow-showProducts">
                                            <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                            <xsl:with-param name="systemName" select="$sName"/>
                                            <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        </xsl:call-template>
                                        <xsl:variable name="p1Id" select="id"/>
                                        <xsl:variable name="s1Name" select="emsObject/systemName"/>
                                        <h3><a href="{$prefix}{$path}/{$s1Name}"><xsl:value-of select="$name"/></a></h3>
                                        <ul id="{$s1Name}" class="child">
                                            <xsl:for-each select="/root/childrenMap/children/entry[key/parentId=$p1Id and key/systemName=$s1Name]/value/item">
                                                <xsl:variable name="childName">
                                                    <xsl:call-template name="localizedName">
                                                        <xsl:with-param name="obj" select="."/>
                                                    </xsl:call-template>
                                                </xsl:variable>

                                                <li>
                                                    <xsl:variable name="s2Name" select="emsObject/systemName"/>
                                                    <a href="{$prefix}{$path}/{$s1Name}/{$s2Name}"><xsl:value-of select="$childName"/></a>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </li>
                                </xsl:for-each>
                            </ul>
                            <script language="javascript">
                                $(document).ready(function() {
                                    updateHeight();
                                    $('.parent > li img').load(function() {
                                        updateHeight();
                                    });

                                });
                                function updateHeight() {
                            	    $('.parent > li').each(function() {
                            		    $(this).height('auto');
                            	    });
                                    var height = 0;
                                    var top = 0;
                                    var elements;
                                    $('.parent > li').each(function() {
                                        var $this = $(this);
                                        if ($this.offset().top != top) {
                                            if (height &gt; 0) {
                                                elements.each(function() {
                                                    $(this).height(height);
                                                });
                                            }
                                            top = $this.offset().top;
                                            height = $this.height();
                                            elements = $this;
                                        }
                                        else {
                                            var h = $this.height();
                                            if (height &lt; h) {
                                                height = h;
                                            }
                                            elements = elements.add($this);
                                        }
                                    });
                                    if (height &gt; 0) {
                                        elements.each(function() {
                                            $(this).height(height);
                                        });
                                    }
                                }
                            </script>
                            <div class="all-products"><a href="{$prefix}{substring($path, 1, string-length($path) - string-length($systemName))}">Вернуться</a></div>
                        </xsl:when>
                        <xsl:otherwise>
                            <div class="custom-content">
                                <!--<h1>c-p</h1>-->
                                <xsl:variable name="name">
                                    <xsl:call-template name="localizedName">
                                        <xsl:with-param name="obj" select="$content"/>
                                    </xsl:call-template>
                                </xsl:variable>

                                <!--<xsl:variable name="maxVersion">
                                    <xsl:call-template name="maxVersion">
                                        <xsl:with-param name="obj" select="$content"/>
                                    </xsl:call-template>
                                </xsl:variable>-->
                                <!--<xsl:variable name="doc" select="$content/documents[language/code=$locale and version=$maxVersion]"/>-->
                                <xsl:variable name="doc" select="$content/documents"/>
                                <div class="product-info">
                                    <div id="product-info-left" class="product-info-left">
                                        <h1><xsl:value-of select="$name"/></h1>
                                        <xsl:value-of select="$doc/xmlSource/Product/description" disable-output-escaping="yes"/>
                                    </div>
                                    <div id="product-info-right" class="product-info-right">
                                        <xsl:variable name="filesInFolders" select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/emsObject/systemName]/value/item"/>
                                        <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                        <xsl:call-template name="slideShow-showProducts">
                                            <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                            <xsl:with-param name="systemName" select="$systemName"/>
                                            <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        </xsl:call-template>
                                        <div class="price">
                                            <xsl:value-of select="$doc/xmlSource/Product/price"/> рубля за <xsl:value-of select="$doc/xmlSource/Product/unit"/>
                                            <span class="price-description">*Рекомендуемая розничная цена</span>
                                        </div>
                                    </div>
                                    <div class="all-products"><a href="{$prefix}{substring($path, 1, string-length($path) - string-length($systemName))}">Вернуться</a></div>
                                </div>
                            </div>
                        </xsl:otherwise>
                    </xsl:choose>

                </div>

            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>


    <xsl:template name="slideShow-showProducts">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        <xsl:param name="typeActionName"/>
        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript" src="{$prefix}js/jquery/jquery.cycle.lite.min.js"/>
                <script language="javascript">
                    $(document).ready(function() {
                        var height = 0;
                        $('#<xsl:value-of select="$systemName"/>-slide-show img').each(function() {
                            if ($(this).height() > height) {
                                height = $(this).height();
                            }
                        });
                        $('#<xsl:value-of select="$systemName"/>-slide-show').height(height);
                        $('#<xsl:value-of select="$systemName"/>-slide-show').cycle();
                    });
                </script>
                <div id="{$systemName}-slide-show" class="slide-show">
                    <xsl:for-each select="$fileObjects">
                        <xsl:if test="starts-with(contentType, 'image/')">
                            <img alt="" src="{$prefix}{path}"/>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$prefix}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <img alt="" src="{$prefix}img/product-cat-empty.jpg"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


<!--
    <xsl:template name="maxVersion">
        <xsl:param name="obj"/>
        <xsl:for-each select="$obj/documents[language/code=$locale]/version">
            <xsl:sort data-type="number" order="descending"/>
            <xsl:if test="position()=1">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
-->


    <xsl:template name="localizedName">
        <xsl:param name="obj"/>
        <!--<xsl:variable name="label" select="$obj/labels/entry[key=$locale]/value"/>-->
        <xsl:variable name="label" select="$obj/objectLabel/label"/>
        <xsl:variable name="name">
            <xsl:choose>
                <xsl:when test="$label">
                    <xsl:value-of select="$label"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$obj/name"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$name"/>
    </xsl:template>

</xsl:stylesheet>