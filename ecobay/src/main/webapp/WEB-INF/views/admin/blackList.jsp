<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			회원관리
			<small>블랙리스트현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="/admin/memberlist.do">Member</a></li>
			<li class="active"><a href="/admin/blacklist.do">BlackList</a></li>
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
								<option value="all">전체검색</option>
				 				<option value="member_id">아이디검색</option>
				 				<option value="member_name">이름검색</option>
							</select>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text" class="form-control" id="keyWord" name="keyWord" placeholder="검색내용을 입력하세요...">
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
		    	<tr align="right"><td id="bcnt" colspan="6">count: ${cnt}</td></tr>
		        <tr>
		            <th>번호</th><th>회원아이디</th><th>이름</th>
		            <th>등록일시</th><th>등록사유</th><th>관리</th>
		        </tr>
		    </thead>
		    <tbody id="tbody">		    
			<c:forEach var="list" items="${list}">
			    <tr data-src="${list.member_id }" data-src2="${list.member_name }">
			    	<td class="blacklisttd">${list.rn}</td>
			    	<td class="blacklisttd">${list.member_id}</td>
			    	<td class="blacklisttd">${list.member_name}</td>
			    	<td class="blacklisttd"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
			    	<td class="blacklisttd">
			    		${list.regcontent }
		    	 	</td>
		    	 	<td>
		    	 		<button class='btn-sm btn-primary' id='blackcanbtn' data-src="${list.member_id }" data-src2="${list.member_name }">정지취소</button>
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

<div class="modal fade" id="blackcanModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="blackregmodaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="blackregmessage">
					<h5 align="center"></h5>
		          </div>
		          <div>
		          	<input id="data-idvalue" class="form-control" type="hidden" value="">
		          	취소 사유:
					<textarea id="blackcantextArea" class="form-control" cols="3"></textarea>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="blackcanmodalbtn" class="btn btn-primary" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="blackcanModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="blackcanmodaltitle">블랙리스트 취소</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="blackcanmessage">
					<h5 align="center"></h5>
					<input id="data-idvalue" class="form-control" type="hidden" value="">
		          </div>
		          <div>
		          	취소 사유:
					<textarea id="blackcantextArea" class="form-control" cols="3"></textarea>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="blackcanmodalbtn" class="btn btn-primary" data-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="blackcontextModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="blackcontextmodaltitle">블랙리스트 사유</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="blackcontextmessage">
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
		ajaxLoadBlackList(nowPage, searchType, keyWord);
	  	
		//페이징 이동 버튼 클릭
		$(document).on("click", ".pagingBtn", function(){
			var movePage = $(this).val();
			nowPage = movePage;
			ajaxLoadBlackList(movePage, searchType, keyWord);
		});
		
		//검색 버튼 클릭
		$(document).on("click", "#searchBtn", function(){
			searchType = $("#searchType option:selected").val();
			keyWord = $('#keyWord').val();
			console.log(keyWord);
			
			ajaxLoadBlackList(1, searchType, keyWord);
		});
		
		$(document).on("click", "#blackcanbtn", function() {
			var id = $(this).attr("data-src");
			var name = $(this).attr("data-src2");
			$("#blackcanmessage").find("h5").text(name + "님을 블랙리스트에서 삭제하시겠습니까?");
			$("#data-idvalue").val("");
			$("#data-idvalue").val(id);
			$("#blackcanModal").modal("show");
		});
	
		$(document).on("click", "#blackcanmodalbtn", function() {
			var id = $("#data-idvalue").val();
			var text = $("#blackcantextArea").val();
			
			console.log(id);
			console.log(text);
			
			var blackvalue = JSON.stringify({
				"member_id" : id,
				"cancontent": text
			});
			
			$.ajax({
				async: true,
				type: 'POST',
				contentType: "application/json; charset=UTF-8",
				data: blackvalue,
				url : "/admin/memberblackcan.do",
				success : function(data) {
					ajaxLoadBlackList(nowPage, searchType, keyWord);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
			
			$("#data-idvalue").val("");
			$("#blackcantextArea").val("");
			
		});
		
		$(document).on("click", ".blacklisttd", function() {
			var member_id = $(this).parent().attr("data-src");
			var name = $(this).parent().attr("data-src2");
			
			$("#blackcontextmodaltitle").text(name + "님의 블랙리스트 사유");
			$.ajax({
				url : "/admin/ajaxblackcontent.do",
				data : member_id ,
				contentType: "application/json; charset=UTF-8",
				method : "POST",
			    success : function(data, movePage) {
					var htmlStr = "";
					
					htmlStr += "<table class='table table-striped table-hover'>";
					htmlStr += "	<thead>";
					htmlStr += "    	<tr>";
					htmlStr += "        	<th>번호</th><th>등록사유</th><th>취소사유</th><th>등록일자</th>";
					htmlStr += "    	</tr>";
					htmlStr += "	</thead>";
					htmlStr += "	<tbody>";
					
					$.each(data.list, function(index, list){ 
						htmlStr += "		<tr>";
						htmlStr += "			<td>" + list.rn + "</td>";
						htmlStr += "			<td>" + list.regcontent + "</td>";
						
					  	if(list.cancontent != null) {
					  		htmlStr += "			<td>" + list.cancontent + "</td>";
					  	}else {
					  		htmlStr += "			<td></td>";
					  	}
					  	
					  	var date = new Date(list.regdate);
						var y = date.getFullYear();
					    var M = date.getMonth()+1;
					    var d = date.getDate();
					    M = (M < 10) ? "0" + M : M;
					    d = (d < 10) ? "0" + d : d;
					  	var day= y + "-" + M + "-" + d;
					  	
					  	htmlStr += "			<td>" + day + "</td>";
					  	
					  	htmlStr += "		<tr>";
					});
					
					htmlStr += "	</tbody>";
					htmlStr += "</table>";
					
					$("#blackcontextmessage").find("h5").html(htmlStr);
					$("#blackcontextModal").modal("show");
			    },
			    error : function(data) {
			    	console.log("data : " + data);
			    }
			});
		});
		
		function ajaxLoadBlackList(movePage, searchType, keyWord) {
			
			var pagevalue = JSON.stringify({
	        	"movePage": movePage,
	        	"searchType": searchType,
	        	"keyWord": keyWord
	        });
			
			$.ajax({
				url : "/admin/ajaxblacklist.do",
				data : pagevalue,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				method : "POST",
			    success : function(data, movePage) {
					var htmlStr = "";
					
					$.each(data.list, function(index, list){ 
						htmlStr += "<tr data-src='" + list.member_id + "' data-src2='" + list.member_name + "'>";
						htmlStr += "	<td class='blacklisttd'>" + list.rn + "</td>";
						htmlStr += "	<td class='blacklisttd'>" + list.member_id +"</td>";
						htmlStr += "	<td class='blacklisttd'>" + list.member_name +"</td>";
						
						
						var date = new Date(list.regdate);
						var y = date.getFullYear();
					    var M = date.getMonth()+1;
					    var d = date.getDate();
					    M = (M < 10) ? "0" + M : M;
					    d = (d < 10) ? "0" + d : d;
					  	var day= y + "-" + M + "-" + d;
					  	htmlStr += "	<td class='blacklisttd'>" + day +"</td>";
						
					  	htmlStr += "	<td class='blacklisttd'>";
					  	htmlStr += list.regcontent;
		    	 		htmlStr += "	</td>";
						htmlStr += "	<td>";
						htmlStr += "		<button class='btn-sm btn-primary' id='blackcanbtn' data-src='" + list.member_id + "' data-src2='" + list.member_name +"'>정지취소</button>";
						htmlStr += "	</td>";
						htmlStr += "</tr>";
					});
					
					$("#tbody").empty();
					$("#tbody").append(htmlStr);
					$("#bcnt").html("count: " + data.cnt);
			            
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
