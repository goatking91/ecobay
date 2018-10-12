<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script src="/resources/js/admin/adminQnaList.js"></script>



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
		
		<!-- 검색 영역 -->
		<div class="row">
			<div class="col-md-12" >
				<div class="form-group row">
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" id="searchType" name="searchType">
				 				<option value="all">전체검색</option>
				 				<option value="title">제목</option>
				 				<option value="content">내용</option>
				 				<option value="writer">작성자</option>
				 				<option value="tnc">제목+내용</option>
				 				<option value="wnc">작성자+내용</option>
							</select>
						</div>
					</div>
					<div class="col-sm-9">
						<div class="input-group">
							<input type="text" class="form-control" id="keyWorld" name="keyWorld" placeholder="검색내용을 입력하세요...">
							<div class="input-group-append">
								<button type="button" id="searchBtn" class="btn btn-primary">검색</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 리스트 영역 -->
		<div class="row">
			<div class="col-md-12">
				<table class="table table-striped table-hover">
				    <thead>
				        <tr>
				            <th width="10%">번호</th>
				            <th width="60%">제목</th>
				            <th width="10%">작성자</th>
				            <th width="10%">등록일시</th>
				            <th width="10%">관리</th>
				        </tr>
				    </thead>
				    <tbody id="qnaListTbody"> 
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
					</tbody>
				</table>
			</div>
		</div>
		
		<!-- 페이징 영역 -->
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6" align="center">
				<div id="pagination">
					<input type="hidden" id="curPage" value="${pagination.curPage }">
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	
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