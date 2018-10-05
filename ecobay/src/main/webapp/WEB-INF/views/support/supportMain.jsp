<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<style>
.carousel-inner>.carousel-item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 400px;
	/* max-height: 400px; */
}
</style>
<div class="container">
	<div>
		<h1>
			고객센터
		</h1>
	</div>
	
	<div>
		<form>
			<div class="form-group row">
				<div class="col-sm-8">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="검색내용을 입력하세요..." id="searchVal" name="searchVal">
							
							
						<div class="input-group-append">
							<button class="btn btn-secondary" id="searchProduct">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<p>
	</div>
	
	<div>
		<a href="/support/notice/noticelist.do">공지사항 리스트</a><br>
		<a href="/support/qna/qnareg.do">1:1문의 등록</a><br>
	</div>
		
</div>
