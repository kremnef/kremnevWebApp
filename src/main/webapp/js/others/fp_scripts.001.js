// Google Analytics

var _gaq = _gaq || []; 
_gaq.push(['_setAccount', 'UA-5906878-1']); 
_gaq.push(['_trackPageview']);

(function() { 
  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; 
  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js'; 
  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); 
})();

$(".srch").click(function(event) {
      $(this).stop().toggleClass("greysrch");
});

$(".clickable").click(function() {
	  $(this).stop().toggleClass("arrowhead");  
	  $(this).stop().toggleClass("arrowheadup"); 
});

// navigation menu
$('.subcol a').hover(function(){
    $(this).stop().animate({ color:'#b4e114'}, "fast");
}, function() {
    $(this).stop().delay(256).animate({color:'#bbbbbb'}, "slow");
});

$(".up").click(function() { window.location.href = "../"; });
$(".upx").click(function() { window.location.href = "../../"; });
$(".upxx").click(function() { window.location.href = "../../../"; });

// main headings
$('a.headline').hover(function(){
    $(this).stop().animate({ color:'#ffffff'}, "fast");
}, function() {
    $(this).stop().animate({color:'#cccccc'}, "fast");
});

jQuery(".closevideos").click(function() {
 	$('div.videoholderInner').replaceWith('<div class="videoholderInner"></div>');
});

$('.column a, .bio a').hover(function(){
	$(this).css('cursor', 'pointer');
    $(this).stop().animate({ color:'#b4e114'}, "fast");
}, function() {
    $(this).stop().delay(256).animate({color:'#ffffff'}, "slow");
});

$('.up, .upx').hover(function(){
	$(this).css('cursor', 'pointer');
    $(this).stop().animate({ color:'#ffffff'}, "fast");
}, function() {
    $(this).stop().delay(256).animate({color:'#b4e114'}, "slow");
});

$('.clickable, table.txt, .news, .video, .biobutton, .biobuttonpdf, .pdfbarbutt, .midrelated').hover(function(){
    $(this).stop().animate({ backgroundColor:'#27282c'}, 0);
}, function() {
    $(this).stop().delay(256).animate({backgroundColor:'#1c1c1c'}, "slow");
});

$('.news, .video, .exh').hover(function(){
    $(this).stop().animate({ backgroundColor:'#505155'}, 0);
}, function() {
    $(this).stop().delay(256).animate({backgroundColor:'#1c1c1c'}, "slow");
});

$(".tw16").click(function() {
	window.open('http://twitter.com/FosterPartners', '_blank')
});

$(".fb16").click(function() {
	window.open('http://www.facebook.com/fosterpartners', '_blank')
});

$(".li16").click(function() {
	window.open('http://www.linkedin.com/company/foster-&-partners', '_blank')
});

$(".yt16").click(function() {
	window.open('http://www.youtube.com/user/FOSTERANDPARTNERS1', '_blank')
});

$(".we16").click(function() {
	window.open('http://e.weibo.com/u/3040745577?type=0', '_blank')
});

$(".rss16").click(function() {
	window.open('http://www.fosterandpartners.com/feed.xml', '_blank')
});


<!--

function smt(loc) {
	if (loc == 'ny') {
        locationstring = 'mai' + 'lto:' + 'newy' + 'ork' + 'info' + '@'+'fostera' + 'ndpartne' + 'rs.com';		
	} else if (loc == 'md') {
        locationstring = 'mai' + 'lto:' + 'mad' + 'rid' + 'info' + '@'+'fos' + 'terandpartne' + 'rs.com';		
	} else if (loc == 'hk') {
        locationstring = 'mai' + 'lto:' + 'hongko' + 'ng' + 'info' + '@'+'foste' + 'randpa' + 'rtners.com';		
	} else if (loc == 'be') {
        locationstring = 'mai' + 'lto:' + 'beij' + 'ingi' + 'nfo' + '@'+'fos' + 'terandpartn' + 'ers.com';		
	} else if (loc == 'ab') {
        locationstring = 'mai' + 'lto:' + 'ab' + 'udhabii' + 'nfo' + '@'+'fost' + 'erand' + 'partners.com';		
	} else if (loc == 'sh') {
        locationstring = 'mai' + 'lto:' + 'sha' + 'nghaii' + 'nfo' + '@'+'foste' + 'randpart' + 'ners.com';
	}  
     window.location.replace(locationstring);
}

//-->


