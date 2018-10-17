<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>상품상세보기</title>
<link rel="stylesheet" href="/resources/css/list.css">
<!-- ajax처리시 권한 스크립트-->
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		 
		$(function() {
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		});
	</script>
	<style>
		.bolck {
			opacity: 0.8;
			filter: grayscale(80%);
		}
	</style>
</head>
<body>
	<div class="container">
		<p>
		<form method="post">
			<security:csrfInput/>
			<div class="form-group row">
				<div class="col-sm-3">
					<div class="input-group">
						<select class="custom-select" name="class_big_cd" id="class_big_cd">
							<option value="" selected="selected">-대분류 선택-</option>
							<c:forEach var="bigcls" items="${bigclass}">
								<c:choose>
									<c:when test="${clsbigcd == ''}">
										<option value="${bigcls.class_big_cd}">${bigcls.class_big_nm}</option>
									</c:when>
									<c:otherwise>
										<option value="${bigcls.class_big_cd}" 
											<c:if test="${bigcls.class_big_cd == clsbigcd}">selected</c:if>
										>${bigcls.class_big_nm}</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<select class="custom-select" name="class_mid_cd" id="class_mid_cd">
							<option value="XX" selected="selected">-중분류 선택-</option>
						</select>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="검색내용을 입력하세요..." id="searchVal" name="searchVal" value="${sVal}">
						<div class="input-group-append">
							<button class="btn btn-secondary" id="searchProduct">검색</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<p>
		
		<div id="products" class="row view-group" style="margin-top: 15px; margin-bottom: 15px;">
			<c:forEach var="list" items="${productList}">
				<div class="item col-xs-3 col-lg-3">
					<div class="thumbnail card" data-src="${list.product_cd}">
						<div class="img-event">
							<c:choose>
								<c:when test="${list.state_cd == '3' }">
									<img class="group list-group-image img-fluid"
										 src="/displayFile.do?fileName=${list.filename_thumb}"
										 onerror="this.src='/resources/images/noimg.gif';"
										 alt="" />
								</c:when>
								<c:otherwise>
									<img class="group list-group-image img-fluid bolck"
										 src="/displayFile.do?fileName=${list.filename_thumb}"
										 onerror="this.src='/resources/images/noimg.gif';"
										 alt="" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class="caption card-body" style="padding: 5px;">
							<ul class="list-group list-group-flush">
    							<li class="list-group-item">
    								<h5 class="group card-title inner list-group-item-heading" style="height: 50px; margin: 0px">
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
									<span style="float: left;">
	                                	<b>입찰:</b> 
	                                     ${list.bid_cnt}명 
									</span>
									<span style="float: right;">
										<b>조회:</b>
										${list.viewcnt}
	                                </span>
								</li>
    							<li class="list-group-item" style="padding:5px;">
    								<span>
										<b>판매자:</b> 
									</span>
									<span class="prodMember_id" style="float: right;">${list.member_id}</span>
    							</li>
    							<li class="list-group-item" style="padding:5px;">
    								<span style="float: left;">
										<b>경매종료:</b> 
									</span>
									<c:choose>
										<c:when test="${list.state_cd == '3' }">
											<span class="auctdate_end" style="float: right;">${list.acutdate_end_str}</span>
										</c:when>
										<c:otherwise>
											<span class="auctdate_end" style="float: right;">${list.state_nm }</span>
										</c:otherwise>
									</c:choose>
									
    							</li>
							</ul>						
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<div id="enters" class='row view-group'></div>
	</div>
	
	<script type="text/javascript">
		$("document").ready(function() {
			var page = 1;
			
			createClsmid("${clsbigcd}", "${clsmidcd}"); // 검색시 중분류 고정시키기.

			$(window).scroll(function() {
				var searchVal = $('#searchVal').val();
				var class_big_cd = $('#class_big_cd').val();
				var class_mid_cd = $('#class_mid_cd').val();

			    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			    	++page;
			
			    	prodListSearch(page, searchVal, class_big_cd, class_mid_cd);
			    }
			});
			
			$('#searchProduct').click(function() {
				var searchVal = $("#searchVal").val(); // 물품명 - 제목
				var class_big_cd = $("#class_big_cd").val(); // 대분류(selectBox)
				var class_mid_cd = $("#class_mid_cd").val(); // 중분류(selectBox)
				
//				location.href="/product/list.do?page=1&searchVal=" + searchVal + "&class_big_cd=" + class_big_cd + "&class_mid_cd=" + class_mid_cd;
				
				prodListSearch(1, searchVal, class_big_cd, class_mid_cd);
			});
			
			$(document).on("click", ".thumbnail", function() {
				var datasrc = $(this).attr("data-src");
				
				location.href="/product/detail.do?product_cd=" + datasrc;
			});
	
			$("select[name='class_big_cd']").change(function(){  // 셀렉트 박스가 체인지 될때 이벤트  - "select[name=classBig]"
				var valBig = $(this).val(); // 현재 선택된 값

				createClsmid(valBig, "XX");
			});
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
			} else {
				$(this).text(obj.state_nm);
			}
		});

		function createClsmid(valBig, valMid){
			if(valBig == "" || valBig == null) {
				$("select[name='class_mid_cd'] option").remove();
				$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
			}
			else {
				$.getJSON("/product/midclass.do/" + valBig, function(data) {
					$("select[name='class_mid_cd'] option").remove();
					$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
					$.each(data, function(i, d) {
						if(d.class_mid_cd == valMid) {
							$("select[name=class_mid_cd]").append('<option value="' + d.class_mid_cd + '" selected>' + d.class_mid_nm + '</option>'); 
						}
						else {
							$("select[name=class_mid_cd]").append('<option value="' + d.class_mid_cd + '">' + d.class_mid_nm + '</option>'); 
						}
					});
				});
			}
		}
		
		function prodListSearch(page, searchVal, class_big_cd, class_mid_cd){
			var senddata = JSON.stringify({
				"searchVal" : searchVal,
				"class_big_cd" : class_big_cd,
			    "class_mid_cd" : class_mid_cd
	    	});
			
	      	$.ajax({
	    	 	async: true,
	    	 	type: "POST",
	    	 	data: senddata,
	    	 	url: "/product/listAjax.do/" + page,
	    	 	dataType: "json",
	    	 	contentType: "application/json; charset=UTF-8",
	    	 	success : function(data) {
	    	 		var str = "";
	    	 		
	    	 		console.log(data.arr);
	    	 		
	    	 		$.each(data.arr, function(index, arr) {
	    	 			str = "";
	    	 			str = str + "<div class='item col-xs-3 col-lg-3'>";
	    	 			str = str + "	<div class='thumbnail card' data-src='" + arr.product_cd + "'>";
	    	 			str = str + "		<div class='img-event'>";
	    	 			if(arr.state_cd == '3') {
	    	 				str = str + "			<img class='group list-group-image img-fluid' src='/displayFile.do?fileName=" + arr.filename_thumb + "' onerror=this.src='/resources/images/noimg.gif;' />";
	    	 			}else {
	    	 				str = str + "			<img class='group list-group-image img-fluid bolck' src='/displayFile.do?fileName=" + arr.filename_thumb + "' onerror=this.src='/resources/images/noimg.gif;' />";
	    	 			}
	    	 			str = str + "		</div>";
	    	 			str = str + "		<div class='caption card-body' style='padding: 5px;'>";
	    	 			str = str + "			<ul class='list-group list-group-flush'>";
	    	 			str = str + "				<li class='list-group-item'>";
	    	 			str = str + "					<h5 class='group card-title inner list-group-item-heading' style='height: 50px; margin: 0px'>" + arr.product_nm + "</h5>"
	    	 			if(arr.bid_max_money == 0) {
	    	 				str = str + "					<h5 class='group card-title inner list-group-item-heading' style='color: #4286f4; text-align: center; margin: 0px'>" +arr.money_first + "원</h5>"
	    	 			}else {
	    	 				str = str + "					<h5 class='group card-title inner list-group-item-heading' style='color: #4286f4; text-align: center; margin: 0px'>" +arr.bid_max_money + "원</h5>"
	    	 			}
	    	 			str = str + "				</li>"
	    	 			str = str + "				<li class='list-group-item' style='padding:5px;'>";
						str = str + "					<span style='float: left;'>";
                        str = str + "						<b>입찰:</b>";
                        str = str + arr.bid_cnt;
                        str = str + "					</span>";
                        str = str + "					<span style='float: right;'>";
                        str = str + "						<b>조회:</b>";
                        str = str + arr.viewcnt;
                    	str = str + "					</span>";
						str = str + "				</li>";
						str = str + "				<li class='list-group-item' style='padding:5px;'>";
						str = str + "					<span>";
						str = str + "						<b>판매자:</b>";
						str = str + "					</span>";
						str = str + "					<span class='prodMember_id' style='float: right;'>" + idCov(arr.member_id) + "</span>";
						str = str + "				</li>";
	    	 			str = str + "				<li class='list-group-item' style='padding:5px;'>";
						str = str + "					<span style='float: left;'>";
						str = str + "						<b>경매종료:</b>";
						str = str + "					</span>";
						if(arr.state_cd == '3') {
							str = str + "					<span class='auctdate_end' style='float: right;'>" + arr.acutdate_end_str + "</span>";
						}else {
							str = str + "					<span class='auctdate_end' style='float: right;'>" + arr.state_nm + "</span>";
						}
						str = str + "				</li>";
						str = str + "			</ul>";				
						str = str + "		</div>"
						str = str + "	</div>"
						str = str + "</div>";
	    	 	
	    	 			$("#enters").append(str);
					});

				}, 
				error: function(error) {
					console.log("error : " + error);
				}
	      	});
		}
	</script>
</body>
</html>