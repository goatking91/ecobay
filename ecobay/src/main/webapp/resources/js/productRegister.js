$(function() {
	
	// ajax처리시 권한 스크립트
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	
	// 대분류에 따른 중분류 가져오기
	$("select[name='class_big_cd']").change(function(){  // 셀렉트 박스가 체인지 될때 이벤트  - "select[name=classBig]"
		var valBig = $(this).val(); // 현재 선택된 값

		if(valBig == "" || valBig == null) {
			$("select[name='class_mid_cd'] option").remove();
			$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
		}
		else {
			$.getJSON("/product/midclass.do/" + valBig, function(data) {
				$("select[name='class_mid_cd'] option").remove();
				$("select[name='class_mid_cd']").append("<option value='XX'>-중분류 선택-</option>");
				$.each(data, function(i, d) {
					$("select[name=class_mid_cd]").append('<option value="' + d.class_mid_cd + '">' + d.class_mid_nm + '</option>'); 
				}); 
			});
		}
	});
	
	// 파일 처리
	var idx = 0;
	
	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();
		
		var files = event.originalEvent.dataTransfer.files;
		
		var file = files[0];
		
		//console.log(file);
		var formData = new FormData();
		
		formData.append("file", file);
		 
		$.ajax({
			url: "/product/uploadAjax.do",
			data: formData,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "POST",
			success: function(data) {
				
				var str = "";
				
				var fileName = getImageLink(data); 
				var originalName = getOriginalName(data);
				var thumbName = data;
				
				if(checkImageType(data)) {
					str = "<div style='display:inline;'><img src='/product/displayFile.do?fileName=" + thumbName + "'/>"
						+ "<small data-src=" + thumbName + ">X</small>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename' value='" + fileName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename_org' value='" + originalName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].filename_thumb' value='" + thumbName + "'>"
						+ "<input style='display:none;' type='hidden' name='ivo["+idx+"].img_idx' value='" + idx + "'>&nbsp;&nbsp;&nbsp;</div>";
				}else {
					alert("이미지 파일로 올려주세요.");
				}
				idx = idx + 1;
				$(".uploadedList").append(str);
			}
		});
	});
	
	function checkImageType(fileName) {
		
		var pattern = /jpg$|gif$|png$|jpeg$/i;
		
		return fileName.match(pattern);
		
	}
	
	function getFileName(fileName) {
		
		var idx = fileName.indexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	function getOriginalName(fileName) {
		
		var idx = fileName.lastIndexOf("_") + 1;
		return fileName.substr(idx);
	}
	
	
	function getImageLink(fileName) {
		
		if(!checkImageType(fileName)) {
			return;
		}
		
		var front = fileName.substr(0,12);
		var end = fileName.substr(14);
		
		return front + end;
	}
	
	$(".uploadedList").on("click", "small", function(event) {
		
		var that = $(this);
		
		$.ajax({
			url: "/product/deleteFile.do",
			type: "post",
			data: {fileName:$(this).attr("data-src")},
			dataType: "text",
			success: function(result) {
				if(result=="deleted") {
					that.parent("div").remove();
				}
			}
		});
	});

	
	// 배송구분코드(라디오버튼)에 배송구분명 처리.
	$("#deli_div_cd").children().click(function() {
		var str = "";
		var check = $("input[name='dvo.deli_div_cd']:checked").val();
		$("#deli_div_nm").html("");
		if(check==1) {
			str = "<input style='display:none;' type='hidden' name='dvo.deli_div_nm' value='직거래'>";
			$("#deli_div_nm").append(str);
		}else if(check==2) {
			str = "<input style='display:none;' type='hidden' name='dvo.deli_div_nm' value='택배'>";
			$("#deli_div_nm").append(str);
		}
	});
	
	// CKEdit 연동
	CKEDITOR.replace( 'content' );
	
	// 즉시구매여부에 따른 금액입력 활성화 처리.
	$('#baynow_yn').click(function()
	{
		var ck = this.checked;

		if(ck == true)
		{
			$('#baynow_money').removeAttr("disabled");
		}
		else
		{
			$('#baynow_money').val('');
			$('#baynow_money').attr("disabled", true);
		}
	});
	
	// flatpickr 연동 처리.
    $( "#acutdate_start_str" ).flatpickr({
    	minDate: 'today',
    	enableTime: true,
    	time_24hr: true,
        dateFormat: 'Y-m-d H:i',
        onReady: function (selectedDates, dateStr, instance) {
            $('#acutdate_start_str input').val(
                instance.formatDate(new Date(), 'Y-m-d H:i')
            )
		}
    });
	
	// 등록 사전 체크작업
	$('#regbutton').click(function(event){
		var class_big_cd = $("#class_big_cd").val();
		var class_mid_cd = $("#class_mid_cd").val();
		var product_nm = $("#product_nm").val();
		var content = CKEDITOR.instances.content.getData(); // CKEdit 값 가져오기.
		
		var money_first = $("#money_first").val(); // 시작가(최소 100원)
		var money_unit = $("#money_unit").val();
		var acutdate_start_str = $("#acutdate_start_str").val();
		var auctdate_unit = $("#auctdate_unit").val();
		var baynow_yn = $("#baynow_yn").is(":checked"); //$("#baynow_yn").val();
		var baynow_money = $("#baynow_money").val(); // 여부 체크시 금액 있어야 함.
		
		// 배송구분 - 라디오버튼으로 하나는 선택되어있음 - 체크루틴 필요없음.
//		var deli_div_cd = $("#deli_div_cd").val();
//		var deli_div_nm = $("#deli_div_nm").val();
		
		// 상품정보 체크
        if(class_big_cd == null || class_big_cd.length == 0) {
            $('#message').find('h4').text("대분류를 선택하세요.");
        	$('#myModal').modal('show');
            $("#class_big_cd").focus();
            return false;
        }
        
        if(class_mid_cd == null || class_mid_cd.length == 0 || class_mid_cd == "XX") {
            $('#message').find('h4').text("중분류를 선택하세요.");
        	$('#myModal').modal('show');
            $("#class_mid_cd").focus();
            return false;
        }

        if(product_nm.length == 0) {
            $('#message').find('h4').text("물품제목를 선택하세요.");
        	$('#myModal').modal('show');
            $("#product_nm").focus();
            return false;
        }

        if(content.length == 0) {
            $('#message').find('h4').text("물품설명을 입력하세요.");
        	$('#myModal').modal('show');
            $("#content").focus();
            return false;
        }
        
		// 이미지 존재여부 체크 -- // 이미지 - 최소 1개 이상 있어야 함.
        if(idx == 0) {
            $('#message').find('h4').text("이미지를 1개 이상 넣어주세요.");
        	$('#myModal').modal('show');
            return false;
        }

        // 경매설정 체크
        if(money_first.length == 0) {
            $('#message').find('h4').text("시작가를 입력하세요.");
        	$('#myModal').modal('show');
            $("#money_first").focus();
            return false;
        }
        else if(money_first < 100) {
            $('#message').find('h4').text("시작가를 100원이상 입력하세요.");
        	$('#myModal').modal('show');
            $("#money_first").focus();
            return false;
        }

        if(money_unit.length == 0) {
            $('#message').find('h4').text("입찰단위를 선택하세요.");
        	$('#myModal').modal('show');
            $("#money_unit").focus();
            return false;
        }

        if(acutdate_start_str.length == 0) {
            $('#message').find('h4').text("경매시작일시를 선택하세요.");
        	$('#myModal').modal('show');
            $("#acutdate_start_str").focus();
            return false;
        }
        if(auctdate_unit.length == 0) {
            $('#message').find('h4').text("경매기간을 선택하세요.");
        	$('#myModal').modal('show');
            $("#auctdate_unit").focus();
            return false;
        }

        if(baynow_yn == true) {
        	if(baynow_money.length == 0) {
                $('#message').find('h4').text("즉시구매가를 입력하세요.");
            	$('#myModal').modal('show');
                $("#baynow_money").focus();
                return false;
        	}
        	else if(baynow_money < 100) {
                $('#message').find('h4').text("즉시구매가를 100원 이상 입력하세요.");
            	$('#myModal').modal('show');
                $("#baynow_money").focus();
                return false;
        	}
        }
    });
 });