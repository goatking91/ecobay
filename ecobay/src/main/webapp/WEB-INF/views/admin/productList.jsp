<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script src="/resources/js/admin/adminProduct.js"></script>

<style>
	img {
		margin-left: auto; 
		margin-right: auto; 
		display: block;
		max-width:100%;
	}
</style>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			경매관리
			<small>상품현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="/admin/productlist.do">Product</a></li>
			<li class="active"><a href="/admin/productlist.do">List</a></li>
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
					</div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" id="searchType" name="searchType">
				 				<option value="">전체</option>
				 				<option value="1">요청</option>
				 				<option value="2">요청취소</option>
				 				<option value="3">승인</option>
				 				<option value="4">반려</option>
				 				<option value="5">낙찰</option>
				 				<option value="6">유찰</option>
				 				<option value="7">즉시구매</option>
				 				<option value="8">구매취소</option>
							</select>
						</div>
					</div>
					
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text" class="form-control" id="keyWord" name="keyWord" placeholder="검색어를 입력하세요...">
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
		   				<tr align="right">
							<td colspan="4" id="prodCnt">count: ${pcnt}</td>
						</tr>
				        <tr>
				            <th width="10%">번호</th>
				            <th width="55%">제목</th>
				            <th width="20%">등록일시</th>
				            <th width="15%">상태</th>
				        </tr>
				    </thead>
				    <tbody id="tbody">		    
						<c:forEach var="list" items="${list}">
						    <tr>
						    	<td class="listtd"  data-src="${list.product_cd}">${list.rn}</td>
						    	<td class="listtd"  data-src="${list.product_cd}">${list.product_nm}</td>
						    	<td class="listtd"  data-src="${list.product_cd}"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
						    	<td class="listtd"  data-src="${list.product_cd}">
						    		${list.state_nm}
						    		<input type="hidden" style="display: none;" id="state_cd" value="${list.state_cd}">
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
					<input type="hidden" id="curPage" value="${pagination.curPage}">
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	
	</section>
	<!-- /내용 -->
</div>

<div class="modal fade" id="productdetailModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productdetailmodaltitle">경매상품</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
		   	</div>
			<div class="modal-body">
				<form>
					<div class="row">
						<div class="col-md">
							<div id="productdetailmessage">
								<!-- align="center" -->
								<h6></h6>
								<table class='table' id='prodinfo'>
								</table>
								<div class="product-detail-thum col-sm-12">
									<div id='imginfo'></div>
								</div>
								<table class='table' id='prodcontent'>
								</table>
							</div>
						</div>		      	
					</div>
				</form>
			</div>
      		<div class="modal-footer">
       			<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      		</div>
		</div>
	</div>
</div>
