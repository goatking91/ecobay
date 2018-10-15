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
			<small>상품현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="/admin/Productlist.do">Product</a></li>
			<li class="active"><a href="/admin/Productlist.do">List</a></li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->

	<!-- 내용 -->
	<section class="content container-fluid">
	
		<div class="col-md-12" >
			<form>
				<div class="form-group row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" id="searchType" name="searchType">
				 				<option value="" selected>전체</option>
				 				<option value="1" >요청</option>
				 				<option value="2" >요청취소</option>
				 				<option value="3" >승인</option>
				 				<option value="4" >반려</option>
				 				<option value="5" >낙찰</option>
				 				<option value="6" >유찰</option>
				 				<option value="7" >즉시구매</option>
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
			</form>
		</div>
			 
		<table class="table table-striped table-hover">
		    <thead>
   				<tr align="right">
					<td colspan="4" id="prodCnt">count: ${pcnt}</td>
				</tr>
		        <tr>
		            <th>번호</th><th>제목</th><th>등록일시</th><th>상태</th>
		        </tr>
		    </thead>
		    <tbody id="tbody">		    
				<c:forEach var="list" items="${list}">
				    <tr>
				    	<td>${list.rn}</td>
				    	<td>${list.product_nm}</td>
				    	<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
				    	<td>
				    		${list.state_nm}
				    		<input type="hidden" style="display: none;" id="state_cd" value="${list.state_cd}">
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
					<input type="hidden" id="curPage" value="${pagination.curPage }">
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
	
	</section>
	<!-- /내용 -->
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
		ajaxLoadProductList(nowPage, searchType, keyWord);
	  	
		//페이징 이동 버튼 클릭
		$(document).on("click", ".pagingBtn", function(){
			var movePage = $(this).val();
			nowPage = movePage;
			ajaxLoadProductList(movePage, searchType, keyWord);
		});
		
		//검색 버튼 클릭
		$(document).on("click", "#searchBtn", function(){
			searchType = $("#searchType option:selected").val();
			keyWord = $('#keyWord').val();
			
			ajaxLoadProductList(1, searchType, keyWord);
		});
	    
		function ajaxLoadProductList(movePage, searchType, keyWord) {
			
			var pagevalue = JSON.stringify({
	        	"movePage": movePage,
	        	"searchType": searchType,
	        	"keyWord": keyWord
	        });
			
			$.ajax({
				url : "/admin/ajaxproductlist.do",
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
					  	htmlStr += "	<input type='hidden' style='display: none;' id='state_cd' value='" + list.state_cd + "'>";
						htmlStr += "</tr>";
					});
					
					$("#tbody").empty();
					$("#tbody").append(htmlStr);
					$("#mcnt").html("count: " + data.cnt);
			            
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
