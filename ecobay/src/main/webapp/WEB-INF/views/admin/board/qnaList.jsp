<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<script>
$(document).ready(function(){
	
	
	/* $('.answer').click(function(event){
		var nowId = $(this).attr("id");
		var noIdx = nowId.replace(/[^0-9]/g,"");
		
		location.href="/admin/board/qnaanswer.do?idx="+noIdx;
		
		
	});
	
	$('.del').click(function(event){
		var nowId = $(this).attr("id");
		var noIdx = nowId.replace(/[^0-9]/g,"");
		
		location.href="/admin/board/qnadel.do?idx="+noIdx;
		
		
	}); */
});

		
</script>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			게시글 관리
			<small>1:1문의</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active">Here</li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container-fluid">
		
		<div class="col-md-12" >
			<form name="myform" action="board/admin/qnalist.do">
				<div class="form-group row">
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" name="keyfield">
				 				<option value="all" selected>전체검색</option>
				 				<option value="title" selected>제목검색</option>
				 				<option value="content" selected>내용검색</option>
							</select>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="검색내용을 입력하세요...">
							<div class="input-group-append">
								<button class="btn btn-primary">검색</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>		 
		<table class="table table-striped table-hover">
		    <thead>
		        <tr>
		            <th>번호</th>
		            <th>제목</th>
		            <th>작성자</th>
		            <th>등록일시</th>
		            <th>관리</th>
		        </tr>
		    </thead>		    
			<c:forEach var="qna" items="${qnaList}" varStatus="status">
				<tr>
				   <td>${status.index + 1 }</td>
				   <td><a href="/admin/board/qnadetail.do?idx=${qna.qna_idx}">${qna.title }</a></td>
				   <td>${qna.member_id}</td>
				   <td><fmt:formatDate value="${qna.regDate}" pattern="yyyy-MM-dd"/></td>
				   <td>
			    		<a href="#"><button id="delBtn${qna.qna_idx}" class="btn btn-sm btn-danger del">삭제</button></a>
				   </td>
			    </tr>
			    
			</c:forEach>
			
			
			
	       <%--  <div align="center">
				<tr>
					<td colspan="6">
						<c:if test="${startpage>10}">
							<a href="#" class="btn btn-light">이전</a>
						</c:if>
						<c:forEach var="i" begin="${startpage}" end="${endpage}">
							<a href="#" class="btn btn-primary">1</a>
						</c:forEach>
						<c:if test="${endpage<pagecount}">
							<a href="#" class="btn btn-light">다음</a>
						</c:if>
					</td>
				</tr>
			</div> --%>
		</table>
		
		
	
	</section>
	<!-- /내용 -->

</div>