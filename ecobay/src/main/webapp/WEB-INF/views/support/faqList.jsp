<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<script src="/resources/js/FaqList.js"></script>

<div class="container">
		<div class="page-header" style="padding:2%">
   	    	<h3>자주 묻는 질문(FAQ) </h3>
		</div>
		<!-- 검색 영역 -->
		<div class="row">
			<div class="col-md-12" >
				<div class="form-group row">
					<div class="col-sm-4"></div>
					<div class="col-sm-2">
						<div class="input-group">
							<select class="custom-select" id="category" name="category_cd">
								<option value="" selected>카테고리</option>
								<c:forEach var="category" items="${categorys}">
									<option value="${category.category_cd}">${category.category_nm}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="col-sm-2">
						<div class="input-group">
							<select class="custom-select" id="searchType" name="searchType">
				 				<option value="all">전체검색</option>
				 				<option value="title">제목</option>
				 				<option value="content">내용</option>
				 				<option value="tnc">제목+내용</option>
							</select>
						</div>
					</div>
					<div class="col-sm-4">
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
				            <th width="10%">카테고리</th>
				            <th width="80%">제목</th>
				        </tr>
				    </thead>
				    <tbody id="faqListTbody">
						<c:forEach var="list" items="${faqList}" varStatus="status">
						    <tr data-toggle="collapse" data-target="#data_${status.count }">
						    	<td>${status.count }</td>
						    	<td>${list.category.category_nm }</td>
						    	<td><i class="fa fa-quora"></i> <a>${list.title}</a></td>
						    </tr>
						    <tr class="collapse" id="data_${status.count }">
						    	<td></td>
						    	<td colspan="2"><i class="fa fa-font"></i> ${list.content }</td>
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
