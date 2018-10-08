<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<style type="text/css">
		.colTitle
		{
			width:15%;
			text-align:right; 
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
		
	</style>
	<script>
		$(document).ready(function(){
			
			$('#delBtn').click(function(event){
				$('#message').find('h5').text("삭제가 완료되었습니다.");
				$('#myModal').modal('show');
				
			});
			
			$('#delConfirm').click(function(event){
				var idx = $('#qna_idx').val();
				location.href="/admin/board/qnadel.do?idx="+idx;
			});
			
			
			
		});
	
	</script>
	
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
			<form name="noticeDetailForm" action="/admin/board/noticemod.do" class="form-horizontal" method="get">
				<input type="hidden" id="qna_idx" name="idx" value="${qna.qna_idx }">
				<div class="table-responsive">
					<table class="table">
	
						<tr>
							<th class="colTitle">제목</th>
							<td>${qna.title }</td>
							<th class="colTitle">작성자</th>
							<td>${qna.member_id }</td>
						</tr>
						
						<tr>
							<th><th>
							<td colspan="3"></td>
						<tr>
						<tr>
							<th class="colTitle">내용</th>
							<td style="height: 350px;" colspan="3">
								${qna.content }
							</td>
						</tr>
						
					</table>
				</div>

            	<p>
	            <div align="center" class="form-actions">
	                <c:url var="listURL" value="/admin/board/qnalist.do" />
	            	<button type="submit" id="modBtn" class="btn btn-primary"> 답변달기 </button>&nbsp;
		            <button type="button" id="delBtn" class="btn btn-danger"> 삭  제 </button>&nbsp;
		            <a href="${pageScope.listURL}"><button type="button" class="btn btn-info"> 목록보기 </button></a>
		           
				</div>
		 </form>
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



	