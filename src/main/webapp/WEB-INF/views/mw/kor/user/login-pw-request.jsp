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
              
              <form method="post" name="loginPwForm" id="loginPwForm">
                <div class="sign-notice__header">
                  <h3 class="sign-notice__header-heading heading heading--sub3">Request reset password!</h3>
                  <p class="sign-notice__header-desc sign-notice__header-desc-highlight1">비밀번호를 잊으셨나요?</p>
                  <p class="sign-notice__header-desc">비밀번호 재설정을 하시려면 이메일 입력 후 링크 발송 버튼을 눌러주세요.
                    입력하신 메일로 재설정 링크가 발송되어 비밀번호를 변경할 수 있습니다.</p>
                </div>
                <!-- sign-visual__header//end -->
                <div class="input-field input-field--confirm">
                  <div class="input-field__item">
                    <div class="input-text input-text--type2">
                      <input type="text" id="email" name="email" />
                      <label for="input-id" class="label label-text--type2">ID (E-mail Adress)</label>
                    </div>
                  </div>
                  <!-- input-field__item//end -->
                </div>
                <!-- input-field//end -->
                <div class="btn-group btn-group--login">
                  <a href="#" class="btn btn-primary lang-kor"id="btn-pw-request">비밀번호 재설정 링크 발송</a>
                  <a href="<c:url value='/user/login' />" class="btn btn-link3">Back to SIGN IN</a>
                </div>
              </form>
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