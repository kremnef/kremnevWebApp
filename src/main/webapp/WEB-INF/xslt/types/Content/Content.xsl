<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:import href="../functions.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>


    <xsl:template match="value[typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <!--<div id="{$systemName}" class="{$typeActionName}">-->
        <!--<xsl:variable name="childrenCount" select="typifiedObject/emsObject/childrenCount" />-->


        <xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>

        <!--<xsl:choose>-->
        <!--<xsl:when test="$childrenCount &gt; 0">-->

        <!--<xsl:variable name="name">-->
        <!--<xsl:call-template name="localizedName">-->
        <!--<xsl:with-param name="obj" select="typifiedObject"/>-->
        <!--</xsl:call-template>-->
        <!--</xsl:variable>-->

        <!--<h1><xsl:value-of select="$name"/></h1>-->
        <!--<ul>-->
        <!--<xsl:call-template name="showContents">-->
        <!--<xsl:with-param name="contents" select="/root/childrenMap/children/entry[key=$systemName]/value/item"/>-->
        <!--<xsl:with-param name="path" select="$baseURL"/>-->
        <!--</xsl:call-template>-->
        <!--</ul>-->
        <!--</xsl:when>-->
        <!--<xsl:otherwise>-->
        <!--<xsl:variable name="maxVersion">-->
        <!--<xsl:call-template name="maxVersion">-->
        <!--<xsl:with-param name="obj" select="typifiedObject"/>-->
        <!--</xsl:call-template>-->
        <!--</xsl:variable>-->

        <!--<xsl:apply-templates select="typifiedObject/documents[language/code=$locale and version=$maxVersion]/xmlSource" />-->
        <!--</xsl:otherwise>-->
        <!--</xsl:choose>-->
        <!--</div>-->
    </xsl:template>


    <xsl:template name="showContent">
        <xsl:param name="content"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>

        <xsl:variable name="systemName" select="$content/emsObject/systemName"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$content"/>
            </xsl:call-template>
        </xsl:variable>
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
                      select="/root/childrenMap/children/entry[key=$systemName]/value/item[emsObject/systemName = $objectURLPrefix]"/>
        <xsl:choose>
            <xsl:when test="$child">
                <xsl:call-template name="showContent">
                    <xsl:with-param name="content" select="$child"/>
                    <xsl:with-param name="objectURL" select="$objectURLSuffix"/>
                    <xsl:with-param name="path" select="concat($path, $objectURLPrefix, '/')"/>
                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name="position" select="../key"/>

                <div class="widget-{$position}">
                    <div id="{$systemName}-{$position}" class="{$typeActionName}">
                        <xsl:variable name="childrenCount" select="$content/emsObject/childrenCount"/>
                        <!--<xsl:variable name="maxVersion">
                            <xsl:call-template name="maxVersion">
                                <xsl:with-param name="obj" select="$content"/>
                            </xsl:call-template>
                        </xsl:variable>-->

                        <!--<xsl:variable name="doc" select="$content/documents[language/code=$locale and version=$maxVersion]"/>-->
                        <xsl:variable name="doc" select="$content/documents"/>
                        <xsl:variable name="filesInFolders" select="/root/childrenMap/children/entry[key=$doc/folders/emsObject/systemName]/value/item"/>
                        <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                        <h1><xsl:value-of select="$name"/></h1>
                        <xsl:call-template name="yoxview">
                            <xsl:with-param name="fileObjects" select="$fileObjects"/>
                            <xsl:with-param name="systemName" select="$systemName"/>
                        </xsl:call-template>

                        <xsl:choose>
                            <xsl:when test="$childrenCount &gt; 0">

                               <!-- <xsl:variable name="name">
                                    <xsl:call-template name="localizedName">
                                        <xsl:with-param name="obj" select="$content"/>
                                    </xsl:call-template>
                                </xsl:variable>-->
                                <xsl:call-template name="showContents">
                                    <xsl:with-param name="contents"
                                                    select="/root/childrenMap/children/entry[key=$systemName]/value/item"/>
                                    <xsl:with-param name="path" select="$path"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="custom-content">
                                    <xsl:apply-templates select="$doc/xmlSource">
                                        <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                    </xsl:apply-templates>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>

                    </div>
                </div>

            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>


    <xsl:template name="yoxview">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>

        <xsl:variable name="previewPath" select="substring-before($fileObjects/path, $fileObjects/name)"/>
        <xsl:variable name="simpleName" select="substring-before($fileObjects/name,'.')"/>
        <h1>2222</h1>
        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/yoxview/yoxview-init.js"></script>
                <script language="javascript">
            $(document).ready(function() {
                                       $("#<xsl:value-of select="$systemName"/>").yoxview({
                                    backgroundColor: 'black',
                                    playDelay: 5000
                                    });
                                    });
                </script>
                <div id="{$systemName}-yoxview" class="yoxview">
                    <xsl:for-each select="$fileObjects">
                        <xsl:if test="starts-with(contentType, 'image/')">
                            <img alt="" src="{$prefix}{$previewPath}{$simpleName}-small.jpeg"/>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$prefix}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="slideShow">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
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
        </xsl:choose>
    </xsl:template>


    <!--<xsl:template name="maxVersion">
        <xsl:param name="obj"/>
        <xsl:for-each select="$obj/documents[language/code=$locale]/version">
            <xsl:sort data-type="number" order="descending"/>
            <xsl:if test="position()=1">
                <xsl:value-of select="."/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>-->


    <xsl:template name="showContents">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <ul>
            <xsl:for-each select="$contents">
                <xsl:sort select="position" data-type="number" order="ascending"/>
                <li>
                    <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
                    <!--<xsl:variable name="sName" select="emsObject/systemName" />
                    <xsl:if test="$childrenCount &gt; 0">

                    </xsl:if>-->
                    <xsl:call-template name="showContentBriefly">
                        <xsl:with-param name="content" select="."/>
                        <xsl:with-param name="path" select="$path"/>
                    </xsl:call-template>

                    <xsl:variable name="sName" select="emsObject/systemName"/>
                    <xsl:if test="$childrenCount &gt; 0">
                        <ol>
                            <xsl:call-template name="showContents">
                                <xsl:with-param name="contents"
                                                select="/root/childrenMap/children/entry[key=$sName]/value/item"/>
                                <xsl:with-param name="path" select="concat($path, '/', $sName)"/>
                            </xsl:call-template>
                        </ol>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>
        <div class="all"><a href="{$path}">Весь список</a></div>
    </xsl:template>


    <xsl:template name="showContentBriefly">
        <xsl:param name="content"/>
        <xsl:param name="path"/>
        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$content"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
        <xsl:choose>
            <xsl:when test="$childrenCount &gt; 0">
                <h3>
                    <xsl:value-of select="$name"/>
                </h3>
            </xsl:when>
            <xsl:otherwise>
                <h3>
                    <a href="{$servletPath}/{$sitemapPath}{concat($path,'/',$content/emsObject/systemName)}">
                        <xsl:value-of select="$name"/>
                    </a>
                </h3>
            </xsl:otherwise>
        </xsl:choose>


       <!-- <xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$content"/>
            </xsl:call-template>
        </xsl:variable>-->
        <!--<xsl:if test="$content/documents[language/code=$locale and version=$maxVersion]/description !=''">-->
        <xsl:if test="$content/documents/description !=''">
            <span class="description">
                <xsl:value-of select="$content/documents/description"/>
            </span>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>