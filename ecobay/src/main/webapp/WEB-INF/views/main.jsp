<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<style>
.carousel-inner>.carousel-item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 400px;
	/* max-height: 400px; */
}
</style>
<div>
<security:csrfInput/>
	<div id="carouselIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselIndicators" data-slide-to="1"></li>
			<li data-target="#carouselIndicators" data-slide-to="2"></li>
			<li data-target="#carouselIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<a href="product/detail.do?product_cd=DGZZ1810260001"><img class="d-block w-100" src="/resources/images/main_cal6_1.jpg"
					alt="첫번째 슬라이드"></a>
			</div>
			<div class="carousel-item">
				<a href="product/detail.do?product_cd=LVLT1810290001"><img class="d-block w-100" src="/resources/images/main_cal7_1.jpg"
					alt="두번째 슬라이드"></a>
			</div>
			<div class="carousel-item">
				<a href="product/detail.do?product_cd=FSCL1810240006"><img class="d-block w-100" src="/resources/images/main_cal9.jpg"
					alt="세번째 슬라이드"></a>
			</div>
			<div class="carousel-item">
				<a href="product/detail.do?product_cd=LGLI1810260001"><img class="d-block w-100" src="/resources/images/main_cal10.jpg"
					alt="네번째 슬라이드"></a>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">이전</span>
		</a> <a class="carousel-control-next" href="#carouselIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">다음</span>
		</a>
	</div>
</div>
<div class="container">
	<div align="center">
		<a class="icon" href="#"><img src="/resources/images/icons/fashion_ic.png" data-src="FS"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/living_ic.png" data-src="LV"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/homeItem_ic.png" data-src="LG"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/digital_ic.png" data-src="DG"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/culture_ic.png" data-src="CT"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/sports_ic.png" data-src="SP"></a>
		<a class="icon" href="#"><img src="/resources/images/icons/collection_ic.png" data-src="CA"></a>
	</div>
</div>
<p>
	<div class="container">
		<div class="row" style="margin-top: 15px; margin-bottom: 15px;">
			<c:forEach var="list" items="${list1}">
				<div class="item col-xs-3 col-lg-3">
					<div class="thumbnail card" data-src="${list.product_cd}">
						<div class="img-event">
							<img class="group list-group-image img-fluid"
								 src="/displayFile.do?fileName=${list.filename_thumb}"
								 onerror="this.src='/resources/images/noimg.gif';"
								 alt="" />
						</div>
						<div class="caption card-body" style="padding: 5px;">
							<ul class="list-group list-group-flush">
    							<li class="list-group-item" style="padding:5px;">
    								<h5 class="group card-title inner list-group-item-heading" style="height: 75px; margin: 0px">
										${list.product_nm}
									</h5>
									<h5 class="group card-title inner list-group-item-heading" style="color: #4286f4; text-align: center; margin: 0px">
									<c:choose>
                                		<c:when test="${list.bid_max_money == '0'}">${list.money_first}원</c:when>
                                		<c:otherwise>${list.bid_max_money}원</c:otherwise>
                            		</c:choose>
                            		</h5>
								</li>
    							<li class="list-group-item" style="padding:5px;">
									<span class="h6" style="float: left;">
	                                	<b>입찰:</b> 
	                                    ${list.bid_cnt}명 
									</span>
									<span class="h6" style="float: right;">
										<b>조회:</b>
										${list.viewcnt}
	                                </span>
								</li>
    							<li class="list-group-item" style="padding:5px;">
    								<h6>
										<b>판매자:</b>
									</h6>
									<h6 class="prodMember_id" style="float: right;">${list.member_id}</h6>
    							</li>
    							<li class="list-group-item" style="padding:5px;">
    								<span class="h6" style="float: left;">
										<b>경매종료:</b>
									</span>
									<span class="auctdate_end h6" style="float: right;">${list.acutdate_end_str}</span>
    							</li>
							</ul>						
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="row" style="margin-top: 15px; margin-bottom: 15px;">
			<c:forEach var="list" items="${list2}">
				<div class="item col-xs-3 col-lg-3">
					<div class="thumbnail card" data-src="${list.product_cd}">
						<div class="img-event">
							<img class="group list-group-image img-fluid"
								 src="/displayFile.do?fileName=${list.filename_thumb}"
								 onerror="this.src='/resources/images/noimg.gif';"
								 alt="" />
						</div>
						<div class="caption card-body" style="padding: 5px;">
							<ul class="list-group list-group-flush">
    							<li class="list-group-item" style="padding:5px;">
    								<h5 class="group card-title inner list-group-item-heading" style="height: 75px; margin: 0px">
										${list.product_nm}
									</h5>
									<h5 class="group card-title inner list-group-item-heading" style="color: #4286f4; text-align: center; margin: 0px">
									<c:choose>
                                		<c:when test="${list.bid_max_money == '0'}">${list.money_first}원</c:when>
                                		<c:otherwise>${list.bid_max_money}원</c:otherwise>
                            		</c:choose>
                            		</h5>
								</li>
    							<li class="list-group-item" style="padding:5px;">
									<span class="h6" style="float: left;">
	                                	<b>입찰:</b>
	                                     ${list.bid_cnt}명 
									</span>
									<span class="h6" style="float: right;">
										<b>조회:</b>
										${list.viewcnt}
	                                </span>
								</li>
    							<li class="list-group-item" style="padding:5px;">
    								<h6>
										<b>판매자:</b>
									</h6>
									<h6 class="prodMember_id" style="float: right;">${list.member_id}</h6>
    							</li>
    							<li class="list-group-item" style="padding:5px;">
    								<span class="h6" style="float: left;">
										<b>경매종료:</b>
									</span>
									<span class="auctdate_end h6" style="float: right;">${list.acutdate_end_str}</span>
    							</li>
							</ul>						
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
<script type="text/javascript">
	$(function() {
		$(".thumbnail").on("click", function() {
			var datasrc = $(this).attr("data-src");
			
			location.href="/product/detail.do?product_cd=" + datasrc;
		});
		
		$(".icon").on("click", function() {
			var datasrc = $(this).children().attr("data-src");
			var form = document.createElement("form");
			
			var input1 = document.createElement("input");
			var input2 = document.createElement("input");
			var seq = document.createElement("input");
				
			var seqVal = $("input[name='_csrf']").val();
			
	        form.action = "/product/list.do";
	        form.method = "post";
            
            input1.setAttribute("type", "hidden");
            input1.setAttribute('name', "class_big_cd");
            input1.setAttribute("value", datasrc);
            
            input2.setAttribute("type", "hidden");
            input2.setAttribute('name', "class_mid_cd");
            input2.setAttribute("value", "XX");
            
            seq.setAttribute("type", "hidden");
            seq.setAttribute('name', "_csrf");
            seq.setAttribute("value", seqVal);
            
            form.appendChild(input1);
            form.appendChild(input2);
            form.appendChild(seq);
            
	        document.body.appendChild(form);
	        
	        form.submit();
		});
		
		// 판매자정보 *처리 하기
		$(".prodMember_id").each(function(i, obj) {
			var prodMember_id = $(this).text();
			var sCov = idCov(prodMember_id);
			$(this).text(sCov);
		    
		});
		
		// *처리 함수
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
		
		// 시간 표시
		$(".auctdate_end").each(function(i, obj) {
			var endDateTime = new Date($(this).text()+":00").getTime();
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
				if(days == 0) {
					$(this).text(hours + "시간 " + minutes + "분");
				}else if (days == 0 && hours == 0) {
					$(this).text(minutes + "분");
				}else {
					$(this).text(days + "일 " + hours + "시간");
				}	
			}
		});
		
	});
</script>