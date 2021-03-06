<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script src="/resources/js/admin/adminNoticeList.js"></script>


<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			게시글 관리
			<small>공지사항</small>
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
					<div class="col-sm-4">
						<a href="/admin/board/noticereg.do"><button type="button" class="btn btn-success">공지사항 등 록</button></a>
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" id="searchType" name="searchType">
				 				<option value="all">전체검색</option>
				 				<option value="title">제목</option>
				 				<option value="content">내용</option>
				 				<option value="tnc">제목+내용</option>
							</select>
						</div>
					</div>
					<div class="col-sm-5">
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
				            <th width="50%">제목</th>
				            <th width="10%">작성자</th>
				            <th width="10%">등록일시</th>
				            <th width="10%">조회수</th>
				            <th width="10%">관리</th>
				        </tr>
				    </thead>
				    <tbody id="noticeListTbody">
				    
				    	<c:forEach var="notice" items="${noticeList}" varStatus="status">
							<tr>
							   <td>${status.index + 1 }</td>
							   <td><a href="/admin/board/noticedetail.do?idx=${notice.notice_idx }">${notice.title }</a></td>
							   <td>관리자</td>
							   <td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/></td>
							   <td>${notice.viewCNT }</td>
							   <td>
						    		<a href="#"><button id="modBtn${notice.notice_idx }" class="btn btn-sm btn-secondary modBtn">수정</button></a>
						    		<a href="#"><button id="delBtn${notice.notice_idx }" class="btn btn-sm btn-danger delBtn">삭제</button></a>
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