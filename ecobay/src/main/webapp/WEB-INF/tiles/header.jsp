<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/resources/css/header.css" />
<script type="text/javascript">
	$(function() {});
</script>

<nav class="navbar fixed-top navbar-expand-md flex-nowrap navbar-new-top">
	<div class="container">
		<a href="/" class="navbar-brand">ECObay</a>
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
											<a href="#" data-toggle="modal" data-target="#findInfoModal">아이디/비밀번호 찾기</a>
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