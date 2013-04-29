<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="ems i18n">

    <!--<xsl:import href="../functions.xsl"/>-->

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>
    <xsl:variable name="prefix">
        <xsl:value-of select="concat($servletPath, '/', $sitemapPath)"/>
    </xsl:variable>
    <!--<xsl:strip-space elements="typeActionName"/>-->

    <!--EMS call template-->
    <xsl:template name="caller">
        <xsl:param name="name"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="contents"/>
        <xsl:param name="path"/>

        <!--<h1>!!!!<xsl:value-of select="$typeActionName"/></h1>-->
        <!--<h1>!!!!<xsl:value-of select="ems:templ[@name=concat($name, '-', $typeActionName)]"/></h1>-->
        <!--<h1>!!!!<xsl:value-of select="concat('Content-', $typeActionName, '.xsl')"/></h1>-->
        <xsl:variable name="templ"
                      select="document(concat('Content-', $typeActionName, '.xsl'))//ems:templ[@name=concat($name, '-', $typeActionName)]"/>
        <xsl:apply-templates select="$templ">
            <xsl:with-param name="contents"
                            select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:apply-templates>
    </xsl:template>
    <!--EMS typifiedObject-->
    <xsl:template name="typifiedObject">
        <xsl:param name="obj"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="position"/>

        <xsl:variable name="systemName" select="$obj/emsObject/systemName"/>
        <xsl:variable name="parentId" select="$obj/id"/>

        <xsl:variable name="items"
                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[objectType/name='FileObject']"/>
        <xsl:if test="count($items) &gt; 0">
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

            <ul>
                <xsl:for-each select="$items">
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="."/>
                        </xsl:call-template>
                    </xsl:variable>

                    <li>
                        <xsl:attribute name="class">
                            <xsl:text>menuItem</xsl:text>
                            <xsl:if test="emsObject/systemName = $objectURLPrefix">selected</xsl:if>
                        </xsl:attribute>
                        <xsl:variable name="path">
                            <xsl:choose>
                                <xsl:when test="starts-with(path, '/')">
                                    <xsl:value-of select="substring-after(path, '/')"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="path"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <a target="_blank" href="{$servletPath}/{$sitemapPath}{$path}">
                            <xsl:value-of select="$name"/>
                        </a>
                        <xsl:variable name="extension">
                            <xsl:call-template name="getExtension">
                                <xsl:with-param name="name" select="$path"/>
                                <xsl:with-param name="fullName" select="1"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <a class="img">
                            <img alt="" src="{$servletPath}/{$sitemapPath}img/icons/{$extension}_icon.png"/>
                        </a>
                        <span>Формат<xsl:value-of select="$extension"/>,
                            <xsl:call-template name="formatSize">
                                <xsl:with-param
                                        name="size" select="size"/>
                            </xsl:call-template>
                            .
                        </span>
                    </li>
                </xsl:for-each>
            </ul>
        </xsl:if>

    </xsl:template>


    <xsl:template name="render-as-list">
        <xsl:param name="content"/>
        <xsl:param name="initialContent"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="position"/>

        <!--variables-->
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


        <div class="widget-{$position}">
            <xsl:comment>widget-list-render</xsl:comment>
            <!--Variables-->
            <xsl:variable name="child"
                          select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[emsObject/systemName = $objectURLPrefix]"/>

            <xsl:variable name="childrenCount"
                          select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
            <xsl:variable name="doc" select="$content/documents"/>
            <xsl:variable name="name">
                <xsl:call-template name="getLocalName">
                    <xsl:with-param name="typifiedObject" select="$content"/>
                </xsl:call-template>
            </xsl:variable>


            <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

            <!-- Content item-->
            <div id="{$systemName}-item">
                <div id="{$systemName}-{$position}" class="{$typeActionName}">

                    <xsl:call-template name="typifiedObject">
                        <xsl:with-param name="obj" select="typifiedObject"/>
                        <xsl:with-param name="objectURL" select="$objectURL"/>
                        <xsl:with-param name="position" select="$position"/>
                    </xsl:call-template>
                    <div class="item-content">
                        <h1>Заголовок!!!
                            <xsl:value-of select="$name"/>
                        </h1>

                    </div>

                </div>
            </div>
            <!--Children List-->
            <div id="{$systemName}-list">
                <xsl:choose>
                    <xsl:when test="$childrenCount &gt; 0">
                        <xsl:variable name="contents"
                                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                        <!--<xsl:call-template name="caller">
                            <xsl:with-param name="name" select="'showContents'"/>
                            <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            <xsl:with-param name="contents"
                                            select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                            <xsl:with-param name="path" select="$path"/>
                        </xsl:call-template>-->
                        <ul>
                            <xsl:for-each select="$contents">
                                <xsl:variable name="item-name">
                                    <xsl:call-template name="getLocalName">
                                        <xsl:with-param name="typifiedObject" select="."/>
                                    </xsl:call-template>
                                </xsl:variable>
                                <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                                <!--<xsl:sort select="documents/createdDateTime" data-type="number" order="descending"/>-->
                                <li>
                                    <!--<xsl:variable name="emsObjectChildrenCount" select="emsObject/childrenCount"/>
                                    <xsl:if test="emsObjectChildrenCount >0">
                                         <xsl:value-of select="emsObjectChildrenCount"/> = emsObjectChildrenCount;
                                    </xsl:if>-->
                                    <xsl:variable name="pId" select="id"/>
                                    <xsl:variable name="sName" select="emsObject/systemName"/>
                                    <a href="{$servletPath}/{$sitemapPath}{concat($path,$sName)}">
                                        <xsl:value-of select="$item-name"/>
                                    </a>
                                </li>
                            </xsl:for-each>
                        </ul>
                        <xsl:variable name="showAll" select="concat($contents/documentType/name, '.showAll')"/>
                        <div class="all">
                            <a href="{$path}">
                                <!--<i18n:text key="{$showAll}"/>-->
                                <i18n:text key="PressRelease.showAll"/>
                            </a>
                        </div>
                    </xsl:when>
                </xsl:choose>
            </div>

        </div>

    </xsl:template>


    <!--EMS showContent One default for attached to page-->
    <xsl:template name="showOneContentWithOutChildren">
        <xsl:param name="content"/>
        <xsl:param name="initialContent"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="position"/>

        <!--variables-->
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
        <div class="widget-{$position}">
            <!--Variables-->
            <xsl:variable name="childrenCount"
                          select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
            <xsl:variable name="doc" select="$content/documents"/>
            <xsl:variable name="name">
                <xsl:call-template name="getLocalName">
                    <xsl:with-param name="typifiedObject" select="$content"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="filesInFolders"
                          select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/emsObject/systemName and key/blockNumber=$position]/value/item"/>
            <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
            <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>


            <!-- Content item-->
            <div id="{$systemName}-item">
                <div id="{$systemName}-{$position}" class="{$typeActionName}">

                    <xsl:call-template name="typifiedObject">
                        <xsl:with-param name="obj" select="typifiedObject"/>
                        <xsl:with-param name="objectURL" select="$objectURL"/>
                        <xsl:with-param name="position" select="$position"/>
                    </xsl:call-template>
                    <div class="item-content">
                        <h1>
                            <xsl:value-of select="$name"/>
                        </h1>
                        <xsl:value-of disable-output-escaping="yes" select="$doc/xmlSource"/>
                        <!--<xsl:apply-templates select="$doc/xmlSource">
                            <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                        </xsl:apply-templates>-->
                    </div>

                    <div class="attachements">
                        <xsl:call-template name="yoxview">
                            <xsl:with-param name="fileObjects" select="$fileObjects"/>
                            <xsl:with-param name="systemName" select="$systemName"/>
                        </xsl:call-template>
                    </div>
                </div>
            </div>
        </div>

    </xsl:template>

    <!--EMS showContent One default for attached to page-->
    <xsl:template name="showContent">
        <xsl:param name="content"/>
        <xsl:param name="initialContent"/>
        <xsl:param name="objectURL"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:param name="position"/>

        <!--variables-->
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
                      select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item[emsObject/systemName = $objectURLPrefix]"/>

        <xsl:choose>
            <xsl:when test="$child and $initialContent != ''">
                <xsl:call-template name="showContent">
                    <xsl:with-param name="content" select="$child"/>
                    <xsl:with-param name="initialContent" select="$initialContent"/>
                    <xsl:with-param name="objectURL" select="$objectURLSuffix"/>
                    <xsl:with-param name="path" select="concat($path, $objectURLPrefix, '/')"/>
                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                    <xsl:with-param name="position" select="$position"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <div class="widget-{$position}">
                    <!--Variables-->
                    <xsl:variable name="childrenCount"
                                  select="count(/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item)"/>
                    <xsl:variable name="doc" select="$content/documents"/>
                    <xsl:variable name="name">
                        <xsl:call-template name="getLocalName">
                            <xsl:with-param name="typifiedObject" select="$content"/>
                        </xsl:call-template>
                    </xsl:variable>

                    <xsl:variable name="filesInFolders"
                                  select="/root/childrenMap/children/entry[key/parentId=$doc/folders/id and key/systemName=$doc/folders/emsObject/systemName and key/blockNumber=$position]/value/item"/>
                    <xsl:variable name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                    <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>

                    <!--Children List-->
                    <div id="{$systemName}-list">
                        <xsl:choose>
                            <xsl:when test="$childrenCount &gt; 0">

                                <xsl:call-template name="caller">
                                    <xsl:with-param name="name" select="'showContents'"/>
                                    <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                    <xsl:with-param name="contents"
                                                    select="/root/childrenMap/children/entry[key/parentId=$parentId and key/systemName=$systemName and key/blockNumber=$position]/value/item"/>
                                    <xsl:with-param name="path" select="$path"/>
                                </xsl:call-template>
                            </xsl:when>
                            <xsl:otherwise>
                                <div class="item-content">
                                    <xsl:apply-templates
                                            select="$doc/xmlSource">
                                        <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                    </xsl:apply-templates>
                                </div>
                                <xsl:if test="$initialContent != ''">
                                    <xsl:call-template name="showContent">
                                        <xsl:with-param name="content" select="$initialContent"/>
                                        <xsl:with-param name="initialContent" select="''"/>
                                        <xsl:with-param name="objectURL" select="$initialContent/objectURL"/>
                                        <xsl:with-param name="path" select="$initialContent/baseURL"/>
                                        <xsl:with-param name="typeActionName" select="$typeActionName"/>
                                        <xsl:with-param name="position" select="$position"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <!-- Content item-->
                    <div id="{$systemName}-item">
                        <div id="{$systemName}-{$position}" class="{$typeActionName}">

                            <xsl:call-template name="typifiedObject">
                                <xsl:with-param name="obj" select="typifiedObject"/>
                                <xsl:with-param name="objectURL" select="$objectURL"/>
                                <xsl:with-param name="position" select="$position"/>
                            </xsl:call-template>
                            <div class="item-content">
                                <h1>
                                    <xsl:value-of select="$name"/>
                                </h1>
                                <xsl:apply-templates
                                        select="$doc/xmlSource">
                                    <xsl:with-param name="fileObjects" select="$filesInFolders | $doc/fileObjects"/>
                                </xsl:apply-templates>
                            </div>
                            <!--<xsl:if test="$initialContent != ''">-->
                            <!--<xsl:call-template name="showContent">-->
                            <!--<xsl:with-param name="content" select="$initialContent"/>-->
                            <!--<xsl:with-param name="initialContent" select="''"/>-->
                            <!--<xsl:with-param name="objectURL" select="$initialContent/objectURL"/>-->
                            <!--<xsl:with-param name="path" select="$initialContent/baseURL"/>-->
                            <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                            <!--<xsl:with-param name="position" select="$position"/>-->
                            <!--</xsl:call-template>-->
                            <!--</xsl:if>-->
                            <!--<xsl:call-template name="slideShow">
                                <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                <xsl:with-param name="systemName" select="$systemName"/>
                                <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            </xsl:call-template>-->
                            <div class="attachements">
                                <xsl:call-template name="yoxview">
                                    <xsl:with-param name="fileObjects" select="$fileObjects"/>
                                    <xsl:with-param name="systemName" select="$systemName"/>
                                </xsl:call-template>
                            </div>
                        </div>
                    </div>
                </div>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <!--EMS showContent One Briefly-->
    <xsl:template name="showContentBriefly">
        <xsl:param name="content"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
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


    <!--EMS showContents Many-->
    <xsl:template name="showContents">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <ul>
            <xsl:for-each select="$contents">
                <!--<xsl:sort select="position" data-type="number" order="ascending"/>-->
                <xsl:sort select="documents/createdDateTime" data-type="number" order="descending"/>
                <li>
                    <xsl:variable name="childrenCount" select="emsObject/childrenCount"/>
                    <!--<xsl:variable name="sName" select="emsObject/systemName" />
                    <xsl:if test="$childrenCount &gt; 0">

                    </xsl:if>-->
                    <xsl:call-template name="caller">
                        <xsl:with-param name="name" select="'showContentBriefly'"/>
                        <xsl:with-param name="typeActionName" select="$typeActionName"/>
                        <xsl:with-param name="contents" select="."/>
                        <xsl:with-param name="path" select="$path"/>
                    </xsl:call-template>

                    <!--<xsl:call-template name="showContentBriefly">-->
                    <!--<xsl:with-param name="content" select="."/>-->
                    <!--<xsl:with-param name="path" select="$path"/>-->
                    <!--<xsl:with-param name="typeActionName" select="$typeActionName"/>-->
                    <!--</xsl:call-template>-->

                    <xsl:variable name="pId" select="id"/>
                    <xsl:variable name="sName" select="emsObject/systemName"/>
                    <xsl:if test="$childrenCount &gt; 0">
                        <ol>
                            <xsl:call-template name="showContents">
                                <xsl:with-param name="contents"
                                                select="/root/childrenMap/children/entry[key/parentId=$pId and key/systemName=$sName]/value/item"/>
                                <xsl:with-param name="path" select="concat($path, '/', $sName)"/>
                                <xsl:with-param name="typeActionName" select="$typeActionName"/>
                            </xsl:call-template>
                        </ol>
                    </xsl:if>
                </li>
            </xsl:for-each>
        </ul>
        <xsl:variable name="showAll" select="concat($contents/documentType/name, '.showAll')"/>
        <div class="all">
            <a href="{$path}">
                <!--<i18n:text key="{$showAll}"/>-->
                <i18n:text key="PressRelease.showAll"/>
            </a>
        </div>
    </xsl:template>


    <!--Plugin-->

    <!--todo:Choose render AS > widget function > plugin appereance -->
    <!--JQuery Yoxview Plugin-->
    <xsl:template name="yoxview">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        <!--<h1><xsl:value-of select="$fileObjects"/></h1>-->

        <xsl:choose>
            <xsl:when test="count($fileObjects) &gt; 1">
                <script type="text/javascript"
                        src="{$servletPath}/{$sitemapPath}js/jquery/yoxview/yoxview-init.js"></script>
                <script language="javascript">
                    $(document).ready(function() {
                    $("#<xsl:value-of select="$systemName"/>-yoxview").yoxview({
                    backgroundColor: '#000000',
                    backgroundOpacity: 0.5,
                    lang: 'ru',
                    playDelay: 5000
                    });
                    });
                </script>
                <div id="{$systemName}-yoxview" class="{$systemName} unspoken yoxview info">
                    <ul>
                        <xsl:for-each select="$fileObjects">
                            <!--<xsl:variable name="fileId" select="$fileObjects/id"/>-->
                            <xsl:variable name="fileId" select="id"/>
                            <xsl:variable name="fileName" select="name"/>
                            <!--select="substring-before($fileObjects/path, concat($fileId,'-',$fileObjects/name))"/>-->
                            <!--<xsl:variable name="simpleName" select="substring-before($fileObjects/name,'.')"/>-->
                            <xsl:variable name="previewPath"
                                          select="substring-before(path, concat(id,'-',name))"/>

                            <!--<xsl:variable name="simpleName" select="substring-before(name,'.')"/>-->

                            <xsl:if test="starts-with(contentType, 'image/')">
                                <li>
                                    <!--<a href="{$servletPath}/{$sitemapPath}{$previewPath}thumbnails/{$fileId}-{$fileName}-large.jpg">-->
                                    <a href="{$servletPath}/{$sitemapPath}{path}">
                                        <img alt="{$fileName}"
                                             src="{$servletPath}/{$sitemapPath}{$previewPath}thumbnails/{$fileId}-{$fileName}-small.jpg"/>
                                    </a>
                                </li>

                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </div>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$prefix}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <!--JQuery Cycle Plugin-->
    <xsl:template name="slideShow">
        <xsl:param name="fileObjects"/>
        <xsl:param name="systemName"/>
        <xsl:param name="typeActionName"/>
        <xsl:variable name="imagesCount" select="count($fileObjects[starts-with(contentType, 'image/')])"/>
        <xsl:choose>
            <xsl:when test="$imagesCount &gt; 1">
                <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.cycle.lite.min.js"/>
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
                            <img alt="" src="{$servletPath}/{$sitemapPath}{path}"/>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </xsl:when>
            <xsl:when test="$imagesCount &gt; 0">
                <xsl:if test="starts-with($fileObjects/contentType, 'image/')">
                    <img alt="" src="{$servletPath}/{$sitemapPath}{$fileObjects/path}"/>
                </xsl:if>
            </xsl:when>
            <xsl:when test="count($fileObjects) &gt; 0">
                <ul class="files">
                    <xsl:for-each select="$fileObjects">
                        <xsl:variable name="extension">
                            <xsl:call-template name="getExtension">
                                <xsl:with-param name="name" select="name"/>
                            </xsl:call-template>
                        </xsl:variable>
                        <li>
                            <xsl:attribute name="class">
                                <xsl:value-of select="$extension"/>
                            </xsl:attribute>
                            <a href="{$servletPath}/{$sitemapPath}{path}">
                                <xsl:value-of select="name"/>
                            </a>
                            <span class="size">
                                <xsl:call-template name="formatSize">
                                    <xsl:with-param name="size" select="size"/>
                                </xsl:call-template>
                            </span>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:when>
        </xsl:choose>
    </xsl:template>


</xsl:stylesheet>