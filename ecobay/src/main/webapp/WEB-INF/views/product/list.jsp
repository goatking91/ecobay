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
		<form>
			<div class="form-group row">
				<div class="col-sm-6">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="검색내용을 입력하세요...">
						<div class="input-group-append">
							<button class="btn btn-secondary">검색</button>
						</div>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="input-group">
						<select class="custom-select" name="class_big_cd" id="class_big_cd">
							<option value="" selected="selected">-대분류 선택-</option>
							<c:forEach var="bigcls" items="${bigclass}">
								<option value="${bigcls.class_big_cd}">${bigcls.class_big_nm}</option>
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
								 src="/product/displayFile.do?fileName=${list.filename_thumb}"
								 onerror="this.src='/resources/images/noimg.gif';"
								 alt="" />
						</div>
						<div class="caption card-body">
							<h4 class="group card-title inner list-group-item-heading">
								${list.product_nm}</h4>
							<p class="group inner list-group-item-text">${list.content}</p>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<p class="lead"> ${list.bid_cnt}명 / ${list.bid_max_money}원</p>
								</div>
								<div class="col-xs-12 col-md-6">
									<c:if test="${list.state_cd != '3'}">
										<label>${list.acutdate_end_str}</label>
									</c:if>
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
			
			$(window).scroll(function() {
			    if ($(window).scrollTop() == $(document).height() - $(window).height()) {
			    	++page;
			      
			      	$.ajax({
			    	 	async: true,
			    	 	type: "POST",
			    	 	data: page,
			    	 	url: "/product/list.do/" + page,
			    	 	dataType: "json",
			    	 	contentType: "application/json, charset=UTF-8",
			    	 	success : function(data) {
			    	 		var str = "";
			    	 		$.each(data.arr, function(index, arr) {
			    	 			str = str + "<div class='item col-xs-4 col-lg-4'>";
			    	 			str = str + "        <div class='thumbnail card' data-src='"+arr.product_cd+"'>";
			    	 			str = str + "            <div class='img-event'>";
			    	 			str = str + "                <img class='group list-group-image img-fluid' src='/product/displayFile.do?fileName="+arr.filename_thumb+"' onerror=this.src='/resources/images/noimg.gif;' alt=''/>";
			    	 			str = str + "            </div>";
			    	 			str = str + "            <div class='caption card-body'>";
			    	 			str = str + "                <h4 class='group card-title inner list-group-item-heading'>";
			    	 			str = str + "                    "+arr.product_nm+"</h4>";
			    	 			str = str + "                <p class='group inner list-group-item-text'>"+arr.content+"</p>";
			    	 			str = str + "                <div class='row'>";
			    	 			str = str + "                    <div class='col-xs-12 col-md-6'>";
			    	 			str = str + "                        <p class='lead'> "+arr.bid_cnt+"명 / "+arr.bid_max_money+"원</p>";
			    	 			str = str + "                    </div>";
			    	 			str = str + "                    <div class='col-xs-12 col-md-6'>";
			    	 			if(arr.acutdate_start_str != '3') {
			    	 			    str = str + "                        <label>"+arr.acutdate_start_str+"</label>";
			    	 			}	
			    	 			str = str + "                    </div>";
			    	 			str = str + "                </div>";
			    	 			str = str + "            </div>";
			    	 			str = str + "        </div>";
			    	 			str = str + "    </div>";
			    	 			str = str + "</div>";
			    	 			$("#enters").append(str);
							});
			    	 		
						}, 
						error: function(error) {
							console.log("error : " + error);
						}
			      	});
			    }
			});
		});
		
		$(".thumbnail").on("click", function() {
			var datasrc = $(this).attr("data-src");
			
			location.href="/product/detail.do?product_cd=" + datasrc;
		})
	
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
</body>
</html>