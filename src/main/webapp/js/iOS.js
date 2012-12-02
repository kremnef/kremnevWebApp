if (navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPad/i)) {
    document.write('<style type="text/css">#swf{display:none;}</style>')
}
else document.write('<style type="text/css">#no-swf{display:none;}</style><script src="js/swfobject.js" type="text/javascript"></script>')