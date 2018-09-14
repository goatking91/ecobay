<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>공지사항등록</title>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
	
	<style type="text/css">
		.colTitle
		{
			width:15%;
			text-align:right; 
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
		
		.contentDiv, imgDiv {
			min-height: 500px;
		}
		
	</style>
</head>
<body>
	<div class="container">
		<form name="iform" class="form-horizontal" method="post">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>공지사항 보기</th>
					</tr>

					<tr>
						<th class="colTitle">제목</th>
						<td><label> 제목 </label></td>
					</tr>
					
					<tr>
						<th class="colTitle">내용</th>
						<td>
							<div class="contentDiv">
								<label> 내용 </label>
							</div>
						</td>
					</tr>
					
					<tr>
						<th class="colTitle">이미지 등록</th>
						<td>
							<div class="imgDiv">
								<label> 이미지 내용 </label>
							</div>
						</td>
					</tr>
				</table>
			</div>

            <p>
            <div align="center" class="form-actions">
	            <button type="button" class="btn btn-info"> 목록보기 </button>
			</div>
		</form>
	</div>
	<br><br><br>
</body>
</html>