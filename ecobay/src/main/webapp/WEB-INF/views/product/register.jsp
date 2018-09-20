<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>상품등록</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	
	<script type="text/javascript">
		$(function() {
		    $( "#acutdate_start_str" ).flatpickr({
		    	minDate: 'today',
		    	enableTime: true,
		    	time_24hr: true,
		        dateFormat: 'Y-m-d H:i',
		        onReady: function (selectedDates, dateStr, instance) {
		            $('#acutdate_start_str input').val(
		                instance.formatDate(new Date(), 'Y-m-d H:i')
		            )
				}
		    });
		 });
	</script>

	<script type="text/javascript" src="/resources/lib/ckeditor/ckeditor.js"></script>
	<script type="text/javascript">
		$(function()
		{
		    CKEDITOR.replace( 'content' );
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
		.fileDropImg {
			height: 150px;
		}
		
		.inline{
			display: inline;
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
						<td colspan="2" class="fileDrop">
							<div class="form-control fileDropImg">
								<label>
									이미지를 여기로 드래그해주세요.<br>
									이미지파일은 [ JPG | GIF | PNG ] 형식만 가능합니다.(이미지 관련 안내문구 출력하기....) 
								</label>
							</div>
						</td>
					</tr>
					<tr>
						<th class="colTitle">이미지 미리보기</th>
						<td colspan="2" class="fileDrop">
							<div class="uploadedList fileDropImg">
								<input style='display:none;' type='hidden' name='ivo[0].product_cd' value=''>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>경매 설정</th>
						<td colspan="2" style="text-align: right; vertical-align: bottom;"><font  size="1">* 표시는 필수 항목입니다.</font></td>
					</tr>
					
					<tr>
						<th class="colTitle">*시작가/입찰단위</th>
						<td><input class="form-control inline" style="width: 90%;" type="number" id="money_first" name="avo.money_first" placeholder="시작가를 입력하세요.">원</td>
						<td>
							<select class="form-control inline" style="width: 70%;" id="money_unit" name="avo.money_unit">
								<option value="">-입찰단위 선택-</option>
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
							원
						</td>
					</tr>

					<tr>
						<th class="colTitle">*경매기간(일)</th>
						<td><input class="form-control" style="width: 90%;" id="acutdate_start_str" name="avo.acutdate_start_str" type="text" placeholder="경매시작일을 넣어주세요."></td>
						<td>
							<select class="form-control" name="avo.auctdate_unit">
								<option value="0">-경매기간 선택-</option>
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
								<option value="8">8일</option>
								<option value="9">9일</option>
								<option value="10">10일</option>
							</select>
						</td>
					</tr>
					<tr>
						<th class="colTitle">*즉시구매</th>
						<td colspan="2">
							<input class="checkbox" type="checkbox" name="avo.baynow_yn" id="baynow_yn" value="baynow_yn">&nbsp;&nbsp;
							<input class="form-control inline" style="width: 30%;" type="number" name="avo.baynow_money" id="baynow_money" disabled>(원)
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
						<td id="deli_div_cd">
							<input type="radio" name="dvo.deli_div_cd" value="1">직거래 <!-- direct  -->
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="dvo.deli_div_cd" value="2" checked="checked">택배 <!-- delivery  -->
							<div id="deli_div_nm">
								<input style='display:none;' type='hidden' name='dvo.deli_div_nm' value='택배'>
							</div>
							
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
		$(function()
		{
			$('#baynow_yn').click(function()
			{
				var ck = this.checked;

				if(ck == true)
				{
					$('#baynow_money').removeAttr("disabled");
				}
				else
				{
					$('#baynow_money').val('');
					$('#baynow_money').attr("disabled", true);
				}
			});
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
					$.getJSON("/product/midclass.do/" + valBig, function(data) {
						$("select[name='class_mid_cd'] option").remove();
						$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
						$.each(data, function(i, d) {
							$("select[name=class_mid_cd]").append('<option value="' + d.class_mid_cd + '">' + d.class_mid_nm + '</option>'); 
						}); 
					});
				}
			});
		});
	</script>
	
	<script type="text/javascript">
	var idx = 0;
	
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
				
				var fileName = getImageLink(data); 
				var originalName = getOriginalName(data);
				var thumbName = data;
				
				if(checkImageType(data)) {
					str = "<div style='display:inline;'><img src='/product/displayFile.do?fileName=" + thumbName + "'/>"
						+ "<small data-src=" + thumbName + ">X</small>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename' value='" + fileName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename_org' value='" + originalName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename_thumb' value='" + thumbName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].img_idx' value='" + idx + "'>&nbsp;&nbsp;&nbsp;</div>";
				}else {
					alert("이미지 파일로 올려주세요.");
				}
				idx = idx + 1;
				$(".uploadedList").append(str);
			}
		});
	});
	
	function checkImageType(fileName) {
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
		
	}
	
	function getFileName(fileName) {
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getOriginalName(fileName) {
		
		var idx = fileName.lastIndexOf("_") + 1;
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
			url: "/product/deleteFile.do",
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
	
	$("#deli_div_cd").children().click(function() {
		var str = "";
		var check = $("input[name='dvo.deli_div_cd']:checked").val();
		$("#deli_div_nm").html("");
		if(check==1) {
			str = "<input style='display:none;' type='hidden' name='dvo.deli_div_nm' value='직거래'>";
			$("#deli_div_nm").append(str);
		}else if(check==2) {
			str = "<input style='display:none;' type='hidden' name='dvo.deli_div_nm' value='택배'>";
			$("#deli_div_nm").append(str);
		}
	});
	</script>
</body>
</html>