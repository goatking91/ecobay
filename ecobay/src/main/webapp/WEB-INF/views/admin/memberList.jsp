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
			<small>회원현황</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li><a href="#">Member</a></li>
			<li class="active"><a href="/admin/memberlist.do">List</a></li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container-fluid">
	
		<div class="col-md-12" >
			<form name="myform" action="list.do">
				<div class="form-group row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" name="keyfield">
				 				<option value="member_id" selected>아이디검색</option>
				 				<option value="name" selected>이름검색</option>
							</select>
						</div>
					</div>
					<div class="col-sm-5">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="검색내용을 입력하세요...">
							<div class="input-group-append">
								<button class="btn btn-primary">검색</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
			 
		<table class="table table-striped table-hover">
			<tr align="right">count: ${mcnt}</tr>
		    <thead>
		        <tr>
		            <th>번호</th><th>회원아이디</th><th>이름</th>
		            <th>등록일시</th><th>가입여부</th><th>사용여부</th><th>관리</th>
		        </tr>
		    </thead>
		    <tbody id="tbody">		    
			<c:forEach var="list" items="${list}">
			    <tr>
			    	<td>${list.rn}</td>
			    	<td>${list.member_id}</td>
			    	<td>${list.member_name}</td>
			    	<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
			    	<td>
				    	<c:choose>
				    		<c:when test="${list.join_yn}">Y</c:when>
				    		<c:otherwise>N</c:otherwise>
				    	 </c:choose>
					    	 </td>
					    	 <td>
				    	 <c:choose>
				    	 	<c:when test="${list.use_yn}">Y</c:when>
				    	 	<c:otherwise>N</c:otherwise>
				    	 </c:choose>
			    	 </td>
			    	 <td>
			    	 	<button class="btn-sm btn-danger" id="blacklistbtn" data-src="${list.member_id }">정지</button>
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
