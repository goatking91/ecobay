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
</head>
<body>
	<div class="container">
		<p>
		<form method="post">
			<security:csrfInput/>
			<div class="form-group row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="검색내용을 입력하세요..." id="searchVal" name="searchVal" value="${sVal}">
						<div class="input-group-append">
							<button class="btn btn-secondary" id="searchProduct">검색</button>
						</div>
					</div>
				</div>
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
			</div>
		</form>
		<p>
		<div id="products" class="row view-group">
			<c:forEach var="list" items="${productList}">
				<div class="item col-xs-4 col-lg-4">
					<div class="thumbnail card" data-src="${list.product_cd}">
						<div class="img-event">
							<img class="group list-group-image img-fluid"
								 src="/displayFile.do?fileName=${list.filename_thumb}"
								 onerror="this.src='/resources/images/noimg.gif';" />
						</div>
						<div class="caption card-body">
							<h4 class="group card-title inner list-group-item-heading">
								${list.product_nm}</h4>
							<!-- <p class="group inner list-group-item-text">${list.content}</p>  -->
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<p class="lead">${list.bid_cnt}명/
										<c:choose>
											<c:when test="${list.bid_max_money == '0'}">${list.money_first}원</c:when>
											<c:otherwise>${list.bid_max_money}원</c:otherwise>
										</c:choose>
									</p>
								</div>
								<div class="col-xs-12 col-md-6">
									<c:choose>
										<c:when test="${list.state_cd != '3'}">
											<label>${list.acutdate_end_str}</label>
										</c:when>
										<c:otherwise>
											<label>경매진행중</label>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
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
	    	 			str = str + "<div class='item col-xs-4 col-lg-4'>";
	    	 			str = str + "	<div class='thumbnail card' data-src='" + arr.product_cd + "'>";
	    	 			str = str + "		<div class='img-event'>";
	    	 			str = str + "			<img class='group list-group-image img-fluid' src='/displayFile.do?fileName=" + arr.filename_thumb + "' onerror=this.src='/resources/images/noimg.gif;' />";
	    	 			str = str + "		</div>";
	    	 			str = str + "		<div class='caption card-body'>";
	    	 			str = str + "			<h4 class='group card-title inner list-group-item-heading'>" + arr.product_nm + "</h4>";
	    	 			//str = str + "			<p class='group inner list-group-item-text'>" + arr.content + "</p>";
	    	 			str = str + "			<div class='row'>";
	    	 			str = str + "				<div class='col-xs-12 col-md-6'>";
	    	 			str = str + "					<p class='lead'> " + arr.bid_cnt + "명/";
	    	 			
	    	 			if(arr.bid_max_money == 0) {
	    	 				str = str + arr.money_first + "원</p>";
	    	 			}
	    	 			else {
	    	 				str = str + arr.bid_max_money + "원</p>";
	    	 			}

	    	 			str = str + "				</div>";
	    	 			str = str + "					<div class='col-xs-12 col-md-6'>";
	    	 			
	    	 			if(arr.state_cd != '3') {
	    	 			    str = str + "					<label>" + arr.acutdate_end_str + "</label>";
	    	 			}
	    	 			else {
	    	 				str = str + "					<label>경매진행중</label>";
	    	 			}
	    	 			
	    	 			str = str + "					</div>";
	    	 			str = str + "				</div>";
	    	 			str = str + "			</div>";
	    	 			str = str + "		</div>";
	    	 			str = str + "	</div>";
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