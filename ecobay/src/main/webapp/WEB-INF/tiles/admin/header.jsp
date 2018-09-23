<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<!-- 메인 헤더 -->
	<header class="main-header">
		<!-- 로고 -->
		<a href="/admin/main.do" class="logo">
			<span class="logo-lg"><b>ECObay</b>-Admin</span>
		</a>
		<!-- 네브바 -->
		<nav class="navbar navbar-static-top" role="navigation">
		    
		</nav>
	</header>
  
	<!-- 사이드 바(전체) -->
	<aside class="main-sidebar">
		<section class="sidebar">
			<!-- 로그인한 사람 정보 -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="https://via.placeholder.com/160x160" class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>admin1</p>
					<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>

			<!-- 검색 -->
			<form action="#" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control" placeholder="Search...">
					<span class="input-group-btn">
						<button type="submit" name="search" id="search-btn" class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form>
			<!-- /검색 -->

			<!-- 메뉴 -->
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">HEADER</li>
				<!-- <li class="active"><a href="#"><i class="fa fa-link"></i> <span>Link</span></a></li> -->
				<li><a href="#"><i class="fa fa-link"></i> <span>통계</span></a></li>
				
				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>경매관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#">경매상품</a></li>
						<li><a href="#">경매내역</a></li>
					</ul>
				</li>
				
				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>회원관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/admin/list.do">회원현황</a></li>
						<li><a href="#">블랙리스트</a></li>
					</ul>
				</li>

				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>게시판관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="/admin/faqlist.do">FAQ</a></li>
						<li><a href="#">1:1문의</a></li>
					</ul>
				</li>
				
			</ul>
			<!-- /메뉴 -->
		</section>
		<!-- /사이드 바(전체) -->
	</aside>