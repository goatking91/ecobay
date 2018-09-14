<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>상품등록</title>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
	
	<script type="text/javascript">
		$(function()
		{
			$('#baynowYn').click(function()
			{
				var ck = this.checked;

				if(ck == true)
				{
					$('#baynowMoney').removeAttr("disabled");
				}
				else
				{
					$('#baynowMoney').val('');
					$('#baynowMoney').attr("disabled", true);			
				}
			});
		});
	</script>
	
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
	<div class="container"> <!-- container-fluid -->
		<form name="iform" class="form-horizontal" method="post">
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th colspan="2">물품정보</th>
						<td style="text-align: right; vertical-align: bottom;"><font  size="1">* 표시는 필수 항목입니다.</font></td>
					</tr>

					<tr>
						<th class="colTitle">*물품분류</th>
						<td>
							<select class="form-control" name="classBig">
								<option value="">-대분류 선택-</option>
							</select>
						</td>
						<td>
							<select class="form-control" name="classMid">
								<option value="">-중분류 선택-</option>
							</select>
						</td>
					</tr>
				
					<tr>
						<th class="colTitle">*물품제목</th>
						<td colspan="2"><input class="form-control" type="text" name="productNm" placeholder="물품제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">*물품설명</th>
						<td colspan="2">
							<font color="red"><strong> * 직거래를 유도하는 문구, 개인정보(휴대폰, e-mail 등)나 html 태그는 사용할 수 없습니다.</strong></font>
							<textarea rows="15" class="form-control" name="content" placeholder="물품설명을 입력하세요."></textarea>
						</td>
					</tr>
					
					<tr>
						<th class="colTitle">*이미지 등록</th>
						<td colspan="2">
							<textarea rows="15" class="form-control" name="fileupload" placeholder="차후 이미지 등록기능 구현 예정임...."></textarea>
							이미지파일은 [ JPG | GIF | BMP ] 형식만 가능합니다.(이미지 관련 안내문구 출력하기....) 
						</td>
					</tr>
				</table>
			</div>

			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>경매 설정</th>
						<td style="text-align: right; vertical-align: bottom;"><font  size="1">* 표시는 필수 항목입니다.</font></td>
					</tr>
					
					<tr>
						<th class="colTitle">*시작가</th>
						<td><input class="form-control" type="text" name="moneyFirst" placeholder="시작가를 입력하세요."></td>
					</tr>

					<tr>
						<th class="colTitle">*입찰단위(원)</th>
						<td>
							<select class="form-control" name="moneyUnit">
								<option value="">-선택하세요-</option>
								<option valie="100">100</option>
								<option valie="200">200</option>
								<option valie="500">500</option>
								<option valie="1000">1,000</option>
								<option valie="2000">2,000</option>
								<option valie="5000">5,000</option>
								<option valie="10000">10,000</option>
								<option valie="20000">20,000</option>
								<option valie="50000">50,000</option>
								<option valie="100000">100,000</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="colTitle">*경매기간(일)</th>
						<td>
							<select class="form-control" name="auctdateUnit">
								<option value="">-선택하세요-</option>
								<option valie="1">1</option>
								<option valie="2">2</option>
								<option valie="3">3</option>
								<option valie="4">4</option>
								<option valie="5">5</option>
								<option valie="6">6</option>
								<option valie="7">7</option>
								<option valie="8">8</option>
								<option valie="9">9</option>
								<option valie="10">10</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="colTitle">*즉시구매</th>
						<td>
							<input class="checkbox" type="checkbox" name="baynowYn" id="baynowYn" value="baynowYn">&nbsp;&nbsp;
							<input type="number" name="baynowMoney" id="baynowMoney" disabled>(원)
						</td>
					</tr>
				</table>
			</div>

			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>배송 설정</th>
						<td style="text-align: right; vertical-align: bottom;"><font  size="1">* 표시는 필수 항목입니다.</font></td>
					</tr>
					
					<tr>
						<th class="colTitle">*배송구분</th>
						<td>
							<input type="radio" name="deliDiv" value="1">직거래 <!-- direct  -->
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="deliDiv" value="2" checked>택배 <!-- delivery  -->
						</td>
					</tr>
				</table>
			</div>

            <p>
            <div align="center" class="form-actions">
	            <button type="submit" class="btn btn-default btn-primary"> 등  록 </button>&nbsp;
	            <button type="button" class="btn btn-info"> 메  인 </button>
			</div>
		</form>
	</div>
	<br><br><br>
</body>
</html>