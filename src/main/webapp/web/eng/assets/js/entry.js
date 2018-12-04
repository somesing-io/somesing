
function accordionOpener(e) {
  e.preventDefault();
  var chkSelected = $(this).parent(".accordion-list__item").hasClass("is-selected");
  var clickedLi = $(this).parent(".accordion-list__item");
  if(chkSelected) {
    clickedLi.removeClass("is-selected");
    clickedLi.children(".accordion-list__content").slideUp("100");
  } else {
    clickedLi.addClass("is-selected");
    clickedLi.children(".accordion-list__content").slideDown("100");
    clickedLi.siblings(".accordion-list__item").removeClass("is-selected");
    clickedLi.siblings(".accordion-list__item").children(".accordion-list__content").slideUp("100");
  }
};

function languageDown(e) {
  e.preventDefault();
  var $this = $(this);
  var $thisParent = $this.parent('.download-language__item').parent('.download-language__itembox').parent('.download-language__list').parent('.download-language__filebox'),
      $link = $thisParent.children(".js-target-href"),
      $textbox = $thisParent.children('.js-download-language'),
      $text = $thisParent.children('.js-download-language').children(".js-file-text");
  var thisText = $this.text(),
      thisSrc = $this.attr("href");
  $link.attr("href", thisSrc);
  $text.text(thisText);
  $textbox.toggleClass('is-selected');
  $this.parent('.download-language__item').siblings().children('.download-language__anchor').removeClass("is-selected");
  $this.addClass("is-selected");
  $this.closest(".download-language__list").removeClass("is-selected");
};

function popupClose(e){
  e.preventDefault();
  var $popup = $('.popup'),
      $videoPopup = $(".js-video-data"),
      $iframedata = $(".js-video-src");

  $("html").removeClass("js-overflow");
  $popup.removeClass("is-selected");

  if($videoPopup.length) {
    $iframedata.attr("src","");
  }

};

function popupOpen(e) {
  e.preventDefault();
  var $popup = $(this).attr("href"),
      videoPopup = $(this).data("youtube-src"),
      $videodata = $(".js-video-data"),
      $iframedata = $(".js-video-src"),
      videosrc = $(this).data("youtube-src");

  $("html").addClass("js-overflow");
  $($popup).addClass("is-selected");

  if($videodata.length) {
    $iframedata.attr("src",videosrc);
  }
}


function tabDetector() {
  $("body").find(".js-tab-menu").each(function(){
    var targetLink = $(this).children(".tab-menu__itembox").hasClass("is-unlink");
    if(!targetLink) {
      var tabCurrent = $(this).children(".tab-menu__itembox").children(".is-selected").children(".tab-menu__anchor").attr("href");
      $(tabCurrent).css({display:"block"});
    } else {
      $(this).siblings(".tab-contents").css({display:"block"});
    }
  });
};

function tabOpener(e) {
  var targetLink = $(this).parent(".tab-menu__item").parent(".tab-menu__itembox").hasClass("is-unlink");
  if(!targetLink) {
    var a = $(this).parent();
    a.siblings().removeClass("is-selected");
    b = a.attr("class");
    a.addClass("is-selected");
    c = a.children(".tab-menu__anchor").attr("href");
    a.parent(".tab-menu__itembox").parent(".tab-menu").siblings(".tab-contents").css({display:"none"});
    $(c).css({display:"block"});
    e.preventDefault();
  }
};
function tabNoOpener(e) {
  e.preventDefault();
};

$(function () {

  var $window = $(window),
    $document = $(document),
    $html = $('html'),
    $body = $('body');

  // gnb : s
  var $gnb = $('.gnb'),
      $gnbmenu = $(".js-gnb-menu-anchor"),
      $lang = $(".js-language-menu"),
      $langmenu = $(".gnb-util__language"),
      $down = $(".js-download-language"),
      $downmenu = $(".download-language__list"),
      $downfile = $(".js-download-language");

  $body.on( 'DOMMouseScroll mousewheel', function ( event ) {
    if( event.originalEvent.detail > 0 || event.originalEvent.wheelDelta < 0 ) {
      //scroll down
      $gnb.removeClass("is-fixed");
      $langmenu.removeClass('is-selected');
      $downmenu.removeClass('is-selected');
      $downfile.removeClass('is-selected');
    } else {
      //scroll up
      $gnb.addClass("is-fixed");
      $downmenu.removeClass('is-selected');
      $downfile.removeClass('is-selected');
    }
  });
  $gnbmenu.on("click", function(e){
    e.preventDefault();
    var $this = $(this),
        targetId = $this.attr("href"),
        tragetOffset = $(targetId).offset().top;
    $("body, html").animate({'scrollTop': tragetOffset}, 500);
  });
  $lang.on("click", function(e){
    e.preventDefault();
    $langmenu.toggleClass('is-selected');
  });

  $down.on("click", function(e){
    e.preventDefault();
    $(this).each(function () {
      $(this).siblings('.download-language__list').toggleClass('is-selected');
      $(this).toggleClass('is-selected');
    })
  });
  // gnb : e

  // lagnuage down : s

  $(".download-language").find(".js-download-file").bind("click", languageDown);

  // language down : e

  // accordion: s
  $(".js-accordion").find(".js-accordion-open").bind("click", accordionOpener);
  // accordion : e

  // popup : s
  $(".js-popup-open").bind("click", popupOpen);
  $(".js-popup-close").bind("click", popupClose);
  // popup : e

  // float button : s
  var $topBtnArea = $('.nav-float'),
    $topBtn = $topBtnArea.find('.js-btn-top');
  $topBtn.on('click', function(e) {
    e.preventDefault();
    $('body, html').animate({'scrollTop': 0}, 200, function(){
      $gnb.addClass('is-fixed');
    });

  });
  var topBtnScroll = function() {
    if($topBtnArea.length){
      var _$footer = $('.footer-container'),
        _$contents = $(".content-container");
      var _windowTop = $window.scrollTop(),
        _windowHeight = $window.height(),
        _margin = 100,
        _btnTop = $topBtnArea.offset().top,
        _contOffset = _$contents.offset().top,
        _btnTopLimit = _$footer.offset().top - ($topBtnArea.height() + _margin),
        _posBottom = _$footer.outerHeight() + _margin;
      if(_windowTop == 0) {
        $topBtnArea.removeClass('is-show');
        $topBtnArea.removeClass('is-keep');
        return false;
      }
      if($topBtnArea.hasClass('is-show') === false) {
        $topBtnArea.addClass('is-show');
      }
      if(_windowTop > 200) {
        $topBtnArea.addClass('is-keep');
      } else {
        $topBtnArea.removeClass('is-keep');
      }
      if(_btnTop >= _btnTopLimit && !$topBtnArea.hasClass('is-limit')) {
        $topBtnArea.addClass('is-limit').css('bottom', _posBottom);
        _btnTop = $topBtnArea.offset().top;
      }
      if(_windowTop + _windowHeight <= _btnTop + $topBtnArea.height() + _margin) {
        $topBtnArea.removeClass('is-limit').css('bottom', '');
      }
    }
  };
  // float: button : e

  // scroll btn : s
  var $scrollBtn = $(".js-btn-scroll");
  $scrollBtn.on("click", function(e){
    e.preventDefault();
    var $this = $(this),
        targetId = $this.attr("href"),
        tragetOffset = $(targetId).offset().top;
    $("body, html").animate({'scrollTop': tragetOffset}, 500);
  });
  // scroll btn : e


  // sns link btn : s
  var $snsBtn = $(".js-sns-link");
  $snsBtn.on("click", function(e){
    e.preventDefault();
    $(this).parent(".sns-share__item").toggleClass("is-selected");
  });


  // sns link btn : e

  // tab-menu : s
  tabDetector();
  $(".tab-menu .tab-menu__anchor").bind("click", tabOpener);
  $(".tab-menu .tab-menu__anchor-unlink").bind("click", tabNoOpener);
  // tab-menu : e

  // channel list : s
  var parallaxElements = $('.js-scroll-bg'),
    parallaxQuantity = parallaxElements.length;
  $window.on('scroll', function () {
    window.requestAnimationFrame(function () {
      for (var i = 0; i < parallaxQuantity; i++) {
        var currentElement = parallaxElements.eq(i);
        var scrolled = $(window).scrollTop();
        currentElement.css({
          'transform': 'translate3d(0,' + scrolled * -0.3 + 'px, 0)'
        });
      }
    });
  });
  // channel list : e

  $window.on("load", function(){
    if($window.scrollTop() > 0) {
      $gnb.removeClass('is-fixed');
    }
  });

  $window.on('scroll', function(){
    topBtnScroll();
  });

  $window.on('resize', function(){
    topBtnScroll();
  });

});


