<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="/resources/js/memberRegister.js"></script>

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
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
IMP.init('imp74608433');//가맹점 식별코드
IMP.request_pay({
    pg : 'kakao', // version 1.1.0부터 지원.
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : 'iamport@siot.do',
    buyer_name : '구매자이름',
    buyer_tel : '010-1234-5678',
    buyer_addr : '서울특별시 강남구 삼성동',
    buyer_postcode : '123-456',
    m_redirect_url : 'http://localhost:7080/member/paymentEnd.do'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
});
</script>
</head>

<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h2>주문자 정보</h2>
   	    <hr>
	</div>
	<div class="col-sm-12">
        <form name="myform" method="post" action="payment.do">
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<security:csrfInput/>
					<input class="form-control border-0" style="background-color:white" id="member_name" name="member_name" type="text" value="${member.member_name}" readonly>
				</div>
			</div>
        	<div class="form-group row row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id1">ID</label>
		        <div class="col-sm-3">
					<input class="form-control border-0" style="background-color:white" id="member_id1" name="member_id1" type="text" value="${member.member_id}" readonly>
				</div>		
        	</div>
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone1 phone2 phone3">번호</label>
				<div class="col-sm-3">
					<div class="input-group">				
					<select class="form-control" id="phone1" name="phone1">
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
					<input class="form-control" id="phone2" name="phone2" type="text">
					<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2">-</span>
  					</div>					
					<input class="form-control" id="phone3" name="phone3" type="text">
					<input class="form-control" id="phone" name="phone" type="hidden" value="${member.phone}">
				</div>
				</div>	
			</div>
			<div class="page-header d-flex justify-content-between align-items-center" style="padding:2%">
   	    		<h2 align="left">배송지 정보</h2>
   	    		<input style="align:'right" class="btn btn-primary" type="button" value="주문자 정보와 동일" id="same">
   	    		<hr>
			</div>
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name2">이름</label>
				<div class="col-sm-4">
					<input class="form-control border-0" style="background-color:white" id="member_name2" name="member_name2" type="text" value="${member.member_name}" readonly>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="zipcode">주소</label>
				<div class="col-sm-3">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" value="${member.zipcode}">
						<span class="input-group-append">
	                    		<button id="search" class="btn btn-secondary" >우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div>
			
			
			 
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr1" name="addr1" type="text" value="${member.addr1}">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr2" name="addr2" type="text" value="${member.addr2}">
				</div>	
			</div>
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone4 phone5 phone6">번호</label>
				<div class="col-sm-3">
					<div class="input-group">				
					<select class="form-control" id="phone4" name="phone4">
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
					<input class="form-control" id="phone5" name="phone5" type="text">
					<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2">-</span>
  					</div>					
					<input class="form-control" id="phone6" name="phone6" type="text">
					<%-- <input class="form-control" id="phone" name="phone" type="hidden" value="${member.phone}"> --%>
				</div>
				</div>	
			</div>
			
			<div class="page-header" style="padding:2%">
   	    		<h2>상품 정보</h2>
   	    		<hr>
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" type="text" value="상품사진, 정보">
				</div>	
			</div>

			<div class="page-header" style="padding:2%">
   	    		<h2>결제수단</h2>
   	    		<hr>
			</div>
			<div id="pg"></div>
				
			<div class="page-header" style="padding:2%">
   	    		<h2>최종결제정보(상품 1개)</h2>
   	    		<hr>
			</div>
			
			<div style="font-size: 20pt" class="d-flex justify-content-between align-items-center">
				<div align="left">결제 예정금액</div>
				<div align="right" style="color: red;">30,000원</div>
			</div>
			
					
			<div class="form-group row">
				<div class="col-sm text-center">
					<input type="submit" id="payment_end" name="payment_end" class="btn btn-lg btn-info" value="주문완료">
				</div>	
			</div>     	
		</form>
	</div>
</article>
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