<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<!-- ajax로그인 할 때 필요한 메타데이터 두 줄-->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>상품등록</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
	<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
	<script type="text/javascript" src="/resources/lib/summernote/summernote-bs4.min.js"></script>
	<link rel="stylesheet" href="/resources/lib/summernote/summernote-bs4.css" />

	<script src="/resources/js/productRegister.js"></script>
	
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
		<form id="iform" name="iform" class="form-horizontal" method="post">
			<security:csrfInput/>
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
						<td colspan="2"><input class="form-control" type="text" id="product_nm" name="product_nm" placeholder="물품제목을 입력하세요."></td>
					</tr>
					
					<tr>
						<th class="colTitle">*물품설명</th>
						<td colspan="2">
							<font color="red"><strong> * 직거래를 유도하는 문구, 개인정보(휴대폰, e-mail 등)나 html 태그는 사용할 수 없습니다.</strong></font>
							<textarea rows="25" class="form-control" name="content" id="content"></textarea>
						</td>
					</tr>
					
					<tr>
						<th class="colTitle">*첨부 이미지 등록</th>
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
						<th class="colTitle">첨부 이미지 미리보기</th>
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
							<select class="form-control" id="auctdate_unit" name="avo.auctdate_unit">
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
							<input class="checkbox" type="checkbox" name="avo.baynow_yn" id="baynow_yn">&nbsp;&nbsp;
							<input class="form-control inline" style="width: 30%;" type="number" name="avo.baynow_money" id="baynow_money" disabled>원
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
	            <input type="submit" id="regbutton" class="btn btn-lg btn-default btn-primary" value=" 등&nbsp;&nbsp;&nbsp;록 ">&nbsp;
	            <input type="reset" class="btn btn-lg btn-info" value=" 초기화 ">
			</div>
		</form>
	</div>
	<br><br><br>

	<!-- 모달 창 -->	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modaltitle">안내</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="row">
							<div class="col-md">
								<div id="message">
									<h4 align="center"></h4>
								</div>
							</div>		      	
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>