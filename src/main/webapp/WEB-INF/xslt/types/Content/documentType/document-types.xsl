<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE stylesheet [
        <!ENTITY lt "<">
        ]>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="ems i18n">

    <xsl:template match="HtmlCode">
        <xsl:value-of select="html" disable-output-escaping="yes"/>
    </xsl:template>

    <xsl:template match="Article">
        <h2>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h2>
        <xsl:value-of select="text" disable-output-escaping="yes"/>
    </xsl:template>

    <xsl:template match="PressRelease">
        <xsl:variable name="imagePath" select="thumbnail/path"/>
        <!--<xsl:variable name="imagePath" select="image"/>-->

        <xsl:if test="$imagePath and $imagePath != ''">
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

           <!-- <xsl:variable name="extension">
                <xsl:call-template name="getExtension">
                    <xsl:with-param name="name" select="$imageName"/>
                </xsl:call-template>
            </xsl:variable>-->

            <xsl:variable name="dotLastIndex">
                <xsl:call-template name="getLastIndex">
                    <xsl:with-param name="search" select="'.'"/>
                    <xsl:with-param name="str" select="$imageName"/>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="mediumImageName">
                <xsl:choose>
                    <xsl:when test="$dotLastIndex = 0">
                        <xsl:value-of select="concat($imageName, '-medium')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                                select="concat(substring($imageName, 1, $dotLastIndex - 1), '-medium.jpg')"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <div class="image">
                <a href="{$servletPath}/{$sitemapPath}{$imagePath}" target="_blank">
                    <img alt="" src="{$servletPath}/{$sitemapPath}{$folderPath}thumbnails/{$mediumImageName}"/>
                </a>
            </div>
        </xsl:if>


        <div class="share-this">
            <a rel="nofollow" target="_blank" class="share-twitter" href="http://twitter.com/intent/tweet?status=Фотогалерея+»+http://tinyurl.com/86vumvz">Twitter</a>
            <a rel="nofollow" target="_blank" class="share-facebook" href="http://www.facebook.com/sharer/sharer.php?u=http://www.tgc-2.ru/&amp;t={title}">Facebook</a>
        </div>
        <div class="text">


            <xsl:value-of select="text" disable-output-escaping="yes"/>
        </div>

        <xsl:if test="contacts != ''">
            <div class="contacts">
                <label>Контакты пресс-службы</label>
                <span>
                    <xsl:value-of select="contacts" disable-output-escaping="yes"/>
                </span>
            </div>
        </xsl:if>

        <xsl:if test="information != ''">
            <div class="information">
                <label>Справочная информация</label>
                <span>
                    <xsl:value-of select="information" disable-output-escaping="yes"/>
                </span>
            </div>
        </xsl:if>
    </xsl:template>


    <xsl:template name="tariffs">
        <xsl:param name="items"/>

        <xsl:if test="count($items) &gt; 0">
            <table border="0" cellspacing="0" cellpadding="0">
                <thead>
                    <tr>
                        <th>Категория потребителей</th>
                        <th>Горячая вода</th>
                        <th>Отборный пар</th>
                        <th>Острый пар</th>
                    </tr>
                </thead>
                <tbody>
                    <xsl:for-each select="$items">
                        <xsl:sort select="@position"/>
                        <tr>
                            <td class="label">
                                <xsl:value-of select="category"/>
                            </td>
                            <td>
                                <xsl:value-of select="hot-water"/>
                            </td>
                            <td>
                                <xsl:value-of select="selected-vapor"/>
                            </td>
                            <td>
                                <xsl:value-of select="live-steam"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>


    <xsl:template match="Vacancy">
        <label class="label">
        <i18n:text key="Vacancy.post"/>
        </label><br/>
        <h2 class="post">
            <xsl:value-of select="post" disable-output-escaping="yes"/>
        </h2>
        <div class="department">
            <label class="label">
            <i18n:text key="Vacancy.department"/></label><br/>
            <xsl:value-of select="department" disable-output-escaping="yes"/>
        </div>
        <div class="number">
            <label class="label">
            <i18n:text key="Vacancy.number"/></label><br/>
            <xsl:value-of select="number" disable-output-escaping="yes"/>
        </div>
        <div class="responsibility">
            <label class="label">
            <i18n:text key="Vacancy.responsibility"/></label><br/>
            <xsl:value-of select="responsibility" disable-output-escaping="yes"/>
        </div>
        <div class="requirements">
            <label class="label">
            <i18n:text key="Vacancy.requirements"/></label><br/>
            <xsl:value-of select="requirements" disable-output-escaping="yes"/>
        </div>
        <div class="job-place">
            <label class="label">
            <i18n:text key="Vacancy.job-place"/></label><br/>
            <xsl:value-of select="job-place" disable-output-escaping="yes"/>
        </div>
        <div class="contacts">
            <label class="label">
            <i18n:text key="Vacancy.contacts"/></label><br/>
            <xsl:value-of select="contacts" disable-output-escaping="yes"/>
        </div>
    </xsl:template>
    <!--<xsl:template match="Project">
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h1>
        <p>
            <strong>
                <xsl:value-of select="author" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <strong>
                <xsl:value-of select="date" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <a href="{url}">
                <xsl:value-of select="url" disable-output-escaping="yes"/>
            </a>
        </p>
        <p>
            <xsl:value-of select="text" disable-output-escaping="yes"/>
        </p>

    </xsl:template>-->
    <!--<xsl:template match="Publication">
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h1>
        <p>
            <strong>
                <xsl:value-of select="author" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <strong>
                <xsl:value-of select="date" disable-output-escaping="yes"/>
            </strong>
        </p>
        <p>
            <a href="{url}">
                <xsl:value-of select="url" disable-output-escaping="yes"/>
            </a>
        </p>
        <p>
            <xsl:value-of select="text" disable-output-escaping="yes"/>
        </p>
    </xsl:template>
    -->
    <!-- <xsl:template match="People">
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h1>
        <xsl:choose>
            <xsl:when test="categories">
                <xsl:for-each select="categories/item">

                    <h3>
                        <xsl:value-of select="sub-heading"/>
                    </h3>
                    <ul>
                        <xsl:for-each select="PeopleList/item">
                            <li valign="middle">
                                <xsl:choose>
                                    <xsl:when test="avatar !=''">
                                        <xsl:choose>
                                            <xsl:when test="@url">
                                                <a href="{@url}" title="{.}" border="0">
                                                    <img src="/mediateka/images/logos/{@logo}.jpg"
                                                         width="120px" height="100px"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <img src="/mediateka/images/logos/{@logo}.jpg"
                                                     title="{.}"
                                                     width="120px" height="100px"
                                                     border="0"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="name" disable-output-escaping="yes"/>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>

                <ul>
                    <xsl:for-each select="PeopleList/item">

                        <li>
                            <xsl:value-of select="name" disable-output-escaping="yes"/>
                        </li>

                    </xsl:for-each>
                </ul>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>-->
    <!--<xsl:template match="Partner">
        <h1>
            <xsl:value-of select="title" disable-output-escaping="yes"/>
        </h1>
        <xsl:choose>
            <xsl:when test="categories">
                <xsl:for-each select="categories/item">

                    <h3>
                        <xsl:value-of select="sub-heading"/>
                    </h3>
                    <ul>
                        <xsl:for-each select="PartnerList/item">

                            <li valign="middle">
                                <xsl:choose>
                                    <xsl:when test="logo !=''">
                                        <xsl:choose>
                                            <xsl:when test="url">
                                                <a href="http://{url}" title="{.}" target="_blank" border="0">
                                                    <img src="/mediateka/images/partnerslogos/{logo}.jpg"
                                                         width="120px" height="100px"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <img src="/mediateka/images/partnerslogos/{logo}.jpg"
                                                     title="{.}"
                                                     width="120px" height="100px"
                                                     border="0"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="name" disable-output-escaping="yes"/>
                                    </xsl:otherwise>
                                </xsl:choose>

                            </li>
                        </xsl:for-each>
                    </ul>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>

                <ul>
                    <xsl:for-each select="PeopleList/item">

                        <li>
                            <xsl:value-of select="name" disable-output-escaping="yes"/>
                        </li>

                    </xsl:for-each>
                </ul>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>-->
</xsl:stylesheet>