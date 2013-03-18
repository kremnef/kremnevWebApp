<?xml version="1.0" encoding="UTF-8"?>
<!--<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <!--<xsl:apply-templates select="systemNode/objects[position = 1]" />-->
    <xsl:import href="../import/header.xsl"/>
    <xsl:import href="../import/footer.xsl"/>
    <xsl:template name="scripts">

        <link rel="stylesheet" href="{$servletPath}/{$sitemapPath}css/others/fp2.css" type="text/css" media="screen"/>
        <link rel="stylesheet" href="{$servletPath}/{$sitemapPath}js/isotope/isotope.css" type="text/css"
              media="screen"/>
        <link rel="alternate" type="application/rss+xml" title="Foster + Partners"
              href="http://www.fosterandpartners.com/feed.xml"/>
        <!--[if lte IE 7]>
            <link rel="stylesheet" href="../core/css/ie7.css" type="text/css" media="screen" />
        <![endif]-->
        <style>
            .footer { display:none; } .container { display:none; }
            #accordionArchive { margin-top:3px; }
            #newsarchive { background: url(../../core/img/bakabaka_news.png) 0 3px; margin-top:3px; }
            .newsdate { position:absolute; left:200px; bottom:14px; }
            .main { left:395px; }
        </style>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/jquery/jquery.min.js"/>


        <script type="text/javascript" async="" src="{$servletPath}/{$sitemapPath}js/others/ga.js"></script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/bootstrap-collapse.js"></script>

        <!--<link rel="apple-touch-icon-precomposed" sizes="144x144"
              href="http://www.fosterandpartners.com/m/core/ico/apple-touch-icon-144-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed" sizes="114x114"
              href="http://www.fosterandpartners.com/m/core/ico/apple-touch-icon-114-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed" sizes="72x72"
              href="http://www.fosterandpartners.com/m/core/ico/apple-touch-icon-72-precomposed.png"/>
        <link rel="apple-touch-icon-precomposed"
              href="http://www.fosterandpartners.com/m/core/ico/apple-touch-icon-57-precomposed.png"/>-->

        <!--<link rel="stylesheet" href="{$servletPath}/{$sitemapPath}css/others/9833.css" type="text/css"/>-->



        <!--<link rel="stylesheet" href=""/>-->


        <!--<link rel="stylesheet" type="text/css" href="/js/flowplayer/css/form.css"/>-->
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/{$sitemapPath}js/flowplayer/css/flight.css"/>-->

        <!-- calendar styling -->
        <!--<link rel="stylesheet" type="text/css"-->
        <!--href="{$servletPath}/{$sitemapPath}js/flowplayer/css/flight-calendar.css"/>-->

        <!--<script src="http://cdn.jquerytools.org/1.2.6/all/jquery.tools.min.js"></script>-->
        <!--<script src="/ems/resource/js/jquery/jquery-ui-1.8.11.custom.min.js" type="text/javascript"></script>-->


    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">
        <div class="outer">
            <xsl:call-template name="header"/>


            <div class="accordion" id="accordion">

                <!--  menu group -->

                <div class="accordion-group">

                    <div id="option" class="accordion-body collapse">
                        <div class="accordion-inner">
                            <div class="subcol idcol ">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/profile/the-way-we-work/">The Way we
                                            Work
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/profile/integrated-design/">Integrated
                                            Design
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/profile/research-+-development/">
                                            Research + Development
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/profile/sustainability/">
                                            Sustainability
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="subcol ">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/projects/type/">Type</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/projects/map/">Map</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/projects/on-site/">On Site</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/projects/list/">List</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/projects/stored/">Stored Projects</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="subcol tmenu">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/team/senior-partners/">Senior
                                            Partners
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/team/partners/">Partners</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/team/associate-partners/">Associate
                                            Partners
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/team/associates/">Associates</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="subcol dmenu">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/awards/">Awards</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/competitions/">
                                            Competitions
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/exhibitions/">
                                            Exhibitions
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/publications/">
                                            Publications
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/essays/">Essays</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/videos/">Videos</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/practice-data/cser/">CSER</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="subcol carmenu">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/careers/graduate-show/">Graduate
                                            Show
                                        </a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/careers/scholarship/">Scholarship</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="subcol conmenu">
                                <ul class="smenu">
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/london/">London</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/new-york/">New York</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/madrid/">Madrid</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/hong-kong/">Hong Kong</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/beijing/">Beijing</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/abu-dhabi/">Abu Dhabi</a>
                                    </li>
                                    <li class="smenu">
                                        <a href="http://www.fosterandpartners.com/contact/shanghai/">Shanghai</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="subcol newscol ">
                                <ul class="smenu">
                                    <li>
                                        <a href="http://www.fosterandpartners.com/news/archive/">Archive</a>
                                    </li>
                                    <li>
                                        <a href="http://www.fosterandpartners.com/news/pressroom/">Pressroom</a>
                                    </li>
                                    <!--<li id="smenu"></li>-->
                                    <!--<li id="smenu"></li>-->
                                    <!--<li id="smenu"></li>-->
                                    <!--<li id="smenu"></li>-->
                                    <li>
                                        <div class="tw16 soc"></div>
                                        <div class="fb16 soc"></div>
                                        <div class="li16 soc"></div>
                                        <div class="yt16 soc"></div>
                                        <div class="we16 soc"></div>
                                        <div class="rss16 soc"></div>
                                    </li>
                                </ul>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- .end menu group -->
                <!-- .end nav -->


<!--                <div class="accordion-group">

                    <div class="accordion-heading">
                        <a class="accordion-toggle clickable arrowheadup " data-toggle="collapse"
                           data-parent="#accordion2" href="http://www.fosterandpartners.com/news/#archive"
                           style="background-color: rgb(38, 39, 43);">
                            <h3>News</h3>
                        </a>


                    </div>


                    <div id="archive" class="accordion-body collapse in">
                        <div class="accordion-inner">

                            <div class="column first ">
                                <p>

                                    <a href="http://www.fosterandpartners.com/news/archive/">Archive</a>
                                    <br/>
                                    <a href="http://www.fosterandpartners.com/news/pressroom/">Pressroom</a>
                                </p>
                            </div>

                        </div>
                    </div>
                </div>-->
                <!-- .accordion-group -->


            </div>
            <!-- .accordion -->


            <div class="container isotope"
                 style="display: block; position: relative; overflow: hidden; height: 2178px;">
                <a href='foster-+-partners-exhibition-opens-in-kuala-lumpur/'><div class='element w588 t390 news'><img class='newsimgbig' src='../data/news/495/t2.jpg' /><h3 class='newsbig'>Foster + Partners exhibition opens in Kuala Lumpur</h3><p class='newsdate main'>06.03.2013</p></div></a>
                <!--<a href="http://www.fosterandpartners.com/news/foster-+-partners-exhibition-opens-in-kuala-lumpur/"
                   style="position: absolute; left: 0px; top: 0px;" class="isotope-item">
                    <div class="element w588 t390 news">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2.jpg"/>
                        <h3 class="newsbig">Foster + Partners exhibition opens in Kuala Lumpur</h3>
                        <p class="newsdate main">06.03.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/president-of-marseille-leads-opening-celebrations-for-new-vieux-port-pavilion/"
                   style="position: absolute; left: 594px; top: 0px;" class="isotope-item">
                    <div class="element w588 t390 news" style="background-color: rgb(80, 81, 85);">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2(1).jpg"/>
                        <h3 class="newsbig">President of Marseille leads opening celebrations for new Vieux Port
                            pavilion
                        </h3>
                        <p class="newsdate main">04.03.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/expression-of-intent-to-submit-thames-hub-airport-proposal-lodged-with-airports-commission/"
                   style="position: absolute; left: 0px; top: 396px;" class="isotope-item">
                    <div class="element w588 t390 news">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2(2).jpg"/>
                        <h3 class="newsbig">Expression of intent to submit Thames Hub Airport proposal lodged with
                            Airports Commission
                        </h3>
                        <p class="newsdate main">04.03.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/me-hotel-opens-in-london/"
                   style="position: absolute; left: 594px; top: 396px;" class="isotope-item">
                    <div class="element w588 t390 news">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2(3).jpg"/>
                        <h3 class="newsbig">ME Hotel opens in London</h3>
                        <p class="newsdate main">01.03.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-exhibition-to-open-in-kuala-lumpur-next-month/"
                   style="position: absolute; left: 0px; top: 792px;" class="isotope-item">
                    <div class="element w588 t390 news">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2(4).jpg"/>
                        <h3 class="newsbig">Foster + Partners exhibition to open in Kuala Lumpur next month</h3>
                        <p class="newsdate main">27.02.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-completes-first-project-in-latin-america/"
                   style="position: absolute; left: 594px; top: 792px;" class="isotope-item">
                    <div class="element w588 t390 news">
                        <img class="newsimgbig" src="./News   Foster + Partners_files/t2(5).jpg"/>
                        <h3 class="newsbig">Foster + Partners completes first project in Latin America</h3>
                        <p class="newsdate main">04.02.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-works-with-european-space-agency-to-3d-print-structures-on-the-moon/"
                   style="position: absolute; left: 0px; top: 1188px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(6).jpg"/>
                        <h3 class="news">Foster + Partners works with European Space Agency to 3D print structures on
                            the moon
                        </h3>
                        <p class="newsdate">31.01.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/lenbachhaus-museum-to-reopen-on-8-may/"
                   style="position: absolute; left: 396px; top: 1188px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(7).jpg"/>
                        <h3 class="news">Lenbachhaus Museum to reopen on 8 May</h3>
                        <p class="newsdate">24.01.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/porcelanosa-unveils-new-flagship-new-york-showroom/"
                   style="position: absolute; left: 792px; top: 1188px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(8).jpg"/>
                        <h3 class="news">Porcelanosa unveils new flagship New York showroom</h3>
                        <p class="newsdate">17.01.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-to-design-major-new-tyre-research-and-development-facility-in-korea/"
                   style="position: absolute; left: 0px; top: 1386px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(9).jpg"/>
                        <h3 class="news">Foster + Partners to design major new tyre research and development facility in
                            Korea
                        </h3>
                        <p class="newsdate">10.01.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/2013-riba-norman-foster-travelling-scholarship-call-for-entries/"
                   style="position: absolute; left: 396px; top: 1386px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(10).jpg"/>
                        <h3 class="news">2013 RIBA Norman Foster Travelling Scholarship call for entries</h3>
                        <p class="newsdate">10.01.2013</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/designs-for-the-new-york-public-library-revealed/"
                   style="position: absolute; left: 792px; top: 1386px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(11).jpg"/>
                        <h3 class="news">Designs for the New York Public Library revealed</h3>
                        <p class="newsdate">19.12.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/tribute-to-dr-alex-moulton-1920-2012-by-norman-foster/"
                   style="position: absolute; left: 0px; top: 1584px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(12).jpg"/>
                        <h3 class="news">Tribute to Dr Alex Moulton 1920 - 2012, by Norman Foster</h3>
                        <p class="newsdate">11.12.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/tribute-to-oscar-niemeyer-by-norman-foster/"
                   style="position: absolute; left: 396px; top: 1584px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(13).jpg"/>
                        <h3 class="news">Tribute to Oscar Niemeyer by Norman Foster</h3>
                        <p class="newsdate">06.12.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/ground-raising-ceremony-for-50-united-nations-plaza/"
                   style="position: absolute; left: 792px; top: 1584px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(14).jpg"/>
                        <h3 class="news">Ground-raising ceremony for 50 United Nations Plaza</h3>
                        <p class="newsdate">14.11.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-re-imagines-grand-central-terminal-for-2013-centenary/"
                   style="position: absolute; left: 0px; top: 1782px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(15).jpg"/>
                        <h3 class="news">Foster + Partners re-imagines Grand Central Terminal for 2013 Centenary</h3>
                        <p class="newsdate">19.10.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-wins-competition-for-new-tower-at-425-park-avenue-new-york/"
                   style="position: absolute; left: 396px; top: 1782px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(16).jpg"/>
                        <h3 class="news">Foster + Partners wins competition for new tower at 425 Park Avenue, New York
                        </h3>
                        <p class="newsdate">03.10.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/foster-+-partners-joins-prime-minister-on-ukti-visit-to-brazil/"
                   style="position: absolute; left: 792px; top: 1782px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(17).jpg"/>
                        <h3 class="news">Foster + Partners joins Prime Minister on UKTI visit to Brazil</h3>
                        <p class="newsdate">28.09.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/hongqiao-vantone-sunnyworld-centre-shanghai-breaks-ground/"
                   style="position: absolute; left: 0px; top: 1980px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(18).jpg"/>
                        <h3 class="news">Hongqiao Vantone SunnyWorld Centre, Shanghai breaks ground</h3>
                        <p class="newsdate">27.09.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/open-house-london-2012/"
                   style="position: absolute; left: 396px; top: 1980px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(19).jpg"/>
                        <h3 class="news">Open House London 2012</h3>
                        <p class="newsdate">18.09.2012</p>
                    </div>
                </a>
                <a href="http://www.fosterandpartners.com/news/new-velux-modular-skylight-sets-new-standards-for-energy-efficiency/"
                   style="position: absolute; left: 792px; top: 1980px;" class="isotope-item">
                    <div class="element w390 t192 news">
                        <img class="newsimg" src="./News   Foster + Partners_files/t2(20).jpg"/>
                        <h3 class="news">New VELUX Modular Skylight sets new standards for energy efficiency</h3>
                        <p class="newsdate">17.09.2012</p>
                    </div>
                </a>-->

            </div>
            <!-- .container -->

            <div class="accordion" id="accordionArchive">

                <div class="accordion-group ">

                    <div class="accordion-heading" id="arc">

                        <a href="http://www.fosterandpartners.com/news/archive/" class="accordion-toggle">
                            <h3>Archive 2012</h3>
                        </a>

                    </div>

                </div>
                <!-- .accordion-group -->

            </div>
            <!-- .accordion -->


            <div class="clear"></div>

            <div class="footer" style="display: block;">

                <p>© Foster + Partners 2013</p>
                <div class="socfoot">
                    <div class="tw16 soc"></div>
                    <div class="fb16 soc"></div>
                    <div class="li16 soc"></div>
                    <div class="yt16 soc"></div>
                    <div class="we16 soc"></div>
                    <div class="rss16 soc"></div>
                </div>
                <p id="email"><a href="http://www.fosterandpartners.com/news/#top">Top</a>|
                    <a href="mailto:?subject=Foster%20%2b%20Partners%20%2f%20News&amp;body=http://www.fosterandpartners.com/news/">
                        Email link to this page</a>|
                    <a href="mailto:info@fosterandpartners.com">info@fosterandpartners.com</a>
                </p>

            </div>
            <!-- end footer -->

        </div>
        <!-- end outer -->


        <!-- scripts -->
        <script type="text/javascript">

            var ADAPT_CONFIG = { path: '../core/css/', dynamic: false, range: ['0 to 1220 = fp.tab.001.css']};

        </script>

        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/head.min.js"></script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/adapt.min.js"></script>


        <!-- end scripts -->


        <div class="content">
            <div class="clear"></div>

            <div class="main">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
                <!--Скролл-->
                <div id="release-search-form">


                    <!--<form method="get" action="/ems/service/search" id="searchNews">-->
                    <!--<div id="keys">-->
                    <!--<label>-->
                    <!--Keywords-->
                    <!--<br/>-->
                    <!--<input value="" id="ems-search" resulte="10" name="query"-->
                    <!--type="text"/>-->

                    <!--</label>-->
                    <!--<label>-->
                    <!--Tag-->
                    <!--<br/>-->
                    <!--<div class="dropdown" id="tagsDropDown">-->
                    <!--&lt;!&ndash;     <script src="/js/jquery/jquery.selectbox-0.5.js"-->
                    <!--type="text/javascript"></script>-->
                    <!--<script type="text/javascript">-->
                    <!--$(document).ready(function() {-->
                    <!--$('#select-tagsDropDown').selectbox();-->
                    <!--});-->
                    <!--</script>&ndash;&gt;-->

                    <!--<select id="select-tagsDropDown">-->
                    <!--<option value="1">Ярославский</option>-->
                    <!--<option value="2">Новгородский</option>-->
                    <!--<option value="3">Тверской</option>-->
                    <!--<option value="4">Костромской</option>-->
                    <!--<option value="5">Архангельский</option>-->
                    <!--</select>-->
                    <!--</div>-->
                    <!--</label>-->
                    <!--</div>-->
                    <!--<div id="flight">-->
                    <!--<label>-->
                    <!--Start-->
                    <!--<br/>-->
                    <!--<input type="date" class="date" name="arrival"-->
                    <!--value="Today"></input>-->
                    <!--</label>-->

                    <!--<label>-->
                    <!--End-->
                    <!--<br/>-->
                    <!--<input type="date" class="date" name="departure" data-value="7"-->
                    <!--value="After one week"></input>-->
                    <!--</label>-->

                    <!--</div>-->
                    <!--</form>-->
                    <!--<script type="text/javascript"
                            src="{$servletPath}/{$sitemapPath}js/flowplayer/jquery.tools.min.js"/>
                    <script language="javascript">

                        // the french localization
                        $.tools.dateinput.localize("ru", {
                        months: 'Январь,Февраль,Март,Апрель,Май,Июнь,Июль,Август,' +
                        'Сентябрь,Октябрь,Ноябрь,Декабрь',
                        shortMonths: 'jan,feb,mar,avr,mai,jun,jul,aug;,sep,oct,nov,dec',
                        days: 'dimanche,lundi,mardi,mercredi,jeudi,vendredi,samedi',
                        shortDays: 'dim,lun,mar,mer,jeu,ven,sam'
                        });
                        &lt;!&ndash;$(document).ready(function(){&ndash;&gt;
                        &lt;!&ndash;$(function() {
                        var dates = $( "#date-from, #date-to" ).datepicker({
                        defaultDate: "+1w",
                        changeMonth: true,
                        numberOfMonths: 3,
                        onSelect: function( selectedDate ) {
                        var option = this.id == "from" ? "minDate" : "maxDate",
                        instance = $( this ).data( "datepicker" ),
                        date = $.datepicker.parseDate(
                        instance.settings.dateFormat ||
                        $.datepicker._defaults.dateFormat,
                        selectedDate, instance.settings );
                        dates.not( this ).datepicker( "option", option, date );
                        }
                        });&ndash;&gt;
                        &lt;!&ndash;});&ndash;&gt;

                        $(".date").dateinput({ trigger: true, format: 'dd mmmm yyyy', min: -1 });


                        // use the same callback for two different events. possible with bind
                        $(".date1").bind("onShow onHide", function() {
                        $(this).parent().toggleClass("active");
                        });


                        // when first date input is changed
                        $(".date:first").data("dateinput").change(function() {

                        // we use it's value for the seconds input min option
                        $(".date:last").data("dateinput").setMin(this.getValue(), true);
                        });
                        &lt;!&ndash;});&ndash;&gt;

                    </script>-->
                </div>

            </div>
            <div class="utils">
                <!--<a class="rss" href="#">RSS рассылка</a>-->
                <!--<a class="email" href="#">EMAIL рассылка</a>-->
            </div>


        </div>
        <xsl:call-template name="footer"/>

    </xsl:template>

</xsl:stylesheet>