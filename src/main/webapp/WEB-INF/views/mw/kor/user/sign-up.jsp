<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
  <%@ include file="/WEB-INF/views/mw/kor/common/inc/include.jsp"%>
  <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async defer></script>
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
              <article class="sign-input">
                <div class="sign-input__header">
                  <h3 class="header-heading heading heading--sub1">WELCOME</h3>
                  <p class="sign-input__header-desc">Sign in by entering the information below</p>
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
                              <p class="input-error__desc">필수 입력 정보입니다.</p>
                            </div>
                          </div>
                          <!-- input-field__box//end -->
                          <div class="input-field__box input-field__box--col2">
                            <div class="input-text input-text--type2">
                              <input type="text" name="lastName" id="lastName" class="signUp-input-group" />
                              <label for="input-last-name" class="label label-text--type2">Last name</label>
                            </div>
                            <div class="input-error">
                              <p class="input-error__desc">필수 입력 정보입니다.</p>
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
                            <p class="input-error__desc">이미 사용 중인 이메일입니다.</p>
                          </div>
                        </div>
                        <!-- input-field__item//end -->
                        <div class="input-field__item">
                          <div class="input-text input-text--type2">
                            <input type="password" name="passwd" id="passwd" class="signUp-input-group" />
                            <label for="input-pw" class="label label-text--type2">Password (Set more than 8 letters)</label>
                          </div>
                          <div class="input-error">
                            <p class="input-error__desc">비밀번호 형식에 맞지 않습니다.</p>
                          </div>
                        </div>
                        <!-- input-field__item//end -->
                        <div class="input-field__item">
                          <div class="input-text input-text--type2">
                            <input type="password" name="passwd_confirm" id="passwd_confirm" class="signUp-input-group" />
                            <label for="input-pw-confirm" class="label label-text--type2">Confirm password</label>
                          </div>
                          <div class="input-error">
                            <p class="input-error__desc">비밀번호가 일치하지 않습니다.</p>
                          </div>
                        </div>
                        <!-- input-field__item//end -->
                        <div class="input-field__item">
                          <div class="input-selectbox input-selectbox--type1">
                            <label for="select-country" class="label label-text--type2">Select Coutry</label>
                            <a class="selectbox selectbox--type1">
                              <select name="country" id="country" class="signUp-input-group">
                               <c:forEach items="${countryList}" var="item" varStatus="status">
                             		 <option value="<c:out value='${item.key}' />"><c:out value='${item.value}' /></option>
                             	</c:forEach>
                              </select>
                              <sapn class="selectbox-ico"></sapn>
                            </a>
                          </div>
                          <div class="input-error">
                            <p class="input-error__desc">필수 입력 정보입니다.</p>
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
                            <p class="input-error__desc">필수 입력 정보입니다.</p>
                          </div>
                        </div>
                        <!-- input-field__item//end -->
                      </div>
                      <!-- input-field//end -->
                      <div class="google-robot" id="google-robot">
                  		<!-- 구글 로봇 -->
                      </div>
                      <div class="btn-group">
                        <button type="button" class="btn btn-color2" id="btn-sign-up">Sign up</button>
                        <!-- <button type="button" class="btn btn-primary">Sign up</button> 회원가입 입력 완료 됐을 때 btn-primary class 추가 -->
                      </div>
                    </fieldset>
                  </form>
                </div>
                <!-- sign-input__form//end -->
                <div class="sign-info">
                  <p class="sign-info__desc">Already have an account? <a href="<c:url value='/user/login' />" class="btn btn-link2">SIGN IN</a></p>
                </div>
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