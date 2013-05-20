<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <!-- getLocalName -->
    <xsl:template name="getLocalName">
        <xsl:param name="typifiedObject"/>
        <xsl:variable name="label" select="$typifiedObject/objectLabel/label"/>
        <xsl:choose>
            <xsl:when test="$label != ''">
                <xsl:value-of select="$label"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$typifiedObject/name"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

<!--Folder - Content-->
    <xsl:template name="formatSize">
        <xsl:param name="size"/>
        <xsl:choose>
            <xsl:when test="$size &gt; 1023">
                <xsl:variable name="kilobytes" select="$size div 1024"/>
                <xsl:choose>
                    <xsl:when test="$kilobytes &gt; 1023">
                        <xsl:variable name="megabytes" select="$kilobytes div 1024"/>
                        <xsl:choose>
                            <xsl:when test="$megabytes &gt; 1023">
                                <xsl:value-of select="round($megabytes div 1024)"/>Gb
                            </xsl:when>
                            <xsl:otherwise><xsl:value-of select="round($megabytes)"/>Mb
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="round($kilobytes)"/>Kb
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$size"/>b
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="getExtension">
        <xsl:param name="name"/>
        <xsl:param name="fullName" select="1"/>
        <xsl:choose>
            <xsl:when test="contains($name, '.')">
                <xsl:call-template name="getExtension">
                    <xsl:with-param name="name" select="substring-after($name, '.')"/>
                    <xsl:with-param name="fullName" select="0"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$fullName = 1">
                        <xsl:value-of select="''"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="getLastIndex">
        <xsl:param name="str"/>
        <xsl:param name="search"/>
        <xsl:choose>
            <xsl:when test="contains($str, $search)">
                <xsl:variable name="firstPart" select="string-length(substring-before($str, $search)) + 1"/>
                <xsl:variable name="otherPart">
                    <xsl:call-template name="getLastIndex">
                        <xsl:with-param name="str" select="substring-after($str, $search)"/>
                        <xsl:with-param name="search" select="$search"/>
                    </xsl:call-template>
                </xsl:variable>
                <xsl:value-of select="$firstPart + $otherPart"/>
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <xsl:template name="lastSubstringBefore">
        <xsl:param name="str"/>
        <xsl:param name="subj"/>
        <xsl:variable name="substr">
            <xsl:choose>
                <xsl:when test="contains($str, $subj)">
                    <xsl:variable name="prefix" select="substring-before($str,$subj)"/>
                    <xsl:variable name="suffix">
                        <xsl:call-template name="lastSubstringBefore">
                            <xsl:with-param name="str" select="substring-after($str,$subj)"/>
                            <xsl:with-param name="subj" select="$subj"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="string-length($suffix) &gt; 0">
                            <xsl:value-of select="concat($prefix, $subj, $suffix)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$prefix"/>
                        </xsl:otherwise>
                    </xsl:choose>

                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="''"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$substr"/>
    </xsl:template>

    <xsl:template name="miniature">
            <xsl:param name="contents"/>
            <xsl:param name="path"/>
            <xsl:param name="name"/>
            <xsl:param name="imagePath"/>
            <xsl:param name="miniatureSize"/>

            <xsl:choose>
                <xsl:when test="$miniatureSize ='none'">
                    <xsl:comment>no miniature</xsl:comment>
                </xsl:when>
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
                                <xsl:value-of select="concat($imageName, '-', $miniatureSize)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of
                                        select="concat(substring($imageName, 1, $dotLastIndex - 1), '-', $miniatureSize, '.jpg')"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <div class="miniature">
                        <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
                            <img alt="{$name}"
                                 src="{$servletPath}/{$sitemapPath}{$folderPath}thumbnails/{$smallImageName}"/>
                        </a>
                    </div>
                </xsl:when>
                <xsl:otherwise>
                    <div class="miniature">
                        <img alt="{$name}" border="0" src="{$servletPath}/img/spacer-{$miniatureSize}.gif"/>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:template>

    <xsl:template name="import-document-type-template">
            <xsl:for-each select="//typifiedObject/documentType/name">
                <xsl:variable name="documentTypeName"><xsl:value-of select="."/></xsl:variable>
                <xsl:variable name="xslemplae"><xsl:value-of select="concat($documentTypeName, '.xsl')"/></xsl:variable>
                <xsl:comment>###${documenTypeName}</xsl:comment>
                <xsl:text>
                    &lt;xsl:import href="${XSLT_DOCUMENT_TYPE_LOCATION}${documenTypeName}"/&gt;
                </xsl:text>
                <!--&lt;!&ndash;<xsl:import href="${XSLT_DOCUMENT_TYPE_LOCATION}${documenTypeName}"/>&ndash;&gt;
                <xsl:import href="Content/documentType/Work.xsl"/>-->
            </xsl:for-each>
        </xsl:template>

</xsl:stylesheet>