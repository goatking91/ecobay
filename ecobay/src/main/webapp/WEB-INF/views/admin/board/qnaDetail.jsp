<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script type="text/javascript" src="/resources/lib/summernote/summernote-bs4.min.js"></script>
<link rel="stylesheet" href="/resources/lib/summernote/summernote-bs4.css" />
<script src="/resources/lib/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/admin/adminQnaDetail.js"></script>

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
			<small>1:1문의-상세</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Here</li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container-fluid">
	
		
		
		<div class="container">
				<div class="table-responsive">
					<table class="table">
						<security:csrfInput/>
	
						<tr>
							<th class="colTitle">제목</th>
							<td>${qna.title }</td>
							<th class="colTitle">작성자</th>
							<td>${qna.member_id }</td>
						</tr>

						<tr>
							<th class="colTitle">내용</th>
							<td style="height: 350px;" colspan="3">
								${qna.content }
							</td>
						</tr>
						<tr>
							<th class="colTitle">답변</th>
							<td colspan="3">
								<div id="reQnas">
									<table id="reQnaTable">
									</table>
								</div>
								<input type="hidden" id="qna_idx" name="idx" value="${qna.qna_idx }">
								<textarea id="reQnaArea" class="form-control col-lg-12" style="width: 100%" rows="4"></textarea>
								<div align="right">
									<button type="button" id="regReQnaBtn" name="regReQnaBtn" class="btn btn-primary">답변등록</button>
								</div>
			   				</td>
						</tr>
						
					</table>
				</div>

            	<p>
				
	            <div align="center" class="form-actions">
	                <c:url var="listURL" value="/admin/board/qnalist.do" />
		            <button type="button" id="delBtn" class="btn btn-danger"> 삭  제 </button>&nbsp;
		            <a href="${pageScope.listURL}"><button type="button" class="btn btn-info"> 목록보기 </button></a>
				</div>
	</div>
	<br><br><br>
		
		
		
	</section>
	<!-- /내용 -->
</div>



<!-- 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="message">
					<h5 align="center"></h5>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="delConfirm" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>



	
