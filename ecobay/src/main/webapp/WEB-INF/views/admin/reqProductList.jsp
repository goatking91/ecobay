<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

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
	
		<table class="table table-striped table-hover">
		    <thead>
   				<tr align="right">
					<td colspan="4" id="prodCnt">count: ${pcnt}</td>
				</tr>
		        <tr>
		            <th>번호</th><th>제목</th><th>등록일시</th><th>관리</th>
		        </tr>
		    </thead>
		    <tbody id="tbody">		    
			<c:forEach var="list" items="${list}">
			    <tr>
			    	<td>${list.rn}</td>
			    	<td>${list.product_nm}</td>
			    	<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
			    	<td>
			    		<input type="hidden" style="display: none;" id="product_cd" value="${list.product_cd}">
			    		<button class='btn-sm btn-primary' id='approvalbtn' data-src="${list.product_cd}" data-src2="3">승인</button>
			    		<button class='btn-sm btn-primary' id='returnbtn' data-src="${list.product_cd}" data-src2="4">반려</button>
			    	</td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
        
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
					<h5 align="center"></h5>
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
		ajaxLoadReqProductList(nowPage, searchType, keyWord);
	  	
		//페이징 이동 버튼 클릭
		$(document).on("click", ".pagingBtn", function(){
			var movePage = $(this).val();
			nowPage = movePage;
			ajaxLoadReqProductList(movePage, searchType, keyWord);
		});
		
		//검색 버튼 클릭
		$(document).on("click", "#searchBtn", function(){
			searchType = $("#searchType option:selected").val();
			keyWord = $('#keyWord').val();
			
			ajaxLoadReqProductList(1, searchType, keyWord);
		});
		
		// 승인 버튼 클릭
		$(document).on("click", "#approvalbtn", function() {
			var cd = $(this).attr("data-src");
			var key = $(this).attr("data-src2");
			$("#msgmodalmessage").find("h5").text(cd + "상품을 승인처리하시겠습니까?");
			$("#data-cdvalue").val("");
			$("#data-cdvalue").val(cd);
			$("#data-keyvalue").val("");
			$("#data-keyvalue").val(key);
			$("#msgModal").modal("show");
		});
		
		// 반려 버튼 클릭
		$(document).on("click", "#returnbtn", function() {
			var cd = $(this).attr("data-src");
			var key = $(this).attr("data-src2");
			$("#msgmodalmessage").find("h5").text(cd + "상품을 반려처리하시겠습니까?");
			$("#data-cdvalue").val("");
			$("#data-cdvalue").val(cd);
			$("#data-keyvalue").val("");
			$("#data-keyvalue").val(key);
			$("#msgModal").modal("show");
		});
		
		// 승인 / 반려 처리하기
		$(document).on("click", "#msgmodalbtn", function() {
			var cd = $("#data-cdvalue").val();
			var key = $("#data-keyvalue").val();
			
			console.log(cd);
			console.log(text);
			
			var productvalue = JSON.stringify({
				"product_cd" : cd,
				"state_cd": key
			});
			
			$.ajax({
				async: true,
				type: 'POST',
				contentType: "application/json; charset=UTF-8",
				data: productvalue,
				url : "/admin/productreqproc.do",
				success : function(data) {
					ajaxLoadReqProductList(nowPage, searchType, keyWord);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
			
			$("#data-idvalue").val("");
			$("#blackcantextArea").val("");
			
		});
		
	    
		function ajaxLoadReqProductList(movePage, searchType, keyWord) {
			var pagevalue = JSON.stringify({
	        	"movePage": movePage,
	        	"searchType": searchType,
	        	"keyWord": keyWord
	        });
			
			$.ajax({
				url : "/admin/ajaxreqproductlist.do",
				data : pagevalue,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				method : "POST",
			    success : function(data, movePage) {
					var htmlStr = "";
					
					$.each(data.list, function(index, list){ 
						htmlStr += "<tr>";
						htmlStr += "	<td>" + list.rn + "</td>";
						htmlStr += "	<td>" + list.product_nm +"</td>";
						
						var date = new Date(list.regdate);
						var y = date.getFullYear();
					    var M = date.getMonth()+1;
					    var d = date.getDate();
					    M = (M < 10) ? "0" + M : M;
					    d = (d < 10) ? "0" + d : d;
					  	var day= y + "-" + M + "-" + d;
					  	htmlStr += "	<td>" + day +"</td>";
					  	htmlStr += "	<td>" + list.state_nm + "</td>";
					  	htmlStr += "	<td>";
					  	htmlStr += "		<input type='hidden' style='display: none;' id='product_cd' value='" + list.product_cd + "'>";
					  	htmlStr += "		<button class='btn-sm btn-primary' id='approvalbtn' data-src='" + list.product_cd + "' data-src2="3">승인</button>";
					  	htmlStr += "		<button class='btn-sm btn-primary' id='returnbtn' data-src='" + list.product_cd + "' data-src2="4">반려</button>";
			    		htmlStr += "	</td>";
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
