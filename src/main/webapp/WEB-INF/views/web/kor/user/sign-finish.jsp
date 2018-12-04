<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
 	<%@ include file="/WEB-INF/views/web/kor/common/inc/include.jsp"%>
 	<%@ include file="/WEB-INF/views/common/common-script.jsp"%>
</head>
<body class="sub-type sub-type2 js-login-type">
  <div class="viewport">
    <div class="view-container">
      <!-- HEADER : [S] -->
      <header class="gnb">
  		<%@ include file="/WEB-INF/views/web/kor/common/inc/header.jsp"%>
	  </header>

      <!-- HEADER : [E] -->
      <section class="content-container content-container--wide">
        <div class="container container--wide">
          <article class="sign-notice container--wide-col">
            <div class="col-top" aria-hidden="true"></div>
            <div class="col-middle">
              <div class="sign-notice__header">
                <h3 class="sign-notice__header-heading heading heading--sub3">Hello!</h3>
                <p class="sign-notice__header-desc sign-notice__header-desc-highlight1">회원가입이 완료되었습니다.</p>
                <p class="sign-notice__header-desc">로그인 후 서비스를 이용해 주세요.</p>
              </div>
              <!-- sign-visual__header//end -->
              <div class="btn-group btn-group--sign">
                <a href="<c:url value='/user/login' />" class="btn btn-primary">SIGN IN</a>
              </div>
              <!-- btn-group//end -->
            </div>
            <div class="col-bottom">
              <!-- FOOTER : [S] -->
              <footer class="footer">
    <p class="footer-copy">©2018 SOMESING. All Copyrights reserved  </p>
</footer>
              <!-- FOOTER : [E] -->
            </div>
          </article>
          <!-- sign-notice//end -->
        </div>
      </section>
    </div>
    <!-- view-container//end -->
  </div>
  <!-- viewport//end -->
  </body>
</html>