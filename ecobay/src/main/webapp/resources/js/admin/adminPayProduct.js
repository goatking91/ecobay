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
	ajaxLoadpayProductList(nowPage, searchType, keyWord);
  	
	//페이징 이동 버튼 클릭
	$(document).on("click", ".pagingBtn", function(){
		var movePage = $(this).val();
		nowPage = movePage;
		ajaxLoadpayProductList(movePage, searchType, keyWord);
	});
	
	//검색 버튼 클릭
	$(document).on("click", "#searchBtn", function(){
		searchType = $("#searchType option:selected").val();
		keyWord = $('#keyWord').val();
		
		ajaxLoadpayProductList(1, searchType, keyWord);
	});
	
	// 배송 버튼 클릭
	$(document).on("click", "#delibtn", function() {
		var cd = $(this).attr("data-src");
		var name = $(this).attr("data-src2");
		//var key = $(this).attr("data-src3");
		//var value = $(this).text(); 
		
		productDeli(cd, name);
	});
	
	function productDeli(product_cd, product_nm) {
			$.ajax({
				async: true,
				type: 'POST',
			url : "/admin/ajaxpayproductdeli.do/" + product_cd,
			contentType: "application/json; charset=UTF-8",
		    success : function(data) {
		    	var htmlStr = "";
		    	
				$("#productdelimodaltitle").text(product_nm);
				
				htmlStr += "	<tr>";
				htmlStr += "		<th class='detailTitle'>상품번호</th>";
				htmlStr += "		<td>" + data.deli.product_cd + "</td>";
				htmlStr += "	</tr>";
				htmlStr += "	<tr>";
				htmlStr += "		<th class='detailTitle'>우편번호</th>";
				htmlStr += "		<td>[" + data.deli.deli_zipcode + "] " + data.deli.deli_addr1 + "</td>";
				htmlStr += "	</tr>";
				htmlStr += "	<tr>";
				htmlStr += "		<th class='detailTitle'>상세주소</th>";
				htmlStr += "		<td colspan='2'>" + data.deli.deli_addr2 + "</td>";
				htmlStr += "	</tr>";
				htmlStr += "	<tr>";
				htmlStr += "		<th class='detailTitle'>이름</th>";
				htmlStr += "		<td>" + data.deli.deli_nm + "</td>";
				htmlStr += "	</tr>";
				htmlStr += "	<tr>";
				htmlStr += "		<th class='detailTitle'>전화번호</th>";
				htmlStr += "		<td colspan='2'>" + data.deli.deli_phonenum + "</td>";
				htmlStr += "	</tr>";
				htmlStr += "	<tr>";
				
				var date = new Date(data.deli.regdate);
				var y = date.getFullYear();
			    var M = date.getMonth()+1;
			    var d = date.getDate();
	 		    var h = date.getHours(); // 0 - 23
	 		    var m = date.getMinutes(); // 0 - 59
			    M = (M < 10) ? "0" + M : M;
			    d = (d < 10) ? "0" + d : d;
	 		    h = (h < 10) ? "0" + h : h;
	 		    m = (m < 10) ? "0" + m : m;
	 		    var regdate = y + '-' + M + '-' + d + ' ' + h + ':' + m;
				
				htmlStr += "		<th class='detailTitle'>주문일시</th>";
				htmlStr += "		<td>" + regdate + "</td>";
				htmlStr += "	</tr>";
				
				$("#productdelimessage").find("#productdeli").html(htmlStr);
				$("#productdeliModal").modal("show");
		    },
		    error : function(data) {
		    	console.log("data : " + data);
		    }
		 });
	}
    
	function ajaxLoadpayProductList(movePage, searchType, keyWord) {
		var pagevalue = JSON.stringify({
        	"movePage": movePage,
        	"searchType": searchType,
        	"keyWord": keyWord
        });
		
		$.ajax({
			url : "/admin/ajaxpayproductlist.do",
			data : pagevalue,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			method : "POST",
		    success : function(data, movePage) {
				var htmlStr = "";
				
				$.each(data.list, function(index, list){ 
					htmlStr += "<tr>";
					htmlStr += "	<td>" + list.rn + "</td>";
					htmlStr += "	<td>" + list.product_cd +"</td>";
					htmlStr += "	<td>" + list.product_nm +"</td>";
					htmlStr += "	<td>" + list.money_pay +"원</td>";
					htmlStr += "	<td>" + list.member_id + "(" + list.member_nm +")</td>";
					
					var date = new Date(list.regdate);
					var y = date.getFullYear();
				    var M = date.getMonth()+1;
				    var d = date.getDate();
				    M = (M < 10) ? "0" + M : M;
				    d = (d < 10) ? "0" + d : d;
				  	var day= y + "-" + M + "-" + d;
				  	htmlStr += "	<td>" + day +"</td>";
				  	
				  	if(list.deli_div_cd == '2') {
				  		htmlStr += "	<td>";
				  		htmlStr += "		<button class='btn-sm btn-warning' id='delibtn' data-src='" + list.product_cd + "' data-src2='" + list.product_nm + "' data-src3='2'>배송</button>";
				  		htmlStr += "	</td>";
				  	}
				  	else{
				  		htmlStr += "	<td>직거래</td>";
				  	}
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
}); /* END 물품결제현황 AJAX */