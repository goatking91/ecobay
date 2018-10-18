<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ajax로그인 할 때 필요한 메타데이터 두 줄-->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>join.jsp</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/js/memberPayment.js"></script>

</head>

<body>
<div class="container">
	<article>
		<div class="page-header" style="padding:2%">
	   	    <h2>주문자 정보</h2>
	   	    <hr>
		</div>
		<div class="col-sm-12">
	        <form id="myform" name="myform" method="post">
	        	<div class="form-group row">
					<label class="col-sm-5 text-right" for="member_name2"><b>이름</b></label>
					<div class="col-sm-7">
						<security:csrfInput/>
						<label id="member_name2">${member.member_name}</label>
					</div>
				</div>
	        	<div class="form-group row">
	          		<label class="col-sm-5 text-right" for="member_id"><b>ID</b></label>
			        <div class="col-sm-7">
						<label id="member_id">${member.member_id}</label>
					</div>		
	        	</div>
				
				<div class="form-group row">	
				<label class="col-sm-5 text-right" for="phone1 phone2 phone3"><b>번호</b></label>
					<div class="col-sm-7">
						<div class="input-group">				
						<label id="phone1">${member.phone.substring(0,3)}</label>
						-
						<label id="phone2">${member.phone.substring(4,8)}</label>
						-					
						<label id="phone3">${member.phone.substring(9,13)}</label>
						<input class="form-control" id="phone" name="phone" type="hidden" value="${member.phone}">
					</div>
					</div>	
				</div>
				
				<c:choose>
					<c:when test="${deliveryInfo eq 2}">
						<div class="page-header d-flex justify-content-between align-items-center">
			   	    		<h2>배송지 정보</h2>
			   	    		<input class="btn-sm btn-primary" type="button" value="주문자 정보와 동일" id="same">
						</div>
						<hr>
			        	<div class="form-group row">
							<label class="col-sm-4 col-form-label text-right" for="member_name"><b>이름</b></label>
							<div class="col-sm-4">
								<input class="form-control" id="member_name" name="deli_nm" type="text">
							</div>
						</div>
						
						<div class="form-group row">
							<label class="col-sm-4 col-form-label text-right" for="deli_zipcode"><b>주소</b></label>
							<div class="col-sm-3">
								<div class="input-group">
									<input class="form-control" id="deli_zipcode" name="deli_zipcode" type="text" value="">
									<input class="form-control" id="zipcode" type="hidden" value="${member.zipcode}">
									<span class="input-group-append">
				                    		<button type="button" id="searchCode" class="btn btn-secondary" >우편번호찾기</button>
				                  	</span>
								</div>	                  	
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<div class="col-sm-6">
								<input class="form-control" id="addr3" name="deli_addr1" type="text" value="">
								<input class="form-control" id="addr1" type="hidden" value="${member.addr1}">
							</div>	
						</div>
						<div class="form-group row">
							<div class="col-sm-4"></div>
							<div class="col-sm-6">
								<input class="form-control" id="addr4" name="deli_addr2" type="text" value="">
								<input class="form-control" id="addr2" type="hidden" value="${member.addr2}">
							</div>	
						</div>
						
						<div class="form-group row">	
						<label class="col-sm-4 col-form-label text-right" for="phone4 phone5 phone6"><b>번호</b></label>
							<div class="col-sm-4">
								<div class="input-group">				
								<select class="form-control" id="phone4">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
								<div class="input-group-append">
			    						<span class="input-group-text" id="basic-addon2">-</span>
			  					</div>
								<input class="form-control" id="phone5" type="text">
								<div class="input-group-append">
			    						<span class="input-group-text" id="basic-addon2">-</span>
			  					</div>					
								<input class="form-control" id="phone6" type="text">
								<input type="hidden" id="deli_phonenum" name="deli_phonenum" value="">
								
							</div>
							</div>	
						</div>
					</c:when>
					<c:otherwise>
						<div class="page-header d-flex justify-content-between align-items-center">
			   	    		<h2>판매자 정보</h2>
						</div>
						<hr>
				        	<div class="form-group row">
							<label class="col-sm-5 text-right" for="member_name2"><b>이름</b></label>
							<div class="col-sm-7">
								<security:csrfInput/>
								<label id="member_name2">${prodMember.member_name}</label>
							</div>
						</div>
			        	<div class="form-group row">
			          		<label class="col-sm-5 text-right" for="member_id"><b>이메일</b></label>
					        <div class="col-sm-7">
								<label id="member_id">${prodMember.member_id}</label>
							</div>		
			        	</div>
						
						<div class="form-group row">	
						<label class="col-sm-5 text-right" for="phone1 phone2 phone3"><b>연락처</b></label>
							<div class="col-sm-7">
								<label id="member_id">${prodMember.phone}</label>
							</div>	
						</div>
					</c:otherwise>
				</c:choose>
				<div class="page-header">
	   	    		<h2>상품 정보</h2>
	   	    		<hr>
				</div>
				<div class="form-group row">
					<div class="col-sm-4"><img src="/displayFile.do?fileName=${img}" style="margin-left: auto; margin-right: 0px; display: block; width: 100px; height: 100px;"></div>
					<div class="col-sm-1 text-right" style="margin-top: auto; margin-bottom: auto; display: block; padding-left: 0px;">
						<b>분류</b><br>
						<b>상품 코드</b><br>
						<b>상품명</b><br>
					</div>
					<div class="col-sm-7" style="margin-top: auto; margin-bottom: auto; display: block;">
						${product.class_big_nm} > ${product.class_mid_nm} <br>
						${auct.product_cd} <br>
						${product.product_nm}
						<input type="hidden" id="product_nm" value="${product.product_nm}">
					</div>
					<%-- <div class="col-sm-3" id="product_cd" style="margin-bottom: auto; margin-top: auto; display: block;"><b>상품 코드 : </b>${auct.product_cd}</div>
	 				<div class="col-sm-2" style="margin-bottom: auto; margin-top: auto; display: block;"><b>상품명 : </b>${product.product_nm}</div>
	 				<input type="hidden" id="product_nm" value="${product.product_nm}">
	 				<div class="col-sm-2" id="class_big_nm" style="margin-bottom: auto; margin-top: auto; display: block;"><b>대분류 : </b>${product.class_big_nm}</div>
	 				<div class="col-sm-2" id="class_mid_nm" style="margin-bottom: auto; margin-top: auto; display: block;"><b>중분류 : </b>${product.class_mid_nm}</div> --%>
				</div>
	
				<!-- <div class="page-header" style="padding:2%">
	   	    		<h2>결제수단</h2>
	   	    		<input type="button" id="pay" name="payment" class="btn btn-lg btn-info" value="카카오페이결제">
	   	    		<hr>
				</div> -->
				<div id="pg"></div>
					
				<div class="page-header">
	   	    		<h2>최종결제정보</h2>
	   	    		<hr>
				</div>
				
				<div style="font-size: 20pt" class="form-group row">
					<div class="col-sm-4 text-right">결제 금액</div>
					<div class="col-sm-8" style="text-align:center;"> 
					
					
					
					
					
					
					
		                <label>${payMoney}원</label>
		                <input id='money_pay' type="hidden" name="money_pay" value="${payMoney}">
	                </div>
	           </div>
				<div class="form-group row">
					<div class="col-sm text-center">
						<input type="button" id="payment" class="btn btn-lg btn-primary" value="결제진행">
						<input type="button" id="cancel" class="btn btn-lg btn-primary" value="취소">
					</div>	
				</div>     	
			</form>
		</div>
	</article>
</div>
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