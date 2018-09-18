<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<link rel="stylesheet" href="/resources/css/header.css" />


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
				<form class="form-inline my-2 my-lg-0">
					<div class="input-group">
						<input class="form-control form-control-sm input-primary" id="searchInput" type="search" placeholder="Search" aria-label="Search">
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
									<form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
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
				<%-- <security:authorize access="isAuthenticated()">
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i>
					</button>
					
					<ul id="login-dp" class="dropdown-menu dropdown-menu-right">
						<li>
							<div class="row">
								<div class="col-md-12">
									<security:authorize access="isAuthenticated()">
										<div class="form-group">
											<form class="logoutForm" role="logoutForm" method="post" action="logout" accept-charset="UTF-8" id="login-nav">
												<button type="submit" class="btn btn-primary btn-block">로그아웃</button>
											</form>
										</div>
									</security:authorize>
								</div>
							</div>
						</li>
					</ul>
				</security:authorize> --%>
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
			<li class="nav-item"><a class="nav-link">소개</a></li>
			<li class="nav-item"><a class="nav-link">경매1</a></li>
			<li class="nav-item"><a class="nav-link">경매2</a></li>
			<li class="nav-item"><a class="nav-link">경매3</a></li>
			<li class="nav-item"><a class="nav-link">고객센터</a></li>
		</ul>
	</div>
</nav>







<!-- 모달 영역 -->
<!-- 아이디/비밀번호 찾기 선택 모달 -->
<div class="modal fade" id="findInfoModal" tabindex="-1" role="dialog" aria-labelledby="findInfoModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findInfoModalLabel">아이디/비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#findIdModal">
		  아이디 찾기
		</button>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#findPwdModal">
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
<div class="modal fade" id="findIdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findIdModalLabel">아이디 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group">
		            <label for="name" class="col-form-label">이름:</label>
		            <input type="text" class="form-control">
		          </div>
		       </div>
		   </div>
		   <div class="row">
		       <div class="col-md">
		          <div class="form-group">
		            <label for="birth" class="col-form-label">생년월일:</label>
		            <input type="text" class="form-control">
		          </div>
		      </div>
		      <div class="col-md">
		          <div class="form-group">
		            <label for="phone" class="col-form-label">전화번호:</label>
		            <input type="text" class="form-control">
		          </div>
		      </div>
		    </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">아이디 찾기</button>
      </div>
    </div>
  </div>
</div>

<!-- 비밀번호 찾기 모달 -->
<div class="modal fade" id="findPwdModal" tabindex="-1" role="dialog" aria-labelledby="findPwdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="findPwdModalLabel">비밀번호 찾기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div class="form-group">
		            <label for="id" class="col-form-label">ID(Email):</label>
		            <input type="text" class="form-control">
		          </div>
		      </div>
		      	
		   </div>
		   <div class="row">
		   		<div class="col-md">
		          <div class="form-group">
		            <label for="name" class="col-form-label">이름:</label>
		            <input type="text" class="form-control">
		          </div>
		       </div>
		       <div class="col-md">
		          <div class="form-group">
		            <label for="birth" class="col-form-label">생년월일:</label>
		            <input type="text" class="form-control">
		          </div>
		      </div>
		      
		    </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">비밀번호 찾기</button>
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
    
    /* document.getElementById("MyClockDisplay").textContent = time; */
    
    setTimeout(showTime, 1000);
    
}


showTime();
</script>

 
 
 
 
