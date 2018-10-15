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
			<li><a href="#">Product</a></li>
			<li class="active"><a href="/admin/ProdReqlist.do">List</a></li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->

	<!-- 내용 -->
	<section class="content container-fluid">
	
		<div class="col-md-12" >
			<form name="myform" action="/admin/product/prodlist.do">
				<div class="form-group row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" name="keyfield">
				 				<option name="state_cd" value="" selected>전체</option>
				 				<option name="state_cd" value="1" >요청</option>
				 				<option name="state_cd" value="2" >요청취소</option>
				 				<option name="state_cd" value="3" >승인</option>
				 				<option name="state_cd" value="4" >반려</option>
				 				<option name="state_cd" value="5" >낙찰</option>
				 				<option name="state_cd" value="6" >유찰</option>
				 				<option name="state_cd" value="7" >즉시구매</option>
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
			    	<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
			    	<td>
			    		${list.state_nm}
			    		<input type="hidden" style="display: none;" id="state_cd" value="${list.state_cd}">
			    	</td>
			    </tr>
			</c:forEach>
			</tbody>
		</table>
 
        
        <div align="center">
			<tr>
				<td colspan="6">
					<c:if test="${startpage>10}">
						<a href="#" class="btn btn-light">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startpage}" end="${endpage}">
						<a href="#" class="btn btn-primary">1</a>
					</c:forEach>
					<c:if test="${endpage<pagecount}">
						<a href="#" class="btn btn-light">다음</a>
					</c:if>
				</td>
			</tr>
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
		
		$(document).on("click", "#blacklistbtn", function() {
			var id = $(this).attr("data-src");
			console.log(id);
			$.ajax({
				async: true,
				type: 'POST',
				contentType:"applicataion/json; charset=UTF-8",
				data: id,
				url : "/admin/memberblack.do",
				success : function(data) {
					alert("수정되었습니다.");
					$("#tbody").empty();
					var str = loadMemberList(data);
					$("#tbody").append(str);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
		
		function loadMemberList(data) {
			var str = "";
			$.each(data.list, function(index, list){ 
				str += "<tr>";
				str += "	<td>" + list.rn + "</td>";
				str += "	<td>" + list.member_id +"</td>";
				str += "	<td>" + list.member_name +"</td>";
				
				var date = new Date(list.regDate);
				var y = date.getFullYear();
			    var M = date.getMonth()+1;
			    var d = date.getDate();
			    M = (M < 10) ? "0" + M : M;
			    d = (d < 10) ? "0" + d : d;
			  	var day= y + "-" + M + "-" + d;
				str += "	<td>" + day +"</td>";
				
				if(list.join_yn == true) {
					str += "	<td>Y</td>";
				}else {
					str += "	<td>N</td>";
				}
				if(list.use_yn == true) {
					str += "	<td>Y</td>";
				}else {
					str += "	<td>N</td>";
				}
				str += "<td>"
	    	 	str += "<button class='btn-sm btn-danger' id='blacklistbtn' data-src='" + list.member_id + "'>정지</button>";
				str += "</td>"
			});
			return str;
		}
	});
</script>
