<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:choose>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, 'index.jsp') > 0 }">
		<script type="text/javascript">
			$(function(){
				$('.somesing-mail-send').click(function(e){
					
					e.preventDefault();
					
					if($('#email_name').val() == ''){
						alert("<spring:message code='index.empty.field' />");
						$('#email_name').focus();
						return false;
					}
					
					if($('#email_email').val() == ''){
						alert("<spring:message code='index.empty.field' />");
						$('#email_email').focus();
						return false;
					}
					
					if($('#email_message').val() == ''){
						alert("<spring:message code='index.empty.field' />");
						$('#email_message').focus();
						return false;
					}
					
					ajax_data_upload_callback("<c:url value='/email/send' />", $('#emailForm').serialize(), '',function(data){
						
					if(data.result == 'Y'){
							alert("<spring:message code='index.send.email' />");
						}else{
							alert("<spring:message code='common.server.error' />");
						}
					});
				});
			});
	
		</script>
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/login.jsp') > 0 }">
		<script type="text/javascript">
	    	$(function(){
	    		<c:if test="${loginFail eq 'loginFail'}">
	    			$('#error-area p.input-error__desc').text("<spring:message code='login.empty.email' />");
					$('#error-area').addClass('is-error');
	    		</c:if>
	    		
	    		<c:if test="${captchaFail eq 'captchaFail'}">
					$('#error-area p.input-error__desc').text("<spring:message code='login.empty.captcha' />");
					$('#error-area').addClass('is-error');
				</c:if>
	    		
	    		$('#btn-sign-in').click(function(e){
	    			
	    			e.preventDefault();
	    			
	    			if($('#login_id').val() == '' || $('#login_pwd').val() == ''){
	    				$('#error-area p.input-error__desc').text("<spring:message code='login.empty.email' />");
	    				$('#error-area').addClass('is-error');
	    				return false;
	    			}
	    			
	    			if(grecaptcha.getResponse().length == 0){
	    				$('#error-area p.input-error__desc').text("<spring:message code='login.empty.captcha' />");
	    				$('#error-area').addClass('is-error');
	    				return false;
	    			}
	    			
	    			$('#login_username').val($('#login_id').val()+'|'+grecaptcha.getResponse());
	    			$('#loginForm').submit();
	    		});
	    	});
	    
		    var onloadCallback = function() {
				grecaptcha.render('google-robot', {
			    	'sitekey' : "<c:out value='${captchaSiteKey}' />",
			        'callback' : verifyCallback,
			        'theme' : 'light'
			  	});
			};
			    
		 	function verifyCallback(callback){}
	    	
	    </script>
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/login-pw-request.jsp') > 0 }">
		 <script type="text/javascript">
		  	$(function(){
		  		$('#btn-pw-request').click(function(e){
		  			
		  			e.preventDefault();
		  			
		  			if($('#email').val() == ''){
		  				alert("<spring:message code='login-pw-request.empty.email' />");
		  				return false;
		  			}
		  			
		  			ajax_data_upload_callback("<c:url value='/user/signUp/userCheck' />", {"email" : $('#email').val() }, '', function(data){
		  				if(data.result == 'N'){
		  					$('#loginPwForm').attr('action', "<c:url value='/user/login/pw/confirm'/>");
		  					$('#loginPwForm').submit();
		  				} else {
		  					alert("<spring:message code='login-pw-request.not.regist.email' />");
		  				}
				  	});
		  		});
		  	});
		  </script>
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/login-pw-reset.jsp') > 0 }">
		<script type="text/javascript">
		  	var flag1, flag2 = false;
		  
		  	$(function(){
		  		
		  		$('#passwdForm .passwd-input-group').focusout(function(){
		  			validation($(this));
		  		});
		  		
		  		$('#btn-passwd-change').click(function(e){
		  			e.preventDefault();
		  			
		  			if(flag1 && flag2){
		  				ajax_data_upload_callback("<c:url value='/user/login/pw/update' />", $('#passwdForm').serialize() , '', function(data){
		 					if(data.result == 'Y'){
		 						location.href= "<c:url value='/user/login/pw/finish' />";
		 					} else {
		 						if(data.message == 'FIELD_ERROR'){
		 							if(data.data != null){
		 								if(data.data instanceof Array){
		 									for(var i in data.data){
		 	 									validation($('#'+data.data[i]));
		 	 								 }
		 								} else {
		 									validation($('#'+data.data));
		 								}
		 							 } else {
		 								 alert("<spring:message code='common.server.error' />");
		 							 }
		 						}else{
		 							alert("<spring:message code='common.server.error' />");
		 						}
		 					}
		  				});
		  			}
		  		});
		  	});
		  	
		  	var validation = function($obj){
		  		if($obj.attr('id') == 'passwd') {
					if($obj.val() == ''){ flag1 = false; showError($obj, "<spring:message code='login-pw-reset.empty.passwd' />");
					} else if(!passwdCheck($obj.val())){ flag1 = false; showError($obj, "<spring:message code='login-pw-reset.not.pattern.passwd' />");
					} else { flag1 = true; hideError($obj); }
				} else if($obj.attr('id') == 'passwd_confirm'){
					if($obj.val() != $('#passwd').val()){ flag2 = false; showError($obj, "<spring:message code='login-pw-reset.not.equal.passwd' />");
					} else { flag2 = true; hideError($obj); }
				}
		  	}
		  		
		 	var hideError = function($obj){
		 		$obj.parent().parent().removeClass('is-error');
		 	}
		 	  	
		 	var showError = function($obj, message){
		 		if(message != ''){
		 			$obj.parent().next().children('p.input-error__desc').text(message);
		 		}
		 		$obj.parent().parent().addClass('is-error');
		 	}
		</script>
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/sign-up.jsp') > 0 }">
		<script type="text/javascript">
		  	var flag1, flag2, flag3, flag4, flag5, flag7, flag8 = false;	// 버튼 활성화 체크 변수
		  	var chkSubmit = false;
		  	
		  	$(function(){
		  		$('#signUpForm .signUp-input-group').focusout(function(){
		  			validation($(this));
		  		});
		  		
		  		$('#input-agree').click(function(e){
		  			if($(this).is(":checked")){
		  				flag7 = true;
		  				showButton();
		  				hideError($(this));
		  			}else {
		  				flag7 = false;
		  				showButton();
		  				showError($(this), '');
		  			}
		  		});
		  		
		  		$('#btn-sign-up').click(function(e){
		  			e.preventDefault();
		  			
					if (flag1 && flag2 && flag3 && flag4 && flag5 && flag7 && flag8) {
		  				if(!chkSubmit) {
		  					chkSubmit = true;
		  					
		  					ajax_data_upload_callback("<c:url value='/user/signUp/insert' />", $('#signUpForm').serialize() , '', function(data){
			  					 if(data.result == 'Y'){
			  						postSubmit("<c:url value='/user/signConfirm' />", {'email' : data.data });
			  					 } else {
			  						 if(data.message == 'EMAIL_OVERLAP'){
			  							flag3 = false; showError($('#email'), "<spring:message code='sign-up.overlap.email' />");
			  						 } else if(data.message == 'FIELD_ERROR'){
			  							if(data.data instanceof Array){
		 									for(var i in data.data){
		 	 									validation($('#'+data.data[i]));
		 	 								 }
		 								} else {
		 									validation($('#'+data.data));
		 								}
			  						 } else if(data.message == 'CAPTCHA_ERROR'){
			  							alert("<spring:message code='sign-up.empty.captcha' />");
			  						 } else {
			  							alert("<spring:message code='common.server.error' />");
			  						 }
			  					 }
		  	  				});
		  					
		  					chkSubmit = false;
		  				}
		  			}
		  		});
		  	});
		  	
			var onloadCallback = function() {
				grecaptcha.render('google-robot', {
			    	'sitekey' : "<c:out value='${captchaSiteKey}' />",
			        'callback' : verifyCallback,
			        'theme' : 'light'
			  	});
			};
			    
		 	function verifyCallback(callback){
		 		if(grecaptcha.getResponse() != ''){
		 			flag8 = true; $('#captchaVal').val(grecaptcha.getResponse()); showButton();
		 		} else { flag8 = false; showButton(); }
		   }
		 
		  	var validation = function($obj){
		  		if($obj.attr('id') == 'firstName'){
		  			if($obj.val() == ''){ flag1 = false; showError($obj, '');
					} else { flag1 = true; hideError($obj); }
		  		}else if($obj.attr('id') == 'lastName'){
		  			if($obj.val() == ''){ flag2 = false; showError($obj, '');
					} else { flag2 = true; hideError($obj); flag2 = true; }
		  		}else if($obj.attr('id') == 'email'){
		  			
					if($obj.val() == ''){ flag3 = false; showError($obj, "<spring:message code='sign-up.empty.email' />");
					} else if(!emailCheck($obj.val())){ flag3 = false; showError($obj, "<spring:message code='sign-up.not.pattern.email' />");
					} else if(emailOverlapCheck() == 'N'){
						flag3 = false; showError($obj, "<spring:message code='sign-up.overlap.email' />");
					} else {
						// 사용가능한 이메일 주소입니다. 표시
						flag3 = true; hideError($obj);
					}
				} else if($obj.attr('id') == 'passwd') {
					if($obj.val() == ''){ flag4 = false; showError($obj, "<spring:message code='sign-up.overlap.passwd' />");
					} else if(!passwdCheck($obj.val())){ flag4 = false; showError($obj, "<spring:message code='sign-up.not.pattern.passwd' />");
					} else { flag4 = true; hideError($obj); }
				} else if($obj.attr('id') == 'passwd_confirm'){
					if($obj.val() == ''){ flag5 = false; showError($obj, '비밀번호를 입력해주세요'); 
					} else if($obj.val() != $('#passwd').val()){ flag5 = false; showError($obj, "<spring:message code='sign-up.not.equal.passwd' />");
					} else { flag5 = true; hideError($obj); }
				} else if($obj.attr('id') == 'countury') { 
					if($obj.val() == ''){ showError($obj, '');
					} else { hideError($obj); }
				}
		  	}
		  	
		  	var hideError = function($obj){
		  		$obj.parent().parent().removeClass('is-error');
		  		showButton();
		  	}
		  	
		  	var showError = function($obj, message){
		  		if(message != ''){
		  			$obj.parent().next().children('p.input-error__desc').text(message);
		  		}
				$obj.parent().parent().addClass('is-error');
				showButton();
		  	}
		  	
		  	var showButton = function(){
		  		
		  		var btnClass = '';
		  		
		  		if("<c:out value='${isMobile}' />" == "true"){
		  			btnClass = 'btn-color2';
		  		} else {
		  			btnClass = 'btn-color1';
		  		}
		  		
		  		if (flag1 && flag2 && flag3 && flag4 && flag5 && flag7 && flag8){
		  			$('#btn-sign-up').removeClass(btnClass);
		  	  	  	$('#btn-sign-up').addClass('btn-primary');
		  		} else {
		  			$('#btn-sign-up').removeClass('btn-primary');
		  		  	$('#btn-sign-up').addClass(btnClass);
		  		}	
		  	}
		  	
		  	// 이메일 중복 검사
		  	var emailOverlapCheck = function(){
		  		
		  		var result = '';
		  		
		  		ajax_data_upload_callback("<c:url value='/user/signUp/userCheck' />", {"email" : $('#email').val()}, '', function(data){
		  			if(data.result != 'Y') result  = 'N';
		  			else result = 'Y';
		  		});
		  		
		  		return result;
		  	}
	  </script>  
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/sign-confirm.jsp') > 0 }">
		<script type="text/javascript">
	 		$(function(){
	 			$('#btn-send-mail').click(function(e){
	 				
	 				e.preventDefault();
	 				
	 				ajax_data_upload_callback("<c:url value='/user/send/email' />", {"email" : "<c:out value='${email}' />"}, '', function(data){
	 		  			if(data.result == 'Y'){
	 		  				alert("<spring:message code='sign-confirm.resend.email' />");
	 		  			} else {
	 		  				alert("<spring:message code='common.server.error' />");
	 		  			}
	 		  		});
	 			});
	 		});
	 	</script>
	</c:when>
	<c:when test="${fn:indexOf(pageContext.request.requestURI, '/user/login-confirm.jsp') > 0 }">
		 <script type="text/javascript">
		  	$(function(){
		  		$('#btn-send-email').click(function(){
		  			postSubmit("<c:url value='/user/login/send/mail' />", {'email' : '<c:out value="${email}" />'});
		  		});
		  	});
		  </script>
	</c:when>
</c:choose>

