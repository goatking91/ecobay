<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- ajax로그인 할 때 필요한 메타데이터 두 줄-->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script type="text/javascript" src="/resources/lib/summernote/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/resources/lib/summernote/summernote-bs4.css" />
<script src="/resources/lib/summernote/lang/summernote-ko-KR.js"></script>

<script>
$(function() {
	
	/*======================================================================================*/
	// ajax처리시 권한 스크립트
	/*======================================================================================*/
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	
	$('#content').summernote({
		lang: 'ko-KR',
        height: 350,
        callbacks: {
        	onImageUpload: function(files, editor, welEditable) {
        		for (var i = files.length - 1; i >= 0; i--) {
        			sendFile(files[i], this);
        		}
        	}
        } 
      });
	
	function sendFile(file, el) {
	      var form_data = new FormData();
	      form_data.append('file', file);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: '/editUploadAjax.do',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(url) {
	          $(el).summernote('editor.insertImage', url);
	        }
	      });
	 }
});
</script>
<style type="text/css">
		.colTitle
		{
			width:10%;
			text-align:right; 
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
</style>
<div class="container">
	<h3>
		1:1문의
		<small>-등록</small>
	</h3>
</div>

<div class="container" style="margin-top: 20px;">
	
	<form name="faqRegForm" action="/support/qna/qnareg.do?${_csrf.parameterName}=${_csrf.token}" class="form-horizontal" method="post" enctype="multipart/form-data">
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
		
		
		
