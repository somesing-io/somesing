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
             
              <form method="post" name="passwdForm" id="passwdForm">
            	<input type="hidden" name="emailCode" id="emailCode" value="<c:out value='${emailCode}' />" />
                <div class="sign-notice__header">
                  <h3 class="sign-notice__header-heading heading heading--sub3">Reset password</h3>
                  <p class="sign-notice__header-desc sign-notice__header-desc-highlight1">새로운 비밀번호를 입력해주세요.</p>
                  <p class="sign-notice__header-desc">비밀번호는 8자 이상 입력해야하니 신중하게 등록해주세요.</p>
                </div>
                <!-- sign-visual__header//end -->
                <div class="input-field input-field--confirm">
                  <div class="input-field__item"><!-- 에러 메세지 노출될 경우 is-error 추가 부탁 드립니다 -->
                    <div class="input-text input-text--type2">
                      <input type="password" name="passwd" id="passwd" class="passwd-input-group" />
                      <label for="input-pw" class="label label-text--type2">New password (Set more than 8 letters )</label>
                    </div>
                    <div class="input-error">
                      <p class="input-error__desc">비밀번호 형식에 맞지 않습니다.</p>
                    </div>
                  </div>
                  <!-- input-field__item//end -->
                  <div class="input-field__item"><!-- 에러 메세지 노출될 경우 is-error 추가 부탁 드립니다 -->
                    <div class="input-text input-text--type2">
                      <input type="password" name="passwd_confirm" id="passwd_confirm" class="passwd-input-group">
                      <label for="input-pw-confirm" class="label label-text--type2">Confirm password</label>
                    </div>
                    <div class="input-error">
                      <p class="input-error__desc">비밀번호가 일치하지 않습니다.</p>
                    </div>
                  </div>
                  <!-- input-field__item//end -->
                </div>
                <!-- input-field//end -->
                <div class="btn-group btn-group--login">
                  <button class="btn btn-primary lang-kor" id="btn-passwd-change">비밀번호 재설정</button>
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