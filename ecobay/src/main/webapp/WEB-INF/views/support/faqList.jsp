<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">
		<div class="page-header" style="padding:2%">
   	    	<h3>자주 묻는 질문(FAQ) </h3>
		</div>
		<div class="col-md-12" >
			<form name="myform" action="/support/faq/faqlist.do">
				<div class="form-group row">
					<div class="col-sm-4">
					</div>
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
		            <th>번호</th>
		            <th>제목</th>
		        </tr>
		    </thead>
			<c:forEach var="list" items="${faqList}" varStatus="status">
			    <tr data-toggle="collapse" data-target="#data_${status.count }">
			    	<td>${status.count }</td>
			    	<td><i class="fa fa-quora"></i> <a>${list.title}</a></td>
			    </tr>
			    <tr class="collapse" id="data_${status.count }">
			    	<td></td>
			    	<td colspan="2"><i class="fa fa-font"></i> ${list.content }</td>
			    </tr>
			</c:forEach>
		    
		    
		</table>
 
        
        <div align="center">
			<tr>
				<td colspan="6">
					<%-- <c:if test="${startpage>10}">
						<a href="#" class="btn btn-light">이전</a>
					</c:if>
					<c:forEach var="i" begin="${startpage}" end="${endpage}">
						<a href="#" class="btn btn-primary">1</a>
					</c:forEach>
					<c:if test="${endpage<pagecount}">
						<a href="#" class="btn btn-light">다음</a>
					</c:if> --%>
				</td>
			</tr>
		</div>
		
</div>
