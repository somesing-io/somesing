
function moveProgressBar() {
  var $progress = $('.is-animate .js-progress');
  $progress.each(function(){
    var $this = $(this),
        $progressContainer = $this.find(".progress-container"),
        $progressBar = $this.find(".progress-container__bar");
    var getPercent = ($progressContainer.data('progress-percent') / 100),
        getProgressWrapWidth = $progressContainer.width(),
        progressTotal = getPercent * getProgressWrapWidth,
        animationLength = 1000;
    $progressBar.stop().animate({
      width: progressTotal
    }, animationLength);
  })
}

function countdown() {
  var $countDouwn = $(".js-count-time");
  $countDouwn.each(function(){
    var $this = $(this);
    var now = new Date(),
        eventDay = $this.data('event-time');
    var eventTime = eventDay.split('.');
    var eventDayNum = new Date(
        parseInt(eventTime[0]),
        parseInt(eventTime[1]) - 1,
        parseInt(eventTime[2])
    );
    var eventDate = new Date(eventDayNum),
      currentTime = now.getTime(),
      evenTime = eventDate.getTime(),
      remTime = evenTime - currentTime;

    var sec = Math.floor(remTime / 1000),
        min = Math.floor(sec / 60),
        hur = Math.floor(min / 60),
        day = Math.floor(hur / 24);

    hur %= 24;
    min %= 60;
    sec %= 60;

    hur = (hur < 10) ? "0" + hur : hur;
    min = (min < 10) ? "0" + min : min;
    sec = (sec < 10) ? "0" + sec : sec;

    $this.find('.js-seconds').text(sec);
    $this.find('.js-minutes').text(min);
    $this.find('.js-hours').text(hur);
    $this.find('.js-days').text(day);
  });
  setTimeout(countdown, 1000);
}

function mainCont(){
  var targetOffset = $('.js-scroll-off').offset().top;
  $('html, body').stop().animate({'scrollTop': targetOffset}, 300);
}

function chartDoughnut() {

  Chart.defaults.global.legend.display = false;
  Chart.defaults.global.tooltips.enabled = false;

    var doughnutData = {
      datasets: [{
        data: [50, 12, 28, 10],
        backgroundColor: [
          'rgba(215, 58, 31, 1)',
          'rgba(255, 198, 44, 1)',
          'rgba(63, 195, 150, 1)',
          'rgba(64, 125, 193, 1)'
        ],
        borderColor: [
          'rgba(215, 58, 31, 1)',
          'rgba(255, 198, 44, 1)',
          'rgba(63, 195, 150, 1)',
          'rgba(64, 125, 193, 1)'
        ],
        borderWidth: 0
      }]
    };

    var doughnutOptions = {
      animation : {
        duration : 1000,
        easing : 'easeOutQuint'
      },
      cutoutPercentage : 40,
      hover: {
        mode: null
      },
      tooltips: {
        callbacks: {
          label: function(tooltipItem) {
            return tooltipItem.yLabel;
          }
        }
      }
    };

    ctx = $('#myChart');
    var myDoughnutChart = new Chart(ctx, {
      type: 'doughnut',
      data: doughnutData,
      options: doughnutOptions
    });
}


$(function(){

  countdown();

  var $window = $(window);

  // carousel dual : s
  var $carouselDual = $('.js-carousel-dual');
  $carouselDual.each(function() {
    var _$this = $(this),
        _$carouselDualScreen = _$this.find('.js-carousel-dual__screen'),
        _$carouselDualBtnPrev = _$this.find('.js-carousel-dual__btn--prev'),
        _$carouselDualBtnNext = _$this.find('.js-carousel-dual__btn--next'),
        _$carouselDualPaging = _$this.find('.js-carousel-triple__paging'),
        _$carouselDualSlick = null;
    var _slidesToScroll = _$this.data('slides-to-scroll') ? _$this.data('slides-to-scroll') : 1;
    _$carouselDualSlick = _$carouselDualScreen.slick({
      infinite: false,
      dots: false,
      slidesToShow: 4,
      slidesToScroll: _slidesToScroll,
      prevArrow: _$carouselDualBtnPrev,
      nextArrow: _$carouselDualBtnNext
    });
  });
  // carousel dual : e

  // carousel main : s
  var $carouselIndicator = $('.js-carousel-main');
  setTimeout(function(){
    $carouselIndicator.addClass("is-selected")
  },100);
  $carouselIndicator.each(function() {
    var _$this = $(this),
        _$carouselIndicatorScreen = _$this.find('.js-carousel__screen'),
        _$carouselIndicatorList = _$this.find('.js-carousel__list'),
        _$carouselIndicatorIndicator = _$this.find('.js-carousel__indicator'),
        _$carouselIndicatorSlick = null;
    _$carouselIndicatorSlick = _$carouselIndicatorScreen.slick({
      infinite: true,
      dots: true,
      arrows: false,
      appendDots: _$carouselIndicatorIndicator,
      fade: true,
      autoplay: true,
      autoplaySpeed: 5000,
      pauseOnHover: false,
      lazyLoad: 'ondemand',
      lazyLoadBuffer: 0,
      cssEase: 'linear',
      slidesToShow: 1,
      slidesToScroll: 1
    });
    _$carouselIndicatorScreen.on('beforeChange', function(e, slick, currentSlide, nextSlide) {
      _$carouselIndicatorList.removeClass('is-selected').eq(nextSlide).addClass('is-selected').click();
      //$(".main-board").find(".download-language__list").removeClass("is-selected");
      //$(".main-board").find(".download-language__file").removeClass("is-selected");
    });
    if(!_$carouselIndicatorList.length == 0) _$carouselIndicatorList.eq(0).addClass('is-selected');
  });
  // carousel main : e
  /*
  var introMouseWheelIng = false;
  var $mainBoard = $(".main-board");

  $mainBoard.on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll", function(e) {
    e.preventDefault();
    return;
  });
  $mainBoard.on("mousewheel DOMMouseScroll", function(e) {
    if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
      $('html, body').stop().animate({'scrollTop': 0}, 300);
    } else {
      if(introMouseWheelIng === false) {
        mainCont();
      }
    }
  });
  */


  var $magicFadeIn = $('.js-scroll-item');
  $window.on('scroll.magicFadeIn', function() {
    $magicFadeIn.each(function() {
      var _$this = $(this);
      var _windowScrollTop = $window.scrollTop(),
          _windowHeight = $window.height(),
          _magicFadeInOffsetTop = _$this.offset().top,
          _magicMargin = 300,
          _magicFadeInMargin = _$this.data('magic-fadein-margin') ? _$this.data('magic-fadein-margin') : _windowHeight/100;
      if(!_$this.hasClass('is-animate')) {
        if((_magicFadeInOffsetTop + _magicMargin) - _windowHeight + _magicFadeInMargin < _windowScrollTop) {
          _$this.addClass('is-animate');
        }
      }
    });
  });

  var isVisible = false;
  var $mainAllocation = $('.main-allocation'),
      $mainSale = $('.main-sale');
  $window.on('scroll', function() {

    if ($mainSale.hasClass("is-animate")) {
      moveProgressBar();
    }

    if ($mainAllocation.hasClass("is-animate") && !isVisible) {
      setTimeout(chartDoughnut, 1200);
      //chartDoughnut();
      isVisible = true;
    }

  });

});
