<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

    <xsl:import href="../types/Content/Content.xsl"/>

    <xsl:template match="value[typifiedObject/objectType/name='Content' and typeAction/name='showImageBanner']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseUrl" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectUrl" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>

        <div class="widget-{$position}">
            <div id="{$systemName}-{$position}" class="{$typeActionName}">
                <xsl:choose>
                    <xsl:when test="levels=0">
                        <xsl:call-template name="showImage">
                            <xsl:with-param name="obj" select="typifiedObject"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="showImages">
                            <xsl:with-param name="parentSystemName" select="$systemName"/>
                            <xsl:with-param name="parentId" select="typifiedObject/id"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
        </div>
    </xsl:template>


    <xsl:template name="showImage">
        <xsl:param name="obj"/>
        <!--<xsl:variable name="maxVersion">
            <xsl:call-template name="maxVersion">
                <xsl:with-param name="obj" select="$obj"/>
            </xsl:call-template>
        </xsl:variable>-->
        <!--<xsl:apply-templates select="$obj/documents[language/code=$locale and version=$maxVersion]/xmlSource"/>-->
        <xsl:apply-templates select="$obj/documents/xmlSource"/>
    </xsl:template>


    <xsl:template name="showImages">
        <xsl:param name="parentSystemName"/>
        <xsl:param name="parentId"/>
        <xsl:variable name="items"
                      select="/root/childrenMap/children/entry[key/systemName=$parentSystemName and key/parentId=$parentId]/value/item"/>
        <xsl:variable name="currentPage">
            <xsl:choose>
                <xsl:when test="$page and $page &lt;= count($items)">
                    <xsl:value-of select="$page"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="1"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:for-each select="$items">
            <xsl:if test="position()=$currentPage">
                <xsl:call-template name="showImage">
                    <xsl:with-param name="obj" select="."/>
                </xsl:call-template>
            </xsl:if>
        </xsl:for-each>
        <xsl:if test="count($items) &gt; 1">
            <div class="pager">
                <ul>
                    <xsl:for-each select="$items">
                        <xsl:variable name="pos" select="position()"/>
                        <xsl:choose>
                            <xsl:when test="$pos=$currentPage">
                                <li class="selected">
                                    <a/>
                                </li>
                            </xsl:when>
                            <xsl:otherwise>
                                <li>
                                    <a href="?page={$pos}"></a>
                                </li>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                </ul>
            </div>
        </xsl:if>
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


    <xsl:template match="ImageBanner">
        <xsl:variable name="link" select="link"/>
        <xsl:choose>
            <xsl:when test="0 &lt; string-length($link)">
                <xsl:choose>
                    <xsl:when test="0 &lt; string-length($sitemapPath)">
                        <a href="{$link}">
                            <img alt="" src="{$servletPath}/{$sitemapPath}{image}"/>
                        </a>
                    </xsl:when>
                    <xsl:otherwise>
                        <a href="{$link}">
                            <img alt="" src="{$servletPath}{image}"/>
                        </a>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="0 &lt; string-length($sitemapPath)">
                        <img alt="" src="{$servletPath}/{$sitemapPath}{image}"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <img alt="" src="{$servletPath}{image}"/>
                    </xsl:otherwise>
                </xsl:choose>

            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>
    <!--<div id="watch-player" class="flash-player"
         style="background-attachment: scroll; background-repeat: repeat; background-image: none; background-position: 0% 0%; background-size: auto; background-origin: padding-box; background-clip: border-box; background-color: transparent">
        <embed type="application/x-shockwave-flash" src="http://s.ytimg.com/yt/swfbin/watch_as3-vflZram0O.swf"
               width="640" id="movie_player" height="390"
               flashvars="fexp=910015%2C911305%2C914102 enablecsi=1 creator=Chileanskies allow_embed=1 iv_close_button=0 is_doubleclick_tracked=1 account_playback_token= iv_enabled_features=TCS autohide=2 csi_page_type=watch5 keywords=pat%2Cmetheny%2Cfirst%2Ccircle cr=RU p_s=4Hudl7FdMH2s-GIeAP-wAu1G9NSyqsu61m5LWCJQuSQ%3D iv3_module=http%3A%2F%2Fs.ytimg.com%2Fyt%2Fswfbin%2Fiv3_module-vfl1HE6Le.swf fmt_list=43%2F640x360%2F99%2F0%2F0%2C34%2F640x360%2F9%2F0%2F115%2C18%2F640x360%2F9%2F0%2F115%2C5%2F320x240%2F7%2F0%2F0 iv_storage_server=http%3A%2F%2Fwww.youtube.com%2Fannotations%2F length_seconds=519 enablejsapi=1 theme=tlb plid=AAS29tw2tt6TDJ0p iv_module=http%3A%2F%2Fs.ytimg.com%2Fyt%2Fswfbin%2Fiv_module-vfl_szWIo.swf watch_xlb=http%3A%2F%2Fs.ytimg.com%2Fyt%2Fxlb%2Fwatch%2Fstrings-ru_RU-vflSnAZPx.xlb t=vjVQa1PpcFN_xo4dm9FodVWIAHesuwLU1Y8pqJTgwTA%3D url_encoded_fmt_stream_map=url%3Dhttp%253A%252F%252Fo-o.preferred.svo01s01.v15.lscache2.c.youtube.com%252Fvideoplayback%253Fsparams%253Did%25252Cexpire%25252Cip%25252Cipbits%25252Citag%25252Csource%25252Cratebypass%25252Ccp%2526fexp%253D910015%25252C911305%25252C914102%2526itag%253D43%2526ip%253D87.0.0.0%2526signature%253DB53A6181D3710D4F7BB069FAF4A41ADF6465257D.A69F8E6E9FB07040445C75D98571167632DCAD3D%2526sver%253D3%2526ratebypass%253Dyes%2526source%253Dyoutube%2526expire%253D1327091526%2526key%253Dyt1%2526ipbits%253D8%2526cp%253DU0hRTFBUT19HUENOMV9ITlNGOkhySWpxY2JncnpX%2526id%253Dd719b4258a23024b%26quality%3Dmedium%26fallback_host%3Dtc.v15.cache2.c.youtube.com%26type%3Dvideo%252Fwebm%253B%2Bcodecs%253D%2522vp8.0%252C%2Bvorbis%2522%26itag%3D43%2Curl%3Dhttp%253A%252F%252Fo-o.preferred.svo01s01.v16.lscache7.c.youtube.com%252Fvideoplayback%253Fsparams%253Did%25252Cexpire%25252Cip%25252Cipbits%25252Citag%25252Csource%25252Calgorithm%25252Cburst%25252Cfactor%25252Ccp%2526fexp%253D910015%25252C911305%25252C914102%2526algorithm%253Dthrottle-factor%2526itag%253D34%2526ip%253D87.0.0.0%2526burst%253D40%2526sver%253D3%2526signature%253D35E599B8A8BA140DF1D06EFA8660B6924C3981B4.B4F08F823699A05AA2658FE8407C4DC3FDE5BBC1%2526source%253Dyoutube%2526expire%253D1327091526%2526key%253Dyt1%2526ipbits%253D8%2526factor%253D1.25%2526cp%253DU0hRTFBUT19HUENOMV9ITlNGOkhySWpxY2JncnpX%2526id%253Dd719b4258a23024b%26quality%3Dmedium%26fallback_host%3Dtc.v16.cache7.c.youtube.com%26type%3Dvideo%252Fx-flv%26itag%3D34%2Curl%3Dhttp%253A%252F%252Fo-o.preferred.svo01s01.v15.lscache6.c.youtube.com%252Fvideoplayback%253Fsparams%253Did%25252Cexpire%25252Cip%25252Cipbits%25252Citag%25252Csource%25252Cratebypass%25252Ccp%2526fexp%253D910015%25252C911305%25252C914102%2526itag%253D18%2526ip%253D87.0.0.0%2526signature%253DBE4A34D48067894E8CDBEA1102FFE935D40D6415.2A72CD63394C6EA0E72EB692D9DBFCEA7D048F%2526sver%253D3%2526ratebypass%253Dyes%2526source%253Dyoutube%2526expire%253D1327091526%2526key%253Dyt1%2526ipbits%253D8%2526cp%253DU0hRTFBUT19HUENOMV9ITlNGOkhySWpxY2JncnpX%2526id%253Dd719b4258a23024b%26quality%3Dmedium%26fallback_host%3Dtc.v15.cache6.c.youtube.com%26type%3Dvideo%252Fmp4%253B%2Bcodecs%253D%2522avc1.42001E%252C%2Bmp4a.40.2%2522%26itag%3D18%2Curl%3Dhttp%253A%252F%252Fo-o.preferred.svo01s01.v2.lscache4.c.youtube.com%252Fvideoplayback%253Fsparams%253Did%25252Cexpire%25252Cip%25252Cipbits%25252Citag%25252Csource%25252Calgorithm%25252Cburst%25252Cfactor%25252Ccp%2526fexp%253D910015%25252C911305%25252C914102%2526algorithm%253Dthrottle-factor%2526itag%253D5%2526ip%253D87.0.0.0%2526burst%253D40%2526sver%253D3%2526signature%253DB96B4B5351B85442646E3A26E082EF1FEB8389CB.50EEBA6AF13FF2DC54B9B68F8F366AF81F736B68%2526source%253Dyoutube%2526expire%253D1327091526%2526key%253Dyt1%2526ipbits%253D8%2526factor%253D1.25%2526cp%253DU0hRTFBUT19HUENOMV9ITlNGOkhySWpxY2JncnpX%2526id%253Dd719b4258a23024b%26quality%3Dsmall%26fallback_host%3Dtc.v2.cache4.c.youtube.com%26type%3Dvideo%252Fx-flv%26itag%3D5 watermark=%2Chttp%3A%2F%2Fs.ytimg.com%2Fyt%2Fimg%2Fwatermark%2Fyoutube_watermark-vflHX6b6E.png%2Chttp%3A%2F%2Fs.ytimg.com%2Fyt%2Fimg%2Fwatermark%2Fyoutube_hd_watermark-vflAzLcD6.png sourceid=ys supersizefeatured=1 iv_load_policy=1 showpopout=1 hl=ru_RU tmi=1 iv_logging_level=3 no_get_video_log=1 rvs=view_count%3D87467%26author%3Dfirstcircle001%26length_seconds%3D535%26id%3DrN11Aqr-DOI%26title%3DThe%2BFirst%2BCircle%2B%25281995%2529%2Cview_count%3D203513%26author%3DMusicenthusiasm%26length_seconds%3D383%26id%3DMWCCqHHyIvY%26title%3DPat%2BMetheny%2B%2526%2BJaco%2BPastorius%2B-%2BLive%2BAt%2BThe%2BJazz%2BWorkshop%2B-%2BBright%2BSize%2BLife%2Cview_count%3D293070%26author%3Dcanserrano%26length_seconds%3D371%26id%3DamEp34owKn0%26title%3DPat%2BMetheny%2BGroup%2B%2528%2BPat%2BMetheny%252C%2BRichard%2BBona%252C%2BAntonio%2BSanchez%2B%2529%2BBright%2BSize%2BLife%2BComplete%2Bversion%2521%2Cview_count%3D14299%26author%3Dleoblack97%26length_seconds%3D376%26id%3D31q9gzJRKPI%26title%3DPat%2BMetheny%2BGroup%2B-%2BHave%2BYou%2BHeard%2Cview_count%3D218478%26author%3DMrOODZAII%26length_seconds%3D190%26id%3DBntNRMiI4PQ%26title%3DPat%2BMetheny%2B%2B%2BDon%2527t%2BKnow%2BWhy%2Cview_count%3D4669%26author%3DTheRealTobobias%26length_seconds%3D564%26id%3DdcXEkg26d-I%26title%3DFirst%2BCircle%2B-%2BPat%2BMetheney%2Cview_count%3D127855%26author%3D777i2i%26length_seconds%3D364%26id%3DkHT9MjkFgBE%26title%3DPAT%2BMETHENY%2B-%2BABOVE%2BTHE%2BTREETOPS%2Cview_count%3D68764%26author%3Dsmokybearguitar%26length_seconds%3D159%26id%3DNswNQ93TPO4%26title%3D%25E3%2583%2591%25E3%2583%2583%25E3%2583%2588%25E3%2583%25A1%25E3%2582%25BB%25E3%2583%258B%25E3%2583%25BC%2BSTRANGER%2BIN%2BTOWN%2B%2B%25E3%2580%258C%25E3%2582%25BF%25E3%2583%25A2%25E3%2583%25AA%25E3%2581%25AE%25E9%259F%25B3%25E6%25A5%25BD%25E3%2581%25AF%25E4%25B8%2596%25E7%2595%258C%25E3%2581%25A0%25E3%2580%258D%25E3%2582%2588%25E3%2582%258A%2Cview_count%3D8647%26author%3DTheMaxvesuvio%26length_seconds%3D561%26id%3DFixG72s8FTU%26title%3DPat%2BMetheny%2B%2526%2BMetropole%2BOrchestra%2Bt4%2B-%2BNorth%2BSea%2BJazz%2BFestival%2B2.wmv%2Cview_count%3D6893%26author%3Dtootthielemans%26length_seconds%3D570%26id%3D_N_Xb7H8xCM%26title%3DPat%2BMetheny%2BGroup%2B-%2BStill%2BLife%2B%2528Talking%2529%2B-%2BMinuano%2B%2528Six%2BEight%2529%2B1987%2Cview_count%3D114608%26author%3DtarkineWild%26length_seconds%3D600%26id%3DEcz3ykm_TRU%26title%3DPat%2B%2BMetheny%2BGroup%2B....The%2BWay%2BUp%2Blive%2BPart%2B1%2Cview_count%3D139460%26author%3Dklaurent13%26length_seconds%3D524%26id%3DLEmL6tIaYWU%26title%3DPat%2BMetheny%2BGroup%2B-%2BFirst%2Bcircle%2B-live%2Bin%2Bjapan endscreen_module=http%3A%2F%2Fs.ytimg.com%2Fyt%2Fswfbin%2Fendscreen-vfl_nBoHp.swf vq=auto referrer=http%3A%2F%2Fwww.youtube.com%2Fresults%3Fsearch_query%3Dpat%2Bmetheny%2Bgroup%26oq%3Dpath%2Bma%26aq%3D6s%26aqi%3Dg5g-s5%26aql%3D%26gs_sm%3De%26gs_upl%3D4219l6059l0l9526l7l7l0l0l0l0l249l991l0.2.3l5l0 video_id=1xm0JYojAks sendtmp=1 q=pat+metheny+group timestamp=1327071279 sk=seYGBvZ8FtVgPE5pKl9XX9XjT1MLWAROC"
               allowscriptaccess="always" allowfullscreen="true" bgcolor="#000000">
        <noembed>&lt;div class="yt-alert yt-alert-error yt-alert-player yt-rounded ">&lt;span class="yt-alert-icon">&lt;img
            src="//s.ytimg.com/yt/img/pixel-vfl3z5WfW.gif" class="icon master-sprite" alt="Значок оповещения">&lt;/span>&lt;div
            class="yt-alert-content"> Установите проигрыватель Adobe Flash Player, чтобы просмотреть это видео. &lt;br>
            &lt;a href="http://get.adobe.com/flashplayer/">Загрузить с сайта Adobe&lt;/a>.
            &lt;/div>&lt;/div>
        </noembed>
    </div>-->
</xsl:stylesheet>