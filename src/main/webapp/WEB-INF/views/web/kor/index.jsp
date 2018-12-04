<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/web/kor/common/inc/include.jsp"%>
  <%@ include file="/WEB-INF/views/common/common-script.jsp"%>
</head>
<body class="main-type">
  <div class="viewport">
    <div class="view-container">
      <!-- HEADER : [S] -->
      <header class="gnb is-fixed">
  <div class="gnb-container">
    <div class="gnb-box">
      <div class="gnb-header">
        <h1 class="gnb-header__symbol"><a href="/index"><img src="/web/kor/assets/img/ico-logo.png" alt="SOME SING"></a></h1>
      </div>
      <!-- gnb-header//end -->
      <div class="gnb-menu">
        <div class="gnb-menu__container" role="group">
          <nav class="gnb-menu__nav gnb-menu__nav--all">
            <div class="gnb-menu__header sr-only" aria-hidden="false">
              <h2 class="gnb-menu__header-title">Site Navigation</h2>
            </div>
            <!-- gnb-menu__header//end -->
            <div class="gnb-menu__menu" role="navigation">
              <ul class="gnb-menu__itembox" role="menu">
                <li class="gnb-menu__item" role="menuitem">
                  <a href="#main-about" class="gnb-menu__anchor js-gnb-menu-anchor">ABOUT SOMESING</a>
                </li>
                <li class="gnb-menu__item" role="menuitem">
                  <a href="#main-team" class="gnb-menu__anchor js-gnb-menu-anchor">TEAM</a>
                </li>
                <li class="gnb-menu__item" role="menuitem">
                  <a href="#main-roadmap" class="gnb-menu__anchor js-gnb-menu-anchor">ROADMAP</a>
                </li>
                <li class="gnb-menu__item" role="menuitem">
                  <a href="#main-allocation" class="gnb-menu__anchor js-gnb-menu-anchor">TOKEN ALLOCATION</a>
                </li>
                <!-- 대시보드?
                 <li class="gnb-menu__item" role="menuitem">
                  <a href="#main-allocation" class="gnb-menu__anchor">Coin Allocation </a>
                </li>
                -->
              </ul>
            </div>
            <!-- gnb-menu__menu//end -->
          </nav>
        </div>
        <!-- gnb-menu__container//end -->
      </div>
      <!-- gnb-menu//end -->
    </div>
    <!--gnb-box//end -->
    <div class="gnb-util">
      <div class="gnb-util__container">
        <nav class="gnb-util__nav">
          <ul class="gnb-util__itembox" role="menu">
          	
          	<sec:authorize access="isAnonymous()">
          		<li class="gnb-util__item" role="menuitem">
	              <a href="<c:url value='/user/login' />" class="gnb-util__anchor">SIGN IN</a>
	            </li>
	            <li class="gnb-util__item" role="menuitem">
	              <a href="<c:url value='/user/signUp' />" class="gnb-util__anchor">SIGN UP</a>
	            </li>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<li class="gnb-util__item" role="menuitem">
              		<a href="<c:url value='/user/logout' />" class="gnb-util__anchor">LOGOUT</a>
            	</li>
			</sec:authorize>
            
            <li class="gnb-util__item" role="menuitem">
              <a href="#none" class="gnb-util__anchor gnb-util__anchor--language js-language-menu">KOR</a>
              <div class="gnb-util__language">
                <ul class="gnb-util__language-itembox">
                  <li class="gnb-util__language-item"><a href="?lang=kor" class="gnb-util__language-anchor is-selected">한국어</a></li><!-- 현재 언어 페이지 일때 is-selected class 추가 -->
                  <li class="gnb-util__language-item"><a href="?lang=en" class="gnb-util__language-anchor">ENGLISH</a></li>
                </ul>
              </div>
            </li>
          </ul>
        </nav>
      </div>
      <!-- gnb-util__container//end -->
    </div>
    <!-- gnb-util//end -->
  </div>
  <!-- gnb-container//end -->
</header>

      <!-- HEADER : [E] -->
      <section class="content-container">
        <article class="main-board js-scroll-item">
          <div class="main-board__container js-carousel-main">
            <div class="main-board__itembox js-carousel__screen">
              <div class="main-board__item js-carousel__list">
                  <div class="main-board__text">
                    <strong class="main-board__text-title">내가 원하는 시간!<br>
                      내가 원하는 곳에서!<br>
                      자유롭게 노래를 부를 수 있어요.</strong>
                    <p class="main-board__text-desc">365days 24hours Free | Over 40,000 songs Free | Everyday New Songs offering<br>
                      Social Music Service based on BLOCKCHAIN TECHNOLOGY</p>
                  </div>
                  <div class="main-board__image"><img src="/web/kor/assets/img/img-main-board1.jpg" alt="" class="main-board__image-bg"></div>
              </div>
              <!-- main-board__item//end -->
              <div class="main-board__item js-carousel__list">
                <div class="main-board__text">
                  <strong class="main-board__text-title">내가 부른 노래를<br>
                    나만의 스튜디오에서<br>
                    직접 믹싱해보세요!</strong>
                  <p class="main-board__text-desc">Social Music Service based on BLOCKCHAIN TECHNOLOGY</p>
                </div>
                <div class="main-board__image"><img src="/web/kor/assets/img/img-main-board2.jpg" alt="" class="main-board__image-bg"></div>
              </div>
              <!-- main-board__item//end -->
              <div class="main-board__item js-carousel__list">
                <div class="main-board__text">
                  <strong class="main-board__text-title">내 노래를 공유해보세요!<br>
                    전세계 사람들이 박수와 환호를<br>
                    보내줄거에요.</strong>
                  <p class="main-board__text-desc">Social Music Service based on BLOCKCHAIN TECHNOLOGY</p>
                </div>
                <div class="main-board__image"><img src="/web/kor/assets/img/img-main-board3.jpg" alt="" class="main-board__image-bg"></div>
              </div>
              <!-- main-board__item//end -->
              <div class="main-board__item js-carousel__list">
                <div class="main-board__text">
                  <strong class="main-board__text-title">
                  내 노래가 매력적이라면,<br>
                  인기와 함께, 경제적 수익도 따라오겠죠!<br>
                  가수란 원래 그런거니까요.</strong>
                  <p class="main-board__text-desc">Social Music Service based on BLOCKCHAIN TECHNOLOGY</p>
                </div>
                <div class="main-board__image"><img src="/web/kor/assets/img/img-main-board4.jpg" alt="" class="main-board__image-bg"></div>
              </div>
              <!-- main-board__item//end -->
            </div>
            <!-- main-board__itembox//end -->
            <div class="main-board__indicator js-carousel__indicator"></div>
          </div>
          <!-- main-board//end -->
          <div class="main-board__download">
            <div class="download-language">
              <p class="download-language__caption">White Paper Download</p>
              <div class="download-language__filebox">
                <span class="download-language__file js-download-language"><span class="download-language__file-type js-file-text">한국어</span></span>
                <a href="/global/assets/file/whitepaper_kr.pdf" class="btn-download js-target-href" target="_blank">DOWNLOAD</a>
                <div class="download-language__list">
                  <ul class="download-language__itembox">
                    <li class="download-language__item"><a href="/global/assets/file/whitepaper_kr.pdf" class="download-language__anchor js-download-file is-selected">한국어</a></li><!-- 현재 언어 페이지 일때 is-selected class 추가 -->
                    <li class="download-language__item"><a href="/global/assets/file/whitepaper_en.pdf" class="download-language__anchor js-download-file">ENGLISH</a></li>
                    <li class="download-language__item"><a href="/global/assets/file/whitepaper_jp.pdf" class="download-language__anchor js-download-file">日本語</a></li>
                    <li class="download-language__item"><a href="/global/assets/file/whitepaper_ch.pdf" class="download-language__anchor js-download-file">中國語</a></li>
                  </ul>
                </div>
              </div>
              <!-- download-language__filebox//end -->
            </div>
            <!-- download-language//end -->
          </div>
          <!-- main-board__download//end -->
        </article>
        
        <!-- 로그인 변화 부분 -->
        <sec:authorize access="isAnonymous()">
	        <article class="main-upcoming main-upcoming--list1 js-scroll-off js-scroll-item">
	          <div class="upcoming-container">
	            <div class="upcoming-header">
	              <h3 class="upcoming-header__heading heading heading--main4">SOMESING ICO is UPCOMING</h3>
	              <p class="upcoming-header__desc">ICO's schedule is as follows. Please refer to the schedule below.</p>
	            </div>
	            <!-- upcoming-header//end -->
	            <div class="upcoming-list">
	              <div class="upcoming-list__itembox">
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">PRE-SALE #1</p>
	                    <p class="upcoming-list__caption-desc">BONUS 20%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">PRE-SALE #2</p>
	                    <p class="upcoming-list__caption-desc">BONUS 10%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">MAIN-SALE</p>
	                    <p class="upcoming-list__caption-desc">BONUS 0%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	              </div>
	              <!-- upcoming-list__itembox//end -->
	            </div>
	            <!-- upcoming-list//end -->
	          </div>
	          <!-- upcoming-container//end -->
	        </article>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<article class="main-sale main-sale--list1 js-scroll-off js-scroll-item">
	          <div class="sale-container">
	            <div class="sale-header">
	              <h3 class="sale-header__heading heading heading--main4">White Paper Download</h3>
	              <p class="sale-header__desc">2018.00.00 00:00(KST) - 2018.00.00 00:00(KST)</p>
	            </div>
	            <!-- sale-header//end -->
	            <div class="sale-time js-count-time" data-event-time="2019.01.01"><!-- 카운트 다운되는 시간 넣어주세요 -->
	              <div class="sale-time__itembox">
	                <div class="sale-time__item">
	                  <div class="sale-time__item-title">Days</div>
	                  <div class="sale-time__item-time js-days"></div>
	                </div>
	                <div class="sale-time__item">
	                  <div class="sale-time__item-title">Hours</div>
	                  <div class="sale-time__item-time js-hours"></div>
	                </div>
	                <div class="sale-time__item">
	                  <div class="sale-time__item-title">Minutes</div>
	                  <div class="sale-time__item-time js-minutes"></div>
	                </div>
	                <div class="sale-time__item">
	                  <div class="sale-time__item-title">Seconds</div>
	                  <div class="sale-time__item-time js-seconds"></div>
	                </div>
	              </div>
	              <!-- sale-time__itembox//end -->
	            </div>
	            <!-- sale-time//end -->
	            <div class="sale-progress">
	              <div class="progress js-progress">
	                <div class="progress-container" data-progress-percent="25"><!-- 진행되는 퍼센트 넣어주세요 -->
	                  <div class="progress-container__bar"></div>
	                </div>
	                <!-- progress-container//end -->
	                <div class="progress-list">
	                  <ul class="progress-list__itembox">
	                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Pre-sale</span></li>
	                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Soft cap</span></li>
	                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Crow-sale</span></li>
	                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Hard cap</span></li>
	                  </ul>
	                </div>
	                <!-- progress-list//end -->
	              </div>
	              <!-- progress//end -->
	              <div class="btn-group btn-group--sale">
	                <a href="#none" class="btn btn-ghost1">BUY NOW</a>
	              </div>
	              <!-- btn-group//end -->
	            </div>
	            <!-- sale-progress//end -->
	          </div>
	          <!-- sale-container//end -->
	        </article>
		</sec:authorize>
        
        <article class="main-alliance js-scroll-item">
          <div class="alliance-container">
            <div class="alliance-header">
              <h3 class="alliance-header__heading heading heading--main1">ICON ALLIANCE</h3>
              <p class="alliance-header__desc">ICON은 다양한 Blockchain Community가 연결된 분산형 네트워크입니다.</p>
            </div>
            <!-- alliance-header//end -->
            <div class="alliance-info">
              <div class="alliance-info__thumbnail"><img src="/web/kor/assets/img/img-main-alliance.png" alt="SOMESING 은 ICON의 공식 Dapp 으로서 ICON Alliance의 다양한 프로젝트들과 함께 새로운 블록체인 세상을 만들어 가겠습니다." class="alliance-info__thumbnail-image"></div>
            </div>
            <!-- alliance-info//end -->
          </div>
          <!-- alliance-container//end -->
        </article>
        <article id="main-about" class="main-about js-scroll-item">
          <div class="about-bg">
            <div class="about-bg__image">
              <div class="about-bg__thumbnail"><img src="/web/kor/assets/img/bg-about-service.png" alt="" class="about-bg__thumbnail-image"></div>
            </div>
          </div>
          <div class="about-container">
            <div class="about-service">
              <!-- 20181020 : [S] -->
              <div class="about-header">
                <h3 class="about-header__heading heading heading--main3">What is <strong class="heading-highlight1">SOMESING?</strong></h3>
                <p class="about-header__desc">Social Music Service based on Blockchain technology.<br>
                  Sing Free / Get Reward / Be SOMESING lovers</p>
              </div>
              <!-- about-header//end -->
              <div class="about-list">
                <ul class="about-list__itembox">
                  <li class="about-list__item">
                    <div class="about-list__caption">
                      <strong class="about-list__caption-title">매일 업데이트되는 신곡</strong>
                    </div>
                  </li>
                  <li class="about-list__item">
                    <div class="about-list__caption">
                      <strong class="about-list__caption-title">Studio 수준의 레코딩 시스템​</strong>
                    </div>
                  </li>
                  <li class="about-list__item">
                    <div class="about-list__caption">
                      <strong class="about-list__caption-title">Global User와 함께 즐길 수 있는 뮤직 소셜 네트워크​​</strong>
                    </div>
                  </li>
                </ul>
              </div>
              <!-- about-list//end -->
              <!-- 20181020 : [E] -->
              <div class="about-video">
                <div class="about-video__header">
                  <strong class="about-video__header-heading">MOVIE about SOMESING</strong>
                </div>
                
                <!-- 동영상 있을 경우 : S -->
                <a href="#popup-main-video" class="about-video__anchor js-popup-open js-video-data" data-youtube-src="//www.youtube.com/embed/W5QMuJORwwQ?autoplay=1&autohide=1?rel=0&vq=hd1080">
                <div class="about-video__image">
                  <div class="about-video__thumbnail"><img src="/web/kor/assets/img/img-about-video.jpg" class="about-video__thumbnail-img" alt=""></div>
                </div>
                </a>
                <!-- 동영상 있을 경우 : E -->
                <!-- 동영상 없을 경우 : S -->
              <!--   <a href="#popup-main-waiting" class="about-video__anchor js-popup-open">
                  <div class="about-video__image">
                    <div class="about-video__thumbnail"><img src="/web/kor/assets/img/img-about-video.jpg" class="about-video__thumbnail-img" alt=""></div>
                  </div>
                </a> -->
                <!-- 동영상 없을 경우 : E -->
              </div>
              <!-- about-video//end -->
            </div>
            <!-- about-service//end -->
          </div>
          <!-- about-container//end -->
        </article>
        <article class="main-system js-scroll-item">
          <div class="system-container">
            <div class="system-header">
              <h3 class="system-header__heading heading heading--main1">SOMESING Ecosystem</h3>
              <p class="system-header__desc">이해 관계자는 각자의 이해를 도모하기 위하여 자발적으로 생태계에 진입하게 되며,<br>생태계는 진입자의 증가 및 활동증가로 선순환의 생태계를 이루게 됩니다.</p>
            </div>
            <!-- system-header//end -->
            <div class="system-step">
              <div class="system-step__thumbnail"><img src="/web/kor/assets/img/img-main-system.png" alt="SOMESING Ecosystem Step - Pratner, User Pay Free User Get 70%, SOMESING + ACCOMPANIMENTGet 30%, Invester, Virtuous circle of SOMESING Ecosystem" class="system-step__thumbnail-image"></div><!-- 20181020 -->
            </div>
            <!-- system-step//end -->
          </div>
          <!-- system-container//end -->
        </article>
        <article class="main-flow js-scroll-item">
          <div class="flow-conatiner">
            <div class="flow-header">
              <h3 class="flow-header__heading heading heading--main2">User & Service Flow</h3><!-- 20181027 -->
              <p class="flow-header__desc">Fun = Economy 의 목표하에 모든 활동의 주체가 즐기는 가운데, <br>경제적 활동의 보상이 이루어 질 수 있는 서비스를 설계하였습니다.​</p><!-- 20181027 -->
            </div>
            <!-- flow-header//end -->
            <div class="flow-step">
              <div class="flow-step__image">
                <div class="flow-step__thumbnail"><img src="/web/kor/assets/img/img-main-flow.png" alt="User & Service Step" class="flow-step__thumbnail-image"></div>
              </div>
            </div>
            <!-- flow-step//end -->
          </div>
          <!-- flow-contaniner//end -->
        </article>
        
        
        <sec:authorize access="isAnonymous()">
        	<article class="main-upcoming main-upcoming--list2 js-scroll-item">
	          <div class="upcoming-container">
	            <div class="upcoming-header">
	              <h3 class="upcoming-header__heading heading heading--main4">SOMESING ICO is UPCOMING</h3>
	              <p class="upcoming-header__desc">ICO's schedule is as follows. Please refer to the schedule below.</p>
	            </div>
	            <!-- upcoming-header//end -->
	            <div class="upcoming-list">
	              <div class="upcoming-list__itembox">
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">PRE-SALE #1</p>
	                    <p class="upcoming-list__caption-desc">BONUS 20%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">PRE-SALE #2</p>
	                    <p class="upcoming-list__caption-desc">BONUS 10%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	                <div class="upcoming-list__item">
	                  <div class="upcoming-list__caption">
	                    <p class="upcoming-list__caption-title">MAIN-SALE</p>
	                    <p class="upcoming-list__caption-desc">BONUS 0%</p>
	                    <p class="upcoming-list__caption-time">To be<br>announced</p><!-- 20181027 -->
	                  </div>
	                </div>
	              </div>
	              <!-- upcoming-list__itembox//end -->
	            </div>
	            <!-- upcoming-list//end -->
	          </div>
	          <!-- upcoming-container//end -->
	        </article>
		</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<article class="main-sale main-sale--list2 js-scroll-item">
		          <div class="sale-container">
		            <div class="sale-header">
		              <h3 class="sale-header__heading heading heading--main4">White Paper Download</h3>
		              <p class="sale-header__desc">2018.00.00 00:00(KST) - 2018.00.00 00:00(KST)</p>
		            </div>
		            <!-- sale-header//end -->
		            <div class="sale-time js-count-time" data-event-time="2018.12.20"><!-- 카운트 다운되는 시간 넣어주세요 -->
		              <div class="sale-time__itembox">
		                <div class="sale-time__item">
		                  <div class="sale-time__item-title">Days</div>
		                  <div class="sale-time__item-time js-days"></div>
		                </div>
		                <div class="sale-time__item">
		                  <div class="sale-time__item-title">Hours</div>
		                  <div class="sale-time__item-time js-hours"></div>
		                </div>
		                <div class="sale-time__item">
		                  <div class="sale-time__item-title">Minutes</div>
		                  <div class="sale-time__item-time js-minutes"></div>
		                </div>
		                <div class="sale-time__item">
		                  <div class="sale-time__item-title">Seconds</div>
		                  <div class="sale-time__item-time js-seconds"></div>
		                </div>
		              </div>
		              <!-- sale-time__itembox//end -->
		            </div>
		            <!-- sale-time//end -->
		            <div class="sale-progress">
		              <div class="progress js-progress">
		                <div class="progress-container" data-progress-percent="50"><!-- 진행되는 퍼센트 넣어주세요 -->
		                  <div class="progress-container__bar"></div>
		                </div>
		                <!-- progress-container//end -->
		                <div class="progress-list">
		                  <ul class="progress-list__itembox">
		                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Pre-sale</span></li>
		                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Soft cap</span></li>
		                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Crow-sale</span></li>
		                    <li class="progress-list__item"><span class="progress-list__item-text">$00M<br>Hard cap</span></li>
		                  </ul>
		                </div>
		                <!-- progress-list//end -->
		              </div>
		              <!-- progress//end -->
		              <div class="btn-group btn-group--sale">
		                <a href="#none" class="btn btn-ghost1">BUY NOW</a>
		              </div>
		              <!-- btn-group//end -->
		            </div>
		            <!-- sale-progress//end -->
		          </div>
		          <!-- sale-conatiner//end -->
		        </article>
			</sec:authorize>
        
        <!-- 20181027 : [S] -->
        <article id="main-team" class="main-team js-scroll-item">
          <div class="team-header">
            <h3 class="team-header__heading heading heading--main1">SOMESING Team</h3>
            <p class="team-header__desc">국내 최초로 블록체인 기술을 활용한 가라오케 서비스를 만들기 위해,<br>
              관련 분야의 Specialist 들이 모였습니다.</p>
          </div>
          <!-- team-header//end -->
          <div class="team-container team-container--wide">
            <div class="team-name">
              <h4 class="team-name__heading">Core Members</h4>
            </div>
            <!-- team-name//end -->
            <div class="team-list js-team-list js-carousel-dual" data-slides-to-scroll="4">
              <ul class="team-list__itembox js-carousel-dual__screen">
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-hbk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Heuibae Kim</p>
                    <p class="team-list__caption-level">CEO & Co-Founder</p>
                    <p class="team-list__caption-job">General Planning and  Operation</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-hky.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Hyunkeun Yoon</p>
                    <p class="team-list__caption-level">COO</p>
                    <p class="team-list__caption-job">LG Fashion HR Manager</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-kyk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Kyle Kim</p>
                    <p class="team-list__caption-level">CSO</p>
                    <p class="team-list__caption-job">The Loop Consulting Director</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-jhc.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Jaehoon Chang</p>
                    <p class="team-list__caption-level">CTO </p>
                    <p class="team-list__caption-job">Infraware R&D Team Leader</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-thr.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Taehee Ryu</p>
                    <p class="team-list__caption-level">CBDO</p>
                    <p class="team-list__caption-job">EMC/Adobe Account Manager</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-hsc.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Heeseok Choi</p>
                    <p class="team-list__caption-level">UI/UX Director</p>
                    <p class="team-list__caption-job">PENTABREED UI/UX DIRECTOR</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-jyk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Jiyeon Kim</p>
                    <p class="team-list__caption-level">CCO</p>
                    <p class="team-list__caption-job">Business Manager</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-djm.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Daejin Moon</p>
                    <p class="team-list__caption-level">Global Director</p>
                    <p class="team-list__caption-job">MK EDU CEO</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-jhh.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">JunHee Han</p>
                    <p class="team-list__caption-level">Blockchain Developer</p>
                    <p class="team-list__caption-job">BitorGroup General Manager</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-msl.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Myungsu Lee</p>
                    <p class="team-list__caption-level">Japan Business Manager</p>
                    <p class="team-list__caption-job">HI Corp. Business Dev. Team</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-kky.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">KyungKeun Yoon</p>
                    <p class="team-list__caption-level">Senior Designer</p>
                    <p class="team-list__caption-job">Hongik-Univ. Master of Design</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-bry.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Bora Yeon</p>
                    <p class="team-list__caption-level">Communication Manager</p>
                    <p class="team-list__caption-job">Yellow mobile Coocha Marketing Team</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-core-list-khk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">kunhee Ko</p>
                    <p class="team-list__caption-level">Designer</p>
                    <p class="team-list__caption-job">IMAGINATION PLANT Designer</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <!-- team-list__item//end -->
              </ul>
              <!-- team-list__itembox//end -->
              <div class="team-list__controller">
                <button type="button" title="Prev Slide" class="team-list__btn team-list__btn--prev js-carousel-dual__btn--prev">Prev Slide</button>
                <button type="button" title="Next Slide" class="team-list__btn team-list__btn--next js-carousel-dual__btn--next">Next Slide</button>
              </div>
              <!-- team-list__controller//end -->
            </div>
            <!-- team-list//end -->
          </div>
          <!-- team-container//end -->
          <div class="team-container">
            <div class="team-name">
              <h4 class="team-name__heading">Advisors</h4>
            </div>
            <!-- tema-name//end -->
            <div class="team-list">
              <ul class="team-list__itembox">
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-kjl.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">KJ Eee</p>
                    <p class="team-list__caption-job">Icon Foundation /Council Member</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-da.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Doug Ahn</p>
                    <p class="team-list__caption-job">Sekelter labs / COO</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-hwc.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Heewon Choi</p>
                    <p class="team-list__caption-job">Pivotal Labs / Associate Director</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-jwl.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Daniel Jin-Woo Lee</p>
                    <p class="team-list__caption-job">Insider / Partner &amp; Country Manager</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-smk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">SeokMyoung Kwon</p>
                    <p class="team-list__caption-job">TJ Communications / Director</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-dcs.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">DaeCheol Shin</p>
                    <p class="team-list__caption-job">Professor Ph.D. / Korea University</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-fjsw.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Fujisawa tatsuya</p>
                    <p class="team-list__caption-job">Sdtech / Director</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-jk.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Jay KIM</p>
                    <p class="team-list__caption-job">Makestar / CEO</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-ckl.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">Changkeun Lee</p>
                    <p class="team-list__caption-job">Keywallet / CEO</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
                <li class="team-list__item">
                  <div class="team-list__image">
                    <div class="team-list__thumbnail"><img src="/web/kor/assets/img/img-team-advisor-list-mky.jpg" alt="" class="team-list__thumbnail-image"></div>
                  </div>
                  <!-- team-list__image//end -->
                  <div class="team-list__caption">
                    <p class="team-list__caption-name">MiKyung Yoon</p>
                    <p class="team-list__caption-job">eMFORCE / CEO</p>
                  </div>
                  <!-- team-list__caption//end -->
                </li>
              </ul>
            </div>
            <!-- team-list//end -->
          </div>
          <!-- team-container//end -->
        </article>
        <!-- 20181027 : [E] -->
        <article id="main-download" class="main-download js-scroll-item">
          <div class="download-container">
            <div class="download-header">
              <h3 class="download-header__heading heading heading--main4">White Paper Download</h3>
              <p class="download-header__desc">Select the language of the WHITE PAPER you want to download and download it.</p>
            </div>
            <!-- download-header//end -->
            <div class="download-list">
              <div class="download-language">
                <div class="download-language__filebox">
                  <span class="download-language__file js-download-language"><span class="download-language__file-type js-file-text">한국어</span></span>
                  <a href="/global/assets/file/whitepaper_kr.pdf" class="btn-download js-target-href" target="_blank">DOWNLOAD</a>
                  <div class="download-language__list">
                    <ul class="download-language__itembox">
                     <li class="download-language__item"><a href="/global/assets/file/whitepaper_kr.pdf" class="download-language__anchor js-download-file is-selected">한국어</a></li><!-- 현재 언어 페이지 일때 is-selected class 추가 -->
                      <li class="download-language__item"><a href="/global/assets/file/whitepaper_en.pdf" class="download-language__anchor js-download-file">ENGLISH</a></li>
                      <li class="download-language__item"><a href="/global/assets/file/whitepaper_jp.pdf" class="download-language__anchor js-download-file">日本語</a></li>
                      <li class="download-language__item"><a href="/global/assets/file/whitepaper_ch.pdf" class="download-language__anchor js-download-file">中國語</a></li>
                    </ul>
                  </div>
                </div>
                <!-- download-language__filebox//end -->
              </div>
              <!-- download-language//end -->
            </div>
            <!-- download-list//end -->
          </div>
          <!-- download-container//end -->
        </article>
        <!-- 20181027 : [S] -->
        <article class="main-partners js-scroll-item">
          <div class="partners-container">
            <div class="partners-header">
              <h3 class="partners-header__heading heading heading--main1">our Partners</h3>
            </div>
            <!-- partners-header//end -->
            <div class="partners-list">
              <ul class="partners-list__itembox">
                <li class="partners-list__item">
                  <a href="#none" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-ic.png" alt="ICON" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">ICON</strong>
                        <p class="partners-list__caption-desc">www.icon.foundation</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="http://www.ziller.co.kr" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-tj.png" alt="TJ communication" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">TJ communication</strong>
                        <p class="partners-list__caption-desc">www.ziller.co.kr</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="https://www.skelterlabs.com" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-st.png" alt="SkelterLabs" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">SkelterLabs</strong>
                        <p class="partners-list__caption-desc">www.skelterlabs.com</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="https://www.makestar.co" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-mk.png" alt="MAKESTAR" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">MAKESTAR</strong>
                        <p class="partners-list__caption-desc">www.makestar.co</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="https://useinsider.com" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-in.png" alt="Insider" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">Insider</strong>
                        <p class="partners-list__caption-desc">www.useinsider.com</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="https://www.keypair.co.kr" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-kp.png" alt="Keypair" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">Keypair</strong>
                        <p class="partners-list__caption-desc">www.keypair.co.kr</p>
                      </div>
                    </div>
                  </a>
                </li>
                <li class="partners-list__item">
                  <a href="http://www.emforce.co.kr" class="partners-list__anchor" target="_blank">
                    <div class="partners-list__image">
                      <div class="partners-list__thumbnail"><img src="/web/kor/assets/img/img-partners-logo-em.png" alt="eMFORCE" class="partners-list__thumbnail-image"></div>
                    </div>
                    <div class="partners-list__caption">
                      <div class="partners-list__caption-inner">
                        <strong class="partners-list__caption-title">eMFORCE</strong>
                        <p class="partners-list__caption-desc">www.emforce.co.kr</p>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
            <!-- partners-list//end -->
          </div>
          <!-- partners-container//end -->
        </article>
        <!-- 20181027 : [E] -->
        <article id="main-roadmap" class="main-roadmap js-scroll-item">
          <div class="roadmap-container">
            <div class="roadmap-header">
              <h3 class="roadmap-header__heading heading heading--main2">Road map</h3>
            </div>
            <!-- roadmap-header//end -->
            <div class="roadmap-list">
              <span class="roadmap-list__spot" aria-hidden="true">
                <span class="roadmap-list__spot-item roadmap-list__spot-item1"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item2"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item3"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item4"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item--bold roadmap-list__spot-item5"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item6"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item7"></span>
                <span class="roadmap-list__spot-item roadmap-list__spot-item8"></span>
              </span>
              <ul class="roadmap-list__itembox">
                <li class="roadmap-list__item roadmap-list__item1"><strong class="roadmap-list__years">2Q, 2016</strong>SOMESING App Development</li>
                <li class="roadmap-list__item roadmap-list__item2"><strong class="roadmap-list__years">1Q, 2018</strong>SOMESING Platform Development</li>
                <li class="roadmap-list__item roadmap-list__item3"><strong class="roadmap-list__years">3Q, 2018</strong>White Paper Draft Release</li>
                <li class="roadmap-list__item roadmap-list__item4"><strong class="roadmap-list__years">4Q, 2018</strong>ICO, Singapore</li>
                <li class="roadmap-list__item roadmap-list__item5"><strong class="roadmap-list__years">1Q, 2019</strong>Global Launching<br>SOMESING<br>Platform MR<br>: K-pop</li>
                <li class="roadmap-list__item roadmap-list__item6"><strong class="roadmap-list__years">2Q, 2019</strong>Japan Launching</li>
                <li class="roadmap-list__item roadmap-list__item7"><strong class="roadmap-list__years">3Q, 2019</strong>China, Asian Service Launching</li>
                <li class="roadmap-list__item roadmap-list__item8"><strong class="roadmap-list__years">4Q, 2019</strong>Global Launching<br>(US, EU)</li>
              </ul>
              <div class="roadmap-list__line"></div>
            </div>
            <!-- roadmap-list//end -->
          </div>
          <!-- roadmap-container//end -->
        </article>
        <article id="main-allocation" class="main-allocation js-scroll-item">
          <div class="allocation-container">
            <div class="allocation-header">
              <h3 class="allocation-header__heading heading heading--main1">Token Allocation</h3>
            </div>
            <!-- allocation-header//end-->
            <div class="allocation-data">
              <ul class="allocation-data__itembox">
                <li class="allocation-data__item allocation-data__item1">Reserve for Dex 10%</li>
                <li class="allocation-data__item allocation-data__item2">Strategical & Community 28%</li>
                <li class="allocation-data__item allocation-data__item3">Team & Others 12%</li>
                <li class="allocation-data__item allocation-data__item4">Fundraiser 50%</li>
              </ul>
            </div>
            <!-- allocation-data//end -->
            <div class="allocation-chart">
              <div class="allocation-chart__graph">
                <div class="allocation-chart__pie">
                  <canvas id="myChart"></canvas>
                </div>
                <!-- allocation-chart__pie//end -->
                <div class="allocation-chart__num">
                  <ul class="allocation-chart__num-itembox">
                    <li class="allocation-chart__num-item allocation-chart__num-item1">Fundraiser <strong class="allocation-chart__num-bold">50%</strong></li>
                    <li class="allocation-chart__num-item allocation-chart__num-item2">Team &<br>Others <strong class="allocation-chart__num-bold">12%</strong></li>
                    <li class="allocation-chart__num-item allocation-chart__num-item3">Strategical &<br>Community <strong class="allocation-chart__num-bold">28%</strong></li>
                    <li class="allocation-chart__num-item allocation-chart__num-item4">Reserve<br>for Dex<strong class="allocation-chart__num-bold">10%</strong></li>
                  </ul>
                </div>
                <!-- allocation-chart__num//end-->
              </div>
              <div class="allocation-chart__table table table--type1">
                <table>
                  <colgroup>
                    <col width="205px">
                    <col width="*">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">Token</th>
                      <th scope="col">Description</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>Token Name</td>
                      <td>SOMESING Exchange</td>
                    </tr>
                    <tr>
                      <td>Token Technology</td>
                      <td>SSX</td>
                    </tr>
                    <tr>
                      <td>Token Supply</td>
                      <td>ICON</td>
                    </tr>
                    <!-- 20181020 : [S] -->
                    <!-- 추후에 오픈 부탁 드립니다.
                    <tr>
                      <td>Token Cap</td>
                      <td>5,000,000,000 (Token Sale) +<br>5,000,000,000</td>
                    </tr>
                    <tr>
                      <td>Token Price​</td>
                      <td>1 SSX = 0.01 USD</td>
                    </tr>
                    <tr>
                      <td>Soft Cap</td>
                      <td>10,000,000 USD</td>
                    </tr>
                    <tr>
                      <td>Hard Cap</td>
                      <td>50,000,000 USD</td>
                    </tr>
                    -->
                    <tr>
                      <td>Token Cap</td>
                      <td>To be updated</td>
                    </tr>
                    <tr>
                      <td>Token Price​</td>
                      <td>To be updated</td>
                    </tr>
                    <tr>
                      <td>Soft Cap</td>
                      <td>To be updated</td>
                    </tr>
                    <tr>
                      <td>Hard Cap</td>
                      <td>To be updated</td>
                    </tr>
                    <!-- 20181020 : [E] -->
                    <tr>
                      <td>Payment Accepted</td>
                      <td>ICX</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <!-- allocation-chart__table//end -->
            </div>
            <!-- allocation-chart//end -->
          </div>
        </article>
        <article class="main-faq js-scroll-item">
          <div class="accordion-list">
            <div class="accordion-list__container">
              <div class="accordion-list__header">
                <h3 class="accordion-list__header-title heading heading--main1">FAQ</h3>
              </div>
              <!-- accordion-list__header//end -->
              <div class="accordion-list__itembox js-accordion" role="list">
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">What is the &#39;SOMESING ecosystem&#39; in a nutshell?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">SOMESING is a social music service based on blockchain technology. To be more specific, SOMESING’s ecosystem is designed in order to distribute the added values and enjoyment fairly and rationally to the contributors while they are creating, enjoying, supporting, and commercializing music contents.</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">How do I withdraw my SSX Tokens?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">After logging into your account and pressing &#39;withdraw,&#39; you will be able to withdraw purchased tokens after ICO. Bonus tokens will be locked for 3 months after the end of the main sale.</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">What currencies are accepted during the sale?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">We accept ICX only to purchase SSX token</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">Why ICON platform?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">At the beginning, SOMESING considered many platforms like ETH, EOS and etc. But the most important things to us are the platform, swift communication, and support. ICON would be a great partner who have made utmost efforts to build a blockchain ecosystem in the Korean market and our team sees the possibility of rapid adjustment and expansion from the partnership with ICON.</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">Do you have a minimum contribution limit for the ICO?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">Yes! To be stable, we have a minimum contribution “300 ICX”</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">When will SSX be listed on cryptocurrency exchanges?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">SSX will be listed on major exchanges at the end of the main sale, January 31</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
                <div class="accordion-list__item" role="listitem">
                  <div class="accordion-list__caption js-accordion-open">
                    <strong class="accordion-list__caption-title">What will happen to the unsold SSX Tokens?</strong>
                  </div>
                  <!-- accordion-list__caption//end -->
                  <div class="accordion-list__content">
                    <div class="accordion-list__content-container">
                      <p class="accordion-list__content-answer">Unsold Tokens will be burned</p>
                    </div>
                    <!-- accordion-list__content-container//end -->
                  </div>
                  <!-- accordion-list__content//end -->
                </div>
                <!-- accordion-list__item//end -->
              </div>
              <!-- accordion-list__itembox//end -->
            </div>
          </div>
          <!-- accordion-list//end -->
        </article>
      </section>
      <!-- FOOTER : [S] -->
       <footer class="footer">
   <div class="nav-float nav-float--footer">
     <a href="#none" class="nav-float__btn nav-float__btn-top js-btn-top">TOP</a>
   </div>
   <!-- nav-float//end -->
   <div class="footer-container">
     <div class="footer-contact">
       <div class="footer-contact__header">
         <h3 class="footer-contact__heading heading heading--main2">contact us</h3>
       </div>
       <form name="emailForm" id="emailForm">
         <filedset>
           <legend>Contact Us message input</legend>
           <div class="input-field">
           <ul class="input-field__itembox">
             <li class="input-field__item">
               <label for="input-name" class="label">Your name</label>
               <div class="input-text input-text--type1"><input type="text" name="name" id="email_name"></div>
             </li>
             <!-- input-field__list//end -->
             <li class="input-field__item">
               <label for="input-email" class="label">Your Email</label>
               <div class="input-text input-text--type1"><input type="text" name="email" id="email_email"></div>
             </li>
             <!-- input-field__list//end -->
             <li class="input-field__item">
               <label for="input-message" class="label">Message</label>
               <div class="input-text input-text--type1"><input type="text" name="message" id="email_message"></div>
             </li>
             <!-- input-field__list//end -->
           </ul>
           </div>
           <!-- input-field//end -->
           <div class="btn-group btn-group--input">
             <a href="#none" class="btn btn-ghost1 somesing-mail-send">SEND MESSAGE</a>
           </div>
         </filedset>
       </form>
       <div class="sns-share">
         <ul class="sns-share__itembox">
           <li class="sns-share__item"><a href="https://blog.naver.com/somesinglovers" class="btn-share btn-share--blog">BLOG</a></li>
           <!-- 20181020 : [S] -->
           <li class="sns-share__item sns-share__item--telegram">
             <a href="#none" class="btn-share btn-share--telegram">TELEGRAM</a>
             <div class="sns-link sns-link--telegram">
               <div class="sns-link__header">
                 <h4 class="sns-link__header-heading">Teleglam</h4>
               </div>
               <ul class="sns-link__itembox">
                 <li class="sns-link__item"><a href="https://t.me/somesinglovers" class="btn btn-default sns-link__anchor">Group</a></li>
                 <li class="sns-link__item"><a href="https://t.me/somesing_Notice" class="btn btn-default sns-link__anchor">Channel</a></li>
               </ul>
             </div>
           </li>
           <!-- 20181020 : [E] -->
           <li class="sns-share__item"><a href="https://open.kakao.com/o/g9siDC1" class="btn-share btn-share--kakao">KAKAO TALK</a></li>
           <li class="sns-share__item"><a href="https://www.facebook.com/somesinglovers" class="btn-share btn-share--facebook">FACEBOOK</a></li>
           <li class="sns-share__item"><a href="https://twitter.com/somesinglovers" class="btn-share btn-share--twitter">TWITTER</a></li>
           <li class="sns-share__item"><a href="https://www.instagram.com/somesinglovers/" class="btn-share btn-share--insta">INSTAGRAM</a></li>
         </ul>
       </div>
       <!-- sns-share//end -->
     </div>
     <!-- footer-contact//end -->
    <div class="footer-copy">
      <div class="footer-copy__header">
        <h3 class="footer-copy__heading"><img src="/web/kor/assets/img/ico-logo-333.png" alt="somesing"></h3>
        <h4 class="footer-copy__summary">Contact us</h4>
        <p class="footer-copy__text"><a href="mailto:support@somesing.io" class="footer-copy__text-anchor">support@somesing.io</a></p>
        <p class="footer-copy__copy">©2018 SOMESING. All Copyrights reserved</p>
      </div>
      <!-- footer-header//end -->
      <div class="footer-copy__menu">
        <ul class="footer-copy__itembox">
          <li class="footer-copy__item"><a href="/agreePrivacy" class="footer-copy__anchor" target="_blank">Privacy Policy</a></li>
          <li class="footer-copy__item"><a href="/agreeTerms" class="footer-copy__anchor" target="_blank">Terms & Conditions </a></li>
        </ul>
      </div>
      <!-- footer-menu//end -->
      <div class="btn-group btn-group--footer">
        <ul class="btn-group__itembox">
          <li class="btn-group__item"><a href="#main-download" class="btn btn-ghost1 js-btn-scroll">WHITE PAPER</a></li>
          <li class="btn-group__item"><a href="#popup-buy-token" class="btn btn-ghost1 js-popup-open">BUY Token</a></li>
        </ul>
      </div>
      <!-- btn-group//end -->
    </div>
    <!-- footer-copy//end -->
   </div>
   <!-- footer-container//end -->
</footer>

      <!-- FOOTER : [E] -->
    </div>
    <!-- view-container//end -->
    <div class="push-container">
      <div id="popup-main-video" class="popup popup--main-video">
        <div class="popup__container">
          <div class="popup__content">
            <div class="popup__video">
              <iframe src="" frameborder="0" allowfullscreen class="popup__video-iframe js-video-src"></iframe>
            </div>
          </div>
          <!-- popup__content//end -->
          <div class="btn-group btn-group--popup">
            <a href="#none" class="btn btn-close js-popup-close">닫기</a>
          </div>
        </div>
        <!-- popup__container//end -->
        <div class="popup__dim"></div>
      </div>
      <!-- popup//end -->
      <div id="popup-buy-token" class="popup popup--buy-token">
        <div class="popup__container">
          <div class="popup__content">
            <div class="popup-header">
              <p class="popup-header__desc">토큰 구매 기간이 아닙니다.<br>ICO 스케쥴을 확인해 주세요.</p>
            </div>
          </div>
          <!-- popup__content//end -->
          <div class="btn-group btn-group--popup">
            <a href="#none" class="btn btn-close js-popup-close">닫기</a>
          </div>
        </div>
        <!-- popup__container//end -->
        <div class="popup__dim"></div>
      </div>
      <!-- popup//end -->
      <div id="popup-main-waiting" class="popup popup--main-waiting">
        <div class="popup__container">
          <div class="popup__content">
            <div class="popup-header">
              <p class="popup-header__desc">준비중 입니다.</p>
            </div>
          </div>
          <!-- popup__content//end -->
          <div class="btn-group btn-group--popup">
            <a href="#none" class="btn btn-close js-popup-close">닫기</a>
          </div>
        </div>
        <!-- popup__container//end -->
        <div class="popup__dim"></div>
      </div>
      <!-- popup//end -->
    </div>
    <!-- push-container//end -->
  </div>
  <!-- viewport//end -->
  </body>
</>