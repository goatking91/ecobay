<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
</head>
<script>
$(function() {
    $( "#birth" ).flatpickr({
    	maxDate: 'today',
        dateFormat: 'd/m/Y',
        onReady: function (selectedDates, dateStr, instance) {
            $('#birth input').val(
                instance.formatDate(new Date(), 'd/m/Y')
            )
		}
    });
 });
	
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#member_id2').bind('change', function(){
		var member_id2 = $('#member_id2').val();
		var member_id3 = $('#member_id3').val();
	       if(member_id2 == '선택'){
	    	   $('#member_id3').attr("readonly", true);
	       }else if(member_id2 == '직접입력'){
	    	   $('#member_id3').attr("readonly", false);
	       }else{
	    	   $('#member_id3').attr("readonly", true);
	       }
	   });
	
	$('#regbutton').click(function(event){
		var member_name = $('#member_name').val();
		var member_id = $('#member_id1').val();
		var member_id2 = $('#member_id2 ').val();
		var member_id3 = $('#member_id3').val();
		var pwd = $('#member_pwd').val();
		var pwdck = $('#pwdck').val();
		var birth = $('#birth').val();
		var gender = $('#gender').val();
		var phone = $('#phone').val();
		var phone2 = $('#phone2').val();
		var phone3 = $('#phone3').val();
		var zipcode = $('#zipcode').val();
		var addr1 = $('#addr1').val();
		var addr2 = $('#addr2').val();
		
		var reg_pwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/);
		var reg_email = RegExp(/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/);
		var reg_phone= RegExp(/^[0-9](3,4)+$/);
        var reg_name= RegExp(/^[가-힣]+$/);
		
        var full_id = '';
        
        if(member_name.length == 0){
        	$('#message').find('h4').text("올바른 이름을 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_name").focus();
        	return false;
         }if(!reg_name.test(member_name)){
        	 $('#message').find('h4').text("올바른 이름형식을 입력해주세요");
         	$('#myModal').modal('show');
         	$("#member_name").val("");
            $("#member_name").focus();
         	return false;
         } 
        
        if(member_id.length == 0){
        	$('#message').find('h4').text("아이디를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_id1").focus();
        	return false;
         }   
          
          else if(member_id2 == '선택'){
            $('#message').find('h4').text('메일 주소를 선택해 주세요.');
            $('#myModal').modal('show');
            return false;
            
         } else if(member_id2 == '직접입력' && member_id3.length == 0) {
            $('#message').find('h4').text('메일 주소를 입력해주세요');
            $('#myModal').modal('show');
            $("#member_id3").focus();
            return false;
         } else {
            if (member_id2 == '직접입력') {
               full_id = member_id + "@" + member_id3;
               if(!reg_email.test(full_id)){
            	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
                   $('#myModal').modal('show'); 
                   $("#member_id1").val("");
                   $("#member_id1").focus();
                   return false;
               }
            } else {
               full_id = member_id + "@" + member_id2;
               if(!reg_email.test(full_id)){
            	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
                   $('#myModal').modal('show');
                   $("#member_id1").val("");
                   $("#member_id1").focus();
                   return false;
               }
            }
         }if(pwd.length == 0){
        	$('#message').find('h4').text("비밀번호를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_pwd").focus();
        	return false;
        }else if(!reg_pwd.test(pwd)){
        	$('#message').find('h4').text('특수문자를 포함한 8~16자리 수를 입력해주세요');
            $('#myModal').modal('show');
            $("#member_pwd").val("");
            $("#member_pwd").focus();
            return false;
        }
         
         if(pwd != pwdck){
        	$('#message').find('h4').text("동일한 비밀번호를 입력해주세요");
        	$('#myModal').modal('show');
            $("#pwdck").val("");
            $("#pwdck").focus();
        	return false;
        }if(birth.length == 0){
        	$('#message').find('h4').text("생년월일을 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }if(phone2.length == 0 || phone3.length == 0){
        	$('#message').find('h4').text("번호를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#phone2").focus();
        	return false;
        }else if(!reg_phone.test(phone2) || !reg_phone.test(phone3)){
        	$('#message').find('h4').text("올바른 번호를 입력해주세요");
        	$('#myModal').modal('show');
            $("#phone2").val("");
            $("#phone3").val("");
            $("#phone2").focus();
        }
        
        if(zipcode.length == 0){
        	$('#message').find('h4').text("우편번호를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }if(addr1.length == 0 || addr2.length == 0){
        	$('#message').find('h4').text("주소를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }      
	})

/* 	$('#member_id2 option:checked').focus(function(event){
		var member_id2 = $('#member_id2').val();
		if(member_id2 == '직접입력'){
			$('#member_id3').attr("readonly", false);
		}else{
			$('#member_id3').attr("disabled",true).attr("readonly", true);
		}	
	}) */
	
});


</script>
<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h1>회원가입 </h1>
   	    <hr>
	</div>
	<div class="col-md-12">
        <form name="myform" method="post" action="reg.do">
        	<input type="hidden" id="join_YN" name="join_YN" value="true">
        	
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<input class="form-control" id="member_name" name="member_name" type="text" placeholder="이름">
				</div>
			</div>
        	
        	<div class="form-group row row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id1">ID</label>
		        <div class="col-sm-3">
		        	<div class="input-group">
						<input class="form-control" id="member_id1" name="member_id" type="text"/>
						<div class="input-group-append">
    						<span class="input-group-text" id="at">@</span>
  						</div>
						<select class="form-control" id="member_id2" name="member_id2">
							<option value="선택">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="직접입력">직접입력</option>
						</select>
					</div>
				</div>
				<div class="col-sm-3">
        			<div class="input-group">
						<input class="form-control" id="member_id3" name="member_id3" type="text" placeholder="직접입력"/>
						<div class="input-group-append">						
                			<button class="btn btn-secondary">중복체크</button>
                		</div>
            		</div>
    			</div>
        		<div class="col-sm-3"></div>
        	</div>
			<div class="form-group row row">
				<label class="col-sm-3 col-form-label text-right text-right" for="member_pwd">비밀번호</label><!-- 8~16자리 -->
				<div class="col-sm-4">
					<input class="form-control" id="member_pwd" name="pwd" type="password" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="pwdck">비밀번호 확인</label>
				<div class="col-sm-4">
					<input class="form-control" id="pwdck" name="pwdck" type="password" placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label><!-- datepicker6자리로 바꾸기 930811-->
				<div class="col-sm-3">
					<input class="form-control" id="birth" name="birth" type="text" placeholder="생년월일">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
				<div class="col-sm-3 col-form-label">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="man" name="gender" value="남" checked="checked">
						<label class="form-check-label" for="man">
						남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="woman" name="gender" value="여">
						<label class="form-check-label" for="woman">
						여</label>	
					</div>
				</div>		
			</div>	
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone phone2 phone3">번호</label>
				<div class="col-sm-3">
					<div class="input-group">				
					<select class="form-control" id="phone" name="phone">
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
				</div>
				</div>	
			</div>    		
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="zipcode">주소</label>
				<div class="col-sm-3">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호">
						<span class="input-group-append">
	                    		<button id="search" class="btn btn-secondary" >우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div> 
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr1" name="addr1" type="text" placeholder="도로명/지번">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr2" name="addr2" type="text" placeholder="상세주소">
				</div>	
			</div>
						
			<div class="form-group row">
				<div class="col-sm text-center">
					<input type="button" id="regbutton" class="btn btn-lg btn-info" value="등록">&nbsp;
					<input type="reset" class="btn btn-lg btn-info" value="초기화">
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