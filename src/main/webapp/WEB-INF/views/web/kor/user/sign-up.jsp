<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/web/kor/common/inc/include.jsp"%>
  <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
  <%@ include file="/WEB-INF/views/common/common-script.jsp"%>
</head>
<body class="sub-type sub-type1 js-login-type">
  <div class="viewport">
    <div class="view-container">
      <!-- HEADER : [S] -->
      <header class="gnb">
  		<%@ include file="/WEB-INF/views/web/kor/common/inc/header.jsp"%>
	  </header>

      <!-- HEADER : [E] -->
      <section class="content-container content-container--flex">
        <div class="container container--half">
          <article class="container--half-col sign-visual">
            <div class="panel">
              <div class="panel__table">
                <div class="panel__row">
                  <div class="panel__cell">
                    <div class="sign-visual__header">
                      <h3 class="sign-visual__header-heading heading heading--sub1">Share your songs<br>
                        in the global music<br>
                        community
                      </h3>
                    </div>
                    <!-- sign-visual__header//end -->
                  </div>
                  <!-- panel__cell//end -->
                </div>
                <!-- panel__row//end -->
              </div>
              <!-- panel__table//end -->
            </div>
            <!-- panel//end -->
          </article>
          <!-- sign-visual//end -->
          <article class="container--half-col sign-input">
            <div class="col-top" aria-hidden="true"></div>
            <div class="col-middle">
              <div class="sign-input__header">
                <h3 class="header-heading heading heading--sub2">WELCOME</h3>
                <p class="sign-input__header-desc">Sign up by entering the information below</p>
              </div>
              <!-- sign-input__header//end -->
              <div class="sign-input__form">
                <form method="post" name="signUpForm" id="signUpForm">
                	<input type="hidden" name="captchaVal" id="captchaVal" value="" />
                  <fieldset>
                    <legend>sign-in input form</legend>
                    <div class="input-field input-field--sign">
                      <div class="input-field__item">
                        <div class="input-field__box input-field__box--col2">
                          <div class="input-text input-text--type2">
                            <input type="text" name="firstName" id="firstName" class="signUp-input-group" />
                            <label for="input-first-name" class="label label-text--type2">First name</label>
                          </div>
                          <div class="input-error">
                            <p class="input-error__desc">성을 입력해주세요</p>
                          </div>
                        </div>
                        <!-- input-field__box//end -->
                        <div class="input-field__box input-field__box--col2">
                          <div class="input-text input-text--type2">
                            <input type="text" name="lastName" id="lastName" class="signUp-input-group" />
                            <label for="input-last-name" class="label label-text--type2">Last name</label>
                          </div>
                          <div class="input-error">
                            <p class="input-error__desc">이름을 입력해주세요</p>
                          </div>
                        </div>
                        <!-- input-field__box//end -->
                      </div>
                      <!-- input-filed__item//end -->
                      <div class="input-field__item">
                        <div class="input-text input-text--type2">
                          <input type="text" name="email" id="email" class="signUp-input-group" />
                          <label for="input-id" class="label label-text--type2">ID (E-mail Adress)</label>
                        </div>
                        <div class="input-error">
                          <p class="input-error__desc">아이디(이메일주소)를 입력해주세요</p>
                        </div>
                      </div>
                      <!-- input-field__item//end -->
                      <div class="input-field__item">
                        <div class="input-text input-text--type2">
                          <input type="password" name="passwd" id="passwd" class="signUp-input-group" />
                          <label for="input-pw" class="label label-text--type2">Password (Set more than 8 letters)</label>
                        </div>
                        <div class="input-error">
                          <p class="input-error__desc">형식에 맞게 비밀번호를 입력해주세요 (Set more than 8 letters)</p>
                        </div>
                      </div>
                      <!-- input-field__item//end -->
                      <div class="input-field__item">
                        <div class="input-text input-text--type2">
                          <input type="password" name="passwd_confirm" id="passwd_confirm" class="signUp-input-group" />
                          <label for="input-pw-confirm" class="label label-text--type2">Confirm password</label>
                        </div>
                        <div class="input-error">
                          <p class="input-error__desc">동일한 비밀번호를 입력해주세요</p>
                        </div>
                      </div>
                      <!-- input-field__item//end -->
                      <div class="input-field__item">
                        <div class="input-selectbox input-selectbox--type1">
                          <label for="select-country" class="label label-text--type2">Select Coutry</label>
                          <span class="selectbox selectbox--type1 js-selectbox">
                            <select name="country" id="country" class="signUp-input-group">
                             	<c:forEach items="${countryList}" var="item" varStatus="status">
                             		 <option value="<c:out value='${item.key}' />"><c:out value='${item.value}' /></option>
                             	</c:forEach>
                            </select>
                          </span>
                        </div>
                        <div class="input-error">
                          <p class="input-error__desc">국가를 선택해주세요</p>
                        </div>
                      </div>
                      <!-- input-field__item//end -->
                      <div class="input-field__item">
                        <div class="input-checkbox input-checkbox--type1">
                          <input type="checkbox" id="input-agree">
                          <label for="input-agree" class="label label-checkobx--type1"></label>
                        </div>
                        <p class="input-checkbox-desc">I agree with the <a href="<c:url value='/agreeTerms' />" class="btn btn-link3" target="_blank">terms and conditions</a> and <a href="<c:url value='/agreePrivacy' />" class="btn btn-link3" target="_blank">the privacy policy</a></p>
                        <div class="input-error">
                          <p class="input-error__desc">약관을 확인하시고 동의에 체크해주세요</p>
                        </div>
                      </div>
                      <!-- input-field__item//end -->
                    </div>
                    <!-- input-field//end -->
                    <div class="google-robot" id="google-robot">
                  	<!-- 구글 로봇 -->
                    </div>
                    <div class="btn-group">
                      <button type="button" class="btn btn-color1" id="btn-sign-up">Sign up</button>
                      <!-- <button type="button" class="btn btn-primary">Sign up</button> 회원가입 입력 완료 됐을 때 btn-primary class 추가 -->
                    </div>
                  </fieldset>
                </form>
              </div>
              <!-- sign-input__form//end -->
              <div class="sign-info">
                <p class="sign-info__desc">Already have an account? <a href="<c:url value='/user/login' />" class="btn btn-link2">SIGN IN</a></p>
              </div>
              <!-- sign-info//end -->
            </div>
            <!-- col-middle//end -->
            <div class="col-bottom">
              <!-- FOOTER : [S] -->
              <footer class="footer">
    <p class="footer-copy">©2018 SOMESING. All Copyrights reserved  </p>
</footer>
              <!-- FOOTER : [E] -->
            </div>
            <!-- col-bottom//end -->
          </article>
          <!-- sign-input//end -->
        </div>
      </section>
    </div>
    <!-- view-container//end -->
  </div>
  <!-- viewport//end -->
  </body>
</html>