$(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	$(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	
	var searchType = $("#searchType option:selected").val();
	var keyWord = $('#keyWord').val();
    var nowPage = $('#curPage').val();
    
  	//초기 리스트 ajax LOAD
	ajaxLoadProductList(nowPage, searchType, keyWord);
  	
	//페이징 이동 버튼 클릭
	$(document).on("click", ".pagingBtn", function(){
		var movePage = $(this).val();
		nowPage = movePage;
		ajaxLoadProductList(movePage, searchType, keyWord);
	});
	
	//검색 버튼 클릭
	$(document).on("click", "#searchBtn", function(){
		searchType = $("#searchType option:selected").val();
		keyWord = $('#keyWord').val();
		
		ajaxLoadProductList(1, searchType, keyWord);
	});
    
	function ajaxLoadProductList(movePage, searchType, keyWord) {
		
		var pagevalue = JSON.stringify({
        	"movePage": movePage,
        	"searchType": searchType,
        	"keyWord": keyWord
        });
		
		$.ajax({
			url : "/admin/ajaxproductlist.do",
			data : pagevalue,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			method : "POST",
		    success : function(data, movePage) {
				var htmlStr = "";
				
				$.each(data.list, function(index, list){ 
					htmlStr += "<tr>";
					htmlStr += "	<td>" + list.rn + "</td>";
					htmlStr += "	<td>" + list.product_nm +"</td>";
					
					var date = new Date(list.regdate);
					var y = date.getFullYear();
				    var M = date.getMonth()+1;
				    var d = date.getDate();
				    M = (M < 10) ? "0" + M : M;
				    d = (d < 10) ? "0" + d : d;
				  	var day= y + "-" + M + "-" + d;
				  	htmlStr += "	<td>" + day +"</td>";
				  	htmlStr += "	<td>" + list.state_nm + "</td>";
				  	htmlStr += "	<input type='hidden' style='display: none;' id='state_cd' value='" + list.state_cd + "'>";
					htmlStr += "</tr>";
				});
				
				$("#tbody").empty();
				$("#tbody").append(htmlStr);
				$("#prodCnt").html("count: " + data.cnt);
		            
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
		    error : function(data) {
		    	console.log("data : " + data);
		    }
		 });
	}
}); /* END 물품현황 AJAX */