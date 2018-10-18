$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	 
	var member_id = $('#member_id').val();
	var page = 1;
	
	$(function() {
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});
	
	//===============내 정보- 수정버튼
	$('#edit_button').click(function(event){
		/* var pwd = $('#pwd').val(); *///입력받은값
        $('#pwdModal').modal('show');
	});
	
	//===============수정버튼 클릭시 뜨는 모달창 확인 버튼
	$('#confirmpwd').click(function(event){
		/* $('#myModal').css('z-index',99999); */
		$('#enter').text("");
		
		var pwd = $('#pwd').val();//입력받은값
		console.log(pwd);
		if(pwd.length == 0){
			$('#enter').text("비밀번호를 입력하세요");
	        return false;
		}
		$.ajax({
			async: true,
			type: 'POST',
			url : "/member/pwdcheck.do",
			data: pwd,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				if(data.flag == false){
					$('#enter').text("올바른 비밀번호가 아닙니다");
					console.log(data);
					console.log(data.flag);
					return false;
				}else{
					location.href='/member/modify.do?member_id='+data.member_id;
					console.log(data.member_id);
					console.log(data.flag);
				}
	        },
	        error: function(data) {
				console.log("error :" + data);
			}
		});  
	})

	//===============페이징 버튼 연결 	
	$(document).on("click", ".bbtnajax", function(){//구매상품 페이징 버튼/ 이전 1234...다음
		buyListAjax($(this).val());
	});
	
	$(document).on("click", ".sbtnajax", function(){//판매상품 페이징 버튼/ 이전 1234...다음
		sellListAjax($(this).val());
	});
	
	$(document).on("click", ".wbtnajax", function(){//관심상품 페이징 버튼/ 이전 1234...다음
		wishListAjax($(this).val());
	});
	
	$(document).on("click", ".qbtnajax", function(){//1:1문의 페이징 버튼/ 이전 1234...다음
		qnaListAjax($(this).val());
	});
	
	//===============관심상품 체크박스
	$(document).on("click", "#chK_all", function(){//체크박스 모두선택
		$('.check').prop('checked', this.checked);
	});

	$(document).on("click", "#delchk", function(){//관심상품리스트에서 체크된 상품들을 삭제
		/* $("input:checkbox[id=chk"+ +""]) */
		var wishDel = [];
		$('#checkBox:checked').each(function() {
			wishDel.push($(this).val());
		});
		$.ajax({
			async: true,
			type: 'POST',
			url : "/member/checkDel.do",
			data: JSON.stringify(wishDel), 
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				alert("관심상품이 삭제되었습니다");
				$('#wishList-tap').tab('show');
				wishListAjax(page);
	        },
	        error: function(data) {
				console.log("error :" + data);
			}
		});  
		
	});
	
	//===============내 구매상품 리스트에서 상품등록 요청취소/state_cd 1-->2
	$(document).on("click", "#stateChan", function(){
		$('#changeMessage').find('h4').text("요청을 취소하시겠습니까?");
		$('#changeModal').modal('show');
		
		var product_cd = $('#prodcd').val();
		
		$('#ok').click(function(){//요청을 취소하시겠습니까? 모달의 확인버튼 눌렀을 시

			$.ajax({
				async : true,
				type : 'POST',
				url : "/member/stateChange.do",
				data : product_cd,
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					$('#sellList-tap').tab('show');
					sellListAjax(page);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
	});
	
	
	
	//===============메뉴 클릭시 페이지 호출
	$('#sellList-tap').click(function(){//내 판매상품
		
		sellListAjax(page);  
		
	});
	
	 $('#buyList-tap').click(function(){//내 구매상품
			
		buyListAjax(page);  
			
	}); 
	
	$('#wishList-tap').click(function(){//내 관심상품
		
		wishListAjax(page);  
		
	});
	
 	$('#qnaList-tap').click(function(){//1:1문의
		
		qnaListAjax(page);  
		
	}); 
	
	
 	//===============각 리스트 페이지
	function wishListAjax(page) {//관심상품리스트
		$.ajax({
			async: true,
			type: "POST",
			data: member_id,
			url : "/member/wishList.do/" + page,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				console.log("1");
				
				$('#wishList').empty();

				var str = "";
				str = str + "<div class='form-group row'>";
				str = str + "	<div class='col-sm-12' align='center'>";
				str = str + "		<h1>내 관심 상품</h1>";
				str = str + "	</div>";
				str = str + "</div>";
				str = str + "<hr style='margin-bottom:3rem; width:925px'>";
				str = str + "	<div style='text-align:right'>관심상품수/ "+ data.cnt +"</div>"
				str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
				str = str + "	<label class='checkbox'>";
				str = str + "		<input type='checkbox' id ='chK_all' name='chK_all'>";
				str = str + "	</label>";
				str = str + "	<input type='button' class='btn btn-primary disabled' id='delchk' value='선택삭제'>";
				str = str + "	<div class='col-sm-2' align='center'>&nbsp;&nbsp;&nbsp;&nbsp;물품사진</div>"
				str = str + "	<div class='col-sm-1'></div>"
				str = str + "	<div class='col-sm-4'>물품정보</div>"
				str = str + "	<div class='col-sm-2'>진행상황</div>"

				str = str + "</div>";
				console.log(data.arr);
				$.each(data.arr, function(index, arr){
					
					var state_cd = arr.state_cd;
					if(state_cd == '3'){
						state_cd = "진행중";
					}else{
						state_cd = "경매종료";
					}
					str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1' style='padding-top:35px'>";
					str = str + "		<input type='checkbox' class='check' id='checkBox' value=" + arr.product_cd + ">";
					str = str + "	</div>";	
					str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
					str = str + "	<div class='col-sm-4' id='form-inline' style='padding-top:10px'>";
					str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
					str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
					str = str + "		<div id='product_nm'>" + arr.product_nm + "</div>";
					str = str + "	</div>";
					str = str + "	<div id='' class='col-sm-3' align='left' style='padding-top:35px;padding-left:50px'>" + state_cd + "</div>";
					str = str + "</div><hr>";
					
				});
				console.log(str);
				var vo = JSON.parse(JSON.stringify(data.vo));

	 			str = str + "<div align='center'>";
				str = str + "	<tr>";
				str = str + "		<td colspan='6'>";
				if(vo.startpage>10){
					str = str + "			<button class='btn btn-light wbtnajax' value='" + (vo.startpage-10) +"' >이전</button>";	
				}
				for(var i = vo.startpage; i <= vo.endpage; i++){
					str = str + "			<button class='btn btn-light wbtnajax' value='"+ i +"'>" + i + "</button>";
				}
				if(vo.endpage<vo.pagecount){
					str = str + "	<button class='btn btn-light wbtnajax' value='"+ (vo.startpage+10) +"' >다음</button>";	
				}
				str = str + "	</td>";
				str = str + "</tr>";
				str = str + "</div>";  
				
				console.log(str);
				$('#wishList').append(str);
	        },
	        error: function(data) {
				console.log("error :" + data);
			}
		});
	}
		
		function buyListAjax(page) {//구매상품리스트
			$.ajax({
				async: true,
				type: "POST",
				data: member_id,
				url : "/member/buyList.do/" + page,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					console.log("1");
					
					$('#buyList').empty();

					var str = "";
					str = str + "<div class='form-group row'>";
					str = str + "	<div class='col-sm-12' align='center'>";
					str = str + "		<h1>내 구매 상품</h1>";
					str = str + "	</div>";
					str = str + "</div>";
					str = str + "<hr style='margin-bottom:3rem; width:925px'>";
					str = str + "	<div style='text-align:right'>구매수/ "+ data.cnt +"</div>"
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1'></div>"
					str = str + "	<div class='col-sm-2'>물품사진</div>"
					str = str + "	<div class='col-sm-1'></div>"
					str = str + "	<div class='col-sm-3' style='text-align:center;'>물품정보</div>"
					str = str + "	<div class='col-sm-2'></div>"
					str = str + "	<div class='col-sm-2'>상태</div>"
					str = str + "</div>";
					console.log(data.arr);

					$.each(data.arr, function(index, arr){
						
						str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";	
						str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
						str = str + "	<div class='col-sm-4' id='form-inline' style='margin-top:auto;margin-bottom:auto;'>";
						str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
						str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
						str = str + "		<div id='product_nm' style='font-size:16pt'>" + arr.product_nm + "</div>";
						str = str + "	</div>"; 
						str = str + "		<div class='col-sm-3' style='margin-top:auto;margin-bottom:auto;text-align:right'>" + arr.state_nm + "</div>";
						//낙찰되었지만 구매아직안했을때 payment_proc_cd=1
						if(arr.payment_proc_cd == '1'){
	 						str = str + "	<div class='col-sm-2' style='margin:auto; padding:0;'>"; 
							str = str + "		<a href='/member/payment.do/" + arr.product_cd + "/2'><buttton class='btn btn-primary'>구매결제</buttton></a>";
							str = str + "		<button class='btn btn-danger' id='paycanbtn' data-src='" + arr.product_cd + "'>구매취소</button>";
							str = str + "	</div>";
						}
						str = str + "	</div>";
						str = str + "</div><hr>";
					});
					console.log(str);
					var vo = JSON.parse(JSON.stringify(data.vo));

		 			str = str + "<div align='center'>";
					str = str + "	<tr>";
					str = str + "		<td colspan='6'>";
					if(vo.startpage>10){
						str = str + "			<button class='btn btn-light bbtnajax' value='" + (vo.startpage-10) +"' >이전</button>";	
					}
					for(var i = vo.startpage; i <= vo.endpage; i++){
						str = str + "			<button class='btn btn-light bbtnajax' value='"+ i +"'>" + i + "</button>";
					}
					if(vo.endpage<vo.pagecount){
						str = str + "	<button class='btn btn-light bbtnajax' value='"+ (vo.startpage+10) +"' >다음</button>";	
					}
					str = str + "	</td>";
					str = str + "</tr>";
					str = str + "</div>";  
					
					console.log(str);
					$('#buyList').append(str);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		}
		
		// 구매현황 - 구매취소버튼 클릭시
		$(document).on("click", "#paycanbtn", function(){
			var prodcd = $(this).attr("data-src");
			
			$("#paycanMessage").find("h5").text("[" + prodcd + "]상품을 구매취소하겠습니까?");
			$('#paycanproduct_cd').val("");
			$('#paycanproduct_cd').val(prodcd);
			$("#paycanModal").modal("show");
		});
		
		
		// 구매취소 모달 - 확인버튼 클릭시
		$(document).on("click", "#paycanokbtn", function(){
			var prodcd = $('#paycanproduct_cd').val();
			
			paycancelAjax(prodcd);
		});
		
		function paycancelAjax(product_cd) { // 구매취소하기.
 			$.ajax({
				async: true,
				type: "POST",
				url : "/member/paycancelajax.do",
				data: product_cd,
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					buyListAjax(1);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		}
		
		function sellListAjax(page) {//판매상품리스트
			$.ajax({
				async: true,
				type: "POST",
				data: member_id,
				url : "/member/sellList.do/" + page,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					
					$('#sellList').empty();

					var str = "";
					str = str + "<div class='form-group row'>";
					str = str + "	<div class='col-sm-12' align='center'>";
					str = str + "		<h1>내 판매 상품</h1>";
					str = str + "	</div>";
					str = str + "</div>";
					str = str + "<hr style='margin-bottom:3rem; width:925px'>";
					str = str + "<div style='text-align:right'>판매수/ "+ data.cnt +"</div>"
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1'></div>"
					str = str + "	<div class='col-sm-2'>물품사진</div>"
					str = str + "	<div class='col-sm-1'></div>"
					str = str + "	<div class='col-sm-4'>물품정보</div>"
					str = str + "	<div class='col-sm-4' style='text-align:center'>상태</div>"

					str = str + "</div>";
					console.log(data.arr);

					$.each(data.arr, function(index, arr){						
						str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";
						str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
						str = str + "	<div class='col-sm-3' id='form-inline' style='margin-top:auto; margin-bottom:auto;'>";
						str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
						str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
						str = str + "		<div id='product_nm' style='font-size:16pt'>" + arr.product_nm + "</div>";
						str = str + "	</div>";
						if(arr.state_cd == '3'){
							str = str + "	<div class='col-sm-3' align='right' style='margin:auto;'>진행중</div>";
						}else if(arr.state_nm == '요청'){
							str = str + "	<div class='col-sm-4' align='right' style='margin:auto;padding-right:0;'>";
							str = str + "<buttton class='btn btn-primary' id='stateChan'>요청취소하기</buttton>";
							str = str + "	</div>";
							str = str + "<input type='hidden' id='prodcd' value='"+ arr.product_cd +"'>";
						}else if(arr.state_cd == '2'){
							str = str + "	<div class='col-sm-4' align='right' style='margin:auto;'>요청취소완료</div>";
						}else{
							/* state_cd = "경매종료"; */
							str = str + "<div class='col-sm-2'></div>";
							str = str + "<div class='col-sm-2' align='center' style='margin:auto;'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + arr.state_nm + "</div>";
						}
						
						str = str + "</div><hr>";

					});
					console.log(str);
					var vo = JSON.parse(JSON.stringify(data.vo));

		 			str = str + "<div align='center'>";
					str = str + "	<tr>";
					str = str + "		<td colspan='6'>";
					if(vo.startpage>10){
						str = str + "			<button class='btn btn-light sbtnajax' value='" + (vo.startpage-10) +"' >이전</button>";	
					}
					for(var i = vo.startpage; i <= vo.endpage; i++){
						str = str + "			<button class='btn btn-light sbtnajax' value='"+ i +"'>" + i + "</button>";
					}
					if(vo.endpage<vo.pagecount){
						str = str + "	<button class='btn btn-light sbtnajax' value='"+ (vo.startpage+10) +"' >다음</button>";	
					}
					str = str + "	</td>";
					str = str + "</tr>";
					str = str + "</div>";  
					
					console.log(str);
					$('#sellList').append(str);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
	}
		 
		//=======1:1문의리스트 클릭시 모달창=>문의내용, 관리자답변 보이기
		$(document).on("click", ".qnaclick", function(){

			$('#mtitle').find('h6').text("제목: "+ $(this).children('#title').text());
			$('#mregdate').find('h6').text("등록날짜: "+ $(this).children('#regdate_str').val());
			$('#mcontent').find('h6').text("내용: "+ $(this).children('#content').val());

			$('#a_id ').find('h6').text("관리자: "+ $(this).children('#admin_id').val());
			$('#a_regdate').find('h6').text("등록날짜: "+ $(this).children('#replyregdate').val());
			$('#a_content').find('h6').text("내용: "+ $(this).children('#replycontent').val()); 
			$('#qnaModal').modal('show');
		})
		
		//========1:1문의 내역
		function qnaListAjax(page) {
			$.ajax({
				async: true,
				type: "POST",
				data: member_id,
				url : "/member/qnaList.do/" + page,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					$('#qnaList').empty();

					var str = "";
					str = str + "<div class='form-group row'>";
					str = str + "	<div class='col-sm-12' align='center'>";
					str = str + "		<h1>1:1문의 내역</h1>";
					str = str + "	</div>";
					str = str + "</div>";
					str = str + "<hr style='margin-bottom:3rem; width:925px'>";
					str = str + "	<div style='text-align:right'>문의수/ "+ data.cnt +"</div>"
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1'>순서</div>"
					str = str + "	<div class='col-sm-1' style='padding:0px;'>글번호</div>"

					str = str + "	<div class='col-sm-5' style='padding:0 170px'>제목</div>"
					str = str + "	<div class='col-sm-2'></div>"
					str = str + "	<div class='col-sm-3' style='padding:0 50px; text-align:left'>등록날짜</div>"

					str = str + "</div>";
					console.log("arr="+data.arr);

					$.each(data.arr, function(index, arr){				
						str = str + "<div class='form-group row col-sm-12 qnaclick' style='padding:15px; margin:10px'>";
						str = str + "	<div class='col-sm-1' style='padding-top:10px'>" + arr.rn + "	</div>";
						str = str + "	<div class='col-sm-1' style='padding-top:10px'>" + arr.qna_idx + "	</div>";
/* 						str = str + "	<button class='col-sm-5' id='title' style='padding-top:35px' value='" + arr.title + "'	></button>"; */
 						str = str + "	<div class='col-sm-5' id='title' style='padding-top:10px'>" + arr.title + "	</div>"; 
 						str = str + "	<div class='col-sm-4' style='padding-top:10px' align='right'>" + arr.regdate_str + "	</div>";
						//타이틀 클릭했을 때 모달처리->내가쓴내용, 관리자 답변
						str = str + "	<input type='hidden' id='content' value='"+ arr.content +"'>";
						str = str + "	<input type='hidden' id='regdate_str' value='"+ arr.regdate_str +"'>";
						str = str + "	<input type='hidden' id='admin_id' value='"+ arr.admin_id +"'>";
						str = str + "	<input type='hidden' id='replycontent' value='"+ arr.replycontent +"'>";
						str = str + "	<input type='hidden' id='replyregdate' value='"+ arr.replyregdate +"'>"; 
						str = str + "</div><hr>";

					});
					console.log(str);
					var vo = JSON.parse(JSON.stringify(data.vo));

		 			str = str + "<div align='center'>";
					str = str + "	<tr>";
					str = str + "		<td colspan='6'>";
					if(vo.startpage>10){
						str = str + "			<button class='btn btn-light qbtnajax' value='" + (vo.startpage-10) +"' >이전</button>";	
					}
					for(var i = vo.startpage; i <= vo.endpage; i++){
						str = str + "			<button class='btn btn-light qbtnajax' value='"+ i +"'>" + i + "</button>";
					}
					if(vo.endpage<vo.pagecount){
						str = str + "	<button class='btn btn-light qbtnajax' value='"+ (vo.startpage+10) +"' >다음</button>";	
					}
					str = str + "	</td>";
					str = str + "</tr>";
					str = str + "</div>";  
					
					console.log(str);
					$('#qnaList').append(str);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
	}
		
		$('#getout-tap').click(function(){
			$('#outPwdModal').modal('show');
		});
		
		
		 $('#yes').click(function(){
			 $.ajax({
					async: true,
					type: 'POST',
					url : "/member/delete.do",
					data: member_id,
					contentType: "application/json; charset=UTF-8",
					success : function(data) {
						console.log(data);
						$('#logoutMessage').find('h4').text("그동안 Ecobay를 이용해주셔서 감사합니다");
						$('#logoutModal').modal('show');
						setTimeout(function() {
							logout();
						}, 3000);
						
			        },
			        error: function(data) {
						console.log("error :" + data);
					}
				});  
		}); 
		 $('#logoutYes').click(function(){
		 	logout();	 
		 });
		$('#outConfirmPwd').click(function(event){
		 $('#myModall').css('z-index',99999); 
			$('#outEnter').text("");
			
			var pwd = $('#outPwd').val();//입력받은값
			console.log(pwd);
			if(pwd.length == 0){
				$('#outEnter').text("비밀번호를 입력하세요");
		        return false;
			}
			$.ajax({
				async: true,
				type: 'POST',
				url : "/member/pwdcheck.do",
				data: pwd,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if(data.flag == false){
						$('#outEnter').text("올바른 비밀번호가 아닙니다");
						console.log(data);
						console.log(data.flag);
						return false;
					}else{
						$('#outPwdModal').modal('hide');
						$('#outChkMessage').find('h4').text("정말 탈퇴하시겠습니까?");
						$('#myModall').modal('show');
						
						//?member_id='+data.member_id
					}
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});  
		});
		
		function logout(){
			var form = document.createElement("form");
			
			var seq = document.createElement("input");
				
			var seqVal = $("input[name='_csrf']").val();
			
	        form.action = "/logout";
	        form.method = "post";
	        
            seq.setAttribute("type", "hidden");
            seq.setAttribute('name', "_csrf");
            seq.setAttribute("value", seqVal);
            
            form.appendChild(seq);
            
            document.body.appendChild(form);
	        
	        form.submit();
		}
		
		$('#change').click(function(){
			var pwd = $('#cpwd').val();//입력받은값
			var pwdck = $('#cpwdck').val();
			var retvalue = 0;
			
			
			console.log(pwd);
			if(pwd.length == 0){
				$('#warning').text("비밀번호를 입력하세요");
		        return false;
			}else if(pwd.length != 0){
				$('#warning').text("");
			}
			if(pwdck.length == 0){
				$('#warning2').text("비밀번호를 확인해주세요");
		        return false;
			}else if(pwdck.length != 0){
				$('#warning2').text("");
			}
			if(pwd != pwdck){
				$('#warning2').text("동일한 비밀번호를 확인해주세요");
		        return false;
			}
			$.ajax({
				async: true,
				type: 'POST',
				url : "/member/pwdcheck.do",
				data: pwd,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				success : function(data) {
					if(data.flag == false){
						$('#warning').text("올바른 비밀번호가 아닙니다");
						return false;
						
					}else{
						$('#pwdChange').empty();
						
						var str = "";
						str = str + "<h3>비밀번호변경</h3>";
						str = str + "<div class='form-group row row'>";
						str = str + "	<label class='col-sm-3 col-form-label text-right text-right' for='newPwd'>새 비밀번호</label>";
						str = str + "	<div class='col-sm-5'>";					
						str = str + "		<input class='form-control' id='newPwd' name='newPwd' type='password' placeholder='새 비밀번호'>";					
						str = str + "		<span id='warning3' style='color: red'></span>";
						str = str + "	</div>";	
						str = str + "</div>";	
						str = str + "<div class='form-group row'>";	
						str = str + "	<label class='col-sm-3 col-form-label text-right' for='newPwdck'>비밀번호 확인</label>";	
						str = str + "	<div class='col-sm-5'>";	
						str = str + "		<input class='form-control' id='newPwdck' name='newPwdck' type='password' placeholder='비밀번호 확인'>";	
						str = str + "		<span id='warning4' style='color: red'></span>";	
						str = str + "	</div>";	
						str = str + "</div>";
						str = str + "<div class='form-group row'>";
						str = str + "	<div class='col-sm text-center'>";
						str = str + "	<input type='button' id='update' class='btn btn-lg btn-info' value='새 비밀번호로 변경'>";
						str = str + "	</div>";	
						str = str + "</div>";
						
						$('#pwdChange').append(str);
					}
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});

		});
		$(document).on("click", "#update", function(){
			var pwd = $('#newPwd').val();
			$.ajax({
				async: true,
    			type: 'POST',
    			url : "/member/newpwd.do",
    			data: {"member_id" : member_id, "pwd" : pwd},
    			dataType : "text",
				success : function(data) {
					$('#message').find('h4').text("비밀번호가 변경되었습니다");
					$('#myModal').modal('show');
					$("#myinfo-tap").tab('show');
					
					$('#pwdChange').empty();
					
					var str = "";
					str = str + "<h3>비밀번호변경</h3>";
					str = str + "<div class='form-group row row'>";
					str = str + "	<label class='col-sm-3 col-form-label text-right text-right' for='pwd'>비밀번호</label>";
					str = str + "	<div class='col-sm-5'>";					
					str = str + "		<input class='form-control' id='pwd' name='pwd' type='password' placeholder='비밀번호'>";					
					str = str + "		<span id='warning3' style='color: red'></span>";
					str = str + "	</div>";	
					str = str + "</div>";	
					str = str + "<div class='form-group row'>";	
					str = str + "	<label class='col-sm-3 col-form-label text-right' for='newPwdck'>비밀번호 확인</label>";	
					str = str + "	<div class='col-sm-5'>";	
					str = str + "		<input class='form-control' id='pwdck' name='pwdck' type='password' placeholder='비밀번호 확인'>";	
					str = str + "		<span id='warning4' style='color: red'></span>";	
					str = str + "	</div>";	
					str = str + "</div>";
					str = str + "<div class='form-group row'>";
					str = str + "	<div class='col-sm text-center'>";
					str = str + "	<input type='button' id='change' class='btn btn-lg btn-info' value='확인'>";
					str = str + "	</div>";	
					str = str + "</div>";
					
					$('#pwdChange').append(str);
		        },
		        error: function(data) {
					console.log("error :" + data);
				}
			});
		});
});