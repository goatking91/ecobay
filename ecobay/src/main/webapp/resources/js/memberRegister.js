$(document).ready(function(){
	var flag = false;
	
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
	            $('#zipcode').val(data.zonecode);
	            $('#addr1').val(fullAddr);


	            // 커서를 상세주소 필드로 이동한다.
	            $('#addr2').focus();
	        }
	    }).open();

	});
	
	$('#member_id2').bind('change', function(){
		var member_id2 = $('#member_id2').val();
		var member_id3 = $('#member_id3').val();
	       if(member_id2 == '선택'){
	    	   $('#member_id3').attr("readonly", true);
	       } else if(member_id2 == '직접입력'){
	    	   $('#member_id3').attr("readonly", false);
	       } else{
	    	   $('#member_id3').attr("readonly", true);
	       }
	   });
	
	$('#regbutton').click(function(event){
		var member_name = $('#member_name').val();
		var member_id1 = $('#member_id1').val();
		var member_id2 = $('#member_id2 ').val();
		var member_id3 = $('#member_id3').val();
		var pwd = $('#member_pwd').val();
		var pwdck = $('#pwdck').val();
		var birth = $('#birth').val();
		var gender = $('#gender').val();
		var phone1 = $('#phone1').val();
		var phone2 = $('#phone2').val();
		var phone3 = $('#phone3').val();
		var zipcode = $('#zipcode').val();
		var addr1 = $('#addr1').val();
		var addr2 = $('#addr2').val();
		
		var reg_pwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/);
		var reg_email = RegExp(/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/);
		var reg_phone= RegExp(/(\d{3,4})/);
        var reg_name= RegExp(/^[가-힣]+$/);
		
        var member_id = '';
        var phone = '';
        
        if(member_name.length == 0){
        	$('#message').find('h4').text("올바른 이름을 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_name").focus();
        	return false;
         }
        if(!reg_name.test(member_name)){
        	 $('#message').find('h4').text("올바른 이름형식을 입력해주세요");
         	$('#myModal').modal('show');
         	$("#member_name").val("");
            $("#member_name").focus();
         	return false;
         } 
         if(member_id1.length == 0){
        	$('#message').find('h4').text("아이디를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_id1").focus();
        	return false;
         }   
         if(member_id2 == '선택'){
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
            	member_id = member_id1 + "@" + member_id3;
               if(!reg_email.test(member_id)){
            	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
                   $('#myModal').modal('show'); 
                   $("#member_id1").val("");
                   $("#member_id1").focus();
                   return false;
               }
               $('#member_id_join').val(member_id);
            } else {
            	member_id = member_id1 + "@" + member_id2;
               if(!reg_email.test(member_id)){
            	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
                   $('#myModal').modal('show');
                   $("#member_id1").val("");
                   $("#member_id1").focus();
                   return false;
               }
               $('#member_id_join').val(member_id);
            }
         }
         if(flag == false){
        	 $('#message').find('h4').text('아이디 중복체크 해주세요');
             $('#myModal').modal('show');
             return false;
         }
         if(pwd.length == 0){
        	$('#message').find('h4').text("비밀번호를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#member_pwd").focus();
        	return false;
        } else if(!reg_pwd.test(pwd)){
        	$('#message').find('h4').text('영문, 숫자, 특수문자를 포함한 8~16자리 수를 입력해주세요');
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
        }
        if(birth.length == 0){
        	$('#message').find('h4').text("생년월일을 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }
        if(phone2.length == 0){
        	$('#message').find('h4').text("번호 가운데자리를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#phone2").focus();
        	return false;
        } else if(phone3.length == 0){
        	$('#message').find('h4').text("번호 마지막자리를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#phone3").focus();
        	return false;
        } else if(!reg_phone.test(phone2)){
        	$('#message').find('h4').text("번호 가운데 자리를 올바르게 입력해주세요");
        	$('#myModal').modal('show');
            $("#phone2").val("");
            $("#phone2").focus();
            return false;
        } else if(!reg_phone.test(phone3)){
        	$('#message').find('h4').text("번호 마지막 자리를 올바르게 입력해주세요");
        	$('#myModal').modal('show');
            $("#phone3").val("");
            $("#phone3").focus();
            return false;
        } else{
        	phone = phone1 + "-" + phone2 + "-" + phone3;
        	$('#phone').val(phone);
        }
        
        if(zipcode.length == 0){
        	$('#message').find('h4').text("우편번호를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        }
        if(addr1.length == 0){
        	$('#message').find('h4').text("주소를 입력해주세요");
        	$('#myModal').modal('show');
        	return false;
        } else if(addr2.length == 0){
        	$('#message').find('h4').text("상세주소를 입력해주세요");
        	$('#myModal').modal('show');
        	$("#addr2").focus();
        	return false; 
        }
	});
	$('#member_idck').click(function(){
		/* 	var member_id = GetComponent("full_id") */

			var member_id ='';
			var member_id1 = $('#member_id1').val();
			var member_id2 = $('#member_id2').val();
			var member_id3 = $('#member_id3').val();
			var reg_email = RegExp(/^([\S]{2,16})@([a-zA-Z]{2,10})\.([a-zA-Z]{2,10})$/)
			
			console.log(member_id1);
			console.log(member_id2);
			console.log(member_id3);
			
			if(member_id1.length == 0){
		    	$('#message').find('h4').text("아이디를 입력해주세요");
		    	$('#myModal').modal('show');
		    	$("#member_id1").focus();
		    	return false;
		     } else if(member_id2 == '선택'){
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
		        	member_id = member_id1 + "@" + member_id3;
		           if(!reg_email.test(member_id)){
		        	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
		               $('#myModal').modal('show'); 
		               $("#member_id1").val("");
		               $("#member_id1").focus();
		               return false;
		           }
		        } else {
		        	member_id = member_id1 + "@" + member_id2;
		           if(!reg_email.test(member_id)){
		        	   $('#message').find('h4').text('올바른 메일 형식을 입력해주세요');
		               $('#myModal').modal('show');
		               $("#member_id1").val("");
		               $("#member_id1").focus();
		               return false;
		           }
		        }
		     }
			
			$.ajax({
				async: true,
		        type : 'POST',
		        data : member_id,
		        url : "/member/idcheck.do",
		        dataType : "json",
		        contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		            if (data.cnt > 0) {
		                
		                $("#message").find('h4').text('사용할 수 없는 아이디입니다.');
		                $("#myModal").modal("show");
		                $("#member_id1").val("");
		                $("#member_id1").focus();            
		            } else {
		            	$("#message").find('h4').text('사용 가능한 아이디입니다.');
		                $("#myModal").modal("show");
		                $("#member_pwd").focus();
		     
		            }
		            flag=true;
		        },
		        error : function(error) {
		            
		            alert("error : " + error);
		        }
			});
		});
});