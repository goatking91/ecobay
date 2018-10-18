<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<link rel="stylesheet" href="/resources/css/supportMain.css">
<script type="text/javascript" src="/resources/js/supportMain.js"></script>

<div class="container">
	<div id="support-headr">
		<h1>
			고객센터
		</h1>
	</div>
	

	<div class="conatiner">
		<div class="row">
			<div class="col-md-12">
				<nav class="nav nav-pills nav-fill nav-filter">
				
					<a class="nav-item nav-link disabled" href="#">
						<i class="fa fa-phone"></i>고객센터
					</a>
					<a class="nav-item nav-link" href="/support/faq/faqlist.do">자주묻는 질문</a>
					<a class="nav-item nav-link" href="/support/qna/qnareg.do">1:1문의 등록</a>
					<a class="nav-item nav-link" href="/support/notice/noticelist.do">공지사항</a>
				</nav>
				<br>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12">
				<div class="search_box h5">
					<form method="get">
						<div class="form-group row">
							<div class="col-sm-2"></div>
							<div class="col-sm-8">
								<font size="3">자주묻는 질문(FAQ)검색</font>
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="검색내용을 입력하세요..." id="searchVal" name="searchVal">
										
										
									<div class="input-group-append">
										<button class="btn btn-secondary" id="searchProduct">검색</button>
									</div>
								</div>
							</div>
							<div class="col-sm-2"></div>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!-- TOP10 LIST -->
		<div class="row lists">
		
			<!-- 자주묻는 질문 -->
			<div class="col-md-6">
				<div class="faqlists">
					<div align="center">
						<h5>자주묻는 질문 TOP10</h5>
					</div>
					<div align="right">
						<a class="more-read" href="/support/faq/faqlist.do">
							<i class="fa fa-plus-circle"></i>더보기
						</a>
					</div>
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th width="3%">#</th>
								<th width="97%"></th>
							</tr>
						</thead>
						
						<tbody id="faqTbody">
							
						</tbody>
					</table>
				</div>
			</div>
		
			<!-- 공지사항 -->
			<div class="col-md-6">
				<div class="noticelists">
					<div align="center">
						<h5>공지사항</h5>
					</div>
					<div align="right">
						<a class="more-read" href="/support/notice/noticelist.do">
							<i class="fa fa-plus-circle"></i>더보기
						</a>
					</div>
					
					<table class="table table-hover table-bordered">
						<thead>
							<tr>
								<th width="3%">#</th>
								<th width="97%"></th>
							</tr>
						</thead>
						
						<tbody id="noticeTbody">
							
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</div>
