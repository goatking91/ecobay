<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<style type="text/css">
	th {
		width: 30%;
		float: right;
	}
	td {
		width: 30%;
	}
</style>

<body>
<h1 align="center">회원가입</h1>
<div class="container">
<form name="myform" method="post" action="" onsubmit=" ;return false;">
		<table width="100%" align="center">
			<tr>
				<th>ID</th>
				<td><input class="form-control" type="text" id="member_id" name="member_id" readonly></td>
				<td><input class="btn btn-info" type="button" onclick="" value="중복체크"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input class="form-control" type="text" id="member_name" name="member_name"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input class="form-control" type="text" id="pwd" name="pwd"></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input class="form-control" type="text" id="pwd2" name="pwd2"></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><input class="form-control" type="text" id="birth" name="birth"></td><!-- datepicker6자리 -->
			</tr>	
			<tr>
				<th>주소</th>
				<td><input class="form-control" type="text" id="zipcode" name="zipcode" placeholder="우편번호"></td>
				<td><input class="btn btn-info" type="button" value="우편번호찾기"></td>
			</tr>		
			<tr>
				<th></th>
				<td><input class="form-control col-xs-8" type="text" id="addr1" name="addr1" placeholder="도로명/지번"></td>
			</tr>
			<tr>
				<th></th>
				<td><input class="form-control" type="text" id="addr2" name="addr2" placeholder="상세주소"></td>
			</tr>
				<tr>
					<th>성별</th>
					<td colspan=2>
						<input type="radio" id="gender" name="gender" value="남" checked="checked">남
						<input type="radio" id="gender" name="gender" value="여">여
					</td>
				</tr>
			<tr>
				<th>번호</th>
				<td>
					<select class="form-control col-sm" id="phone1" name="phone1">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="010">017</option>
					</select>
					<input class="form-control col-sm" type="text" id="phone2" name="phone2">
					<input class="form-control col-sm" type="text" id="phone3" name="phone3">

				</td>
			</tr>
			<tr>
				<td></td>
				<td align="center">
					<input type="submit" class="btn btn-info" value="등록">
					<input type="reset" class="btn btn-info" value="초기화">
				</td>
			</tr>		
		</table>
	</form>
</div>
</body>
</html>