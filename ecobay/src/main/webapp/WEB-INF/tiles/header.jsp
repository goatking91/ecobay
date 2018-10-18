<%@page import="org.ecobay.user.util.UserDetailsVO"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	Object principal = auth.getPrincipal();
	String name = "";
	if(principal != null && principal instanceof UserDetailsVO) {
		name = ((UserDetailsVO)principal).getMember_name();
	}
%>
<link rel="stylesheet" href="/resources/css/header.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

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
				<security:authorize access="isAuthenticated()" >
					<button type="button" class="btn btn-outline-primary btn-sm dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-user"></i>
					</button>
					
					<ul id="login-dp" class="dropdown-menu dropdown-menu-right">
						<li>
							<div class="row">
								<div class="col-md-12">
									<div style ="text-align: center;"><%=name %>님 환영합니다.</div>
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
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#findidModal" id="findidModalShow">
		  아이디 찾기
		</button>
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#findpwdModal" id="findpwdModalShow">
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
<div class="modal fade" id="findidModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
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
		            <label for="findname" class="col-form-label">이름</label>
		            <input id="findmember_name" name="member_name" type="text" class="form-control">
		            <span id="findenter" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="findbirth" class="col-form-label">생년월일</label>
		            <input id="findbirth" name="birth" type="text" class="form-control">
		            <span id="findenter2" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="findphone" class="col-form-label">번호</label>
		            <input id="findphone" name="phone" type="text" class="form-control" placeholder="ex)010-xxxx-oooo">
		            <span id="findenter3" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="findidgo" class="btn btn-primary">확인</button>
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
		          <div id="findmessage">
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
<div class="modal fade" id="findpwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
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
		            <label for="findname" class="col-form-label">아이디</label>
		            <input id="findmember_id1" name="member_id" type="text" class="form-control">
		            <span id="findenter4" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="findmember_name1" class="col-form-label">이름</label>
		            <input id="findmember_name1" name="member_name" type="text" class="form-control">
		            <span id="findenter5" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="findbirth1" class="col-form-label">생년월일</label>
		            <input id="findbirth1" name="birth" type="text" class="form-control">
		            <span id="findenter6" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="findpwdgo" class="btn btn-primary">확인</button>
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
		            <label for="findnewpwd" class="col-form-label">새비밀번호</label>
		            <input id="findnewpwd" name="pwd" type="password" class="form-control">
		            <span id="find1enter" style="color: red"></span>
		          </div>
		          <div class="form-group text-left">
		            <label for="findnewpwd2" class="col-form-label">비밀번호 확인</label>
		            <input id="findnewpwd2" name="pwd2" type="password" class="form-control">
		            <span id="find2enter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="findnewpwdgo" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

 <script type="text/javascript" src="/resources/js/header.js"></script>
