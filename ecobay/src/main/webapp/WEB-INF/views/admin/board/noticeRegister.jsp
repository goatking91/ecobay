<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- ajax로그인 할 때 필요한 메타데이터 두 줄-->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script type="text/javascript" src="/resources/lib/summernote/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/resources/lib/summernote/summernote-bs4.css" />
<script src="/resources/lib/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/admin/adminNoticeRegister.js"></script>

<style type="text/css">
		.colTitle
		{
			width:10%;
			text-align:right; 
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
</style>


<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			게시글 관리
			<small>공지사항-등록</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Here</li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container-fluid">
	
		
		



	<div class="container" style="margin-top: 50px;">
		<form name="faqRegForm" action="/admin/board/noticereg.do?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" method="post" enctype="multipart/form-data">
			<security:csrfInput/><!-- 폼태그 처리시 시큐리티 태그라이브러리 -->
			<div class="table-responsive">
				<table class="table">

					<tr>
						<th class="colTitle">제목</th>
						<td><input class="form-control" type="text" name="title" placeholder="제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">내용</th>
						<td>
							<textarea rows="15" class="form-control" id="content" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<th class="colTitle">파일첨부</th>
						<td>
							<input id="upload" type="file" name="upload">
							<input id="upload" type="file" name="upload">
							<input id="upload" type="file" name="upload">
						</td>
					</tr>
					
				</table>
			</div>

            <p>
            <div align="center" class="form-actions">
	            <button type="submit" class="btn btn-primary"> 등  록 </button>&nbsp;
	            <button type="button" class="btn btn-info"> 취  소 </button>
			</div>
		</form>
	</div>
	<br><br><br>
		
		
		
		
		
		
		
		
		
	
	</section>
	<!-- /내용 -->
</div>
