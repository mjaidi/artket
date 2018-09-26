function i18n(e){var t=window.i18n_local,n=window.i18n_global;return void 0===t&&void 0===n?"":void 0!==t&&void 0!==t[e]?t[e]:n[e]}var UTIL=function(){function e(e){if(f||n())f=!0,e();else{var t=function(){n()&&(f=!0,window.removeEventListener("load",e),document.removeEventListener("readystatechange",t),e())};document.addEventListener("readystatechange",t),window.addEventListener("load",e)}}function n(){return"complete"===document.readyState||"loading"!==document.readyState&&!document.documentElement.doScroll}function t(e,t){e.classList?e.classList.add(t):e.className+=" "+t}function o(e,t){e.classList?e.classList.remove(t):e.className=e.className.replace(new RegExp("(^|\\b)"+t.split(" ").join("|")+"(\\b|$)","gi")," ")}function a(e,t){return e.classList?e.classList.contains(t):new RegExp("(^| )"+t+"( |$)","gi").test(e.className)}function i(e){try{var t=new CustomEvent(e)}catch(n){(t=document.createEvent("CustomEvent")).initCustomEvent(e,!0,!0,null)}document.dispatchEvent(t)}function r(){return null===h||h===undefined?h=document.querySelector('meta[name="csrf-token"]').getAttribute("content"):h}function s(e){var t=new XMLHttpRequest;return t.open("GET",e,!0),t.setRequestHeader("X-CSRF-Token",r()),t.setRequestHeader("Accept","text/javascript, application/javascript, application/ecmascript, application/x-ecmascript, */*; q=0.01"),t.setRequestHeader("X-Requested-With","XMLHttpRequest"),t}function d(e,t,n){var o=new XMLHttpRequest;return o.open("GET",e,!0),o.setRequestHeader("X-CSRF-Token",r()),o.onreadystatechange=function(){4===o.readyState&&(200<=o.status&&o.status<400?t(o.responseText):n(o.responseText))},o.send(),o}function l(e){var t=("; "+document.cookie).split("; "+e+"=");if(2==t.length)return t.pop().split(";").shift()}function c(e){g=e}function u(){return g||!1}var g,h,f=!1;return{ready:e,addClass:t,removeClass:o,hasClass:a,triggerEvent:i,getCsrfToken:r,scriptRequest:s,getRequest:d,setSignedIn:c,isSignedIn:u,getCookie:l}}(),ENDLESS_SCROLLING=function(){function init(){document.querySelector(SELECTOR_NEXT_PAGE)&&(elPagination=document.querySelector(SELECTOR_PAGINATION))&&(seed=elPagination.getAttribute("data-seed"),setBottomThreshold(),restoreState(),checkIfNearBottom(),bindEvents())}function terminate(){unbindEvents()}function setBottomThreshold(){document.querySelector(".footer")&&(bottomThreshold+=BOTTOM_THRESHOLD_FOOTER_ADDITION)}function bindEvents(){document.addEventListener("scroll",checkIfNearBottom),window.addEventListener("beforeunload",saveScrollPosition)}function unbindEvents(){document.removeEventListener("scroll",checkIfNearBottom),window.removeEventListener("beforeunload",saveScrollPosition)}function checkIfNearBottom(){if(0===loadingPages.length&&window.pageYOffset+window.innerHeight>document.body.scrollHeight-bottomThreshold){var e=document.querySelector(SELECTOR_NEXT_PAGE);if(!e)return;var t=e.getAttribute("href");if(!t)return;bottomThreshold<=BOTTOM_THRESHOLD_SMALL+BOTTOM_THRESHOLD_FOOTER_ADDITION&&(bottomThreshold+=BOTTOM_THRESHOLD_ADDITION),UTIL.removeClass(document.querySelector(SELECTOR_LOADING_BAR),"hidden");var n,o=t+"&format=js";if(history.state!==undefined)null!==history.state&&history.state.pages?n=history.state:(n={pages:[]},history.state&&history.state.activeHomeTab&&(n.activeHomeTab=history.state.activeHomeTab)),n.pages.push(o),history.replaceState(n,"");loadPage(o)}}function restoreState(){if(history.state&&history.state.pages&&0<history.state.pages.length){if(seed!=history.state.seed&&3<history.state.pages.length)return;for(var t=0;t<history.state.pages.length;t++)loadPage(history.state.pages[t]);document.addEventListener("new-page",function e(){0==loadingPages.length&&(document.removeEventListener("new-page",e),window.scrollTo(0,history.state.pos))})}}function saveScrollPosition(){if(history.state&&history.state.pages){var e=history.state;e.pos=window.pageYOffset,e.seed=seed,history.replaceState(e,"")}}function loadPage(url){url+="&seed="+seed;var index=loadingPages.length;loadingPages.push(url);var request=UTIL.scriptRequest(url);request.onload=function(){if(loadingPages.splice(loadingPages.indexOf(url),1),loadedPages[index]=request.responseText,0==loadingPages.length){for(var i=0;i<loadedPages.length;i++)elPagination.innerHTML="",eval(loadedPages[i]);loadedPages=[],UTIL.addClass(document.querySelector(SELECTOR_LOADING_BAR),"hidden"),UTIL.triggerEvent("new-page")}},request.send()}var SELECTOR_NEXT_PAGE=".pagination .next_page",SELECTOR_PAGINATION=".js-pagination",elPagination,seed;return SELECTOR_LOADING_BAR=".js-loading",BOTTOM_THRESHOLD_SMALL=600,BOTTOM_THRESHOLD_FOOTER_ADDITION=280,BOTTOM_THRESHOLD_ADDITION=500,bottomThreshold=BOTTOM_THRESHOLD_SMALL,loadingPages=[],loadedPages=[],UTIL.ready(init),{init:init,terminate:terminate}}();!function(){function e(){var e=document.createElement("script");e.src="/assets/app-async-e63caa0821996d928364d37da60afdf8097147b5d2cbf9547186462846bdcc45.js",document.body.appendChild(e)}UTIL.ready(e)}(),function(){function e(){var e=UTIL.getCookie("locale"),t=window.location.pathname;e&&"en"!==e&&"/"===t&&"locale=en"!==window.location.search.substring(1)?window.location.replace("/"+e+"/"):n()}function n(){var e=document.documentElement.getAttribute("lang");document.cookie="locale="+e+"; expires="+t()+"; path=/"}function t(){var e=new Date;return e.setTime(e.getTime()+63072e7),e.toUTCString()}UTIL.ready(e)}(),function(){function e(){"true"==localStorage.getItem("newsletterSubscribed")&&UTIL.addClass(document.body,"newsletter-subscribed")}UTIL.ready(e)}(),/(\?nc|&nc)$/.test(document.location.href)&&history.replaceState({},document.title,document.location.href.replace(/(\?nc|&nc)$/,""));var rowGrid=function(e,t){function n(e){for(var t=[e];(e=e.nextSibling)&&9!==e.nodeType;)1===e.nodeType&&t.push(e);return t}function o(e,t,n){var o=0,a=[],i=(n=Array.prototype.slice.call(n||e.querySelectorAll(t.itemSelector))).length;singleImagePerRow=!!window.matchMedia&&!window.matchMedia("(min-width:"+t.minWidth+"px)").matches;for(var r,s,d,l=getComputedStyle(e),c=Math.floor(e.getBoundingClientRect().width)-parseFloat(l.getPropertyValue("padding-left"))-parseFloat(l.getPropertyValue("padding-right")),u=[],g=0;g<i;++g)(r=n[g].getElementsByTagName("img")[0])?((s=parseInt(r.getAttribute("width")))||r.setAttribute("width",s=r.offsetWidth),(d=parseInt(r.getAttribute("height")))||r.setAttribute("height",d=r.offsetHeight),u[g]={width:s,height:d}):(n.splice(g,1),--g,--i);for(var h=0;h<i;++h){if(n[h].classList?(n[h].classList.remove(t.firstItemClass),n[h].classList.remove(t.lastRowClass)):n[h].className=n[h].className.replace(new RegExp("(^|\\b)"+t.firstItemClass+"|"+t.lastRowClass+"(\\b|$)","gi")," "),o+=u[h].width,a.push(n[h]),h===i-1)for(var f=0;f<a.length;f++){0===f&&(a[f].className+=" "+t.lastRowClass);var m="width: "+u[h+parseInt(f)-a.length+1].width+"px;height: "+u[h+parseInt(f)-a.length+1].height+"px;";f<a.length-1&&(m+="margin-right:"+t.minMargin+"px"),a[f].style.cssText=m}if(o+t.maxMargin*(a.length-1)>c||singleImagePerRow){var p=o+t.maxMargin*(a.length-1)-c,v=a.length;if((t.maxMargin-t.minMargin)*(v-1)<p){var T=t.minMargin;p-=(t.maxMargin-t.minMargin)*(v-1)}else{T=t.maxMargin-p/(v-1);p=0}var w,y=null,S=0;for(f=0;f<a.length;f++){w=a[f];var L=u[h+parseInt(f)-a.length+1].width,E=L-L/o*p;y=y||Math.round(u[h+parseInt(f)-a.length+1].height*(E/L)),.5<=S+1-E%1?(S-=E%1,E=Math.floor(E)):(S+=1-E%1,E=Math.ceil(E));m="width: "+E+"px;height: "+y+"px;";f<a.length-1&&(m+="margin-right: "+T+"px"),w.style.cssText=m,0===f&&t.firstItemClass&&(w.className+=" "+t.firstItemClass)}a=[],o=0}}}if(null!==e&&e!==undefined)if("appended"===t){t=JSON.parse(e.getAttribute("data-row-grid"));var a=n(e.getElementsByClassName(t.lastRowClass)[0]);o(e,t,a)}else t?(t.minWidth===undefined&&(t.minWidth=0),t.lastRowClass===undefined&&(t.lastRowClass="last-row"),e.setAttribute("data-row-grid",JSON.stringify(t)),window.addEventListener("resize",function(){o(e,t)})):t=JSON.parse(e.getAttribute("data-row-grid")),o(e,t)};PhotoGrid=function(){function e(){(o=document.querySelector(".carbon-ad-in-photos img"))&&(n(),window.addEventListener("resize",n)),t(".photos")}function t(e){var t={minMargin:10,maxMargin:10,itemSelector:".photo-item",firstItemClass:"first-item",lastRowClass:"last-row",resize:!0,minWidth:426};rowGrid(document.querySelector(e),t)}function n(){var e=window.innerWidth,t=180;e<600?t=2*e:e<1e3?t=280:e<1100&&(t=240),o.setAttribute("width",t)}var o;return UTIL.ready(e),{init:t}}(),function(){function e(){(UTIL.getCookie("pexels_auth")||r())&&(UTIL.setSignedIn(!0),UTIL.ready(t)),l=!1}function t(){o(),a()}function n(e){var t=document.querySelector(".js-avatar");if(t){var n;try{n=e&&e.avatar||decodeURIComponent(UTIL.getCookie("avatar_url")||"")}catch(o){return}t.setAttribute("src",n)}}function o(){UTIL.addClass(document.body,"signed-in")}function a(){var e=r();e&&(i(e),n(e))}function i(e){var t=document.querySelector(".js-user-name");t&&(t.innerText=e.name)}function r(){var e=localStorage.user;if(!e)return s(),null;var t=JSON.parse(e);return t.avatar||s(),t}function s(){if(!l){l=!0;var e=new XMLHttpRequest;e.open("GET","/me/",!0),e.setRequestHeader("Accept","application/json, text/*"),e.onreadystatechange=function(){4===e.readyState&&200<=e.status&&e.status<400&&(d(e.responseText),a())},e.send()}}function d(e){var t;try{t=JSON.parse(e)}catch(o){return void console.log(o)}var n={name:t.first_name,hero:"no_hero"!==t.hero_status,avatar:t.avatar,photographer:t.photographer};localStorage.user=JSON.stringify(n)}var l=!0;e()}();var SponsoredPhotos=function(){function init(e){var t=(arguments.length<=0||e===undefined?document:e).querySelector(".js-sponsored-photos");t&&("false"!=t.getAttribute("data-load-on-init")?loadSponsoredPhotos(t):document.addEventListener("end-of-photos",function(){loadSponsoredPhotos(t)}))}function loadSponsoredPhotos(el){if(el&&!el.getAttribute("data-loaded")){var url=el.getAttribute("data-url"),request=UTIL.scriptRequest(url);request.onload=function(){document.body.contains(el)&&200<=request.status&&request.status<400&&(eval(request.responseText),el.setAttribute("data-loaded",!0))},request.send()}}function showInlineAd(){var e=document.querySelector(".js-sponsored-photos-inline");if(e){var t=document.querySelectorAll(".first-item"),n=t[t.length-1].previousElementSibling;n.style.marginBottom="252px",e.style.display="block",e.style.top=getTopOffset(n)+"px",window.addEventListener("resize",function(){e.style.display="none"})}}function getTopOffset(e){var t=document.body.getBoundingClientRect(),n=e.getBoundingClientRect();return n.top+n.height-t.top}return UTIL.ready(init),{init:init,loadSponsoredPhotos:loadSponsoredPhotos,showInlineAd:showInlineAd}}();