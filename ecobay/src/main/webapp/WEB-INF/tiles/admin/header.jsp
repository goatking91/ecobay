<%@page import="org.ecobay.user.util.UserDetailsVO"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

	Object principal = auth.getPrincipal();
	String name = "";
	if(principal != null && principal instanceof UserDetailsVO) {
		name = ((UserDetailsVO)principal).getMember_name();
	}
%>
<!DOCTYPE html>
<html>
<head>
  	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
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
				<security:authorize access="isAnonymous()">
				<div class="pull-left info">
					<p></p>
					<a href="#"><i class="fa fa-circle text-danger"></i> Offline</a>
				</div>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_USER')">
				<div class="pull-left info">
					<p></p>
					<a href="#"><i class="fa fa-circle text-danger"></i> Offline</a>
				</div>
				</security:authorize>
				<security:authorize access="hasRole('ROLE_ADMIN')">
				<div class="pull-left info">
					<p><%=name %> 관리자</p>
					<a id="adminLogout" href="#"><i class="fa fa-circle text-success"></i> Logout</a>
				</div>
				</security:authorize>
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
				<!-- <li><a href="#"><i class="fa fa-link"></i> <span>통계</span></a></li> -->
				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>통계</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/admin/main.do">통계</a></li>
					</ul>
				</li>
				
				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>경매관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/admin/productlist.do">물품현황</a></li>
						<li><a href="/admin/reqproductlist.do">물품승인요청</a></li>
						<li><a href="/admin/payproductlist.do">물품결제현황</a></li>
					</ul>
				</li>
				
				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>회원관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/admin/memberlist.do">회원현황</a></li>
						<li><a href="/admin/blacklist.do">블랙리스트</a></li>
					</ul>
				</li>

				<li class="treeview">
					<a href="#"><i class="fa fa-link"></i> <span>게시판관리</span>
						<span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
					</a>
					<ul class="treeview-menu">
						<li><a href="/admin/board/noticelist.do">공지사항</a></li>
						<li><a href="/admin/board/faqlist.do">FAQ</a></li>
						<li><a href="/admin/board/qnalist.do">1:1문의</a></li>
					</ul>
				</li>
				
			</ul>
			<!-- /메뉴 -->
		</section>
		<!-- /사이드 바(전체) -->
	</aside>
	<script type="text/javascript">
		$(function() {
			$(document).on("click", "#adminLogout", function() {
				var form = document.createElement("form");
				var seq = document.createElement("input");
				var seqVal = $("#_csrf").attr("content");
				
		        form.action = "/admin/logout";
		        form.method = "post";
	            /* form.setAttribute("accept-charset=", "UTF-8"); */
	            
	            seq.setAttribute("type", "hidden");
	            seq.setAttribute('name', "_csrf");
	            seq.setAttribute("value", seqVal);

	            form.appendChild(seq);
	            
	            document.body.appendChild(form);
		        
		        form.submit();

			});
		});
	</script>