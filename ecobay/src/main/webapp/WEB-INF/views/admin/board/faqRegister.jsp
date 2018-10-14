<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	$('#faqRegBtn').click(function(event){
		var category = $('#category').val();
		var title = $('#title').val();
		var content = $('#content').val();
		
		var modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
		if (category == null || category == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("카테고리를 선택해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else if (title == null || title == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("제목을 입력해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else if (content == null || content == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("내용을 입력해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else {
			$('#faqRegForm').submit();
		}
		
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
			<small>자주 묻는 질문(FAQ)-등록</small>
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
		<form id="faqRegForm" name="faqRegForm" action="/admin/board/faqreg.do" class="form-horizontal" method="post">
			<security:csrfInput/><!-- 폼태그 처리시 시큐리티 태그라이브러리 -->
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th class="colTitle">카테고리</th>
						<td width="20%">
							<select class="custom-select" id="category" name="category_cd">
								<option value="" selected>==선 택==</option>
								<c:forEach var="category" items="${categorys}">
									<option value="${category.category_cd}">${category.category_nm}</option>
								</c:forEach>
							</select>
						</td>
						<td></td>
					</tr>
					<tr>
						<th class="colTitle">제목</th>
						<td colspan="2"><input class="form-control" type="text" id="title" name="title" placeholder="제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">내용</th>
						<td colspan="2">
							<textarea rows="15" class="form-control" id="content" name="content" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
					
				</table>
			</div>

            <p>
            <div align="center" class="form-actions">
	            <button id="faqRegBtn" type="button" class="btn btn-primary"> 등  록 </button>&nbsp;
	            <button type="button" class="btn btn-info"> 취  소 </button>
			</div>
		</form>
	</div>
	<br><br><br>
		
		
		
		
		
		
		
		
		
	
	</section>
	<!-- /내용 -->
</div>


<!-- 모달 -->
<div id="myModal" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">title</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<p>body text</p>
			</div>
			<div class="modal-footer">

			</div>
		</div>
	</div>
</div>
