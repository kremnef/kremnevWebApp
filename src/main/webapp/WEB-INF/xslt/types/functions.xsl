<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="Paging">
        <xsl:param name="currentPage" />
        <!--<xsl:param name="totalRows" />-->
        <xsl:param name="totPages" />
        <xsl:param name="rowsPerPage" />


       <!-- <h3>1-
            <xsl:value-of select="$currentPage"/>
        </h3>
        <h3>2-
            &lt;!&ndash;<xsl:value-of select="$totalRows"/>&ndash;&gt;
        </h3>
        <h3>3-
            <xsl:value-of select="$rowsPerPage"/>
        </h3>
-->

        <!--Here we calculate the total no of pages need to display the items-->
        <!--<xsl:variable name="totPages" select="ceiling($totalRows div $rowsPerPage)" />-->
        <!--this condition checks the currentpage and displays the "first page" link if current page is not the 1st page-->
        <xsl:if test="$currentPage &gt; 1">
            <a href="?page=1">
                &lt;&lt;
            </a>
            <a href="?page={$currentPage - 1}">
                &lt;
            </a>
        </xsl:if>
        <!--Now we set the start page ie the 1st page number link on the page-->
        <xsl:variable name="pagStartPage">
            <xsl:choose>
                <xsl:when test="$currentPage &lt;= 5">1</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$currentPage - 4"></xsl:value-of>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <!--Now we call the template for generating page number links on the page-->
        <!--we pass start page ,number of page links to diaplay,the current page and the total no of pages as parameters to the template-->
        <xsl:call-template name="PageNumbers">
            <xsl:with-param name="i" select="$pagStartPage"/>
            <xsl:with-param name="MaxPagelink" select="($pagStartPage+4)"/>
            <xsl:with-param name="currentPage" select="$currentPage"/>
            <xsl:with-param name="totPages" select="$totPages"/>
        </xsl:call-template>
        <!--this condition diplays the next page link
    here we check the current page is less than the total pages and display the next icon-->
        <xsl:if test="$currentPage &lt; $totPages" >
            <a href="?page={$currentPage + 1}" >
                &gt;
            </a>
        </xsl:if>
        <!-- Here we check if total records are not equal to zero followed by checking that the current page is not equal to the last page and display the last page link-->
        <!--<xsl:if test="$totalRows!= 0">-->
            <xsl:if test="$currentPage != $totPages">
                <a href="?page={$totPages}">
                    &gt;&gt;
                </a>
            </xsl:if>
        <!--</xsl:if>-->
    </xsl:template>

    <!--this template generates the page number links -->
    <xsl:template name="PageNumbers">
        <xsl:param name="i" />
        <xsl:param name="MaxPagelink"/>
        <xsl:param name="currentPage" />
        <xsl:param name="totPages"/>

        <xsl:choose>
            <!--Here we check if the total pages is greater than max page link on the page else skip to otherwise tag-->
            <xsl:when test="$totPages &gt; $MaxPagelink">
                <!--Here we check check if current page is less than or equal to max page link to display on the page-->
                <xsl:if test="$i &lt;= $MaxPagelink">
                    <xsl:choose>
                        <!--this condition diaplays an enabled number link if it is not the current page-->
                        <xsl:when test="$currentPage != $i">
                            <a href="?page={$i}">
                                <xsl:value-of select="$i"></xsl:value-of>
                            </a>
                        </xsl:when>
                        <!--if its the current page it diables the link-->
                        <xsl:otherwise>
                            <span>
                            <xsl:value-of select="$i"></xsl:value-of>
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>
                    <!--Here we call the template in a loop  untill it "i" equals the maxpagenumber link to display-->
                    <xsl:call-template name="PageNumbers">
                        <xsl:with-param name="i" select="($i + 1)"></xsl:with-param>
                        <xsl:with-param name="MaxPagelink" select="$MaxPagelink"></xsl:with-param>
                        <xsl:with-param name="currentPage" select="$currentPage" ></xsl:with-param>
                        <xsl:with-param name="totPages" select="$totPages"> </xsl:with-param>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <!-- This tag is called if the no of pages or total pages is less than the maxpage number link -->
            <xsl:otherwise>
                <!--Here we check if the no of pages are more than one,if yes than only display the  page links-->
                <xsl:if test="$totPages &gt; 1">
                    <xsl:if test="$i &lt;= $totPages">
                        <!--this condition diaplays an enabled number link if it is not the current page-->
                        <xsl:choose>
                            <xsl:when test="$currentPage != $i">
                                <a href="?page={$i}">
                                    <xsl:value-of select="$i"></xsl:value-of>
                                </a>
                            </xsl:when>
                            <!--if its the current page it diables the link-->
                            <xsl:otherwise>
                                <span>
                                <xsl:value-of select="$i"></xsl:value-of>
                                </span>
                            </xsl:otherwise>
                        </xsl:choose>
                        <!--Here we call the template in a loop  untill it "i" equals the maxpagenumber link to display-->
                        <xsl:call-template name="PageNumbers">
                            <xsl:with-param name="i" select="($i + 1)"></xsl:with-param>
                            <xsl:with-param name="MaxPagelink" select="$MaxPagelink"></xsl:with-param>
                            <xsl:with-param name="currentPage" select="$currentPage" ></xsl:with-param>
                            <xsl:with-param name="totPages" select="$totPages"> </xsl:with-param>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

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
                    <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/systemName)}">
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
            <xsl:variable name="documentTypeName">
                <xsl:value-of select="."/>
            </xsl:variable>
            <xsl:variable name="xslemplae">
                <xsl:value-of select="concat($documentTypeName, '.xsl')"/>
            </xsl:variable>
            <xsl:comment>###${documenTypeName}</xsl:comment>
                <xsl:text>
                    &lt;xsl:import href="${XSLT_DOCUMENT_TYPE_LOCATION}${documenTypeName}"/&gt;
                </xsl:text>
            <!--&lt;!&ndash;<xsl:import href="${XSLT_DOCUMENT_TYPE_LOCATION}${documenTypeName}"/>&ndash;&gt;
            <xsl:import href="Content/documentType/Work.xsl"/>-->
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>