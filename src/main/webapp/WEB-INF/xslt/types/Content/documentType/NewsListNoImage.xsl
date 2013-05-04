<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://freeCMS.kremnevatelier.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="../ext/date.format-date.template.xsl"/>
    <xsl:import href="../types/Content/Content-templates.xsl"/>
    <xsl:import href="../types/functions.xsl"/>
    <xsl:import href="document-types.xsl"/>

    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='showNewsListNoImage' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="''"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>

    </xsl:template>

    <ems:templ name="showContents-showNewsListNoImage"/>
    <ems:templ name="showContentBriefly-showNewsListNoImage"/>

    <xsl:template match="ems:templ[@name='showContents-showNewsListNoImage']">
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>
        <xsl:call-template name="showContents">
            <xsl:with-param name="contents" select="$contents"/>
            <xsl:with-param name="path" select="$path"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
        </xsl:call-template>
    </xsl:template>


    <xsl:template match="ems:templ[@name='showContentBriefly-showNewsListNoImage']">
        <!--<xsl:template name="showContentBriefly">-->
        <xsl:param name="contents"/>
        <xsl:param name="path"/>
        <xsl:param name="typeActionName"/>

        <xsl:variable name="name">
            <xsl:call-template name="getLocalName">
                <xsl:with-param name="typifiedObject" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>
        <!--<xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$contents"/>
            </xsl:call-template>
        </xsl:variable>-->
        <div class="news-block">
            <xsl:variable name="post-link" select="date"/>
            <xsl:variable name="post-title" select="$name"/>

            <xsl:variable name="document" select="$contents/documents"/>

            <div class="date">

                <xsl:call-template name="date:format-date">
                    <xsl:with-param name="date-time" select="$contents/publishDateTime"/>
                    <xsl:with-param name="pattern" select="'dd MMMMM yyyy'"/>
                </xsl:call-template>

            </div>

            <div class="title">
                <a href="{$servletPath}/{$sitemapPath}{concat($path,$contents/emsObject/systemName)}">
                    <xsl:value-of select="$name"/>
                    <!--<xsl:value-of select="$document/title"/>-->
                </a>
            </div>
            <div class="text">
                <xsl:value-of select="$document/description" disable-output-escaping="yes"/>
            </div>
        </div>

    </xsl:template>

    <xsl:template match="News">
        <xsl:value-of select="text" disable-output-escaping="yes"/>
    </xsl:template>

    <xsl:template match="News/item">
    <div class="buttons">
                <!--twitter-->
                <!--<noindex>-->
                    <!--<a rel="nofollow" target="_blank"-->
                       <!--href="http://twitter.com/intent/tweet?text=RT @shakinru {$post-title}: {$post-link}"-->
                       <!--title="Добавить в Twitter">-->
                        <!--<img src="/img/twitter.gif" alt="Опубликовать в twitter.com"-->
                             <!--width="78" height="18"/>-->
                    <!--</a>-->
                <!--</noindex>-->
                <!--twitter-->
                <!--<noindex>
                    <a href="http://vkontakte.ru/share.php?url={$post-link}" target="_blank" rel="nofollow">
                        <img src="/img/images/vkontakte.gif" width="84" height="18"
                             title="Поделиться ВКонтакте"/>
                    </a>
                </noindex>-->
                <!--Facebook-->
                <!--<noindex>
                    <a rel="nofollow" target="blank" href="http://www.facebook.com/sharer.php?u={$post-link}">
                        <img src="/img/images/facebook.gif" width="73" height="18"
                             title="Поделиться в Facebook"/>
                    </a>
                </noindex>-->
                <!--Google-->
                <!--<noindex>
                    <a href="http://www.google.com/reader/link?url={$post-link} title={$post-title} srcURL=http://shakin.ru/"
                       rel="nofollow" target="_blank">
                        <img src="/img/images/google-buzz-compact.gif" width="73" height="18"
                             title="Добавить в Google Buzz"/>
                    </a>
                </noindex>-->
                <!---->
                <!--<noindex>-->
                    <!--<a rel="nofollow"-->
                       <!--href="http://www.livejournal.com/update.bml?event={$post-link} subject={$post-title}"-->
                       <!--target="_blank" title="Опубликовать в своем блоге livejournal.com">-->
                        <!--<img src="/img/images/livejournal.gif"-->
                             <!--alt="Опубликовать в своем блоге livejournal.com" width="73" height="18"/>-->
                    <!--</a>-->
                <!--</noindex>-->


                <!--<div style="margin-top:15px;" id="shareThis">
                    <table cellspacing="0" cellpadding="0" id="vkshare0" onmouseover="VK.Share.change(1, 0);"
                           onmouseout="VK.Share.change(0, 0);" onmousedown="VK.Share.change(2, 0);"
                           onmouseup="VK.Share.change(1, 0);"
                           style="position: relative; width: auto; cursor: pointer; border: 0px;">
                        <tbody>
                            <tr style="line-height: normal;">
                                <td style="vertical-align: middle;">
                                    <a href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                                       onmouseup="this._btn=event.button;this.blur();"
                                       onclick="return VK.Share.click(0, this);"
                                       style="text-decoration: none; background-position: -21px -42px; ">
                                        <div style="height: 21px; cursor:pointer; width: 2px; background: url(https://vk.com/images/btns.png) no-repeat -21px -42px;"></div>
                                    </a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <a href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                                       onmouseup="this._btn=event.button;this.blur();"
                                       onclick="return VK.Share.click(0, this);" style="text-decoration:none;">
                                        <div style="border: 1px solid #3b6798; cursor:pointer; border-left: 0px;">
                                            <div style="border-top-width: 1px; border-right-width: 1px; border-bottom-width: 1px; border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-image: initial; border-left-width: 0px; border-left-style: initial; color: rgb(255, 255, 255); text-shadow: rgb(69, 104, 142) 0px 1px; height: 15px; padding-top: 2px; padding-right: 4px; padding-bottom: 0px; padding-left: 6px; font-family: tahoma, arial; font-size: 10px; background-color: rgb(109, 143, 179); border-top-color: rgb(126, 156, 188); border-right-color: rgb(92, 130, 171); border-bottom-color: rgb(92, 130, 171); border-left-color: rgb(92, 130, 171); ">
                                                Поделиться
                                            </div>
                                        </div>
                                    </a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <a href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                                       onmouseup="this._btn=event.button;this.blur();"
                                       onclick="return VK.Share.click(0, this);" style="text-decoration:none;">
                                        <div style="background-image: url(https://vk.com/images/btns.png); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; cursor: pointer; height: 21px; width: 22px; background-position: 0px -21px; background-repeat: no-repeat no-repeat; "></div>
                                    </a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <a href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                                       onmouseup="this._btn=event.button;this.blur();"
                                       onclick="return VK.Share.click(0, this);" style="text-decoration:none;">
                                        <div style="border-top-style: solid; border-right-style: solid; border-bottom-style: solid; border-left-style: solid; border-top-color: rgb(162, 185, 211); border-right-color: rgb(162, 185, 211); border-bottom-color: rgb(162, 185, 211); border-left-color: rgb(162, 185, 211); border-image: initial; border-top-width: 1px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 0px; cursor: pointer; background-color: rgb(222, 230, 241); color: rgb(0, 0, 0); height: 15px; padding-top: 2px; padding-right: 6px; padding-bottom: 0px; padding-left: 4px; font-size: 10px; font-weight: bold; font-family: tahoma, arial; display: none; ">
                                            0
                                        </div>
                                    </a>
                                </td>
                                <td style="vertical-align: middle;">
                                    <a href="http://vkontakte.ru/share.php?url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                                       onmouseup="this._btn=event.button;this.blur();"
                                       onclick="return VK.Share.click(0, this);" style="text-decoration:none;">
                                        <div style="background-image: url(https://vk.com/images/btns.png); background-attachment: initial; background-origin: initial; background-clip: initial; background-color: initial; cursor: pointer; width: 2px; height: 21px; display: none; background-position: -27px -42px; background-repeat: initial initial; "></div>
                                    </a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <a name="fb_share" type="button_count" share_url="www.quizful.net%2Fpost%2Fjava-memory-leak-visualvm"
                       href="http://www.facebook.com/sharer.php?u=www.quizful.net%252Fpost%252Fjava-memory-leak-visualvm&amp;src=sp"
                       style="text-decoration: none; ">
                        <span class="fb_share_size_Small ">
                            <span class="FBConnectButton FBConnectButton_Small" style="cursor:pointer;">
                                <span class="FBConnectButton_Text">Share</span>
                            </span>
                            <span class="fb_share_count_nub_right fb_share_no_count"></span>
                            <span class="fb_share_count fb_share_no_count fb_share_count_right">
                                <span class="fb_share_count_inner">&nbsp;</span>
                            </span>
                        </span>
                    </a>
                    <a href="http://www.google.com/buzz/post" class="google-buzz-button" title="Post to Google Buzz"
                       data-url="http://www.quizful.net/post/java-memory-leak-visualvm"
                       data-imageurl="http://quizful.net/res/img/logo.png" data-button-style="small-count"></a>
                    <iframe allowtransparency="true" frameborder="0" scrolling="no"
                            src="http://platform.twitter.com/widgets/tweet_button.1326407570.html#_=1327075800335&amp;_version=2&amp;count=horizontal&amp;enableNewSizing=false&amp;id=twitter-widget-0&amp;lang=en&amp;original_referer=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm&amp;size=m&amp;text=%D0%90%D0%BD%D0%B0%D0%BB%D0%B8%D0%B7%D0%B8%D1%80%D1%83%D0%B5%D0%BC%20%D1%83%D1%82%D0%B5%D1%87%D0%BA%D0%B8%20%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%B8%20%D0%B2%20Java%20%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F%D1%85%2C%20%D0%B8%D1%81%D0%BF%D0%BE%D0%BB%D1%8C%D0%B7%D1%83%D1%8F%20VisualVM&amp;url=http%3A%2F%2Fwww.quizful.net%2Fpost%2Fjava-memory-leak-visualvm&amp;via=quizful"
                            class="twitter-share-button twitter-count-horizontal" style="height: 20px; width: 110px; "
                            title="Twitter Tweet Button"></iframe>
                </div>-->
                <div class="tweet_button">
                    <iframe src="http://platform0.twitter.com/widgets/tweet_button.html?_=&amp;count=horizontal&amp;lang=en&amp;text=%D0%91%D1%80%D0%B8%D1%82%D0%B0%D0%BD%D1%86%D1%8B%20%D0%BE%D1%82%D0%BE%D0%B7%D0%B2%D0%B0%D0%BB%D0%B8%20%D0%BB%D0%B8%D1%86%D0%B5%D0%BD%D0%B7%D0%B8%D1%8E%20%D0%BD%D0%B0%20%D0%B2%D0%B5%D1%89%D0%B0%D0%BD%D0%B8%D0%B5%20%D1%83%20%D0%B8%D1%80%D0%B0%D0%BD%D1%81%D0%BA%D0%BE%D0%B3%D0%BE%20%D1%82%D0%B5%D0%BB%D0%B5%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB%D0%B0%20Press%20TV&amp;url=http://www.ria.ru/world/20120120/544649258.html&amp;via=rianru"
                            scrolling="no" frameborder="0" id="twitter" allowtransparency="true" width="110"
                            height="30"></iframe>
                </div>
            </div>
        <div class="news-item">
            <h1>
                <xsl:value-of select="title" disable-output-escaping="yes"/>
            </h1>
            <div class="date">
                <xsl:value-of select="date" disable-output-escaping="yes"/>
            </div>
            <div class="news-text">
                <xsl:value-of select="text" disable-output-escaping="yes"/>
            </div>
        </div>

    </xsl:template>



</xsl:stylesheet>