<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

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
	<!-- 시큐리티 사용자ID 가져오기 -->
	<div>
		<security:authentication property="principal" var="user"/>
		<c:if test="${user != 'anonymousUser'}">
			<security:authentication property="principal.username" var="userid"/>
		</c:if>
	</div>

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
							<td style="text-align: center;">
								<c:if test="${userid != null}">
									<button type="button" class="btn btn-outline-dark btn-sm" name="bidCnt" id="bidCnt">경매기록보기</button>
								</c:if>
							</td>
						</tr>
						<tr>
							<th class="detailTitle">배송정보</th>
							<td colspan="2">${deli.deli_div_nm}</td>
						</tr>
						<tr>
							<th class="detailTitle">판매자정보</th>
							<td colspan="2"><!-- ${prod.member_id} -->
								<input type="text" style="border: 0;" id ="prodMember_id" name="prodMember_id" value="" readonly>
							</td> 
						</tr>
						
						<tr>
							<td colspan="3" style="vertical-align: middle; text-align: center;">
								<c:if test="${userid != null}">
									<c:if test="${prod.state_cd == '3'}">
										<button type="button" class="btn btn-primary" href="#none" onclick="" >입찰하기</button>
									</c:if>
								</c:if>
							</td>
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
						
						<c:if test="${userid != null}">
							<c:if test="${userid != prod.member_id}">
								<button class="btn btn-primary" style="float: right;" id="btnQnaModal">문의하기</button>
							</c:if>
						</c:if>
						
						<table id="enters" class="table table-striped table-hover">
						    <thead>
						        <tr>
						            <th style="width: 8%; text-align: center;">번호</th>
						            <th style="width: 35%; text-align: center;">제목</th>
						            <th style="width: 20%; text-align: center;">작성자</th>
						            <th style="width: 20%; text-align: center;">등록일시</th>
						            <th style="width: 17%; text-align: center;"></th>
						        </tr>
						    </thead>
						    
							<c:forEach var="qlist" items="${qnaList}">
							    <tr data-toggle="collapse" data-target="#data_${qlist.qna_idx}">
							    	<td style="text-align: center;">
							    		${qlist.rowcnt}
							    		<input type="hidden" style="display: none;" id='qna${qlist.qna_idx}"' value="${qlist.qna_idx}">
							    	</td>
							    	<td style="text-align: center;">
							    		<a  id="qtitle${qlist.qna_idx}">${qlist.title}</a>
							    	</td>
							    	<td id="memberid${qlist.qna_idx}" style="text-align: center;"><a>${qlist.member_id}</a></td>
							    	<td style="text-align: center;"><fmt:formatDate value="${qlist.regdate}" pattern="yyyy-MM-dd HH:mm"/></td>
							    	<td  style="text-align: center;">
	    								<c:if test="${userid != null}">
	    									<c:if test="${userid == prod.member_id}">
	    										<c:if test="${qlist.qna_reply == ''}">
								    				<a href="#"><button id="replyBtn${qlist.qna_idx}" class="btn btn-sm btn-primary reply">답변</button></a>
								    			</c:if>
								    		</c:if>
								    		
								    		<c:if test="${userid == qlist.member_id}">
								    			<a href="#"><button id="delBtn${qlist.qna_idx}" class="btn btn-sm btn-danger del">삭제</button></a>
								    		</c:if>
										</c:if>
							    	</td>
							    </tr>
							    <tr class="collapse" id="data_${qlist.qna_idx}">
							    	<td colspan="5">
							    		<label class="form-control" style="border: 0px; background: transparent;" id="qcontent${qlist.qna_idx}">${qlist.content}</label>
								    	<c:if test="${qlist.qna_reply != ''}">
								    		<hr><input type="text" style="border: 0px;" value="${qlist.qna_reply}" readonly>
									    </c:if>
							    	</td>
							    </tr>
							</c:forEach>
							
							<!-- 페이징 시작 -->
							<thead>
						 		<tr align="center">
									<td colspan="5">
									<c:set value="1" var="PageNum" />
									<c:if test="PageNum != 1"> <!-- [맨앞] 출력 여부 - [1]이면 출력하지 않기. --> iPageNum != 1
										<a name="pagecount" qna-page-no="1" href="javascript:;">[처음]</a>
									</c:if>
									
									<!-- // [이전] 출력 여부 - [11]부터 [이전]을 붙여줘야 하며 이동시 10씩 빼줘야 함. -->
									<c:if test="${iStartPage > qnaPageCnt}">
										<a name="pagecount" qna-page-no="${iStartPage-qnaPageCnt}" href="javascript:;">[이전]</a>
									</c:if>
									
									<!-- // 페이지 번호 - iStartPage : 1 / iEndPage : 10 ==> [1][2] ~ [9][10] -->
									<c:forEach var="i" begin="${iStartPage}" end="${iEndPage}" step="1" >
										<c:choose>
											<c:when test="${PageNum == i}"><font style='color:red;'>[${i}]</font></c:when>
											<c:otherwise><a name="pagecount" qna-page-no="${i}" href="javascript:;">[${i}]</a></c:otherwise>
										</c:choose>
									</c:forEach>
						
									<!-- // [다음] 출력 여부 - 최종페이지가 아닌 경우 [다음]을 붙여줘야 하며 이동시 10씩 더해줘야 함. -->
									<c:if test="${iEndPage < iPageTotalNum}">
										<a name="pagecount" qna-page-no="${iStartPage+qnaPageCnt}" href="javascript:;">[다음]</a>
									</c:if>
									
									<!-- // [맨뒤] 출력 여부 - 최대값이면 출력하지 않기. -->
									<c:if test="${PageNum != iPageTotalNum && iPageTotalNum != 0}">
										<a name="pagecount" qna-page-no="${iPageTotalNum}" href="javascript:;">[맨끝]</a>
									</c:if>
									</td>
								</tr>
							</thead>
							<!-- 페이징 끝 -->
						</table>
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
	
	<!-- 모달 창(문의하기) -->	
	<div class="modal fade" id="qModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="qmodaltitle">상품문의</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="qclose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="qnaform">
						<input type="hidden" class="form-control" id="qproduct_cd" name="product_cd" value="${prod.product_cd}">
						<input type="hidden" class="form-control" id="qqna_div" name="qna_div" value="1">
						<input type="hidden" class="form-control" id="qmember_id" name="member_id" value="${userid}">
					
						<div class="row">
							<div class="col-md">
								<input type="text" class="form-control" name="title" id="qtitle">
							</div>
						</div>
						<div class="row">
							<div class="col-md">
								<textarea class="form-control" cols="3" name="content" id="qcontent"></textarea>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md">
								<span class="form-control" style="border: 0;" name="msg" id="qmsg" value=""></span>
							</div>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="qnaregBtn">문의등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 모달 창(답변하기) -->	
	<div class="modal fade" id="aModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="amodaltitle">상품문의 답변</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="aclose">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="replyform">
						<input type="hidden" class="form-control" id="aproduct_cd" name="product_cd" value="${prod.product_cd}">
						<input type="hidden" class="form-control" id="aqna_idx" name="qna_idx" value="">
						<input type="hidden" class="form-control" id="aqna_div" name="qna_div" value="2">
						<input type="hidden" class="form-control" id="amember_id" name="member_id" value="${prod.member_id}">						
					
						<div class="row">
							<div class="col-md">
								<input type="text" class="form-control" name="title" id="atitle" value="" readonly>
							</div>
						</div>
						<div class="row">
							<div class="col-md">
								<input class="form-control" cols="5" name="acontent_bf" id="acontent_bf" value="" readonly>
							</div>
						</div>
						<div class="row">
							<div class="col-md">
								<textarea class="form-control" cols="3" name="content" id="acontent"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal" id="qnareplyBtn">답변등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
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
	
	$(function(){
		/*======================================================================================*/
		// ajax처리시 권한 스크립트
		/*======================================================================================*/
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    /*======================================================================================*/
      	var product_cd = "${prod.product_cd}";
		var userid = "${userid}";
		var memberId_sale = "${prod.member_id}";
		
		$("#prodMember_id").ready(function() {
			var prodMember_id = "${prod.member_id}";
			var sCov = idCov(prodMember_id);
			
			$("#prodMember_id").val(sCov);
		});
		
		function idCov(memberid){
			var covNum = memberid.indexOf("@");
			var sCov = "";
			
			for(var i=1; i<=memberid.length; i++) {
				if(i > 2 && i <= covNum-1) {
					sCov = sCov + "*"; 
				}
				else {
					sCov = sCov + memberid.substring(i-1, i);
				}
			}
			
			return sCov;
		}
	    
		$("#btnQnaModal").on("click", function(){
            //$('#message').find('h4').text("상품문의");
            $('#qModal').css("zIndex", "999999");
        	$('#qModal').modal('show');
		});
		
		$("#qclose").on("click", function(){
			$("#qtitle").val("");
			$("#qcontent").val("");
		});
		
		$("#aclose").on("click", function(){
			$("#atitle").val("");
			$("#acontent_bf").val("");
			$("#acontent").val("");
		});
		
		$("#qnaregBtn").on("click", function(){
			var qqna_div = $("#qqna_div").val();
			var qmember_id = $("#qmember_id").val(); // 작성자id(로그인한 사람) - //var amember_id = $("#amember_id").val(); // 판매자id
			var qtitle = $("#qtitle").val();
			var qcontent = $("#qcontent").val();
			
			if(qtitle == null || qtitle.length == 0) {
				$("#qmsg").html("제목을 넣어주세요.");
				$("#qtitle").focus();
				
				return false;
			}
			
			if(qcontent == null || qcontent.length == 0) {
				$("#qmsg").html("내용을 넣어주세요.");
				$("#qcontent").focus();
				
				return false;
			}

			var form_data = $("#qnaform").serialize();
			
			$.ajax({
				async: true,
				type: 'POST',
				url : "/product/qnaReg.do",
				data: form_data,
				success : function(data) {
					//console.log(data);
						qnaListCall(1);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
		
		$(document).on("click", '.reply', function(event){
			var nowId = $(this).attr("id");
			var noIdx = nowId.replace(/[^0-9]/g,"");
			
			if(noIdx == null || noIdx.length == 0) {
				return false;
			}

			var nowtitle = $('#qtitle'+noIdx).text();
			var nowcontent = $('#qcontent'+noIdx).text();
			
			$("#aqna_idx").val(noIdx); // 문의idx 전달.
			$("#atitle").val("[답변] " + nowtitle);// 문의 제목 자동처리[답변] - 읽기전용
			$("#acontent_bf").val("[문의] " + nowcontent);// 문의 내용 출력 - 읽기전용

            $('#aModal').css("zIndex", "999999");
        	$('#aModal').modal('show');
		});
		
		// 문의 삭제 처리
		$(document).on("click", ".del", function(){
			var nowId = $(this).attr("id");
			var qna_idx = nowId.replace(/[^0-9]/g,"");
			
			$.ajax({
				async: true,
				type: 'POST',
				url : "/product/qnaDel.do/" + qna_idx,
				success : function(data) {
						qnaListCall(1);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
		
		// 문의 답변 등록 처리
		$("#qnareplyBtn").on("click", function(){
			var aqna_idx = $("#aqna_idx").val(); //qna_idx
			var aqna_div = '2';
			var amember_id = $("#amember_id").val(); // 작성자id(로그인한 사람) - //var amember_id = $("#amember_id").val(); // 판매자id
			var atitle = $("#atitle").val();
			var acontent = $("#acontent").val();
			
			if(acontent == null || acontent.length == 0) {
				$("#qmsg").html("답변을 넣어주세요.");
				$("#acontent").focus();
				
				return false;
			}

			var form_data = $("#replyform").serialize();
			
			$.ajax({
				async: true,
				type: 'POST',
				url : "/product/qnaReply.do",
				data: form_data,
				success : function(data) {
						qnaListCall(1);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
		
 		// name="pagecount" 클릭이벤트 - 페이징 처리용.
		$(document).on("click", "a[name='pagecount']", function(){
			var pageVal = $(this).attr("qna-page-no");
			qnaListCall(pageVal);
		});
		
		function qnaListCall(pagenum){
			$.ajax({
				async: true,
				type: 'POST',
				url : "/product/prodqna.do/" + product_cd + "/" + pagenum,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
	    	 		var str = "";
	    	 		
	    	 		$("#enters").empty();
	    	 		
	    	 		str = str + "<thead>";
	    	 		str = str + "	<tr>";
	    	 		str = str + "		<th style='width: 8%; text-align: center;'>번호</th>";
	    	 		str = str + "		<th style='width: 35%; text-align: center;'>제목</th>";
	    	 		str = str + "		<th style='width: 20%; text-align: center;'>작성자</th>";
	    	 		str = str + "		<th style='width: 20%; text-align: center;'>등록일시</th>";
	    	 		str = str + "		<th style='width: 17%; text-align: center;'></th>";
	    	 		str = str + "	</tr>";
	    	 		str = str + "</thead>";
	    	 		
	    	 		$.each(data.arr, function(index, arr) {
	    	 			str = str + "<tr data-toggle='collapse' data-target='#data_" + arr.qna_idx + "'>";
	    	 			str = str + "	<td style='text-align: center;'> " + arr.rowcnt;
	    	 			str = str + "		<input type='hidden' style='display: none;' id='qna" + arr.qna_idx + "' value='" + arr.qna_idx + "'>";
	    	 			str = str + "	</td>";
	    	 			str = str + "	<td style='text-align: center;'><a id='qtitle" + arr.qna_idx + "'>" + arr.title + "</a></td>";
	    	 			
	    	 			//var qlist_member_id_val = idCov(arr.member_id); // 암호화 미적용함.
	    	 			str = str + "	<td style='text-align: center;'><a>" + arr.member_id + "</a></td>";
	    	 			
	    	 			var date = new Date(arr.regdate);
	    	 		    var y = date.getFullYear();
	    	 		    var M = date.getMonth()+1;
	    	 		    var d = date.getDate();
	    	 		    var h = date.getHours(); // 0 - 23
	    	 		    var m = date.getMinutes(); // 0 - 59
	    	 		    
	    	 		    M = (M < 10) ? "0" + M : M;
	    	 		    d = (d < 10) ? "0" + d : d;
	    	 		    h = (h < 10) ? "0" + h : h;
	    	 		    m = (m < 10) ? "0" + m : m;
	    	 			
	    	 		    var regdate = y + '-' + M + '-' + d + ' ' + h + ':' + m;
	    	 			
	    	 			str = str + "	<td style='text-align: center;'>" + regdate + "</td>";
	    	 			str = str + "	<td style='text-align: center;'>";

	    	 			if(userid != null) {
		    	 			if(userid == memberId_sale && arr.qna_reply == '') {
		    	 				str = str + "		<a href='#'><button id='replyBtn" + arr.qna_idx + "' class='btn btn-sm btn-primary reply'>답변</button></a>";
	    	 				}
		    	 			
		    	 			if(userid == arr.member_id) {
		    	 				str = str + "		<a href='#'><button id='delBtn" + arr.qna_idx + "' class='btn btn-sm btn-danger del'>삭제</button></a>";
		    	 			}
    	 				}
	    	 			
	    	 			str = str + "	</td>";
	    	 			str = str + "</tr>";
	    	 			str = str + "<tr class='collapse' id='data_" + arr.qna_idx + "'>";
	    	 			str = str + "	<td colspan='5'>";
	    	 			str = str + arr.content;
	    	 			
	    	 			if(arr.qna_reply != '') {
	    	 				str = str + "		<hr>" + arr.qna_reply;
	    	 			}
	    	 			
	    	 			str = str + "	</td>";
	    	 			str = str + "</tr>";
					});
	    	 		
	    	 		// 페이징 처리
	    	 		str = str + "<thead>";
	    	 		str = str + "	<tr align='center'>";
	    	 		str = str + "		<td colspan='5'>";

	    	 		// [맨앞] 출력 여부 - [1]이면 출력하지 않기. - iPageNum
	    	 		if(pagenum != 1) {
	    	 			str = str + "		<a name='pagecount' qna-page-no='1' href='javascript:;'>[처음]</a>";
	    	 		}

	    	 		// [이전] 출력 여부 - [11]부터 [이전]을 붙여줘야 하며 이동시 10씩 빼줘야 함.
	    	 		if("${iStartPage}" > "${qnaPageCnt}") {
	    	 			str = str + "		<a name='pagecount' qna-page-no='" + "${iStartPage - qnaPageCnt}" + "' href='javascript:;'>[이전]</a>";
	    	 		}
	    	 		
	    	 		// 페이지 번호 - iStartPage : 1 / iEndPage : 10 ==> [1][2] ~ [9][10]
	    	 		for(var i = "${iStartPage}"; i<="${iEndPage}"; i++) {
	    	 			if(pagenum == i) {
	    	 				str = str + "			<font style='color:red;'>[" + i + "]</font>";
	    	 			}
	    	 			else {
	    	    	 		str = str + "			<a name='pagecount' qna-page-no='" + i + "' href='javascript:;'>[" + i + "]</a>";
	    	 			}
	    	 		}

	    	 		// [다음] 출력 여부 - 최종페이지가 아닌 경우 [다음]을 붙여줘야 하며 이동시 10씩 더해줘야 함.
	    	 		if("${iEndPage}" < "${iPageTotalNum}") {
	    	 			str = str + "		<a name='pagecount' qna-page-no='" + "${iStartPage + qnaPageCnt}" + "' href='javascript:;'>[다음]</a>";
	    	 		}
	    	 			
	    	 		// [맨뒤] 출력 여부 - 최대값이면 출력하지 않기.
	    	 		if(pagenum != "${iPageTotalNum}" && "${iPageTotalNum}" != 0) {
	    	 			str = str + "		<a name='pagecount' qna-page-no='" + "${iPageTotalNum}" + "' href='javascript:;'>[맨끝]</a>";
	    	 		}
	    	 		str = str + "		</td>";
	    	 		str = str + "	</tr>";
	    	 		str = str + "<thead>";
	    	 		
	    	 		$("#enters").append(str);
				},
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		}
	});
	
/*  		$("#enters").ready(function(){
		//var qlist = "${qnaList.get(0).member_id}";
	//var qlist_len = "${fn:length(qnaList)}"; 
	
		var str = "";
		
		$("#enters").html("");
		
		str = str + "<thead>";
		str = str + "	<tr>";
		str = str + "		<th style='width: 8%; text-align: center;'>번호</th>";
		str = str + "		<th style='width: 35%; text-align: center;'>제목</th>";
		str = str + "		<th style='width: 20%; text-align: center;'>작성자</th>";
		str = str + "		<th style='width: 20%; text-align: center;'>등록일시</th>";
		str = str + "		<th style='width: 17%; text-align: center;'></th>";
		str = str + "	</tr>";
		str = str + "</thead>";
		
		var qnalist_len = "${fn:length(qnaList)}";
		
		if(qnalist_len > 0) {
		<c:forEach var="qlist" items="${qnaList}">
			console.log("${qlist.qna_idx}");
			console.log("${qlist.member_id}");
			
			str = str + "<tr data-toggle='collapse' data-target='#data_" + "${qlist.qna_idx}" + "'>";
 			str = str + "	<td style='text-align: center;'> " + "${qlist.rowcnt}";
 			str = str + "		<input type='hidden' style='display: none;' id='qna" + "${qlist.qna_idx}" + "' value='" + "${qlist.qna_idx}" + "'>";
 			str = str + "	</td>";
 			str = str + "	<td style='text-align: center;'><a>" + "${qlist.title}" + "</a></td>";
 			str = str + "	<td style='text-align: center;'><a>" + "${qlist.member_id}" + "</a></td>";
 			
 			var date_reg = new Date("${qlist.regdate}");
 			console.log("${qlist.regdate}");

 			
 		    var y = date_reg.getFullYear();
 		    var M = date_reg.getMonth()+1;
 		    var d = date_reg.getDate();
 		    var h = date_reg.getHours(); // 0 - 23
 		    var m = date_reg.getMinutes(); // 0 - 59
 		    
 		    M = (M < 10) ? "0" + M : M;
 		    d = (d < 10) ? "0" + d : d;
 		    h = (h < 10) ? "0" + h : h;
 		    m = (m < 10) ? "0" + m : m;
 			
 		    var regdate = y + '-' + M + '-' + d + ' ' + h + ':' + m;
 			
 			str = str + "	<td style='text-align: center;'>" + regdate + "</td>";
 			str = str + "	<td style='text-align: center;'>";

 			var qna_reply = "${qlist.qna_reply}";
 			
 			if(userid != null) {
	 			if(userid == memberId_sale && qna_reply == '') { 
	 				str = str + "		<a href='#'><button id='replyBtn" + "${qlist.qna_idx}" + "' class='btn btn-sm btn-primary reply'>답변</button></a>";
 				}
	 			
	 			if(userid == "${qlist.member_id}") {
	 				str = str + "		<a href='#'><button id='delBtn" + "${qlist.qna_idx}" + "' class='btn btn-sm btn-danger del'>삭제</button></a>";
	 			}
				}
 			
 			str = str + "	</td>";
 			str = str + "</tr>";
 			str = str + "<tr class='collapse' id='data_" + "${qlist.qna_idx}" + "'>";
 			str = str + "	<td colspan='5'>";
 			str = str + "${qlist.content}";
 			
 			if(qna_reply != '') {
 				str = str + "		<hr>" + qna_reply;
 			}
 			
 			str = str + "	</td>";
 			str = str + "</tr>";
		</c:forEach>
		}
	
		$("#enters").append(str);
}); */
	
</script>
	
</body>
</html>