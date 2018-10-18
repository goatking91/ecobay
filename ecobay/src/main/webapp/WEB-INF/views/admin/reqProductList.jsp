<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<style>
		.detailTitle
		{
			width:20%;
			text-align:right;
			background-color: #F2F2F2; 
			vertical-align: middle;
			border: 1px solid white;
		}
</style>

<script src="/resources/js/admin/adminReqProduct.js"></script>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			경매관리
			<small>요청상품</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="/admin/productlist.do">Product</a></li>
			<li class="active"><a href="/admin/reqproductlist.do">List</a></li>
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
				 				<option value="" selected>제목검색</option>
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
				            <th width="15%">관리</th>
				        </tr>
				    </thead>
				    <tbody id="tbody">		    
					<c:forEach var="list" items="${list}">
					    <tr>
					    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.rn}</td>
					    	<td class="reqlisttd" data-src="${list.product_cd}">
					    		<a id="product_nm">${list.product_nm}</a>
					    	</td>
					    	<td class="reqlisttd" data-src="${list.product_cd}">
					    		<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/>
					    	</td>
					    	<td>
					    		<button class="btn-sm btn-primary" id="approvalbtn" data-src="${list.product_cd}" data-src2="${list.product_nm}" data-src3="3">승인</button>
					    		<button class="btn-sm btn-danger" id="returnbtn" data-src="${list.product_cd}" data-src2="${list.product_nm}" data-src3="4">반려</button>
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

<div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="msgmodaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="msgmodalmessage">
		          	<h5 align="center"></h5>
		          </div>
		          <div>
		          	<input id="data-cdvalue" class="form-control" type="hidden" value="">
		          	<input id="data-keyvalue" class="form-control" type="hidden" value="">
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="msgmodalbtn" class="btn btn-primary" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="reqproductModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="reqproductmodaltitle">경매상품</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
		   	</div>
			<div class="modal-body">
				<form>
					<div class="row">
						<div class="col-md">
							<div id="reqproductmessage">
								<!-- align="center" -->
								<h6></h6>
								<table class='table' id='prodinfo'>
								</table>
								<div class="product-detail-thum col-sm-12">
									<div id='imginfo'></div> <!-- class='bxslider' -->
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
