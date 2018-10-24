<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
 
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>modify.jsp</title>

<script type="text/javascript">
$(document).ready(function(){	
	var phone = $('#phone').val();
	var phone1 = phone.substring(0,3);
	var phone2 = phone.substring(4,8);
	var phone3 = phone.substring(9,13);

	$('#phone1').val(phone1);
	$('#phone2').val(phone2);
	$('#phone3').val(phone3);
	
$('#search').click(function() {		
		
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
	            $('#zipcode').val(data.zonecode);
	            $('#addr1').val(fullAddr);


	            // 커서를 상세주소 필드로 이동한다.
	            $('#addr2').focus();
	        }
	    }).open();

	});
	
	$('#modify_end').click(function(event){
/* 		var pwd = $('#pwd').val();
		var pwdck = $('#pwdck').val(); */
		var phone1 = $('#phone1').val();
		var phone2 = $('#phone2').val();
		var phone3 = $('#phone3').val();
		var zipcode = $('#zipcode').val();
		var addr1 = $('#addr1').val();
		var addr2 = $('#addr2').val();
		
/* 		var reg_pwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/); */
		var reg_phone= RegExp(/(\d{3,4})/);
		
        var phone = '';
		
		/* if(pwd.length == 0){
			$('#message').find('h4').text("비밀번호를 입력해주세요");
			$('#myModal').modal('show');
			$("#pwd").focus();
			return false;
		}else if(!reg_pwd.test(pwd)){
			$('#message').find('h4').text('특수문자를 포함한 8~16자리 수를 입력해주세요');
		    $('#myModal').modal('show');
		    $("#pwd").val("");
		    $("#pwd").focus();
		    return false;
		}if(pwd != pwdck){
			$('#message').find('h4').text("동일한 비밀번호를 입력해주세요");
			$('#myModal').modal('show');
		    $("#pwdck").val("");
		    $("#pwdck").focus();
			return false;
		} */
		if(phone2.length == 0){
        	$('#message').find('h4').text("번호 가운데자리를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#phone2").focus();
        	return false;
        }else if(phone3.length == 0){
        	$('#message').find('h4').text("번호 마지막자리를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#phone3").focus();
        	return false;
        }else if(!reg_phone.test(phone2)){
        	$('#message').find('h4').text("번호 가운데 자리를 올바르게 입력해주세요");
        	$('#myModal').modal('show');
            $("#phone2").val("");
            $("#phone2").focus();
            return false;
        }else if(!reg_phone.test(phone3)){
        	$('#message').find('h4').text("번호 마지막 자리를 올바르게 입력해주세요");
        	$('#myModal').modal('show');
            $("#phone3").val("");
            $("#phone3").focus();
            return false;
        }else{
        	phone = phone1 + "-" + phone2 + "-" + phone3;
        	$('#phone').val(phone);
        }
        
        if(zipcode.length == 0){
        	$('#message').find('h4').text("우편번호를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }if(addr1.length == 0){
        	$('#message').find('h4').text("주소를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }else if(addr2.length == 0){
        	$('#message').find('h4').text("상세주소를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#addr2").focus();
        	return false; 
        }
        
        
        })
        $('#cancel').click(function(){
        	$('#message').find('h4').text("모든 입력을 취소하시겠습니까?");
        	$('#myModal').modal('show');
        	$('#ok').click(function(){
        		location.href = "/member/mypage.do";
        	})
	});
}); 
</script>
</head>
<body>
<article>
	<div class="container">
		<div class="page-header" style="padding:2%">
	   	    <h1 align="center">회원정보수정 </h1>
	   	    <hr>
		</div>
		<div class="col-sm-12">
	        <form name="myform" method="post" action="modify.do">
	        	<div class="form-group row">
					<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>이름</b></div>
					<div class="col-sm-4">
						<security:csrfInput/>
						<input class="form-control border-0" style="background-color:white" id="member_name" name="member_name" type="text" value="${member.member_name}" readonly>
					</div>
				</div>
	        	<div class="form-group row row">
	          		<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>ID</b></div>
			        <div class="col-sm-3">
						<input class="form-control border-0" style="background-color:white" id="member_id" name="member_id" type="text" value="${member.member_id}" readonly>
					</div>		
	        	</div>
				<!-- <div class="form-group row row">
					<label class="col-sm-3 col-form-label text-right text-right" for="pwd">비밀번호</label>
					<div class="col-sm-3">
						<input class="form-control" id="pwd" name="pwd" type="password" placeholder="비밀번호">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="pwdck">비밀번호 확인</label>
					<div class="col-sm-3">
						<input class="form-control" id="pwdck" name="pwdck" type="password" placeholder="비밀번호 확인">
					</div>
				</div> -->
				<div class="form-group row">
					<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>생년월일</b></div>
					<div class="col-sm-3">
						<input class="form-control border-0" style="background-color:white" id="birth" name="birth" type="text" value="${member.birth}" readonly>
					</div>
				</div>	
				<div class="form-group row">
					<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>성별</b></div>
					<div class="col-sm-3">
							<input class="form-control border-0" style="background-color:white" id="gender" name="gender" type="text" value="${member.gender}" readonly>
						</div>	
				</div>	
				
				<div class="form-group row">	
				<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>번호</b></div>
					<div class="col-sm-4">
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
				
				<div class="form-group row">
				<div class="col-sm-3 text-right" style="margin-top:auto;margin-bottom:auto;"><b>주소</b></div>
					<div class="col-sm-3">
						<div class="input-group">
							<input class="form-control" id="zipcode" name="zipcode" type="text" value="${member.zipcode}">
							<span class="input-group-append">
		                    		<input type='button' id="search" class="btn btn-secondary" value='우편번호찾기'>
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
					<div class="col-sm text-center">
						<input type="submit" id="modify_end" name="modify_end" class="btn btn-lg btn-primary" value="수정완료">&nbsp;
						<input type="button" id="cancel" class="btn btn-lg btn-primary" value="취소">
					</div>	
				</div>     	
			</form>
		</div>
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
        <button type="button" id="ok" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

</body>
</html>