<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/bootstrap/js/bootstrap.js"></script>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>

<div class="container">
	<div class="row">
		<div class="page-header" style="padding:2%">
   	    	<h1>공지사항 </h1>
		</div>
		<div class="col-md-12" >
			<form name="myform" action="list.do">
				<div class="form-group row">
					<div class="col-sm-4"></div>
					<div class="col-sm-3">
						<div class="input-group">
							<select class="custom-select" name="keyfield">
				 				<option value="all" selected>전체검색</option>
				 				<option value="title" selected>제목검색</option>
				 				<option value="content" selected>내용검색</option>
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
		    <thead>
		        <tr>
		            <th>번호</th><th>제목</th>
		            <th>작성자</th><th>등록일시</th><th>조회수</th>
		        </tr>
		    </thead>		    
			<c:forEach var="notice" items="${noticeList}" varStatus="status">
				<tr>
				   <td>${status.index + 1}</td>
				   <td><a href="/support/notice/noticedetail.do?idx=${notice.notice_idx }">${notice.title }</a></td>
				   <td>관리자</td>
				   <td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd"/></td>
				   <td>${notice.viewCNT }</td>
			    </tr>
			    
			</c:forEach>
		</table>
        </div>
        <%-- <div align="center">
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
		</div> --%>
</div>
</body>
</html>