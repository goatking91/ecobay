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

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- ajax처리시 권한 스크립트-->
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
 
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
    $('#searchCode').click(function() {		
		new daum.Postcode({
	        oncomplete: function(data) {
	        	var fullAddr = '';
				var extraAddr ='';
				
				
				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                fullAddr = data.roadAddress;

	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                fullAddr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
	            if(data.userSelectedType === 'R'){
	                //법정동명이 있을 경우 추가한다.
	                if(data.bname !== ''){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있을 경우 추가한다.
	                if(data.buildingName !== ''){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
	                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            $('#deli_zipcode').val(data.zonecode);
	            $('#addr3').val(fullAddr);


	            // 커서를 상세주소 필드로 이동한다.
	            $('#addr4').focus();
	        }
		}).open();
	});
    
    $('#payment').click(function(){
		var member_id = $('#member_id2').val();
		var phone4 = $('#phone4').val();
		var phone5 = $('#phone5').val();
		var phone6 = $('#phone6').val();
		var member_name = $('#member_name').val();
		var addr1 = $('#addr3').val();
		var addr2 = $('#addr4').val();
		var deli_zipcode = $('#deli_zipcode').val();
		var money_pay = $('#money_pay').val();
		var product_nm = $('#product_nm').text();
		var DELI_PHONENUM = $('#DELI_PHONENUM').val();
		
		var phone = '';
		
		if(addr1.length == '' || addr2.length == '' || deli_zipcode.length == ''){
			$('#message').find('h4').text("정확한 주소를 입력해주세요");
			$('#myModal').modal('show');
			$('#deli_zipcode').focus();
			return false;
		}
		if(member_name.length == ''){
			$('#message').find('h4').text("이름을 입력해주세요");
			$('#myModal').modal('show');
			$('#member_name').focus();
			return false;
		}
		if(phone5.length == '' || phone6.length == ''){
			$('#message').find('h4').text("번호를 입력해주세요");
			$('#myModal').modal('show');
			$('#phone5').focus();
			return false;
		} else {
        	phone = phone4 + "-" + phone5 + "-" + phone6;
        	$('#DELI_PHONENUM').val(phone);
        } 
		
		/* m_redirect_url : 'http://localhost:7080/main.do' */
		
		IMP.init('imp74608433');//가맹점 식별코드
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    merchant_uid : 'merchant_' + new Date().getTime(),//일시
		    name : product_nm,//상품명
		    amount : money_pay,//결제금액
		    buyer_email : member_id,
		    buyer_name : member_name,
		    buyer_tel : DELI_PHONENUM,
		    buyer_addr : addr1 + " " + addr2,
		    buyer_postcode : deli_zipcode,
		    
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        $('#myform').submit(); 
		    } else {
		    	console.log("9");
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        console.log(msg);
		        console.log(product_nm);
		        console.log(error_code);
		    }
		});
		
	});

	
	
	
	$('#same').click(function(){//주문자정보와 배송지 정보 동일시
		var member_name = $('#member_name').val($('#member_name2').text());//배송지정보
		var deli_zipcode = $('#deli_zipcode').val($('#zipcode').val());
		var phone = $('#phone').val();
		var phone4 = $('#phone4').val(phone.substring(0,3));
		var phone5 = $('#phone5').val(phone.substring(4,8));
		var phone6 = $('#phone6').val(phone.substring(9,13));
		var DELI_PHONENUM = $('#DELI_PHONENUM').val(phone);
		var addr1 = $('#addr3').val($('#addr1').val());
		var addr2 = $('#addr4').val($('#addr2').val());
	});
	
	$('#cancel').click(function(){
		if(confirm("정말 구매를 취소하시겠습니까?") == true){
			location.href="/main.do";
		}else{
			return false;
		}
	})
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
        <form id="myform" name="myform" method="post">
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name2">이름</label>
				<div class="col-sm-4">
					<security:csrfInput/>
					<label id="member_name2" name="member_name2" >${member.member_name}</label>
				</div>
			</div>
        	<div class="form-group row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
		        <div class="col-sm-3">
					<label id="member_id" name="member_id" >${member.member_id}</label>
				</div>		
        	</div>
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone1 phone2 phone3">번호</label>
				<div class="col-sm-3">
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
			
			<!--  -->
			<div class="page-header d-flex justify-content-between align-items-center" style="padding:2%">
   	    		<h2 align="left">배송지 정보</h2>
   	    		<input style="align:'right" class="btn btn-primary" type="button" value="주문자 정보와 동일" id="same">
   	    		<hr>
			</div>
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<input class="form-control" id="member_name" name="deli_nm" type="text">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="deli_zipcode">주소</label>
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
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr3" name="deli_addr1" type="text" value="">
					<input class="form-control" id="addr1" type="hidden" value="${member.addr1}">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr4" name="deli_addr2" type="text" value="">
					<input class="form-control" id="addr2" type="hidden" value="${member.addr2}">
				</div>	
			</div>
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone4 phone5 phone6">번호</label>
				<div class="col-sm-3">
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
					<input type="hidden" id="DELI_PHONENUM" name="DELI_PHONENUM" value="">
					
				</div>
				</div>	
			</div>
			
			<div class="page-header" style="padding:2%">
   	    		<h2>상품 정보</h2>
   	    		<hr>
			</div>
			<div class="form-group row">
				<div class="col-sm-3"><img src="/displayFile.do?fileName=${img}" style="margin-left: auto; margin-right: auto; display: block; width=30%"></div>
				<div class="col-sm-3" id="product_cd">${auct.product_cd}</div>
				<input type="hidden" name="product_cd" value="${auct.product_cd}">
 				<div class="col-sm-6" id="product_nm">${product_nm}</div>
 					 
			</div>

			<!-- <div class="page-header" style="padding:2%">
   	    		<h2>결제수단</h2>
   	    		<input type="button" id="pay" name="payment" class="btn btn-lg btn-info" value="카카오페이결제">
   	    		<hr>
			</div> -->
			<div id="pg"></div>
				
			<div class="page-header" style="padding:2%">
   	    		<h2>최종결제정보(상품 1개)</h2>
   	    		<hr>
			</div>
			
			<div style="font-size: 20pt" class="d-flex justify-content-between align-items-center">
				<div class="col-sm-4" align="left">결제 예정금액</div>
				<div class="col-sm-6"></div>
                <label id='money_pay' name="money_pay" style="color: red; align:right;">${payMoney}</label>원
           </div>
			
					
			<div class="form-group row">
				<div class="col-sm text-center">
					<input type="button" id="payment" class="btn btn-lg btn-info" value="결제진행">
					<input type="button" id="cancel" class="btn btn-lg btn-info" value="취소">
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