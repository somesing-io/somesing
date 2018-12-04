<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
 	<%@ include file="/WEB-INF/views/mw/kor/common/inc/include.jsp"%>
 	<%@ include file="/WEB-INF/views/common/common-script.jsp"%>
</head>
<body class="sub-type sub-type2">
  <div class="viewport">
    <div class="view-container">
      <div class="container--wide">
        <div class="container--wide-col">
          <div class="col-top">
            <!-- HEADER : [S] -->
            <header class="gnb">
  				<%@ include file="/WEB-INF/views/mw/kor/common/inc/header.jsp"%>
			</header>
            <!-- HEADER : [E] -->
          </div>
          <div class="col-middle">
            <section class="content-container">
              <article class="sign-notice">
                <div class="sign-notice__header">
                  <h3 class="sign-notice__header-heading heading heading--sub3">OOPS!</h3>
                  <p class="sign-notice__header-desc sign-notice__header-desc-highlight1">이메일 인증이 완료되지 않았습니다!</p>
                  <p class="sign-notice__header-desc">회원가입을 완료하기 위해서는 이메일 인증이 반드시 필요합니다.
                    회원가입 때, 작성된 이메일 주소의 메일함을 확인하시고,
                    ‘이메일 인증 완료‘ Link 를 클릭해 주세요.</p>
                </div>
                <!-- sign-visual__header//end -->
                <div class="btn-group btn-group--login">
                  <p class="btn-group__desc">인증 메일을 못받으셨나요?</p>
                  <a href="#" class="btn btn-primary lang-kor" id="btn-send-email">인증 메일 재발송</a>
                </div>
                <!-- btn-group//end -->
              </article>
              <!-- sign-notice//end -->
            </section>
          </div>
          <div class="col-bottom">
            <!-- FOOTER : [S] -->
            <footer class="footer">
    <p class="footer-copy">©2018 SOMESING. All Copyrights reserved  </p>
</footer>
            <!-- FOOTER : [E] -->
          </div>
        </div>
        <!-- //end -->
      </div>
      <!-- //end -->
    </div>
    <!-- view-container//end -->
  </div>
  <!-- viewport//end -->
  </body>
</html>