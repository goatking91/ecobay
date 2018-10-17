$(function() {
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    
	    var noticeIDX = $('#noticeIDX').val();
	    ajaxLoadFileList(noticeIDX);
		
		$('#delBtn').click(function(event){
			$('#message').find('h5').text("삭제가 완료되었습니다.");
			$('#myModal').modal('show');
			
		});
		
		$('#delConfirm').click(function(event){
			var idx = $('#noticeIDX').val();
			location.href="/admin/board/noticedel.do?idx="+idx;
		});
		
	});
	
	
	/** FILE 리스트 AJAX **/
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
				
				for (var i = 0; i <= data.fileList.length; i++) {
					if (data.fileList[0] == null && data.fileList[1] == null && data.fileList[2] == null) {
						htmlStr += "첨부파일이 존재하지 않습니다.";
					} else if(data.fileList[i] != null) {
						htmlStr += 	"<a href='/admin/board/download.do?fileidx="+ data.fileList[i].file_idx +"&noticeidx="+ data.fileList[i].notice_idx +"'>"+data.fileList[i].filename_org+"</a>";
						htmlStr += 	"<span style='font-size: 11px;'>";
						htmlStr += 		"(" + data.fileList[i].fileSizeByte + " KByte)";
						htmlStr += 	"</span><br>";	
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
	}/* END FILE 리스트 AJAX */