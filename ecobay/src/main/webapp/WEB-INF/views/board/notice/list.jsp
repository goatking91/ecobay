<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
   	    	<h1>회원가입 </h1>
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
		            <th>작성자</th><th>등록일시</th><th>파일</th><th>조회수</th>
		        </tr>
		    </thead>		    
			<c:forEach var="dto" items="${dto}">
			    <tr>
				   <td>1</td>
				   <td>공지사항입니다</td>
				   <td>관리자</td>
				   <td>2018-09-14</td>
				   <td></td>
				   <td>2345</td>
			    </tr>
			    <tr>
				   <td>2</td>
				   <td>공지사항입니다</td>
				   <td>관리자</td>
				   <td>2018-09-14</td>
				   <td></td>
				   <td>2345</td>
			    </tr>
			</c:forEach>
		</table>
        </div>
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
</div>
</body>
</html>