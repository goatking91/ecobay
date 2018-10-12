$(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    var searchType = $("#searchType option:selected").val();
	var keyWorld = $('#keyWorld').val();
    var nowPage = $('#curPage').val();
    
    //초기 리스트 ajax LOAD
	ajaxLoadQnaList(nowPage, searchType, keyWorld);
	
	
	
	//페이징 이동 버튼 클릭
	$(document).on("click", ".pagingBtn", function(){
		var movePage = $(this).val();
		nowPage = movePage;
		ajaxLoadQnaList(movePage, searchType, keyWorld);
	});
	
	//검색 버튼 클릭
	$(document).on("click", "#searchBtn", function(){
		searchType = $("#searchType option:selected").val();
		keyWorld = $('#keyWorld').val();
		
		ajaxLoadQnaList(1, searchType, keyWorld);
	});
	
	//수정 버튼 클릭
	$(document).on("click", ".modBtn", function(){
		var idx = $(this).attr("id");
		
		location.href="/admin/board/noticemod.do?idx="+idx;
	});
	
	$(document).on("click", ".del", function(){
		var idx = $(this).attr("id");
		
		location.href="/admin/board/noticedel.do?idx="+idx;
	});
	
	//삭제 버튼 클릭
	$(document).on("click", ".delBtn", function(){
		var idx = $(this).attr("id");
		
		var modalBtnHtml = "<button type='button' class='btn btn-secondary' data-dismiss='modal'>취소</button>";
		modalBtnHtml += "<button id='modalConfirmBtn' type='button' class='btn btn-primary'>확인</button>";
		
		$('.modal-title').text("삭제 안내");
		$('.modal-body').find('p').text("정말 삭제 하시겠습니까?");
		$('.modal-footer').html(modalBtnHtml);
		$('#myModal').modal('show');
		
		$('#modalConfirmBtn').click(function(event){
			
			$.ajax({
				url : "/admin/board/ajaxnoticedel.do",
				data : idx,
				method : "POST",
				dataType : "json",
				contentType: "application/json; charset=UTF-8",
		        success : function(data) {
		        	if(data.isSuccess == 'true') {
		        		modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
		        		$('.modal-title').text("삭제 완료");
		    			$('.modal-body').find('p').text("삭제가 완료 되었습니다.");
		    			$('.modal-footer').html(modalBtnHtml);
		    			$('#myModal').modal('show');
		    			
		    			ajaxLoadQnaList(nowPage, searchType, keyWorld);
					}
		        },
		        error : function(jqXHR) {
		        	console.log("error :"+ jqXHR.status);
		        }
		     });
			
		});
		
	});
	
	
	
	
	
});


/** QNA 리스트 AJAX **/
function ajaxLoadQnaList(movePage, searchType, keyWorld) {
	$.ajax({
		url : "/admin/board/ajaxnoticelist.do",
		data : {
        	"movePage": movePage,
        	"searchType": searchType,
        	"keyWorld": keyWorld
        },
		dataType : "json",
		contentType: "application/json; charset=UTF-8",
		method : "GET",
	    success : function(data, movePage) {
			var htmlStr = "";
			
			for (var i = 0; i < data.noticeList.length; i++) {
				
				/* 날짜 패턴 변경 */
				var date = new Date(data.noticeList[i].regDate);
				var y = date.getFullYear();
			    var M = date.getMonth()+1;
			    var d = date.getDate();
			    M = (M < 10) ? "0" + M : M;
			    d = (d < 10) ? "0" + d : d;
			  	var day= y + "-" + M + "-" + d;
				
				
				htmlStr += "<tr>";
				htmlStr += 	"<td>" + data.noticeList[i].notice_idx + "</td>";
				htmlStr += 	"<td><a href='/admin/board/noticedetail.do?idx=" + data.noticeList[i].notice_idx + "'>" + data.noticeList[i].title + "</a></td>";
				htmlStr += 	"<td>관리자</td>";
				htmlStr += 	"<td>" + day + "</td>";
				htmlStr += 	"<td>" + data.noticeList[i].viewCNT + "</td>";
				htmlStr += 	"<td>";
				htmlStr += 		"<a href='#'><button type='button' id='" + data.noticeList[i].notice_idx + "' class='btn btn-sm btn-secondary modBtn'>수정</button></a>";
				htmlStr += 		"<a href='#'><button type='button' id='" + data.noticeList[i].notice_idx + "' class='btn btn-sm btn-danger delBtn'>삭제</button></a>";
				htmlStr += 	"</td>";
				htmlStr += "</tr>";

			}
			
			$('#noticeListTbody').empty();
            $('#noticeListTbody').append(htmlStr);             
            $('#noticeListTbody').val('');
	            
	            
	        var htmlStr2 = "";
	      		
	        htmlStr2 += "<input type='hidden' id='curPage' value='" + movePage + "'>";
	        
	        if (data.pagination.curRange != 1 || data.pagination.curPage != 1) {
				htmlStr2 += "<button type='button' class='btn pagingBtn' value='1'>처음</button>";
				htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.prevPage + "'>이전</button>";
			} else {
				htmlStr2 += "<button type='button' class='btn' value='1' disabled>처음</button>";
				htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.prevPage + "' disabled>이전</button>";
			}
	        
            for (var nowPage = data.pagination.startPage; nowPage <= data.pagination.endPage; nowPage++) {
            	if (nowPage == data.pagination.curPage) {
            		htmlStr2 += "<button type='button' class='btn btn-primary pagingBtn' value='"+ nowPage +"'>" + nowPage + "</button>";
				}else if(nowPage != data.pagination.curPage) {
					htmlStr2 += "<button type='button' class='btn pagingBtn' value='"+ nowPage +"'>" + nowPage + "</button>";
				}
            }
            
            if (data.pagination.curRange != data.pagination.totalPage && data.pagination.totalPage > 0) {
				htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.nextPage + "'>다음</button>";
				htmlStr2 += "<button type='button' class='btn pagingBtn' value='" + data.pagination.totalPage + "'>끝</button>";
			} else {
				htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.nextPage + "' disabled>다음</button>";
				htmlStr2 += "<button type='button' class='btn' value='" + data.pagination.totalPage + "' disabled>끝</button>";
			}
            
            $('#pagination').empty();
            $('#pagination').append(htmlStr2);             
            $('#pagination').val('');
            
	    },
	    error : function(jqXHR, data) {
	    	console.log("error : "+ jqXHR.status);
	    	console.log("data : " + data);
	    }
	 });
}/* END QNA 리스트 AJAX */