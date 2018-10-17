//jquery 시작
$(function() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
	$('#content').summernote({
		lang: 'ko-KR',
        height: 350
    });
	
	var noticeIDX = $('#noticeIDX').val();
	
	ajaxLoadFileList(noticeIDX);
	
	//삭제 버튼 이벤트
	$(document).on("click", ".filedelBtn", function(){
		var fileidx = $(this).attr("id");
		
		var modalBtnHtml = "<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>";
		modalBtnHtml += "<button id='modalConfirmBtn' type='button' class='btn btn-primary'>확인</button>";
		
		$('.modal-title').text("삭제 안내");
		$('.modal-body').find('p').html("정말 삭제 하시겠습니까?<br><small style='color:red;'>※삭제 처리가 바로 적용됩니다.</small>");
		$('.modal-footer').html(modalBtnHtml);
		$('#myModal').modal('show');
		
		
		//삭제 '확인' 이벤트
		$(document).on("click", "#modalConfirmBtn", function(){
			//삭제처리 AJAX
			$.ajax({
				url : "/admin/board/ajaxfiledelete.do",
				data : {
		        	"fileidx": fileidx
		        },
		        method : "GET",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
			    success : function(data) {
					if (data.isSuccess == 'true') {
						modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
		        		$('.modal-title').text("삭제 완료");
		    			$('.modal-body').find('p').html("삭제가 완료 되었습니다.<br><small style='color:red;'>파일 복구는 관리자에게 문의하세요</small>");
		    			$('.modal-footer').html(modalBtnHtml);
		    			$('#myModal').modal('show');
		    			
						ajaxLoadFileList(noticeIDX);
					}
			    },
			    error : function(jqXHR, data) {
			    	console.log("error : "+ jqXHR.status);
			    	console.log("data : " + data);
			    }
			 });//삭제 처리 AJAX 종료
		}); //삭제 '확인' 버튼 이벤트 종료
		
	});//삭제 버튼 이벤트 종료
	
	
	//수정 버튼 이벤트
	$(document).on("click", "#noticeModBtn", function(){
		var title = $('#title').val();
		var content = $('#content').val();
		noticeIDX = $('#noticeIDX').val();
		
		var modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
		
		if (title == '') {
			$('.modal-title').text("안내");
			$('.modal-body').find('p').html("제목이 비었습니다.<br>제목을 입력해 주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
		}
		
		if (content == '') {
			$('.modal-title').text("안내");
			$('.modal-body').find('p').html("내용이 비었습니다.<br>내용을 입력해 주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
		}
		
		
        var formData = new FormData($("#noticeModForm")[0]);
        $.ajax({
            type : 'post',
            url : '/admin/board/noticemod.do',
            data : formData,
            processData : false,
            contentType : false,
            success : function() {
   				location.href="/admin/board/noticedetail.do?idx="+noticeIDX;
            },
            error : function(error) {
            	$('.modal-title').text("안내");
    			$('.modal-body').find('p').html("공지사항 수정에 실패하였습니다.<br>다시 한번 확인해주세요.");
    			$('.modal-footer').html(modalBtnHtml);
    			$('#myModal').modal('show');
            }
   		});
		
	});
	
	
	
});//Jqery종료

//파일 리스트 AJAX
function ajaxLoadFileList(noticeIDX) {
	$.ajax({
		url : "/admin/board/ajaxfilelist.do",
		data : {
        	"idx": noticeIDX
        },
        method : "GET",
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
	    success : function(data) {
			var htmlStr = "";
			
			htmlStr += "<th class='colTitle'>첨부파일</th>";
			htmlStr += "<td>";
			
			for (var i = 0; i <= 2; i++) {
				

				if (data.fileList[i] != null) {
					htmlStr += "<div id='fileUpload'>";
					htmlStr += 	"<input id='upload_"+ i +"' type='file' name='upload'>";
					htmlStr += 	"<a href='/admin/board/download.do?fileidx="+ data.fileList[i].file_idx +"&noticeidx="+ data.fileList[i].notice_idx +"'>"+data.fileList[i].filename_org+"</a>";
					htmlStr += 	"<span style='font-size: 11px;'>";
					htmlStr += 		"(" + data.fileList[i].fileSizeByte + " KByte)";
					htmlStr += 	"</span>";
					htmlStr += 	"<button type='button' id='"+ data.fileList[i].file_idx +"' class='btn btn-sm btn-danger filedelBtn'>삭제</button>";
					htmlStr += "</div><br>";
				} else {
					htmlStr += "<div id='fileUpload'>";
					htmlStr += 	"<input id='upload_"+ i +"' type='file' name='upload'>";
					htmlStr += "</div><br>";
				}
			}
			
			htmlStr += "</td>";
			
			$('#fileListTR').empty();
            $('#fileListTR').append(htmlStr);             
            $('#fileListTR').val('');
	            
            
	    },
	    error : function(jqXHR, data) {
	    	console.log("error : "+ jqXHR.status);
	    	console.log("data : " + data);
	    }
	 });
}//파일 리스트 AJAX 종료