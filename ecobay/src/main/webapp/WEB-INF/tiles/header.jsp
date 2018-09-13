<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/header.css" />
<script type="text/javascript">
	$(function() {});
</script>

<nav class="navbar fixed-top navbar-expand-md flex-nowrap navbar-new-top">
	<div class="container">
		<a href="/" class="navbar-brand">ECOBay</a>
		<ul class="nav navbar-nav mr-auto"></ul>
		<ul class="navbar-nav flex-row">
			<!-- <li class="nav-item">
	                    <a class="nav-link px-2">Link</a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link px-2">Link</a>
	                </li> -->
			<li class="dropdown">
				<a href="#" class="dropdown-toggle btn header-btn" data-toggle="dropdown">
					<b>Login</b>
					<span class="caret"></span>
				</a>
				
				<ul id="login-dp" class="dropdown-menu">
					<li>
						<div class="row">
							<div class="col-md-12">
								<form class="form" role="form" method="post" action="login" accept-charset="UTF-8" id="login-nav">
									<div class="form-group">
										<label class="sr-only" for="exampleInputEmail2">Email address</label> 
										<input type="email" class="form-control" id="exampleInputEmail2" placeholder="Email address" required>
									</div>
									<div class="form-group">
										<label class="sr-only" for="exampleInputPassword2">Password</label>
										<input type="password" class="form-control"
											id="exampleInputPassword2" placeholder="Password" required>
										<div class="help-block text-right">
											<a href="">아이디/비밀번호 찾기</a>
										</div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary btn-block">로그인</button>
									</div>
								</form>
							</div>
							<div class="bottom text-center">
								처음 오셨나요? <a href="/memberJoin.do"><b>회원가입</b></a>
							</div>
						</div>
					</li>
				</ul>
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
			<li class="nav-item active"><a class="nav-link" href="/">홈</a></li>
			<li class="nav-item"><a class="nav-link">소개</a></li>
			<li class="nav-item"><a class="nav-link">경매1</a></li>
			<li class="nav-item"><a class="nav-link">경매2</a></li>
			<li class="nav-item"><a class="nav-link">경매3</a></li>
			<li class="nav-item"><a class="nav-link">고객센터</a></li>
		</ul>
	</div>
</nav>