<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>상품등록</title>
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
	
	<script type="text/javascript" src="/resources/lib/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function()
		{
		    CKEDITOR.replace( 'content' );
		});
	</script>
	
	<script type="text/javascript">
		$(function()
		{
			$("select[name='class_big_cd']").change(function(){  // 셀렉트 박스가 체인지 될때 이벤트  - "select[name=classBig]"
				var valBig = $(this).val(); // 현재 선택된 값
	
				if(valBig == "" || valBig == null) {
					$("select[name='class_mid_cd'] option").remove();
					$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
				}
				else {
					$.ajax({  
						url         : "midclass.do",  
						type        : "POST",  
						data    	: "class_big_cd="+valBig,  
						dataType    : "json",  
						contentType : "applicaton/json; charset=UTF-8",  
						success     : function (data) {
							$.each(data, function(i, d) {
								$("select[name=class_mid_cd]").append('<option value="' + d.class_mid_cd + '">' + d.class_mid_nm + '</option>'); 
							});  
						}
					});
				}
			});
		});
	</script>
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
							<select class="custom-select" name="class_big_cd" id="class_big_cd">
								<option value="">-대분류 선택-</option>
								<c:forEach var="bigcls" items="${bigclass}">
									<option value="${bigcls.class_big_cd}">${bigcls.class_big_nm}</option>
								</c:forEach>
							</select>
						</td>
						<td>
							<select class="custom-select" name="class_mid_cd" id="class_mid_cd">
								<option value="XX">-중분류 선택-</option>
								<c:forEach var="midcls" items="${midclass}">
									<option value="${midcls.class_mid_cd}">${midcls.class_mid_nm}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				
					<tr>
						<th class="colTitle">*물품제목</th>
						<td colspan="2"><input class="form-control" type="text" name="product_nm" placeholder="물품제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">*물품설명</th>
						<td colspan="2">
							<font color="red"><strong> * 직거래를 유도하는 문구, 개인정보(휴대폰, e-mail 등)나 html 태그는 사용할 수 없습니다.</strong></font>
							<textarea rows="25" class="form-control" name="content" id="content"></textarea>
						</td>
					</tr>
					
					<tr>
						<th class="colTitle">*이미지 등록</th>
						<td colspan="2">
							<textarea rows="5" class="form-control fileDrop" name="fileupload" placeholder="차후 이미지 등록기능 구현 예정임...."></textarea>
							이미지파일은 [ JPG | GIF | BMP ] 형식만 가능합니다.(이미지 관련 안내문구 출력하기....) 
						</td>
					</tr>
					<tr>
						<th class="colTitle">이미지 미리보기</th>
						<td colspan="2">
							<div class="uploadedList"></div>
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
								<option value="100">100</option>
								<option value="200">200</option>
								<option value="500">500</option>
								<option value="1000">1,000</option>
								<option value="2000">2,000</option>
								<option value="5000">5,000</option>
								<option value="10000">10,000</option>
								<option value="20000">20,000</option>
								<option value="50000">50,000</option>
								<option value="100000">100,000</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="colTitle">*경매기간(일)</th>
						<td>
							<select class="form-control" name="auctdateUnit">
								<option value="">-선택하세요-</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
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
	<script type="text/javascript">
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		//console.log(file);
		var formData = new FormData();
		
		formData.append("file", file);
		 
		$.ajax({
			url: "/product/uploadAjax.do",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "POST",
			success: function(data) {
				
				var str = "";
				
				if(checkImageType(data)) {
					str = "<div>"
						+ "<a href='displayFile?fileName=" + getImageLink(data) + "'>"
						+ "<img src='displayFile?fileName=" + data + "'/>"
						+ "</a><small data-src=" + data + ">X</small></div>";
				}else {
					str = "<div><a href='displayFile?fileName=" + data + "'>"
						+ getOriginalName(data) +"</a>"
						+ "<small data-src=" + data + ">X</small></div></div>";
				}
				
				$(".uploadedList").append(str);
			}
		});
	});
	
	function checkImageType(fileName) {
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
		
	}
	
	function getOriginalName(fileName) {
		
		if(checkImageType(fileName)) {
			return;
		}
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getImageLink(fileName) {
		
		if(!checkImageType(fileName)) {
			return;
		}
		
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	}
	
	$(".uploadedList").on("click", "small", function(event) {
		
		var that = $(this);
		
		$.ajax({
			url: "/deleteFile",
			type: "post",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result=="deleted") {
					that.parent("div").remove();
				}
			}
		});
	});
	</script>
</body>
</html>