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
	</style>
</head>
<body>
	<div class="container">
		<form name="iform" class="form-horizontal" method="post">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>공지사항 등록</th>
					</tr>

					<tr>
						<th class="colTitle">제목</th>
						<td><input class="form-control" type="text" name="title" placeholder="제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">내용</th>
						<td>
							<textarea rows="15" class="form-control" name="content" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
					
					<tr>
						<th class="colTitle">이미지 등록</th>
						<td>
							<textarea rows="15" class="form-control" name="fileupload" placeholder="차후 이미지 등록기능 구현 예정임...."></textarea>
							이미지파일은 [ JPG | GIF | BMP ] 형식만 가능합니다.(이미지 관련 안내문구 출력하기....) 
						</td>
					</tr>
				</table>
			</div>

            <p>
            <div align="center" class="form-actions">
	            <button type="submit" class="btn btn-default btn-primary"> 등  록 </button>&nbsp;
	            <button type="button" class="btn btn-info"> 취  소 </button>
			</div>
		</form>
	</div>
	<br><br><br>
</body>
</html>