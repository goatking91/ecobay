<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.colTitle
	{
		width:15%;
		text-align:right; 
		background-color: #F2F2F2; 
		vertical-align: middle;
	}
</style>
<div class="container">
	<div class="page-header" style="padding:2%">
    	<h3>
    		공지사항
    		<small>-상세</small>
    	</h3>
    	
	</div>
	<input type="hidden" id="notice_idx" name="idx" value="${notice.notice_idx }">
	<div class="table-responsive">
		<table class="table">

			<tr>
				<th class="colTitle">제목</th>
				<td>${notice.title }</td>
				<th>조회수</th>
				<td>${notice.viewCNT }</td>
			</tr>
			
			<tr>
				<th class="colTitle">첨부파일</th>
				<td colspan="3">
					<c:forEach var="filelist" items="${notice.fileVOList }">
						<c:choose>
							<c:when test="${filelist.filename_org ne null}">
								<a href="/support/notice/download.do?fileidx=${filelist.file_idx}&noticeidx=${notice.notice_idx}">${filelist.filename_org} </a>
								
								<span style="font-size: 11px;">
									(${filelist.fileSizeByte } KByte)
								</span>
								<br>
							</c:when>
							<c:otherwise>
								첨부파일이 존재하지 않습니다.
							</c:otherwise>
						</c:choose>
					</c:forEach>								
   				</td>
			</tr>
			<tr>
				<th class="colTitle">내용</th>
				<td style="height: 350px;" colspan="3">
					${notice.content }
				</td>
			</tr>
			
		</table>
	</div>

    <p>
    
    <div align="center" class="form-actions">
		<c:url var="listURL" value="/support/notice/noticelist.do" />
        <a href="${pageScope.listURL}"><button type="button" class="btn btn-info"> 목록보기 </button></a>
	</div>
	
</div>
<br><br><br>