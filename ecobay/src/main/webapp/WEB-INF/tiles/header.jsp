<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet" href="/resources/css/header.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

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
<!-- Header -->
<nav class="navbar fixed-top navbar-expand-md flex-nowrap navbar-new-top">
	<div class="container">
		<!-- BrandName -->
		<a href="/main.do" class="navbar-brand">ECObay</a>
		<ul class="nav navbar-nav mr-auto">
			<li id="MyDayDisplay" class="clock"></li>
			<li id="MyClockDisplay" class="clock"></li>
		</ul>
		<ul class="navbar-nav flex-row">
		
			<!-- Search -->
			<li id="searchBar">
				<form class="form-inline my-2 my-lg-0" method="post" id="searchForm" action="/product/list.do">
					<div class="input-group">
						<security:csrfInput/>
						<input class="form-control form-control-sm input-primary" name="searchVal" id="searchInput" type="search" placeholder="Search" aria-label="Search" value="${sVal}">
				      	<button class="btn btn-outline-primary btn-sm input-group-append" type="button" id="searchBtn">
	                        <i class="fa fa-search"></i>
	                  	</button>
					</div>
			      
			    </form>
			</li>
			
			<!-- Login DropDown -->
			<li class="dropdown">
				<!-- 인증된 유저가 아닐 때 -->
				<security:authorize access="isAnonymous()">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user-o"></i>
					</button>
					
					<ul id="login-dp" class="dropdown-menu dropdown-menu-right">
						<li>
							<div class="row">
								<div class="col-md-12">
									<form class="form" role="form" method="post" action="/login" accept-charset="UTF-8" id="login-nav">
										<security:csrfInput />
										<div class="form-group">
											<label class="sr-only" for="#member_id">Email address</label> 
											<input type="email" class="form-control" name="member_id" id="member_id" placeholder="Email address" required>
										</div>
										<div class="form-group">
											<label class="sr-only" for="#pwd">Password</label>
											<input type="password" class="form-control"
												name="pwd" id="pwd" placeholder="Password" required>
											<div class="help-block text-right">
												<a href="#" data-toggle="modal" data-target="#findInfoModal">아이디/비밀번호 찾기</a>
											</div>
										</div>
										<div class="form-group">
											<button type="submit" class="btn btn-primary btn-block">로그인</button>
										</div>
									</form>
								</div>
								<div class="bottom text-center">
									처음 오셨나요? <a href="/member/join.do"><b>회원가입</b></a>
								</div>
							</div>
						</li>
					</ul>
				</security:authorize>
				
				
				<!-- 인증된 유저일 때 -->
				<security:authorize access="isAuthenticated()">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i>
					</button>
					
					<ul id="login-dp" class="dropdown-menu dropdown-menu-right">
						<li>
							<div class="row">
								<div class="col-md-12">
								
									<div class="form-group">
											<a style="text-decoration: none" href="/member/mypage.do"><button class="btn btn-default btn-block" >마이페이지</button></a>
										</div>
									
										<div class="form-group">
											<form class="logoutForm" role="logoutForm" method="post" action="/logout" accept-charset="UTF-8" id="login-nav">
												<security:csrfInput />
												<button type="submit" class="btn btn-primary btn-block">로그아웃</button>
											</form>
										</div>
									
								</div>
							</div>
						</li>
					</ul>
				</security:authorize> 
			</li>
		</ul>
		<button class="navbar-toggler ml-auto" type="button"
			data-toggle="collapse" data-target="#navbar2">
			<span class="navbar-toggler-icon"></span>
		</button>
	</div>
</nav>

<nav class="navbar navbar-expand-md navbar-new-bottom">
	<div class="navbar-collapse collapse pt-2 pt-md-0" id="navbar2">

		<ul class="navbar-nav w-100 justify-content-center px-3">
			<li class="nav-item active"><a class="nav-link" href="/main.do">홈</a></li>
			<li class="nav-item"><a class="nav-link" href="/intro.do">소개</a></li>
			<li class="nav-item"><a class="nav-link" href="/product/list.do">경매목록</a></li>
			<li class="nav-item"><a class="nav-link" href="/product/reg.do">물품등록</a></li>
			<li class="nav-item"><a class="nav-link" href="/support.do">고객센터</a></li>
		</ul>
	</div>
</nav>

<!-- 모달 영역 -->
<!-- 아이디/비밀번호 찾기 선택 모달 -->
<div class="modal fade" id="findInfoModal" tabindex="-1" role="dialog" aria-labelledby="findInfoModalLabel" aria-hidden="true" >
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findInfoModalLabel">아이디/비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align: center;">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#idModal">
		  아이디 찾기
		</button>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#pwdModal">
		  비밀번호 찾기
		</button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 아이디 찾기 모달 -->
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

<div class="modal fade" id="mysearchModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
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

<!-- 비밀번호 찾기 모달 -->
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

<!-- 새 비밀번호 입력 -->
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


<script type="text/javascript">
	function showTime(){
	    var date = new Date();
	    var y = date.getFullYear();
	    var M = date.getMonth()+1;
	    var d = date.getDate();
	    var h = date.getHours(); // 0 - 23
	    var m = date.getMinutes(); // 0 - 59
	    var s = date.getSeconds(); // 0 - 59
	    var session = "오전";
	    
	    if(h == 0){
	        h = 12;
	    }
	    
	    if(h == 12){
	        session = "오후";
	    }
	    
	    if(h > 12){
	        h = h - 12;
	        session = "오후";
	    }
	    
	    
	    y = y.toString().substr(2,2);
	    M = (M < 10) ? "0" + M : M;
	    d = (d < 10) ? "0" + d : d;
	    h = (h < 10) ? "0" + h : h;
	    m = (m < 10) ? "0" + m : m;
	    s = (s < 10) ? "0" + s : s;
	    
	    var day = y + "년 " + M + "월 " + d + "일";
	    var time = session + " " + h + ":" + m + ":" + s;
	    document.getElementById("MyDayDisplay").innerHTML = day;
	    document.getElementById("MyClockDisplay").innerHTML = time;
	    
	    setTimeout(showTime, 1000);
	    
	}
	
	
	showTime();
	$("document").ready(function() {	
		
		$("#searchBtn").on("click", function(e) {
			e.preventDefault();
			$('#searchForm')[0].submit();
		});
		
		$('#newpwdModal').css("z-index","9999999");//모달 z-index 설정하기
    	$('#mysearchModal').css("z-index","99999999");
		
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
						$('#mysearchModal').modal('show');	
					}else{
						//$('#idModal').modal('hide'); 
						$('#message').find('h4').text("정보가 일치하지 않습니다 다시 입력해주세요");
						$('#mysearchModal').modal('show');	
					} 
    			},
    	        error: function(data) {
    				console.log("error :" + data);
    				console.log(data.member_id);
    			}
    		});  
    	})
    	
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
						$('#mysearchModal').modal('show');	
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
				$('#mysearchModal').modal('show');
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
								$('#mysearchModal').modal('show');
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

 
 
 
 
