!function(o){var t=o.document;if(!location.hash&&o.addEventListener){o.scrollTo(0,1);var n=1,e=function(){return o.pageYOffset||"CSS1Compat"===t.compatMode&&t.documentElement.scrollTop||t.body.scrollTop||0},l=setInterval(function(){t.body&&(clearInterval(l),n=e(),o.scrollTo(0,1===n?0:1))},15);o.addEventListener("load",function(){setTimeout(function(){e()<20&&o.scrollTo(0,1===n?0:1)},0)},!1)}}(this);