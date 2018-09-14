<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<hr>

<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-sm-10"><h1>User name</h1></div>
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
				<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Home</a>
				<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">menu1</a>
				<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">menu2</a>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">홈 탭</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">menu1 탭</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">menu2 탭</div>
			</div>
		</div>
		<!--탭 영역 끝-->
	</div>
</div>                           