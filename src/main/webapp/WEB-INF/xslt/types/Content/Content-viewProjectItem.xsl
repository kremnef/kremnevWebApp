<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:ems="http://ems.strela.ru/"
                xmlns:date="http://exslt.org/dates-and-times"
                exclude-result-prefixes="ems">

    <xsl:import href="Content-templates.xsl"/>
    <xsl:import href="../functions.xsl"/>
    <xsl:param name="servletPath"/>
    <xsl:param name="sitemapPath"/>

    <xsl:template match="value[typeAction/name='viewProjectItem' and typifiedObject/objectType/name='Content']">
        <xsl:variable name="systemName" select="typifiedObject/emsObject/systemName"/>
        <xsl:variable name="typeActionName" select="typeAction/name"/>
        <xsl:variable name="baseURL" select="typifiedObject/baseURL"/>
        <xsl:variable name="objectURL" select="typifiedObject/objectURL"/>

        <xsl:variable name="position" select="../key"/>
        
        
        
        
        
        

        <!--<xsl:call-template name="showContent">
            <xsl:with-param name="content" select="typifiedObject"/>
            <xsl:with-param name="initialContent" select="typifiedObject"/>
            <xsl:with-param name="objectURL" select="$objectURL"/>
            <xsl:with-param name="path" select="$baseURL"/>
            <xsl:with-param name="typeActionName" select="$typeActionName"/>
            <xsl:with-param name="position" select="$position"/>
        </xsl:call-template>-->













        <link rel="stylesheet" href="../../core/css/fp2.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="../../core/css/fp_proj.css" type="text/css" media="screen" />
        <link rel="stylesheet" href="../../core/css/galleria.miniml.css" type="text/css" media="screen" />

                    <div class="clear"></div>

                    <div class="accordion" id="accordion">

                        <!--  menu group -->

                        <div class="accordion-group" id="menugroup">

                            <div id="menu" class="accordion-body collapse">
                                <div class="accordion-inner proj" id="menugroup">
                                    <div class="subcol idcol ">
                                        <ul class="smenu" >
                                            <li><a href="../../profile/the-way-we-work/">The Way we Work</a></li>
                                            <li><a href="../../profile/integrated-design/">Integrated Design</a></li>

                                            <li><a href="../../profile/research-+-development/">Research + Development</a></li>
                                            <li><a href="../../profile/sustainability/">Sustainability</a></li>
                                        </ul>
                                    </div>
                                    <div class="subcol ">
                                        <ul class="smenu" >
                                            <li><a href="../../projects/type/">Type</a></li>
                                            <li><a href="../../projects/map/">Map</a></li>

                                            <li><a href="../../projects/on-site/">On Site</a></li>
                                            <li><a href="../../projects/list/">List</a></li>
                                            <li><a href="../../projects/stored/">Stored Projects</a></li>
                                        </ul>
                                    </div>

                                    <div class="subcol tmenu">
                                        <ul class="smenu" >
                                            <li><a href="../../team/senior-partners/">Senior Partners</a></li>

                                            <li><a href="../../team/partners/">Partners</a></li>
                                            <li><a href="../../team/associate-partners/">Associate Partners</a></li>
                                            <li><a href="../../team/associates/">Associates</a></li>
                                        </ul>
                                    </div>
                                    <div class="subcol dmenu">
                                        <ul class="smenu" >
                                            <li><a href="../../practice-data/awards/">Awards</a></li>

                                            <li><a href="../../practice-data/competitions/">Competitions</a></li>
                                            <li><a href="../../practice-data/exhibitions/">Exhibitions</a></li>
                                            <li><a href="../../practice-data/publications/">Publications</a></li>
                                            <li><a href="../../practice-data/essays/">Essays</a></li>
                                            <li><a href="../../practice-data/videos/">Videos</a></li><li><a href="../../practice-data/cser/">CSER</a></li>
                                        </ul>

                                    </div>
                                    <div class="subcol carmenu">
                                        <ul class="smenu" >
                                            <li><a href="../../careers/graduate-show/">Graduate Show</a></li>
                                            <li><a href="../../careers/scholarship">Scholarship</a></li>
                                        </ul>
                                    </div>
                                    <div class="subcol conmenu">

                                        <ul class="smenu" >
                                            <li class="smenu"><a href="../../contact/london/">London</a></li><li class="smenu"><a href="../../contact/new-york/">New York</a></li><li class="smenu"><a href="../../contact/madrid/">Madrid</a></li><li class="smenu"><a href="../../contact/hong-kong/">Hong Kong</a></li><li class="smenu"><a href="../../contact/beijing/">Beijing</a></li><li class="smenu"><a href="../../contact/abu-dhabi/">Abu Dhabi</a></li><li class="smenu"><a href="../../contact/shanghai/">Shanghai</a></li>		  	   </ul>
                                    </div>
                                    <div class="subcol newscol ">
                                        <ul class="smenu" >
                                            <li><a href="../../news/archive/">Archive</a></li>

                                            <li><a href="../../news/pressroom/">Pressroom</a></li>
                                            <li id="smenu">&nbsp;</li>
                                            <li id="smenu">&nbsp;</li>
                                            <li id="smenu">&nbsp;</li>
                                            <li id="smenu">&nbsp;</li>
                                            <li><div class="tw16 soc"></div><div class="fb16 soc"></div><div class="li16 soc"></div><div class="yt16 soc"></div><div class="we16 soc"></div><div class="rss16 soc"></div></li>
                                        </ul>
                                    </div>


                                </div>
                            </div>
                        </div>

                        <!-- .end menu group -->
                        <!-- .end nav -->





                        <div class="accordion-group ">

                            <div class="accordion-heading proj ">

                                <a class="accordion-toggle noclick" >

                                    <h3 class="select"><span class="up">Projects</span> &nbsp;<span class="pipe">/</span> <span class="wherefrom"></span> Masdar Institute&nbsp;&nbsp;<span class="date">&nbsp;Abu Dhabi, United Arab Emirates&nbsp; 2007-2010</span></h3>

                                </a>

                            </div>

                        </div> <!-- .accordion-group -->




                    </div><!-- .accordion -->

                    <div id="galleryouter"><div id="pgallery">

                        <img src='../../data/projects/1605/img0.jpg' ><img src='../../data/projects/1605/img1.jpg' ><img src='../../data/projects/1605/img2.jpg' ><img src='../../data/projects/1605/img3.jpg' >
                    </div></div>

                    <div class="pdfbar">

                        <a href="gallery/"><div class="pdfbarbutt prj "><p class="smltext">View Image Gallery</p></div></a><a href="../../core/pdf/project/?id=1605"><div class="pdfbarbutt gal "><p class="smltext">Download Project PDF</p></div></a>
                    </div> <!-- .pdfbar -->



                    <div class="accordion" id="groups">

                        <div class="accordion-group conc " >
                            <div class="accordion-heading proj ">
                                <a class="accordion-toggle clickable arrowhead " data-toggle="collapse" href="#description">
                                    <h4>Description</h4>
                                </a>

                            </div>
                            <div id="description" class="accordion-body collapse backin">
                                <div class="accordion-inner ">
                                    <div class='column '><p>The Masdar Institute is the first part of the wider Masdar City masterplan to be realised and creates an educational focus for the entire programme. The Institute embodies the principles and goals of Masdar to create a prototypical and sustainable city and is the first building of its kind to be powered entirely by renewable solar energy. The design incorporates a variety of passive and active environmental strategies and will be used as a test-bed for the sustainable technologies that will be explored for implementation in future Masdar City buildings.</p><p>The Institute's residences and laboratories are oriented to shade both the adjacent buildings and the pedestrian streets below and the facades are also self-shading. Over 5,000 square metres of roof-mounted photovoltaic installations provide power and further protection from the direct sun.</p></div><div class='column second '><p>A 10-megawatt solar field within the masterplan site provides 60 per cent more energy than is consumed by the Masdar Institute, all of which can be fed back to the Abu Dhabi grid. The campus will also use significantly less energy and water than average modern buildings in the UAE. Horizontal and vertical fins and brises soleil shade the laboratories, which have highly flexible 'plug and play' services to encourage interdisciplinary research. The laboratory facades are formed from highly insulative inflatable ETFE cushions, which remain cool to the touch under the intense desert sun. Cooling air currents are directed through the public spaces using a contemporary interpretation of the region's traditional wind towers, and green landscaping and water provide evaporative cooling.</p><p>The laboratories and residential accommodation are supported by a variety of social spaces, including a gymnasium, canteen, café, knowledge centre, majlis - or meeting place - and landscaped areas that extend the civic realm.</p></div><div class='column '><p>One, two and three-bedroom apartments are housed in low-rise, high-density blocks, which provide a social counterpoint to the research environment. Windows in the residential buildings are protected by a contemporary reinterpretation of mashrabiya, a type of latticed projecting oriel window, constructed with sustainably developed, glass-reinforced concrete and coloured with local sand to integrate with its desert context and to minimise maintenance. The perforations for light and shade are based on the patterns found in the traditional architecture of Islam.</p></div>
                                </div>
                            </div>
                        </div> <!-- .accordion description -->


                        <div class="accordion-group conc " ><div class="accordion-heading proj " id="load0"  ><a class="accordion-toggle clickable arrowhead " data-toggle="collapse" href="#images0"><h4>Sketches + Drawings</h4></a></div><div class="container0" id="images0" ></div></div><div class="accordion-group conc " ><div class="accordion-heading proj " id="load1"  ><a class="accordion-toggle clickable arrowhead " data-toggle="collapse" href="#images1"><h4>Development</h4></a></div><div class="container1" id="images1" ></div></div><div class="accordion-group conc " ><div class="accordion-heading proj " id="load2"  ><a class="accordion-toggle clickable arrowhead " data-toggle="collapse" href="#images2"><h4>Construction</h4></a></div><div class="container2" id="images2" ></div></div><div class='accordion-group conc '><div class='accordion-heading proj '><a class='accordion-toggle clickable arrowhead ' data-toggle='collapse' href='#sustainability'><h4>Sustainability</h4></a></div><div id='sustainability' class='accordion-body collapse backin'><div class='accordion-inner'><div class="column sust "><h4 class="select">Site + Climate</h4><p>The city grid is angled to minimise solar penetration of the streetscape. It also helps capture and funnel prevailing winds, to cool the masterplan.</p></div><div class="column sust "><h4 class="select">Form + Massing</h4><p>The orientation of the buildings was designed to optimise street shading and provide overshadowing to adjacent buildings, which helps to keep them cool. The design of the façade means that, while buildings are in close proximity to their neighbours, there is still a feeling of privacy, as they do not overlook each other.</p></div><div class="column sust "><h4 class="select">Passive Design</h4><p>Insulated facades to all buildings within the masterplan and balconies with solar screens in residential blocks, provide protection from direct solar access. In the atria, a thermal stack and exposed thermal mass, help to provide passive cooling.</p></div><div class="clear "></div><div class="column sust "><h4 class="select">Environmental Systems</h4><p>Each building contains advance environmental systems to maximise comfort whilst minimising energy usage. These include advanced fan coil units; active chilled beams with air sensing technology to reduce air change rates; low energy lighting fittings; advanced frictionless chillers and full heat and coolth recovery from exhaust air.</p></div><div class="column sust "><h4 class="select">Renewable Energy</h4><p>A rooftop PV array helps provide the electricity requirements of the buildings whilst shading the roof to limit solar heat gains.</p></div><div class="column sust "><h4 class="select">Energy Infrastructure</h4><p>A near site 50MW PV array and concentrated solar power plant help provide the energy requirements of Masdar.</p></div><div class="clear "></div><div class="column sust "><h4 class="select">Mobility + Connectivity</h4><p>The city was designed for a healthy lifestyle by encouraging walking, through improving the microclimate and the positioning of lifts to encourage stair use. Masdar is a car free city. An electronic personal rapid transit (PRT) system transports people around the development in a specially designed undercroft.</p></div><div class="column sust "><h4 class="select">Materials + Waste</h4><p>Low carbon concrete with cement replacement. Full on-site waste segregation and recycling in construction helped to minimise waste sent to landfill. Prefabrication of key façade elements and bathroom pods helped to reduce construction waste. 100% certified timber was used in the library structure and palmwood used for the screens. A lifecycle analysis methodology was followed throughout the material selection process.</p></div><div class="column sust "><h4 class="select">Water</h4><p>Potable water usage was minimised, using low flow fixtures and fittings. Water was then recycled, including condensate for non-potable water uses. Species used in landscaping were carefully chosen to minimise irrigation requirements.</p></div><div class="clear "></div><div class="column sust "><h4 class="select">Land + Ecology</h4><p>Landscaping and ecology were used intelligently across the streetscape to provide both shade and cooling through the natural process of evapotranspiration. To minimise the impact of the development, Masdar is an example of a high-density, low-rise development.</p></div><div class="column sust "><h4 class="select">Culture + Heritage</h4><p>The road layout was a response to the traditional Arabic walled town. Arabic geometry was used widely throughout the design of the buildings, including in the privacy and shading screens on the balconies and in the detailing of the facades. A windtower in the courtyard draws upon historic precedent, whilst using the latest technologies to help cool the external area.</p></div><div class="column sust "><h4 class="select">Wellbeing</h4><p>The design has an enhanced microclimate through shade, material selection for thermal mass, wind movement and evaporative cooling from water features and the windtower. Within the buildings, the creation of buffer spaces between indoor and outdoor areas helps to reduce the thermal shock from travelling through air conditioned buildings to the midday heat of Abu Dhabi.</p></div><div class="clear "></div><div class="column sust "><h4 class="select">Prosperity</h4><p>Masdar is designed to be a cleantech hub, attracting universities and companies alike, that are developing innovative sustainable technologies. Bringing new businesses and skills to the region.</p></div><div class="column sust "><h4 class="select">Planning for Change</h4><p>The structure in Phase 1 is designed to be flexible, allowing for residential areas to be converted into labs, or vice versa.</p></div><div class="column sust "><h4 class="select">Performance in Use</h4><p>After phase 1 was completed a microclimate post-occupancy evaluation was conducted. This showed measurable improvement in felt comfort, compared to downtown Abu Dhabi. The Masdar Institute of Science and Technology are studying a number of renewable technologies for applicability in the desert, including the performance implications of sand collecting on PV arrays.</p></div><div class="clear "></div></div></div></div>

                        <div class="accordion-group">
                            <div class="accordion-heading proj ">
                                <a class="accordion-toggle clickable arrowheadup " data-toggle="collapse" href="#factsnfigures">
                                    <p>Facts + Figures</p>
                                </a>
                            </div>
                            <div id="factsnfigures" class="accordion-body collapse in backin">
                                <div class="accordion-inner">

                                    <div class='column '>

                                        <div class="storebox"><p><a href="javascript:void(0)">Add project to Stored Projects?</a><br/>&nbsp;</p></div><p><span class='hilite'>Appointment:</span> 2007<br/><span class='hilite'>Construction start:</span> 2009<br/><span class='hilite'>Completion:</span> 2010<br/><p><span class='hilite'>Area:</span> 4 000 m&sup2;<br/></p><p><span class='hilite'>Client:</span> Mubadala Development Company<br/><br/><span class='hilite'>Structural Engineer:</span> Adams Kara Taylor<br/><span class='hilite'>M+E Engineer:</span> PHA Consult<br/><br/><span class='hilite'>Additional Consultants:</span> Gillespies, Claude Engle Lighting Design, RFD, Decarbon8, Systematica, Lerch Bates, Arup, Sandy Brown, WS Atkins, Acentech, RWDI, Mott MacDonald, RW Armstrong</p></div><div class="column second"><p class='hilite'>Award</p><ul><li>RIBA International Award – Masdar Institute</li></ul><div class='clear'></div><p class='hilite'>Related Press Releases</p><p><a href='../../news/success-at-riba-awards-2011/'>Success at RIBA Awards 2011<br/></a><span class='muted'>19.05.2011</span></p><p><a href='../../news/official-opening-of-the-masdar-institute-campus-first-solar-powered-building-at-masdar-city/'>Official opening of the Masdar Institute campus, first solar powered building at Masdar City<br/></a><span class='muted'>23.11.2010</span></p></div><div class='column '><p><a href='http://maps.google.com/maps?ll=24.42916,54.61833' target='_blank'>Get directions</a></p><iframe frameBorder='0' border='0' style='border:0;' id='map' src='../loc.php/?l=24.42916,54.61833&id=1605' scrolling='no' ></iframe><div class='clear'></div><div class='mapframe'></div>

                                </div> <!-- end lastcolumn -->

                                </div>
                            </div>
                        </div>

                    </div> <!-- .accordion -->

                    <div class="relatedbar"><a href="../newport-school/" title=""><div class="pdfbarbutt projbutt typebutt related"><p class="prelated nxt rite smltext ">Newport School</p></div></a><a href="../lycee-albert-camus/" title=""><div class="pdfbarbutt projbutt typebuttprev related"><p class="prelated prv smltext ">Lycée Albert Camus</p></div></a><a href="../type/health-+-education/#sortBy=chrono" ><div class="related midrelated "><p class="muted smltext ">All <span class="hilite">Health + Education</span> Projects</p></div></a></div><div class="clear"></div><div class="relatedbar"><a href="../mclaren-production-centre/" title=""><div class="pdfbarbutt projbutt typebutt related"><p class="prelated nxt rite smltext ">McLaren Production Centre</p></div></a><a href="../leslie-l-dan-pharmacy-building/" title=""><div class="pdfbarbutt projbutt typebuttprev related"><p class="prelated prv smltext ">Leslie L. Dan Pharmacy Building</p></div></a><a href="../type/research-+-development/#sortBy=chrono" ><div class="related midrelated "><p class="muted smltext ">All <span class="hilite">Research + Development</span> Projects</p></div></a></div><div class="clear"></div>

                    <!-- Put related buttons in here -->






            <!-- scripts -->

            <script type="text/javascript" src="../../core/js/head.min.js"></script>

            <script type="text/javascript">

                var ADAPT_CONFIG = { path: '../../core/css/', dynamic: false, range: ['0 to 1220 = fp.tab.001.css']};

                head.js(

                "../../core/js/fp_scripts.001.js",
                "../../core/js/autocolumn.js",
                "../../core/js/jquery.color.js",
                "../../core/js/galleria-1.2.9.min.js",
                "../../core/js/galleria.miniml.min.js",
                "../../core/js/jquery.isotope.min.js",
                "../../core/js/jquery.cookie.js",
                "../../core/js/adapt.min.js",
                "../../core/js/project.video.js",

                function() {

                $from = $.cookie('ptype');

                if ($from != null) {

                if ($from == 'map') {

                $('.wherefrom').append(' &nbsp;<span class="addnav">Map</span>&nbsp; <span class="pipe">/</span>&nbsp;');
                $(".addnav").click(function() { window.location.href = "../map/"; });

                } else if ($from == 'onsite') {

                $('.wherefrom').append(' &nbsp;<span class="addnav">On Site</span>&nbsp; <span class="pipe">/</span>&nbsp;');
                $(".addnav").click(function() { window.location.href = "../on-site/"; });

                } else if ($from == 'list') {

                $('.wherefrom').append(' &nbsp;<span class="addnav">List</span>&nbsp; <span class="pipe">/</span>&nbsp;');
                $(".addnav").click(function() { window.location.href = "../list/"; });

                } else if ($from.substring(0, 4) == 'type') {

                $mytype = $from.substring(4, $from.length)
                $myname = $mytype.replace('-+-',' + ').replace('-',' ');

                if ($from == 'type') {

                $('.wherefrom').append(' &nbsp;<span class="addnav">Type</span>&nbsp; <span class="pipe">/</span>&nbsp;');

                } else {

                $('.wherefrom').append(' &nbsp;<span class="addnav">Type</span>&nbsp; <span class="pipe">/</span> &nbsp;<span class="typenav">'+$myname+'</span>&nbsp; <span class="pipe">/</span>&nbsp;');


                $(".typenav").click(function() { window.location.href = "../type/"+$mytype.toLowerCase()+"/"; });

                $('.typenav').hover(function(){
                $(this).css('cursor', 'pointer');
                $(this).stop().animate({ color:'#ffffff'}, "fast");
                }, function() {
                $(this).stop().delay(256).animate({color:'#b4e114'}, "slow");
                });

                /// currently removes the subtype so when you click on next project... ////
                $.cookie('ptype', 'type', { expires: 1, path: '/' });

                }

                $(".addnav").click(function() { window.location.href = "../type/"; });

                }
                }


                $('.addnav').hover(function(){
                $(this).css('cursor', 'pointer');
                $(this).stop().animate({ color:'#ffffff'}, "fast");
                }, function() {
                $(this).stop().delay(256).animate({color:'#b4e114'}, "slow");
                });

                // v1.01

                var load0 = false;
                var load1 = false;
                var load2 = false;

                $("#load0").click(function() {
                if (load0 == false) {
                load0 = true;
                var $newItems = $("<div class='element click w885 t588 thumb'><img src='../../data/projects/1605/drawings/img0.jpg' width='100%' height='100%'/></div><div class='element click w885 t588 thumb'><img src='../../data/projects/1605/drawings/img1.jpg' width='100%' height='100%'/></div><div class='element click w885 t588 thumb'><img src='../../data/projects/1605/drawings/img2.jpg' width='100%' height='100%'/></div><div class='element click w885 t588 thumb'><img src='../../data/projects/1605/drawings/img3.jpg' width='100%' height='100%'/></div><div class='element click w885 t588 thumb'><img src='../../data/projects/1605/drawings/img4.jpg' width='100%' height='100%'/></div>");
                var $containera = $('.container0');
                $containera.append( $newItems ).isotope( 'addItems', $newItems );
                $containera.isotope({itemSelector: '.element', masonry : {columnWidth : 99}});
                //	$container.isotope('reLayout');
                }
                });

                $("#load1").click(function() {
                if (load1 == false) {
                load1 = true;
                var $newItems = $("<div class='element click w588 t390 thumb'><img src='../../data/projects/1605/development/img0.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/development/img1.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/development/img2.jpg' width='100%' height='100%'/></div>");
                var $containerb = $('.container1');
                $containerb.append( $newItems ).isotope( 'addItems', $newItems );
                $containerb.isotope({itemSelector: '.element', masonry : {columnWidth : 99}});
                //	$container.isotope('reLayout');
                }
                });

                $("#load2").click(function() {
                if (load2 == false) {
                load2 = true;
                var $newItems = $("<div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img0.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img1.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img2.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img3.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img4.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img5.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img6.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img7.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img8.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img9.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img10.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img11.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img12.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img13.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img14.jpg' width='100%' height='100%'/></div><div class='element click w588 t390 thumb'><img src='../../data/projects/1605/construction/img15.jpg' width='100%' height='100%'/></div>");
                var $containerc = $('.container2');
                $containerc.append( $newItems ).isotope( 'addItems', $newItems );
                $containerc.isotope({itemSelector: '.element', masonry : {columnWidth : 99}});
                //	$container.isotope('reLayout');
                }
                });

                $(".pdfbarbutt.projbutt.typebutt.related, .pdfbarbutt.projbutt.typebuttprev.related").hover(
                function () {
                $(this).children('p').fadeIn(64);
                },
                function () {
                $(this).children('p').fadeOut('slow');
                }
                );

                var current_width = $(window).width();

                if(current_width > 1220){

                $('#pgallery').toggle().galleria({
                imagePosition:'left center', width:1182, height: 739, transition: "fade",  initialTransition: "fade", touchTransition:"slide", imageCrop: false, carousel: false, imagePan: false, clicknext: true, fullscreenDoubleTap: false});

                } else {

                $('#pgallery').toggle().galleria({
                imagePosition:'left center', width:885, height: 553, transition: "fade", initialTransition: "fade", touchTransition:"slide", imageCrop: false, carousel: false, imagePan: false, clicknext: true, fullscreenDoubleTap: false});

                }

                Galleria.ready(function() {
                var gallery = this;
                <!--this.push({ image: "../../data/projects/1605/img4.jpg" },{ image: "../../data/projects/1605/img5.jpg" },{ image: "../../data/projects/1605/img6.jpg" },{ image: "../../data/projects/1605/img7.jpg" },{ image: "../../data/projects/1605/img8.jpg" },{ image: "../../data/projects/1605/img9.jpg" },{ image: "../../data/projects/1605/img10.jpg" },{ image: "../../data/projects/1605/img11.jpg" },{ image: "../../data/projects/1605/img12.jpg" },{ image: "../../data/projects/1605/img13.jpg" },{ image: "../../data/projects/1605/img14.jpg" },{ image: "../../data/projects/1605/img15.jpg" },{ image: "../../data/projects/1605/img16.jpg" },{ image: "../../data/projects/1605/img17.jpg" },{ image: "../../data/projects/1605/img18.jpg" },{ image: "../../data/projects/1605/img19.jpg" });$dotsholder = $(".galleria-dots");$dotsholder.append('<div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div><div class=\"\"></div>');-->


        });

        $(".storebox").click(function() {
        var temp = $.cookie('stored');
        var newtemp = temp+'1605';
        $.cookie('stored', newtemp, { expires: 364, path: '/' });
        $('div.storebox').replaceWith('<div class="storebox"><p class="stored">Project stored.<br/><a href="../stored">Click here for Stored Projects</a></p></div>');
        });

        var $containera = $('.container0');

        $containera.delegate( '.element.click', 'click', function(){
        $(this).toggleClass('thumb');
        $containera.isotope('reLayout');
        });

        var $containerb = $('.container1');

        $containerb.delegate( '.element.click', 'click', function(){
        $(this).toggleClass('thumb');
        $containerb.isotope('reLayout');
        });

        var $containerc = $('.container2');

        $containerc.delegate( '.element.click', 'click', function(){
        $(this).toggleClass('thumb');
        $containerc.isotope('reLayout');
        });

        $('.conc').toggle();

        }); // end head

        </script>

        <!-- end scripts -->

        
        
    </xsl:template>

    


    

</xsl:stylesheet>