<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<script type="text/javascript" src="/resources/lib/summernote/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/resources/lib/summernote/summernote-bs4.css" />
<script src="/resources/lib/summernote/lang/summernote-ko-KR.js"></script>
<script>
$(function() {
	$('#content').summernote({
		lang: 'ko-KR',
        height: 350
      });
});
</script>
<style type="text/css">
		.colTitle
		{
			width:15%;
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
			<small>공지사항-수정</small>
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
		<form name="faqRegForm" action="/admin/board/noticemod.do" class="form-horizontal" method="post">
			<security:csrfInput/><!-- 폼태그 처리시 시큐리티 태그라이브러리 -->
			<input type="hidden" name="idx" value="${notice.notice_idx }">
			<div class="table-responsive">
				<table class="table">

					<tr>
						<th class="colTitle">제목</th>
						<td><input class="form-control" type="text" name="title"  value="${notice.title }"></td>
					</tr>
					
					<tr>
						<th class="colTitle">내용</th>
						<td>
							<textarea rows="15" class="form-control" id="content" name="content">${notice.content }</textarea>
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
