<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

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

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			경매관리
			<small>상품결제현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="/admin/productlist.do">Product</a></li>
			<li class="active"><a href="/admin/payproductlist.do">List</a></li>
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
				 				<option value="all">전체</option>
				 				<option value="product_nm">제목</option>
				 				<option value="member_id">아이디검색</option>
				 				<option value="member_nm">이름검색</option>
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
							<td colspan="7" id="prodCnt">count: ${pcnt}</td>
						</tr>
				        <tr>
				            <th width="10%">번호</th>
				            <th width="15%">상품코드</th>
				            <th width="25%">제목</th>
				            <th width="10%">금액</th>
				            <th width="20%">낙찰자</th>
				            <th width="10%">결제일시</th>
				            <th width="10%">구분</th>
				        </tr>
				    </thead>
				    <tbody id="tbody">		    
						<c:forEach var="list" items="${list}">
						    <tr>
						    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.rn}</td>
						    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.product_cd}</td>
						    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.product_nm}</td>
						    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.money_pay}</td>
						    	<td class="reqlisttd"  data-src="${list.product_cd}">${list.member_id}(${list.member_nm})</td>
						    	<td class="reqlisttd"  data-src="${list.product_cd}"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
						    	<c:choose>
						    		<c:when test="${list.deli_div_cd == '2'}">
								    	<td>
								    		<button class="btn-sm btn-warning" id="delibtn" data-src="${list.product_cd}" data-src2="${list.product_nm}" data-src3="2">배송</button>
								    	</td>
						    		</c:when>
						    		<c:otherwise>
						    			<td>직거래</td>
						    		</c:otherwise>
						    	</c:choose>
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

<div class="modal fade" id="productdeliModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="productdelimodaltitle">배송정보</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
		   	</div>
			<div class="modal-body">
				<form>
					<div class="row">
						<div class="col-md">
							<div id="productdelimessage">
								<h6></h6>
								<table class='table' id='productdeli'>
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

<script type="text/javascript">
	$(document).ready(function(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");

		$(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
		
		var searchType = $("#searchType option:selected").val();
		var keyWord = $('#keyWord').val();
	    var nowPage = $('#curPage').val();
	    
	  	//초기 리스트 ajax LOAD
		ajaxLoadpayProductList(nowPage, searchType, keyWord);
	  	
		//페이징 이동 버튼 클릭
		$(document).on("click", ".pagingBtn", function(){
			var movePage = $(this).val();
			nowPage = movePage;
			ajaxLoadpayProductList(movePage, searchType, keyWord);
		});
		
		//검색 버튼 클릭
		$(document).on("click", "#searchBtn", function(){
			searchType = $("#searchType option:selected").val();
			keyWord = $('#keyWord').val();
			
			ajaxLoadpayProductList(1, searchType, keyWord);
		});
		
		// 배송 버튼 클릭
		$(document).on("click", "#delibtn", function() {
			var cd = $(this).attr("data-src");
			var name = $(this).attr("data-src2");
			//var key = $(this).attr("data-src3");
			//var value = $(this).text(); 
			
			productDeli(cd, name);
		});
		
		function productDeli(product_cd, product_nm) {
 			$.ajax({
 				async: true,
 				type: 'POST',
				url : "/admin/ajaxpayproductdeli.do/" + product_cd,
				contentType: "application/json; charset=UTF-8",
			    success : function(data) {
			    	var htmlStr = "";
			    	
					$("#productdelimodaltitle").text(product_nm);
					
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>상품번호</th>";
					htmlStr += "		<td>" + data.deli.product_cd + "</td>";
					htmlStr += "	</tr>";
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>우편번호</th>";
					htmlStr += "		<td>[" + data.deli.deli_zipcode + "] " + data.deli.deli_addr1 + "</td>";
					htmlStr += "	</tr>";
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>상세주소</th>";
					htmlStr += "		<td colspan='2'>" + data.deli.deli_addr2 + "</td>";
					htmlStr += "	</tr>";
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>이름</th>";
					htmlStr += "		<td>" + data.deli.deli_nm + "</td>";
					htmlStr += "	</tr>";
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>전화번호</th>";
					htmlStr += "		<td colspan='2'>" + data.deli.deli_phonenum + "</td>";
					htmlStr += "	</tr>";
					htmlStr += "	<tr>";
					htmlStr += "		<th class='detailTitle'>주문일시</th>";
					htmlStr += "		<td>" + data.deli.regdate + "</td>";
					htmlStr += "	</tr>";
					
					$("#productdelimessage").find("#productdeli").html(htmlStr);
					$("#productdeliModal").modal("show");
			    },
			    error : function(data) {
			    	console.log("data : " + data);
			    }
			 });
		}
	    
		function ajaxLoadpayProductList(movePage, searchType, keyWord) {
			var pagevalue = JSON.stringify({
	        	"movePage": movePage,
	        	"searchType": searchType,
	        	"keyWord": keyWord
	        });
			
			$.ajax({
				url : "/admin/ajaxpayproductlist.do",
				data : pagevalue,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				method : "POST",
			    success : function(data, movePage) {
					var htmlStr = "";
					
					$.each(data.list, function(index, list){ 
						htmlStr += "<tr>";
						htmlStr += "	<td>" + list.rn + "</td>";
						htmlStr += "	<td>" + list.product_cd +"</td>";
						htmlStr += "	<td>" + list.product_nm +"</td>";
						htmlStr += "	<td>" + list.money_pay +"원</td>";
						htmlStr += "	<td>" + list.member_id + "(" + list.member_nm +")</td>";
						
						var date = new Date(list.regdate);
						var y = date.getFullYear();
					    var M = date.getMonth()+1;
					    var d = date.getDate();
					    M = (M < 10) ? "0" + M : M;
					    d = (d < 10) ? "0" + d : d;
					  	var day= y + "-" + M + "-" + d;
					  	htmlStr += "	<td>" + day +"</td>";
					  	
					  	if(list.deli_div_cd == '2') {
					  		htmlStr += "	<td>";
					  		htmlStr += "		<button class='btn-sm btn-warning' id='delibtn' data-src='" + list.product_cd + "' data-src2='" + list.product_nm + "' data-src3='2'>배송</button>";
					  		htmlStr += "	</td>";
					  	}
					  	else{
					  		htmlStr += "	<td>직거래</td>";
					  	}
						htmlStr += "</tr>";
					});
					
					$("#tbody").empty();
					$("#tbody").append(htmlStr);
					$("#prodCnt").html("count: " + data.cnt);
			            
			        var htmlStr2 = "";
			      		
			        htmlStr2 += "<input type='hidden' id='curPage' value='" + movePage + "'>";
			        
			        if (data.pagination.curRange != 1 || data.pagination.curPage != 1) {
						htmlStr2 += "<button type='button' class='btn pagingBtn' value='1'>처음</button>";
						htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.prevPage + "'>이전</button>";
					} else {
						htmlStr2 += "<button type='button' class='btn' value='1' disabled>처음</button>";
						htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.prevPage + "' disabled>이전</button>";
					}
			        
		            for (var nowPage = data.pagination.startPage; nowPage <= data.pagination.endPage; nowPage++) {
		            	if (nowPage == data.pagination.curPage) {
		            		htmlStr2 += "<button type='button' class='btn btn-primary pagingBtn' value='"+ nowPage +"'>" + nowPage + "</button>";
						}else if(nowPage != data.pagination.curPage) {
							htmlStr2 += "<button type='button' class='btn pagingBtn' value='"+ nowPage +"'>" + nowPage + "</button>";
						}
		            }
		            
		            if (data.pagination.curRange != data.pagination.totalPage && data.pagination.totalPage > 0) {
						htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.nextPage + "'>다음</button>";
						htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.totalPage + "'>끝</button>";
					} else {
						htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.nextPage + "' disabled>다음</button>";
						htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.totalPage + "' disabled>끝</button>";
					}
		            
		            $('#pagination').empty();
		            $('#pagination').append(htmlStr2);             
		            $('#pagination').val('');
			    },
			    error : function(data) {
			    	console.log("data : " + data);
			    }
			 });
		}
	});
</script>
