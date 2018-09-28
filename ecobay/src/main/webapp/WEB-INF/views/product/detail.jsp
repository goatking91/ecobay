<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>상품상세보기</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<style type="text/css">
		a 
		{
		    color: #337ab7;
		    text-decoration: none;
		}

		.text-right
		{
			padding-right: 0;
		    display: table-cell;
		    text-align: right;
		}

		.product-detail-thum 
		{
		    padding-right: 40px;
		}
		
		.product-detail-thum .gallery-thumbs-container
		{
			margin-top: 30px;
		}
		
		.product-detail-thum .gallery-thumbs-container .bx-prev 
		{
	    	left: 10;
		    background: url(/resources/images/image-arrow-left.png) no-repeat;
		    position: absolute;
		    font-size: 0;
		    width: 15px;
		    height: 28px;
		    overflow: hidden;
		    text-indent: -100px;
		    top: 50%;
		    margin-top: -14px;
		    z-index: 100;
		}
		
		.product-detail-thum .gallery-thumbs-container .bx-next 
		{
		    right: 0;
		    background: url(/resources/images/image-arrow-right.png) no-repeat;
   		    position: absolute;
		    font-size: 0;
		    width: 15px;
		    height: 28px;
		    overflow: hidden;
		    text-indent: -100px;
		    top: 50%;
		    margin-top: -14px;
		    z-index: 100;
		}
		
		.product-detail-thum .imgBig 
		{
		    display: table;
		    width: 100%;
		    height: 500px;
		    border: 1px solid #ddd;
		}
		
		.thumb.pager-active 
		{
		    border: 1px solid #114da5;
		}
		
		.product-detail-spec
		{
		    padding-left: 20px;
		}
		
		.detailTitle
		{
			width:25%;
			text-align:right;
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
	</style>
	
	
<script type="text/javascript">
	$(function() {
		$('.bxslider').bxSlider({
			  auto: true,
			  autoControls: true,
			  stopAutoOnClick: true,
			  pager: true
		});
	})
</script>
	
	
</head>
<body>
	<br>
	<!-- 제목(상품명) 출력영역 -->
	<div class="container">
		<div class="row">
			
		</div>
	</div>

	<!-- 상품상세내역 출력영역 -->
	<div class="container">
 		<div id="product-detail-info" class="row"><!--  important; -->
		
			<!-- 이미지 출력 영역 시작 -->
			<div class="product-detail-thum col-sm-12 col-md-6">
				<h4>${prod.product_nm}</h4>
 				<div class="bxslider">
					<c:forEach items="${img}" var="img">
						<div><img src="/displayFile.do?fileName=${img.filename_thumb}" style="margin-left: auto; margin-right: auto; display: block;"></div>
					</c:forEach>
				</div>
			</div>
			<!-- 상품정보 출력영역 -->
			<div class="product-detail-spec col-sm-12 col-md-6">
				<div class="table-responsive">
					<label style="float:right;" id="remain"></label>
					<input id="endTime" type="hidden" value="${auct.acutdate_end_str}"> 
					<table class="table">
						<tr>
							<th class="detailTitle">현재가</th>
							<td colspan="2"><input type="text" size="10" name="moneyBid" id="moneyBid" style="border: none;" readOnly 
									<c:choose>
										<c:when test="${prod.bid_max_money eq 0}">value='${auct.money_first}원'</c:when>
										<c:otherwise>
											value='${prod.bid_max_money}원'
										</c:otherwise>
									</c:choose>>
							</td>
						</tr>
						
						<tr>
							<th class="detailTitle">상품번호</th>
							<td colspan="2">${prod.product_cd}</td>
						</tr>
						
						<tr>
							<th class="detailTitle">경매기간</th>
							<td colspan="2">${auct.acutdate_start_str} ~ ${auct.acutdate_end_str}</td>
						</tr>
						
						<tr>
							<th class="detailTitle">시작가</th>
							<td colspan="2">${auct.money_first}원</td>
						</tr>
						<tr>
							<th class="detailTitle">입찰단위</th>
							<td colspan="2">${auct.money_unit}원</td>
						</tr>
						<tr>
							<th class="detailTitle">즉시구매</th>
							<td colspan="2">
								<c:choose>
									<c:when test="${auct.baynow_yn == true}">${auct.baynow_money}</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-danger btn-sm" name="baynow_money" id="baynow_money">즉시구매 불가능</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th class="detailTitle">입찰수</th>
							<td>${prod.bid_cnt}명</td>
							<td style="text-align: center;"><button type="button" class="btn btn-outline-dark btn-sm" name="bidCnt" id="bidCnt">경매기록보기</button></td>
						</tr>
						<tr>
							<th class="detailTitle">배송정보</th>
							<td colspan="2">${deli.deli_div_nm}</td>
						</tr>
						<tr>
							<th class="detailTitle">판매자정보</th>
							<td colspan="2">${prod.member_id}</td>
						</tr>
						
						<tr>
							<td colspan="3" style="vertical-align: middle; text-align: center;"><button type="button" class="btn btn-primary" href="#none" onclick="" >입찰하기</button></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 상품정보 출력영역 끝 -->
			
			<!-- 탭 영역 -->
			<div class="col-sm-12">
				<nav class="nav nav-tabs" id="myTab" role="tablist">
					<a class="nav-item nav-link active" id="nav-content-tab" data-toggle="tab" href="#nav-content" role="tab" aria-controls="nav-content" aria-selected="true">상품정보</a>
					<a class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="false">상품문의</a>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-content-tab">
						<div class="container">
							${prod.content}
						</div>
							
					
					</div>
					<div class="tab-pane fade" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">
						<%-- <c:import url="/WEB-INF/views/product/qna.jsp"></c:import> --%>
					</div>
				</div>
			</div>
		<!--탭 영역 끝-->
		</div>
	</div>




	<div class="container">
		<form name="iform" class="form-horizontal" method="post">
		</form>
	</div>
	
	
<script type="text/javascript">
	
	var endDateTime = new Date(document.getElementById("endTime").value+":00").getTime();
	function auctTime(){
		var dateTime = new Date().getTime();
		
		if(endDateTime > dateTime) {
			var difference_ms = endDateTime - dateTime;
			difference_ms = difference_ms / 1000;
			var seconds = Math.floor(difference_ms % 60);
			difference_ms = difference_ms / 60; 
			var minutes = Math.floor(difference_ms % 60);
			difference_ms = difference_ms / 60; 
			var hours = Math.floor(difference_ms % 24);  
			var days = Math.floor(difference_ms / 24);
			
			seconds = (seconds < 10) ? "0" + seconds : seconds;
			minutes = (minutes < 10) ? "0" + minutes : minutes;
			hours = (hours < 10) ? "0" + hours : hours;

			document.getElementById("remain").innerHTML = "남은시간 : " + days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
			setTimeout(auctTime, 1000);
		}else {
			document.getElementById("remain").innerHTML = "경매종료";
		}
	    
	}
	
	auctTime();
</script>
	
</body>
</html>