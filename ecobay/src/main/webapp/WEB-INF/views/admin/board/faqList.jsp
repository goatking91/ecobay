<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
$(document).ready(function(){
	
	
	$('.mod').click(function(event){
		var nowId = $(this).attr("id");
		var noIdx = nowId.replace(/[^0-9]/g,"");
		var faqIdx = $('#faq'+noIdx).val();
		
		location.href="/admin/board/faqmod.do?idx="+faqIdx;
		
		
	});
	
	$('.del').click(function(event){
		var nowId = $(this).attr("id");
		var noIdx = nowId.replace(/[^0-9]/g,"");
		var faqIdx = $('#faq'+noIdx).val();
		
		location.href="/admin/board/faqdel.do?idx="+faqIdx;
		
		
	});
});

		
</script>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			게시글 관리
			<small>자주 묻는 질문(FAQ)</small>
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
			<form name="myform" action="board/admin/faqlist.do">
				<div class="form-group row">
					<div class="col-sm-4">
						<a href="/admin/faqreg.do"><button type="button" class="btn btn-success">FAQ 등 록</button></a>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" name="keyfield">
								<option value="all" selected>전체검색</option>
				 				<option value="title" selected>제목검색</option>
				 				<option value="content" selected>내용검색</option>
							</select>
						</div>
					</div>
					<div class="col-sm-5">
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
		            <th>등록일시</th>
		            <th>비고</th>
		        </tr>
		    </thead>
			<c:forEach var="list" items="${faqList}" varStatus="status">
			    <tr data-toggle="collapse" data-target="#data_${status.count }">
			    	<td>${status.count }</td>
			    	<td><a>${list.title}</a></td>
			    	<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
			    	<td>
			    		<input type="hidden" id="faq${status.count }" value="${list.faq_idx }">
			    		<a href="#"><button id="modBtn${status.count }" class="btn btn-sm btn-secondary mod">수정</button></a>
			    		<a href="#"><button id="delBtn${status.count }" class="btn btn-sm btn-danger del">삭제</button></a>
			    	</td>
			    </tr>
			    <tr class="collapse" id="data_${status.count }">
			    	<td></td>
			    	<td colspan="3">${list.content }</td>
			    </tr>
			</c:forEach>
		    
		    
		</table>
 
        
        <div align="center">
			<tr>
				<td colspan="6">
					<%-- <c:if test="${startpage>10}">
						<a href="#" class="btn btn-light">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startpage}" end="${endpage}">
						<a href="#" class="btn btn-primary">1</a>
					</c:forEach>
					<c:if test="${endpage<pagecount}">
						<a href="#" class="btn btn-light">다음</a>
					</c:if> --%>
				</td>
			</tr>
		</div>
		
		
		
		
		
		
		
		
		
	
	</section>
	<!-- /내용 -->
</div>
