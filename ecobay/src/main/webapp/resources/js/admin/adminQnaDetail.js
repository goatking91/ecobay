$(function(){
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
		
		loadReQna();
		
		$('#reQnaArea').summernote({
			lang: 'ko-KR',
	        height: 150
	      });


		$('#delBtn').click(function(event){
			$('#message').find('h5').text("삭제가 완료되었습니다.");
			$('#myModal').modal('show');
			
		});
		
		$('#delConfirm').click(function(event){
			var idx = $('#qna_idx').val();
			location.href="/admin/board/qnadel.do?idx="+idx;
		});
		
		
		$(document).on("click", ".redel", function(){
			var qnarp_idx = $(this).attr("id");
			$.ajax({
				url : "/admin/board/reqnadel.do",
				data : qnarp_idx,
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
				method : "POST",
		        cache : false,
		        success : function(data) {
		        	if(data.isSuccess == 'true') {
						loadReQna();
					}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
		});
		
		
		//답변 등록버튼 클릭
		$('#regReQnaBtn').click(function() {
			var reQnaArea =$('#reQnaArea').val();
			
			if(reQnaArea.length == 0 ){
				$('#message').find('h5').text("답변내용이 비었습니다.");
				$('#myModal').modal('show');
                return false;
            } else {
            	$.ajax({
                	url : "/admin/board/reqnareg.do",
                    data : {
                    	"idx": $("#qna_idx").val(),
                        "content": $("#reQnaArea").val()                                                                                                            
                    },
					dataType : "json",
					method : "POST",
					cache : false,
					success : function(data) {
						if(data.isSuccess == 'true') {
							loadReQna();
						}
					},
					error : function(jqXHR) {
						console.log("error :"+ jqXHR.status);
					}
				});
			}
		});
	});
	
	
	/* QNA답글 리스트 AJAX */
	function loadReQna() {
	var idx = $('#qna_idx').val();
	$.ajax({
		url : "/admin/board/reqnalist.do",
		data : idx,
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		method : "POST",
        cache : false,
        success : function(data) {
			var htmlStr = "";
				for (var i = 0; i < data.qnaReplyList.length; i++) {
					if (data.qnaReplyList[i].qnarp_idx != 0) {
	            		htmlStr += "<tr><td>관리자</td>";
	            		htmlStr += "<td>" + data.qnaReplyList[i].content + "</td>";
	            		htmlStr += "<td><button type='button' class='btn btn-sm btn-danger redel' id='"  + data.qnaReplyList[i].qnarp_idx + "'>삭제</button></td></tr>"
					}
				}
	            $('#reQnaTable').empty();
	            $('#reQnaTable').append(htmlStr);             
	            $('#reQnaArea').val('');
        },
        error : function(jqXHR) {
        	console.log("error :"+ jqXHR.status);
        }
     });
	}/* END QNA답글 리스트 AJAX */