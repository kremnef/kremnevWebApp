<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet SYSTEM "../../../dtd/escape.dtd">

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"

                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:str="http://exslt.org/strings"
                xmlns:func="http://exslt.org/functions"
                xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
                exclude-result-prefixes="date str func i18n">

    <xsl:import href="import/header.xsl"/>
    <xsl:import href="import/footer.xsl"/>

    <xsl:template name="scripts">
    </xsl:template>

    <xsl:template name="styles">
    </xsl:template>

    <xsl:template match="root">
        <xsl:variable name="serverName" select="/root/params/request/param[@name='serverName']"/>
        <xsl:variable name="serverPort" select="/root/params/request/param[@name='serverPort']"/>


        <!--<div class="outer">
            <xsl:call-template name="header"/>


            <div class="accordion" id="accordion">

                &lt;!&ndash;  menu group &ndash;&gt;

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
                                    &lt;!&ndash;<li id="smenu"></li>&ndash;&gt;
                                    &lt;!&ndash;<li id="smenu"></li>&ndash;&gt;
                                    &lt;!&ndash;<li id="smenu"></li>&ndash;&gt;
                                    &lt;!&ndash;<li id="smenu"></li>&ndash;&gt;
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

            </div>
            &lt;!&ndash; .accordion &ndash;&gt;



            &lt;!&ndash; .container &ndash;&gt;

            <div class="accordion" id="accordionArchive">

                <div class="accordion-group ">

                    <div class="accordion-heading" id="arc">

                        <a href="http://www.fosterandpartners.com/news/archive/" class="accordion-toggle">
                            <h3>Archive 2012</h3>
                        </a>

                    </div>

                </div>
                &lt;!&ndash; .accordion-group &ndash;&gt;

            </div>
            &lt;!&ndash; .accordion &ndash;&gt;


            &lt;!&ndash; end footer &ndash;&gt;

        </div>-->
        <!-- end outer -->


        <!-- scripts -->






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


            <xsl:apply-templates select="systemNodeObjects/object/entry[key = 19]/value"/>
            <div class="news-block">
                <xsl:apply-templates select="systemNodeObjects/object/entry[key = 3]/value"/>
            </div>
            <!--<iframe width="100%" height="166" scrolling="no" frameborder="no" src="http://w.soundcloud.com/player/?url=http%3A%2F%2Fapi.soundcloud.com%2Ftracks%2F20412712&amp;auto_play=false&amp;show_artwork=false&amp;color=b5ef5d"></iframe>-->
        </div>

        <xsl:call-template name="footer"/>
    </xsl:template>

</xsl:stylesheet>