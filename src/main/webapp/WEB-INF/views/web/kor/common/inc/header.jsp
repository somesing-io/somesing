<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="gnb-container">
    <div class="gnb-box">
      <div class="gnb-header">
        <h1 class="gnb-header__symbol"><a href="<c:url value='/index' />" class="gnb-header__symbol-anchor">SOME SING</a></h1>
      </div>
      <!-- gnb-header//end -->
    </div>
    <!--gnb-box//end -->
    <div class="gnb-util">
      <div class="gnb-util__container">
        <nav class="gnb-util__nav">
          <ul class="gnb-util__itembox" role="menu">
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