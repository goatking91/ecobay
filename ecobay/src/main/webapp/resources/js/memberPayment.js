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
		var member_id = $('#member_id2').text();
		var phone4 = $('#phone4').val();
		var phone5 = $('#phone5').val();
		var phone6 = $('#phone6').val();
		var member_name = $('#member_name').val();
		var addr1 = $('#addr3').val();
		var addr2 = $('#addr4').val();
		var deli_zipcode = $('#deli_zipcode').val();
		var money_pay = $('#money_pay').val();
		var product_nm = $('#product_nm').val();
		var DELI_PHONENUM = $('#DELI_PHONENUM').val();
		
		var phone = '';
		
		var deliveryInfo = '${deliveryInfo}'
		
		if(deliveryInfo == 2) {
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
			} 
			else {
	        	phone = phone4 + "-" + phone5 + "-" + phone6;
	        	$('#DELI_PHONENUM').val(phone);
	        }
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
		var deli_phonenum = $('#deli_phonenum').val(phone);
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