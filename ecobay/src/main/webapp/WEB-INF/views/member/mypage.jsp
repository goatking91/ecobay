<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<script>
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
				str = str + "<h3>관심 상품</h3>";
				str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
				str = str + "	<label class='checkbox'>";
				str = str + "		<input type='checkbox' id ='chK_all' name='chK_all'>";
				str = str + "	</label>";
				str = str + "	<input type='button' class='btn btn-default' id='delchk' value='선택상품 삭제'>";
				str = str + "<div class='col-sm-8'></div>"
				str = str + "<div style='align:right'>관심상품수 "+ data.cnt +"</div>"
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
					str = str + "	<div class='col-sm-5' id='form-inline' style='padding-top:10px'>";
					str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
					str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
					str = str + "		<div id='product_nm'>" + arr.product_nm + "</div>";
					str = str + "	</div>";
					str = str + "	<div id='' class='col-sm-3' align='right' style='padding-top:35px'>" + state_cd + "</div>";
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
					str = str + "<h3>구매 상품</h3>";
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-10'></div>"
					str = str + "	<div style='align:right'>구매상품수 "+ data.cnt +"</div>"
					str = str + "</div>";
					console.log(data.arr);

					$.each(data.arr, function(index, arr){
						
						str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";	
						str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
						str = str + "	<div class='col-sm-5' id='form-inline' style='padding-top:10px'>";
						str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
						str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
						str = str + "		<div id='product_nm'>" + arr.product_nm + "</div>";
						str = str + "	</div>";
						str = str + "	<div>";
						str = str + "		<div id='' class='col-sm-3' align='right' style='padding-top:35px'>" + arr.state_nm + "</div>";
						//낙찰되었지만 구매아직안했을때 payment_proc_cd=1
						if(arr.payment_proc_cd == '1'){
							str = str + "		<a href='/member/payment.do/" + arr.product_cd + "/2'><buttton class='btn btn-info'>구매결제</buttton></a>";
							str = str + "		<button class='btn btn-danger' id='paycanbtn' data-src='" + arr.product_cd + "'>구매취소</button>";
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
					console.log("1");
					
					$('#sellList').empty();

					var str = "";
					str = str + "<h3>판매 상품</h3>";
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-10'></div>"
					str = str + "	<div style='align:right'>판매상품수 "+ data.cnt +"</div>"
					str = str + "</div>";
					console.log(data.arr);

					$.each(data.arr, function(index, arr){						
						str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";
						str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
						str = str + "	<div class='col-sm-5' id='form-inline' style='padding-top:10px'>";
						str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
						str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
						str = str + "		<div id='product_nm'>" + arr.product_nm + "</div>";
						str = str + "	</div>";
						if(arr.state_cd == '3'){
							str = str + "	<div id='' class='col-sm-3' align='right' style='padding-top:35px'>진행중</div>";
						}else if(arr.state_cd == '1'){
							str = str + "<buttton class='btn btn-info' id='stateChan' style='height:30%; margin-top:35px; margin-left:20px'>요청취소</buttton>";
							str = str + "<input type='hidden' id='prodcd' value='"+ arr.product_cd +"'>";
						}else if(arr.state_cd == '2'){
							str = str + "	<div class='col-sm-3' align='right' style='padding-top:35px'>요청취소</div>";
						}else{
							state_cd = "경매종료";
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

			$('#mtitle').find('h5').text("제목: "+ $(this).children('#title').text());
			$('#mregdate').find('h5').text("등록날짜: "+ $(this).children('#regdate_str').val());
			$('#mcontent').find('h5').text("내용: "+ $(this).children('#content').val());

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
					str = str + "<h3>1:1문의 내역</h3>";
					str = str + "<div class='bg-light border-top border-bottom form-inline col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1'>넘버</div>"
					str = str + "	<div class='col-sm-1'>글번호</div>"
					str = str + "	<div class='col-sm-5'>제목</div>"
					str = str + "	<div class='col-sm-2'>등록날짜</div>"
					str = str + "	<div style='align:right'>문의 수 "+ data.cnt +"</div>"
					str = str + "</div>";
					console.log("arr="+data.arr);

					$.each(data.arr, function(index, arr){				
						str = str + "<div class='form-group row col-sm-12 qnaclick' style='padding:15px; margin:10px'>";
						str = str + "	<div class='col-sm-1' style='padding-top:35px'>" + arr.rn + "	</div>";
						str = str + "	<div class='col-sm-1' style='padding-top:35px'>" + arr.qna_idx + "	</div>";
/* 						str = str + "	<button class='col-sm-5' id='title' style='padding-top:35px' value='" + arr.title + "'	></button>"; */
 						str = str + "	<div class='col-sm-5' id='title' style='padding-top:35px'>" + arr.title + "	</div>"; 
 						str = str + "	<div class='col-sm-2' style='padding-top:35px'>" + arr.regdate_str + "	</div>";
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
</script>

<hr>
<div class="container bootstrap snippet" >
	<div class="row">
		<div class="col-sm-10"><h1>${member_name}</h1></div>
		<div class="col-sm-2"></div>
	</div>

	<div class="row">
		<!-- 왼쪽 sub_nav -->
		<div class="col-sm-2">
			<ul class="list-group" id="myTab">
				<li style="list-style:none; color:#5ebded; text-align:center;"><h1><b>MYPAGE</b></h1></li>
            	<li class="list-group-item text-muted" style="text-align:center; padding:1.5rem 1.25rem;">
            		<a style="color:black" id="myinfo-tap" data-toggle="tab" href="#nav-home" role="tab">내 정보</a>
            	</li>
            	<li class="list-group-item sell_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
            		<a style="color:black" id="pwdChange-tap" data-toggle="tab" href="#pwdChange" role="tab">비밀번호 변경</a>
				</li>
            	<li class="list-group-item sell_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="sellList-tap" data-toggle="tab" href="#sellList" role="tab">내 판매상품</a>
				</li>
				<li class="list-group-item menu_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="buyList-tap" data-toggle="tab" href="#buyList" role="tab">내 구매상품</a>
				</li>
				<li class="list-group-item menu_wish" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="wishList-tap" data-toggle="tab" href="#wishList" role="tab">관심상품</a> 
				</li>
				<li class="list-group-item menu_qna" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="qnaList-tap" data-toggle="tab" href="#qnaList" role="tab">1:1문의 내역</a> 
				</li>
				<li class="list-group-item menu_getout" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="getout-tap" data-toggle="tab" href="#getout" role="tab">탈퇴하기</a> 
				</li>
			</ul> 
		</div>
		<!-- 왼쪽 sub_nav 끝 -->
		
		
		<!-- 탭 영역 -->
		<div class="col-sm-10">
			
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="myinfo-tap" >
					<div class="form-group row">
						<div class="col-sm-12" align="center">
							<h1><b>내 정보</b></h1>
						</div>
					</div>
					<div class="col-sm-12">
				        <form>
				        	<div class="form-group row">
								<label class="col-sm-3 col-form-label text-right" for="member_name"><b>이름</b></label>
								<div class="col-sm-4">
									<security:csrfInput/>
									<p id="member_name">${member.member_name}</p>
								</div>
							</div>
				        	
				        	<div class="form-group row">
				          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
						        <div class="col-sm-4">
						        	<div class="input-group">
										<input class="form-control border-0 " style="background-color:white" id="member_id" name="member_id" type="text" value="${member.member_id}" readonly>
									</div>
								</div>
				        		<div class="col-sm-3"></div>
				        	</div>
							<div class="form-group row">
								<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label>
								<div class="col-sm-3">
									<input class="form-control border-0 " style="background-color:white" id="birth" name="birth" type="text" value="${member.birth}" readonly>
								</div>
							</div>
							
							<div class="form-group row">
								<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
								<div class="col-sm-3">
									<input class="form-control border-0 " style="background-color:white" id="gender" name="gender" type="text" value="${member.gender}" readonly>
								</div>
							</div>	
							
							<div class="form-group row">	
							<label class="col-sm-3 col-form-label text-right" for="phone">번호</label>
								<div class="col-sm-3">
									<input class="form-control border-0 " style="background-color:white" id="phone" name="phone" type="text" value="${member.phone}" readonly>
								</div>
							</div>    		
							<div class="form-group row">
								<div class="col-sm-3"></div>
								<div class="col-sm-3">
									<input class="form-control border-0 " style="background-color:white" id="zipcode" name="zipcode" type="text" value="${member.zipcode}" readonly>	                  	
								</div>
							</div> 
							<div class="form-group row">
								<label class="col-sm-3 col-form-label text-right" for="addr1">주소</label>
								<div class="col-sm-6">
									<input class="form-control border-0 " style="background-color:white" id="addr1" name="addr1" type="text" value="${member.addr1}" readonly>
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-3"></div>
								<div class="col-sm-6">
									<input class="form-control border-0 " style="background-color:white" id="addr2" name="addr2" type="text" value="${member.addr2}" readonly>
								</div>	
							</div>
										
							<div class="form-group row">
								<div class="col-sm text-center">
									<input type="button" id="edit_button" class="btn btn-lg btn-primary" value="수정">
								</div>	
							</div>     	
						</form>
					</div>
				</div>
				<!-- 리스트 들어가는 부분 -->
				<div class="tab-pane fade" id="pwdChange" role="tabpanel" aria-labelledby="pwdChange">
					<h3>비밀번호변경</h3>
					<div class="form-group row row center" style="align:center;">
						<label class="col-sm-3 col-form-label text-right text-right" id="pwdlabel" for="pwd">비밀번호</label>
						<div class="col-sm-5">
							<input class="form-control" id="cpwd" name="pwd" type="password" placeholder="비밀번호">
							<span id="warning" style="color: red"></span>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-3 col-form-label text-right" id="pwdcklabel" for="pwdck">비밀번호 확인</label>
						<div class="col-sm-5">
							<input class="form-control" id="cpwdck" name="cpwdck" type="password" placeholder="비밀번호 확인">
							<span id="warning2" style="color: red"></span>
						</div>
					</div>
					<div class="form-group row">
								<div class="col-sm text-center">
									<input type="button" id="change" class="btn btn-lg btn-info" value="확인">
								</div>	
					</div>    
				</div>
				<div class="tab-pane fade" id="sellList" role="tabpanel" aria-labelledby="sellList"></div>
				<div class="tab-pane fade" id="buyList" role="tabpanel" aria-labelledby="buyList"></div>
				<div class="tab-pane fade" id="wishList" role="tabpanel" aria-labelledby="wishList"></div>
				<div class="tab-pane fade" id="qnaList" role="tabpanel" aria-labelledby="qnaList"></div>
			</div>
		</div>
		<!--탭 영역 끝-->
	</div>
</div>                

<!-- 모달 -->

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

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
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
		          <div id="logoutMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="logoutYes">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModall" tabindex="-1" role="dialog" aria-labelledby="myModallabell" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="outChkMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='yes'>확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 요청취소 -->
<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="changeModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="changeMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='ok'>확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">비밀번호를 입력해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group">
		            <label for="pwd" class="col-form-label">비밀번호</label>
		            <input id="pwd" type="password" class="form-control">
		            <span id="enter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="confirmpwd" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="outPwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호를 입력해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group">
		            <label for="outPwd" class="col-form-label">비밀번호</label>
		            <input id="outPwd" type="password" class="form-control">
		            <span id="outEnter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="outConfirmPwd" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 구매취소 -->
<div class="modal fade" id="paycanModal" tabindex="-1" role="dialog" aria-labelledby="paycanModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="paycanmodaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        	<input type="hidden" style="display: none;" class="form-control" id="paycanproduct_cd" name="product_cd" value="">
	      	<div class="row">
	      		<div class="col-md">
		          <div id="paycanMessage">
					<h5 align="center"></h5>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='paycanokbtn'>확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 1:1문의 상세 -->
<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="qnaModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">1:1문의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      	<div>내 질문</div>
	      	<div class="row">
	          <div id="mtitle">
				<h5 align="center"></h5>
	          </div>		      		      	
			</div>
			<div class="row">
	          <div id="mregdate">
				<h5 align="center"></h5>
	          </div>		      		      	
			</div>
			<div class="row">
	          <div id="mcontent">
				<h5 align="center"></h5>
	          </div>		      		      	
			</div>
	  		
	  		<div>답변</div>
	  		<div class="row">
	          <div id="a_id">
				<h6 align="center"></h6>
	          </div>		      		      	
			</div>
			<div class="row">
	          <div id="a_regdate">
				<h6 align="center"></h6>
	          </div>		      		      	
			</div>
			<div class="row">
	          <div id="a_content">
				<h6 align="center"></h6>
	          </div>		      		      	
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='ok'>확인</button>
      </div>
    </div>
  </div>
</div>

           