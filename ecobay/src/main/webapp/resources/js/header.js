	
	 
	$(function() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});

	function showTime(){
	    var date = new Date();
	    var y = date.getFullYear();
	    var M = date.getMonth()+1;
	    var d = date.getDate();
	    var h = date.getHours(); // 0 - 23
	    var m = date.getMinutes(); // 0 - 59
	    var s = date.getSeconds(); // 0 - 59
	    var session = "오전";
	    
	    if(h == 0){
	        h = 12;
	    }
	    
	    if(h == 12){
	        session = "오후";
	    }
	    
	    if(h > 12){
	        h = h - 12;
	        session = "오후";
	    }
	    
	    
	    y = y.toString().substr(2,2);
	    M = (M < 10) ? "0" + M : M;
	    d = (d < 10) ? "0" + d : d;
	    h = (h < 10) ? "0" + h : h;
	    m = (m < 10) ? "0" + m : m;
	    s = (s < 10) ? "0" + s : s;
	    
	    var day = y + "년 " + M + "월 " + d + "일";
	    var time = session + " " + h + ":" + m + ":" + s;
	    document.getElementById("MyDayDisplay").innerHTML = day;
	    document.getElementById("MyClockDisplay").innerHTML = time;
	    
	    setTimeout(showTime, 1000);
	    
	}
	
	
	showTime();
	$("document").ready(function() {	
		
		$("#findidModalShow").on("click", function() {
			$("#findInfoModal").modal("hide");
		});
		
		$("#findpwdModalShow").on("click", function() {
			$("#findInfoModal").modal("hide");
		});
		
		$("#searchBtn").on("click", function(e) {
			e.preventDefault();
			$('#searchForm')[0].submit();
		});
		
		$('#findnewpwdModal').css("z-index","9999999");//모달 z-index 설정하기
    	$('#mysearchModal').css("z-index","99999999");
		
		$('#findidgo').click(function(event){
    		var member_name = $('#findmember_name').val();
    		var birth = $('#findbirth').val();
    		var phone = $('#findphone').val();
    		
    		var postData = {'member_name' : member_name , 'birth' : birth, 'phone' : phone};
    		//널체크
    		if(member_name.length == 0){
    			$('#findenter').text("이름 입력해주세요");
    			$('#findmember_name').focus();
    			return false;
    		}
    		if(birth.length == 0){
    			$('#findenter2').text("생년월일 입력해주세요");
    			$('#findbirth').focus();
    			return false;
    		}
    		if(phone.length == 0){
    			$('#findenter3').text("번호 입력해주세요");
    			$('#findphone').focus();
    			return false;
    		}
    		//ajax로 보내고 얘네를 쿼리를 돌려서  
    		$.ajax({
    			async: true,
    			type: 'POST',
    			url : "/member/idfind.do",
    			data: JSON.stringify(postData),
    			dataType : "json",
    			contentType: "application/json; charset=UTF-8",
    			success : function(data) {//이름,생년월일,폰번호,아이디
    				console.log(data.member_id);
					 if(data.member_id != ""){
	    				
						$('#findidModal').modal('hide'); 
	    				$('#findmessage').find('h4').text("회원님의 정보로 등록된 아이디는" + data.member_id + " 입니다");
						$('#mysearchModal').modal('show');	
					}else{
						//$('#idModal').modal('hide'); 
						$('#findmessage').find('h4').text("정보가 일치하지 않습니다 다시 입력해주세요");
						$('#mysearchModal').modal('show');	
					} 
    			},
    	        error: function(data) {
    				console.log("error :" + data);
    				console.log(data.member_id);
    			}
    		});  
    	})
    	
		var tmpId;//비번 변경할 아이디 값 기억
		
    	$('#findpwdgo').click(function(event){
    		var member_id = $('#findmember_id1').val();
    		var member_name = $('#findmember_name1').val();
    		var birth = $('#findbirth1').val();
    		
    		var postData = {'member_id' : member_id, 'member_name' : member_name, 'birth' : birth}
    		
    		if(member_id.length == 0){
    			$('#findenter4').text("아이디 입력해주세요");
    			$('#findmember_id1').focus();
    			return false;
    		}
    		if(member_name.length == 0){
    			$('#findenter5').text("이름을 입력해주세요");
    			$('#findmember_name1').focus();
    			return false;
    		}
    		if(birth.length == 0){
    			$('#findenter6').text("생일을 입력해주세요");
    			$('#findbirth1').focus();
    			return false;
    		}
    		//아이디를 먼저 받아와서 아이디에 해당하는 pwd값 업데이트
    		$.ajax({
    			async: true,
    			type: 'POST',
    			url : "/member/pwdfind.do",
    			data: JSON.stringify(postData),
    			dataType : "json",
    			contentType: "application/json; charset=UTF-8",
    			success : function(data) {//이름,생년월일,폰번호,아이디
    				console.log(data.pwd);
					 if(data.pwd != ""){
	    				tmpId = data.member_id;
						$('#findpwdModal').modal('hide'); 
						$('#newpwdModal').modal('show');	
					}else{
						//$('#idModal').modal('hide'); 
						$('#findmessage').find('h4').text("정보가 일치하지 않습니다 다시 입력해주세요");
						$('#mysearchModal').modal('show');	
						return false;
					} 
    			},
    	        error: function(data) {
    				console.log("error :" + data);
    				console.log(data.pwd);
    			}
    		});
    	});
    	
    	$('#findnewpwdgo').click(function(event){
    		var pwd = $('#findnewpwd').val();
    		var pwdck = $('#findnewpwd2').val();
    		
    		if(pwd.length == 0){
    			$('#find1enter').text("새 비밀번호를 입력해주세요");
    			$('#findnewpwd').focus();
    			return false;
    		}else if(pwdck.length == 0){
    			$('#find2enter').text("비밀번호를 한번 더 입력해주세요");
    			$('#findnewpwd2').focus();
    			return false;
    		}else if(pwd != pwdck){
    			$('#findmessage').find('h4').text("동일한 비밀번호를 입력해주세요");
				$('#mysearchModal').modal('show');
				return false;
    		}
    		
    		var postData = {"member_id" : tmpId, "pwd" : pwd} 
    		$.ajax({
	    			async: true,
	    			type: 'POST',
	    			url : "/member/newpwd.do",
	    			data: {"member_id" : tmpId, "pwd" : pwd},
	    			dataType : "text",
/* 	    			contentType: "application/text; charset=UTF-8",  */ //배열을 넘길때 contentType쓰면 값이 안넘어감
	    			success : function(data) {//이름,생년월일,폰번호,아이디							 	
		    					$('#newpwdModal').modal('hide'); 
								$('#findmessage').find('h4').text("비밀번호가 변경되었습니다");
								$('#mysearchModal').modal('show');
	    			},
	    	        error: function(error) {
	    				console.log("error :" + data);
	    			}
	    		});
    	})
    	
    	$( "#findbirth" ).flatpickr({
        	maxDate: 'today',
            dateFormat: 'Y-m-d',
            onReady: function (selectedDates, dateStr, instance) {
                $('#findbirth input').val(
                    instance.formatDate(new Date(), 'Y-m-d')
                )
    		}
        });
    	
    	$( "#findbirth1" ).flatpickr({
        	maxDate: 'today',
            dateFormat: 'Y-m-d',
            onReady: function (selectedDates, dateStr, instance) {
                $('#findbirth1 input').val(
                    instance.formatDate(new Date(), 'Y-m-d')
                )
    		}
        });
	});