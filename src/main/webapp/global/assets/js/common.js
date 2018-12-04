
$(function(){
	
	$.ajaxSetup({
		type : 'json',
		method : 'post',
		async : false,
	/*	beforeSend : function(xhr){
			xhr.setRequestHeader("x-ajax-call", "true");
		},*/
		error : function(error){
			console.log('에러가 발생하였습니다.');
			console.log(error);
		}
	});
});


var popup = function(url, popName, width, height){
	
	var top = (screen.height - height) / 2;
	var left = (screen.width - width) / 2;
	window.open(url, popName, 'width='+width+', height='+height+', left='+left+', top='+top+', toolbar=no, menubar=no, location=no, scrollbars=yes, status=no, resizable=no, fullscreen=no');
}

var postPopup = function(id, url, width, height, param){
	
	if($('#postPopup').length > 0){
		$('#postPopup').remove();
	}
	
	var form = $('<form></form>');
    form.attr('action', url);
    form.attr('method', 'post');
    form.appendTo('body');
    
    for(var key in param){
    	 form.append($('<input type="hidden" value="'+ param[key] + '" name="' + key + '">'));
    }
    
    var top = (screen.height - height) / 2;
	var left = (screen.width - width) / 2;
	
	if(width == '' && height == ''){
		window.open("", id, 'toolbar=no, menubar=no, location=no, scrollbars=yes, status=no, resizable=no, fullscreen=no');
	}else{
		window.open("", id, 'width='+width+', height='+height+', left='+left+', top='+top+', toolbar=no, menubar=no, location=no, scrollbars=yes, status=no, resizable=no, fullscreen=no');
	}
    
	form.target = id;
	form.submit();
}

var ajax_file_upload = function(_url, _form){
	
	var _data = new FormData(_form[0])
	
	$.ajax ({
		url : _url,
		type: "POST",
		data : _data,
		enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    cache: false,
		success : function(data) {
			if(typeof(data.message) != 'undefined' && data.message != ''){
				alert(data.message);
			}
		}
	});
}

var ajax_file_upload_callback = function(_url, _form, callback){
	
	var _data = new FormData(_form[0])
	
	$.ajax ({
		url : _url,
		type: "POST",
		data : _data,
		enctype: 'multipart/form-data',
	    processData: false,
	    contentType: false,
	    cache: false,
	    success : function(data){
			callback(data);
		}
	});
}


var ajax_data_upload = function(_url, _param, _dateType){
	
	if(_dateType == ''){
		_dateType = 'json';
	}
	
	$.ajax ({
		url : _url,
		data : _param,
		dateType : _dateType,
		success : function(data){
			if(typeof(data.message) != 'undefined' && data.message != ''){
				alert(data.message);
			}
			
			if(data.result == 'Y'){
				location.reload();
			}else{
				if(typeof(data.message) == 'undefined' || data.message == ''){
					alert('에러가 발생하였습니다.');
				}
			}
		}
	});
}

var ajax_data_upload_callback = function(_url, _param, _dateType, callback){
	
	if(_dateType == ''){
		_dateType = 'json';
	}
	
	$.ajax ({
		url : _url,
		data : _param,
		dateType : _dateType,
		success : function(data){
			callback(data);
		}
	});
}

var patternCheck = function(pattern, val){
	return pattern.test(val);
}

var emailCheck = function(val){
	var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return patternCheck(regExp, val);
}

var passwdCheck = function(val){
//	var regExp = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/i;
	var regExp = /^([a-zA-Z]|[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]|[0-9]){8,20}$/i;
	return patternCheck(regExp, val);
}

var postSubmit = function(action, param){
	
	$('#locationForm').remove();	// 기존 폼 삭제
	
	var $form = $('<form></form>');
	$form.attr('id', 'locationForm');
	$form.attr('action', action);
	$form.attr('method', 'post');
	$form.appendTo('body');
	
	if(param != ''){
		for(var key in param){
			$form.append('<input type="hidden" value="'+param[key]+'" name='+key+'>');
		}
	}
	
	$form.submit();
}