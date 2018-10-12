<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script>
	$(function(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    var searchType = $("#searchType option:selected").val();
		var keyWorld = $('#keyWorld').val();
	    var nowPage = $('#curPage').val();
	    //리스트 ajax LOAD
		ajaxLoadQnaList(nowPage, searchType, keyWorld);
		
		//페이징 이동 버튼 클릭
		$(document).on("click", ".pagingBtn", function(){
			var movePage = $(this).val();
			nowPage = movePage;
			ajaxLoadQnaList(movePage, searchType, keyWorld);
		});
		
		//검색 버튼 클릭
		$(document).on("click", "#searchBtn", function(){
			searchType = $("#searchType option:selected").val();
			keyWorld = $('#keyWorld').val();
			
			ajaxLoadQnaList(1, searchType, keyWorld);
		});
		
		//삭제 버튼 클릭
		$(document).on("click", ".delBtn", function(){
			var qna_idx = $(this).attr("id");
			
			var modalBtnHtml = "<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>";
			modalBtnHtml += "<button id='modalConfirmBtn' type='button' class='btn btn-primary'>확인</button>";
			
			$('.modal-title').text("삭제 안내");
			$('.modal-body').find('p').text("정말 삭제 하시겠습니까?");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			
			$('#modalConfirmBtn').click(function(event){
				
				$.ajax({
					url : "/admin/board/ajaxqnadel.do",
					data : qna_idx,
					method : "POST",
					dataType : "json",
					contentType: "application/json; charset=UTF-8",
			        success : function(data) {
			        	if(data.isSuccess == 'true') {
			        		modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
			        		$('.modal-title').text("삭제 완료");
			    			$('.modal-body').find('p').text("삭제가 완료 되었습니다.");
			    			$('.modal-footer').html(modalBtnHtml);
			    			$('#myModal').modal('show');
			    			
			    			ajaxLoadQnaList(nowPage, searchType, keyWorld);
						}
			        },
			        error : function(jqXHR) {
			        	console.log("error :"+ jqXHR.status);
			        }
			     });
				
			});
			
		});
		
		
		
		
		
	});
	
	
	/** QNA 리스트 AJAX **/
	function ajaxLoadQnaList(movePage, searchType, keyWorld) {
		$.ajax({
			url : "/admin/board/ajaxqnalist.do",
			data : {
            	"movePage": movePage,
            	"searchType": searchType,
            	"keyWorld": keyWorld
            },
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			method : "GET",
		    success : function(data, movePage) {
				var htmlStr = "";
				
				for (var i = 0; i < data.qnaList.length; i++) {
					
					/* 날짜 패턴 변경 */
					var date = new Date(data.qnaList[i].regDate);
					var y = date.getFullYear();
				    var M = date.getMonth()+1;
				    var d = date.getDate();
				    M = (M < 10) ? "0" + M : M;
				    d = (d < 10) ? "0" + d : d;
				  	var day= y + "-" + M + "-" + d;
					
					
					htmlStr += "<tr>";
					htmlStr += 	"<td>" + data.qnaList[i].qna_idx + "</td>";
					htmlStr += 	"<td><a href='/admin/board/qnadetail.do?idx=" + data.qnaList[i].qna_idx + "'>" + data.qnaList[i].title + "</a></td>";
					htmlStr += 	"<td>" + data.qnaList[i].member_id + "</td>";
					htmlStr += 	"<td>" + day + "</td>";
					htmlStr += 	"<td>";
					htmlStr += 		"<a href='#'><button type='button' id='" + data.qnaList[i].qna_idx + "' class='btn btn-sm btn-danger delBtn'>삭제</button></a>";
					htmlStr += 	"</td>";
					htmlStr += "</tr>";

				}
				
				$('#qnaListTbody').empty();
	            $('#qnaListTbody').append(htmlStr);             
	            $('#qnaListTbody').val('');
		            
		            
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
		    error : function(jqXHR, data) {
		    	console.log("error : "+ jqXHR.status);
		    	console.log("data : " + data);
		    }
		 });
	}/* END QNA 리스트 AJAX */

		
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