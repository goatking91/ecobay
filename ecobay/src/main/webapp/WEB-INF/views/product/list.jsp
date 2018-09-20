<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>상품상세보기</title>
<link rel="stylesheet" href="/resources/css/list.css">
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
					<div class="thumbnail card">
						<div class="img-event">
							<img class="group list-group-image img-fluid"
								 src="${list.filename_thumb}"
								 onerror="this.src='/resources/images/noimg.gif';"
								 alt="" />
						</div>
						<div class="caption card-body">
							<h4 class="group card-title inner list-group-item-heading">
								${list.product_nm}</h4>
							<p class="group inner list-group-item-text">${list.content}</p>
							<div class="row">
								<div class="col-xs-12 col-md-6">
									<p class="lead"> ${list.bib_cnt}명 / ${list.bib_max_money}원</p>
								</div>
								<div class="col-xs-12 col-md-6">
									<c:if test="${list.state_cd != '3'}">
										<label>${list.acutdate_start_str}</label>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
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
</body>
</html>