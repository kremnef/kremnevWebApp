<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">
<!--<!DOCTYPE xsl:stylesheet SYSTEM "/xhtml.ent">-->
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
        <xsl:comment><![CDATA[[if IE 6]><script src="]]><xsl:value-of select="$servletPath"/><![CDATA[/js/DD_belatedPNG.js"/>
			<script  type="text/javascript">
				DD_belatedPNG.fix("img");
			</script>
		<![endif]]]>
        </xsl:comment>


    </xsl:template>

    <xsl:template name="styles">
        <!--<link rel="stylesheet" type="text/css" href="{$servletPath}/css/fancybox/jquery.fancybox-1.3.1.css"-->
        <!--media="screen"/>-->
    </xsl:template>

    <xsl:template match="root">
        <xsl:variable name="serverName" select="/root/params/request/param[@name='serverName']"/>
        <xsl:variable name="serverPort" select="/root/params/request/param[@name='serverPort']"/>


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


            <!-- end footer -->

        </div>
        <!-- end outer -->


        <!-- scripts -->
        <script type="text/javascript">

            var ADAPT_CONFIG = { path: '../core/css/', dynamic: false, range: ['0 to 1220 = fp.tab.001.css']};

        </script>

        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/head.min.js"></script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/adapt.min.js"></script>

        <script type="text/javascript">

            head.js(


            "../core/js/fp_scripts.001.js",
            "../core/js/jquery.color.js",
            "../core/js/jquery.isotope.min.js",


            function() {

            $('#arc').hover(function(){
            $(this).animate({ backgroundColor:'#525359'}, "fast");
            }, function() {
            $(this).animate({ backgroundColor:'#1c1c1c'}, "fast");
            });


            isoVar = window.setTimeout(function(){

            var $container = $('.container');
            $container.toggle().isotope({transformsEnabled: false, masonry : {columnWidth : 99}});
            $('.footer').toggle();
            return false;

            },64);


            }); // end head

        </script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/fp_scripts.001.js"></script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/others/jquery.color.js"></script>
        <script type="text/javascript" src="{$servletPath}/{$sitemapPath}js/isotope/jquery.isotope.min.js"></script>

        <!-- end scripts -->





        <div class="content">
            <div class="clear"></div>
            <div class="main">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 4]/value"/>
            </div>
            <!--news-->



            <!--brands-->
            <div class="brands">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 2]/value"/>
            </div>

            <!--<iframe width="100%" height="166" scrolling="no" frameborder="no"
                    src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F17250280&amp;show_artwork=true"></iframe>-->
            <!--instruments-->


            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 19]/value"/>
            <div class="news-block">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
            </div>
            <iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F20412712&amp;auto_play=false&amp;show_artwork=false&amp;color=b5ef5d"></iframe>
        </div>

        <!--<xsl:apply-templates select="systemNodeObjects/object/entry[key = 18]/value"/>-->
        <xsl:call-template name="footer"/>
    </xsl:template>

</xsl:stylesheet>