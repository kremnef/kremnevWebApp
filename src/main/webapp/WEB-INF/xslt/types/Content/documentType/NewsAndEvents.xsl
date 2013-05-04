<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="ems">

    <xsl:import href="../../../ext/date.format-date.template.xsl"/>

    <ems:templ name="NewsAndEvents-item"/>
    <ems:templ name="NewsAndEvents-list"/>


    <xsl:template match="ems:templ[@name='NewsAndEvents-item']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>


        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>

        <!-- <xsl:variable name="post-link" select="date"/>
         <xsl:variable name="post-title" select="$name"/>

         <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
         <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

         <xsl:variable name="document" select="$contents/documents"/>

         <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>-->

        <div class="item">
            <h1>
                <xsl:value-of select="$name"/>
            </h1>
            <span class="date">
                <xsl:call-template name="date:format-date">
                    <xsl:with-param name="date-time" select="$contents/publishDateTime"/>
                    <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
                </xsl:call-template>
            </span>
            <xsl:call-template name="miniature">
                <xsl:with-param name="name" select="$name"/>
                <xsl:with-param name="contents" select="$contents"/>
                <xsl:with-param name="imagePath" select="$imagePath"/>
                <xsl:with-param name="path" select="$path"/>
            </xsl:call-template>
            <p>
                SOME TEXT
            </p>

        </div>


    </xsl:template>


    <xsl:template match="ems:templ[@name='NewsAndEvents-list']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>

        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>

        <!--
                <xsl:variable name="post-link" select="date"/>
                <xsl:variable name="post-title" select="$name"/>

                <xsl:variable name="previewPath" select="substring-before($contents/path, $contents/name)"/>
                <xsl:variable name="simpleName" select="substring-before($contents/name,'.')"/>

        -->
        <!--<xsl:variable name="document" select="$contents/documents[language/code=$locale and version=$maxVersion]"/>-->
        <xsl:variable name="document" select="$contents/documents"/>

        <xsl:variable name="documentTypeName" select="$contents/documentType/name"/>
        <xsl:variable name="imagePath" select="$contents/thumbnail/path"/>
        <!--<xsl:variable name="imagePath" select="$document/xmlSource/*[name()=$documentTypeName]/image"/>-->

        <div class="date">
            <xsl:call-template name="date:format-date">
                <xsl:with-param name="date-time" select="$contents/publishDateTime"/>
                <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
            </xsl:call-template>
        </div>

        <div class="title" width="340px">
            <a width="340px" href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
                <xsl:value-of select="$name"/>
            </a>
        </div>

        <xsl:call-template name="miniature">
            <xsl:with-param name="name" select="$name"/>
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="imagePath" select="$imagePath"/>
            <xsl:with-param name="path" select="$path"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template name="miniature">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="name"/>
        <xsl:param name="imagePath"/>

        <xsl:choose>
            <xsl:when test="$imagePath and $imagePath != ''">
                <xsl:variable name="slashLastIndex">
                    <xsl:call-template name="getLastIndex">
                        <xsl:with-param name="str" select="$imagePath"/>
                        <xsl:with-param name="search" select="'/'"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:variable name="imageName">
                    <xsl:choose>
                        <xsl:when test="$slashLastIndex = 0">
                            <xsl:value-of select="$imagePath"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of
                                    select="substring($imagePath, $slashLastIndex + 1, string-length($imagePath) - $slashLastIndex)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="folderPath">
                    <xsl:choose>
                        <xsl:when test="$slashLastIndex = 0">
                            <xsl:value-of select="''"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="substring($imagePath, 1, $slashLastIndex)"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>

                <xsl:variable name="dotLastIndex">
                    <xsl:call-template name="getLastIndex">
                        <xsl:with-param name="search" select="'.'"/>
                        <xsl:with-param name="str" select="$imageName"/>
                    </xsl:call-template>
                </xsl:variable>

                <xsl:variable name="smallImageName">
                    <xsl:choose>
                        <xsl:when test="$dotLastIndex = 0">
                            <xsl:value-of select="concat($imageName, '-medium')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="concat(substring($imageName, 1, $dotLastIndex - 1), '-medium.jpg')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <div class="miniature">
                    <a width="340px" href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
                        <img width="340px" alt="{$name}"
                             src="{$servletPath}/{$sitemapPath}{$folderPath}thumbnails/{$smallImageName}"/>
                    </a>
                </div>


            </xsl:when>
            <xsl:otherwise>
                <div class="miniature">
                    <img alt="{$name}" border="0" src="{$servletPath}/img/spacer.gif" width="340px" height="200px"/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

</xsl:stylesheet>