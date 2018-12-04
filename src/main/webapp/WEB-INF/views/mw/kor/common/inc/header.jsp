<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="gnb-container">
      <div class="gnb-header">
        <h1 class="gnb-header__symbol"><a href="<c:url value='/index' />" class="gnb-header__symbol-anchor">Some sing</a></h1>
        <h1 class="gnb-header__util"><a href="<c:url value='/index' />"></a></h1>
      </div>
      <!-- gnb-header//end -->
      <div class="gnb-box">
        <div class="gnb-menu">
          <div class="gnb-menu__container" role="group">
            <nav class="gnb-menu__nav gnb-menu__nav--all">
              <div class="gnb-menu__header sr-only" aria-hidden="false">
                <h2 class="gnb-menu__header-title">Site Navigation</h2>
              </div>
              <!-- gnb-menu__header//end -->
            </nav>
          </div>
          <!-- gnb-gnb-menu//end -->
        </div>
        <!-- gnb-menu//end -->
        <div class="gnb-util">
          <div class="gnb-util__container">
            <nav class="gnb-util__nav">
              <ul class="gnb-util__itembox" role="menu">
                <!--
                <li class="gnb-util__item" role="menuitem">
                  <a href="index.html" class="gnb-util__anchor">LOGOUT</a>
                </li>
                -->
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
    <!-- gnb-box//end -->
  </div>
  <!-- gnb-container//end -->