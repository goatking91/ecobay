<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<hr>

<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-sm-10"><h1>${member_name}</h1></div>
		<div class="col-sm-2"></div>
	</div>
	
	<div class="row">
		<!-- 왼쪽 sub_nav -->
		<div class="col-sm-3">
			<hr><br>
			<ul class="list-group">
            	<li class="list-group-item text-muted">Activity</li>
            	<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Shares</strong>
				    <span class="badge badge-primary badge-pill">14</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Likes</strong>
				    <span class="badge badge-primary badge-pill">13</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Posts</strong>
				    <span class="badge badge-primary badge-pill">37</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Followers</strong>
				    <span class="badge badge-primary badge-pill">78</span>
				</li>
			</ul> 
		</div>
		<!-- 왼쪽 sub_nav 끝 -->
		
		
		<!-- 탭 영역 -->
		<div class="col-sm-9">
			<nav class="nav nav-tabs" id="myTab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">내 정보</a>
				<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">판매</a>
				<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">구매</a>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="form-group row">
					<input class="form-control col-sm-3" id="member_id" name="member_id" type="text" value="${member.member_name}" readonly> 님의 정보입니다
				</div>
		<div class="col-sm-12">
	        <form>
	        	<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
					<div class="col-sm-4">
						<input class="form-control" id="member_name" name="member_name" type="text" value="${member.member_name}" readonly>
					</div>
				</div>
	        	
	        	<div class="form-group row">
	          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
			        <div class="col-sm-3">
			        	<div class="input-group">
							<input class="form-control" id="member_id" name="member_id" type="text" value="${member.member_id}" readonly>
						</div>
					</div>
	        		<div class="col-sm-3"></div>
	        	</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label><!-- datepicker6자리로 바꾸기 930811-->
					<div class="col-sm-3">
						<input class="form-control" id="birth" name="birth" type="text" value="${member.birth}" readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
					<div class="col-sm-3">
						<input class="form-control" id="gender" name="gender" type="text" value="${member.gender}" readonly>
					</div>
				</div>	
				
				<div class="form-group row">	
				<label class="col-sm-3 col-form-label text-right" for="phone">번호</label>
					<div class="col-sm-3">
						<input class="form-control" id="phone" name="phone" type="text" value="${member.phone}" readonly>
					</div>
				</div>    		
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="zipcode">주소</label>
					<div class="col-sm-3">
						<input class="form-control" id="zipcode" name="zipcode" type="text" value="${member.zipcode}" readonly>	                  	
					</div>
				</div> 
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<input class="form-control" id="addr1" name="addr1" type="text" value="${member.addr1}" readonly>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<input class="form-control" id="addr2" name="addr2" type="text" value="${member.addr2}" readonly>
					</div>	
				</div>
							
				<div class="form-group row">
					<div class="col-sm text-center">
						<input type="button" class="btn btn-lg btn-info" value="수정" onclick="location.href='update.do?member_id=${member.member_id}'">
					</div>	
				</div>     	
			</form>
		</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">menu1 탭</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">menu2 탭</div>
			</div>
		</div>
		<!--탭 영역 끝-->
	</div>
</div>                           