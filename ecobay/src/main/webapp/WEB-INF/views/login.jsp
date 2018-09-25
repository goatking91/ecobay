<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		 
		$(function() {
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		});
</script>
    <title>login Template for Bootstrap</title>
    <!-- Custom styles for this template -->
    <link href="/resources/css/login.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script type="text/javascript">
    $(document).ready(function(){
    	$('#newpwdModal').css("z-index","9999999");//모달 z-index 설정하기
    	$('#myModal').css("z-index","99999999");
    	
    	$('#idfind').click(function(event){
    		$('#idModal').modal('show');
    	});
    	
    	$('#idgo').click(function(event){
    		var member_name = $('#member_name').val();
    		var birth = $('#birth').val();
    		var phone = $('#phone').val();
    		
    		var postData = {'member_name' : member_name , 'birth' : birth, 'phone' : phone};
    		//널체크
    		if(member_name.length == 0){
    			$('#enter').text("이름 입력해주세요");
    			$('#member_name').focus();
    			return false;
    		}
    		if(birth.length == 0){
    			$('#enter2').text("생년월일 입력해주세요");
    			$('#birth').focus();
    			return false;
    		}
    		if(phone.length == 0){
    			$('#enter3').text("번호 입력해주세요");
    			$('#phone').focus();
    			return false;
    		}
    		//ajax로 보내고 얘네를 쿼리를 돌려서  
    		$.ajax({
    			async: true,
    			type: 'POST',
    			url : "/member/idfind.do",
    			data: JSON.stringify(postData),
    			dataType : "json",
    			contentType: "application/json; charset=UTF-8",
    			success : function(data) {//이름,생년월일,폰번호,아이디
    				console.log(data.member_id);
					 if(data.member_id != ""){
	    				
						$('#idModal').modal('hide'); 
	    				$('#message').find('h4').text("회원님의 정보로 등록된 아이디는" + data.member_id + " 입니다");
						$('#myModal').modal('show');	
					}else{
						//$('#idModal').modal('hide'); 
						$('#message').find('h4').text("정보가 일치하지 않습니다 다시 입력해주세요");
						$('#myModal').modal('show');	
					} 
    			},
    	        error: function(data) {
    				console.log("error :" + data);
    				console.log(data.member_id);
    			}
    		});  
    	})
    	
    	$('#pwdfind').click(function(event){
    		$('#pwdModal').modal('show');
    	});

    	var tmpId;//비번 변경할 아이디 값 기억
    	$('#pwdgo').click(function(event){
    		var member_id = $('#member_id1').val();
    		var member_name = $('#member_name1').val();
    		var birth = $('#birth1').val();
    		
    		var postData = {'member_id' : member_id, 'member_name' : member_name, 'birth' : birth}
    		
    		if(member_id.length == 0){
    			$('#enter4').text("아이디 입력해주세요");
    			$('#member_id1').focus();
    			return false;
    		}
    		if(member_name.length == 0){
    			$('#enter5').text("이름을 입력해주세요");
    			$('#member_name1').focus();
    			return false;
    		}
    		if(birth.length == 0){
    			$('#enter6').text("생일을 입력해주세요");
    			$('#birth1').focus();
    			return false;
    		}
    		//아이디를 먼저 받아와서 아이디에 해당하는 pwd값 업데이트
    		$.ajax({
    			async: true,
    			type: 'POST',
    			url : "/member/pwdfind.do",
    			data: JSON.stringify(postData),
    			dataType : "json",
    			contentType: "application/json; charset=UTF-8",
    			success : function(data) {//이름,생년월일,폰번호,아이디
    				console.log(data.pwd);
					 if(data.pwd != ""){
	    				tmpId = data.member_id;
						$('#pwdModal').modal('hide'); 
						$('#newpwdModal').modal('show');	
					}else{
						//$('#idModal').modal('hide'); 
						$('#message').find('h4').text("정보가 일치하지 않습니다 다시 입력해주세요");
						$('#myModal').modal('show');	
						return false;
					} 
    			},
    	        error: function(data) {
    				console.log("error :" + data);
    				console.log(data.pwd);
    			}
    		});
    	});
    	
    	$('#newpwdgo').click(function(event){
    		var pwd = $('#newpwd').val();
    		var pwdck = $('#newpwd2').val();
    		
    		if(pwd.length == 0){
    			$('#1enter').text("새 비밀번호를 입력해주세요");
    			$('#newpwd').focus();
    			return false;
    		}else if(pwdck.length == 0){
    			$('#2enter').text("비밀번호를 한번 더 입력해주세요");
    			$('#newpwd2').focus();
    			return false;
    		}else if(pwd != pwdck){
    			$('#message').find('h4').text("동일한 비밀번호를 입력해주세요");
				$('#myModal').modal('show');
				return false;
    		}
    		
    		var postData = {"member_id" : tmpId, "pwd" : pwd} 
    		$.ajax({
	    			async: true,
	    			type: 'POST',
	    			url : "/member/newpwd.do",
	    			data: {"member_id" : tmpId, "pwd" : pwd},
	    			dataType : "text",
/* 	    			contentType: "application/text; charset=UTF-8",  */ //배열을 넘길때 contentType쓰면 값이 안넘어감
	    			success : function(data) {//이름,생년월일,폰번호,아이디							 	
		    					$('#newpwdModal').modal('hide'); 
								$('#message').find('h4').text("비밀번호가 변경되었습니다");
								$('#myModal').modal('show');
	    			},
	    	        error: function(error) {
	    				console.log("error :" + data);
	    			}
	    		});
    	})
    	
    	$( "#birth" ).flatpickr({
        	maxDate: 'today',
            dateFormat: 'Y-m-d',
            onReady: function (selectedDates, dateStr, instance) {
                $('#birth input').val(
                    instance.formatDate(new Date(), 'Y-m-d')
                )
    		}
        });
    	
    	$( "#birth1" ).flatpickr({
        	maxDate: 'today',
            dateFormat: 'Y-m-d',
            onReady: function (selectedDates, dateStr, instance) {
                $('#birth1 input').val(
                    instance.formatDate(new Date(), 'Y-m-d')
                )
    		}
        });
    });
    
    </script>
</head>

<body class="text-center">
    <form class="form-signin" action="/login" method="post">
      <security:csrfInput />
      <h1 class="h3 mb-3 font-weight-normal">로그인</h1>
      <label for="inputEmail" class="sr-only">Email address</label>
      <input type="text" name="member_id" id="member_id" class="form-control" placeholder="Email address" required autofocus>
      <label for="inputPassword" class="sr-only">Password</label>
      <input type="password" name="pwd" id="pwd" class="form-control" placeholder="Password" required>
	      <div align="left">
	      	<input type="checkbox" value="remember-me"> 아이디 기억
	      </div>
	      <div class="d-flex justify-content-between align-items-center">
		      <div align="left">
		      	<a href="/member/reg.do">회원가입</a>
		      </div>
		      <div align="right">	
		      	<input type="button" style="padding-right:0" class="btn btn-link" id="idfind" value="아이디 ·">
		      	<input type="button" style="padding-left:0" class="btn btn-link" id="pwdfind" value="비밀번호 찾기">
		      </div>
	      </div>	
      <button class="btn btn-lg btn-primary btn-block" type="submit">로그인</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2018</p>
    </form>
  
  
    
<div class="modal fade" id="idModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">아이디찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group text-left">
		            <label for="name" class="col-form-label">이름</label>
		            <input id="member_name" name="member_name" type="text" class="form-control">
		            <span id="enter" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="birth" class="col-form-label">생년월일</label>
		            <input id="birth" name="birth" type="text" class="form-control">
		            <span id="enter2" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="phone" class="col-form-label">번호</label>
		            <input id="phone" name="phone" type="text" class="form-control" placeholder="ex)010-xxxx-oooo">
		            <span id="enter3" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="idgo" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="message">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">비밀번호찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group text-left">
		            <label for="name" class="col-form-label">아이디</label>
		            <input id="member_id1" name="member_id" type="text" class="form-control">
		            <span id="enter4" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="member_name1" class="col-form-label">이름</label>
		            <input id="member_name1" name="member_name" type="text" class="form-control">
		            <span id="enter5" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="birth1" class="col-form-label">생년월일</label>
		            <input id="birth1" name="birth" type="text" class="form-control">
		            <span id="enter6" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="pwdgo" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="newpwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">새 비밀번호 입력</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group text-left">
		            <label for="newpwd" class="col-form-label">새비밀번호</label>
		            <input id="newpwd" name="pwd" type="password" class="form-control">
		            <span id="1enter" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="newpwd2" class="col-form-label">비밀번호 확인</label>
		            <input id="newpwd2" name="pwd2" type="password" class="form-control">
		            <span id="2enter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="newpwdgo" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
  </body>
</html>