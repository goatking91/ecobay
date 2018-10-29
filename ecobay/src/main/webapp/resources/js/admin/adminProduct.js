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
	
	//행클릭시 상세보기 모달 호출
	$(document).on("click", ".listtd", function(){
		var cd = $(this).attr("data-src");

		productDetail(cd);
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
					htmlStr += "	<td class='listtd'  data-src='" + list.product_cd + "'>" + list.rn + "</td>";
					htmlStr += "	<td class='listtd'  data-src='" + list.product_cd + "'>" + list.product_nm +"</td>";
					
					var date = new Date(list.regdate);
					var y = date.getFullYear();
				    var M = date.getMonth()+1;
				    var d = date.getDate();
				    M = (M < 10) ? "0" + M : M;
				    d = (d < 10) ? "0" + d : d;
				  	var day= y + "-" + M + "-" + d;
				  	htmlStr += "	<td class='listtd'  data-src='" + list.product_cd + "'>" + day +"</td>";
				  	htmlStr += "	<td class='listtd'  data-src='" + list.product_cd + "'>" + list.state_nm + "</td>";
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
	
	function productDetail(product_cd) {
		$.ajax({
			async: true,
			type: 'POST',
		url : "/admin/ajaxreqproductdetail.do/" + product_cd,
		contentType: "application/json; charset=UTF-8",
	    success : function(data) {
	    	var htmlStr = "";
	    	var htmlStrProd = "";
	    	var htmlStrImg = "";
	    	var htmlStrContent = "";
	    	
			$("#productdetailmodaltitle").text(data.prod.product_nm);
			
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>상품번호</th>";
			htmlStrProd += "		<td colspan='2'>" + data.prod.product_cd + "</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>분류</th>";
			htmlStrProd += "		<td>" + data.prod.class_big_nm + "</td>";
			htmlStrProd += "		<td>" + data.prod.class_mid_nm + "</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>경매기간</th>";
			htmlStrProd += "		<td colspan='2'>" + data.auct.acutdate_start_str + "~" + data.auct.acutdate_end_str + "</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>시작가</th>";
			htmlStrProd += "		<td colspan='2'>" + data.auct.money_first + "원" + "</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>입찰단위</th>";
			htmlStrProd += "		<td colspan='2'>" + data.auct.money_unit + "원" + "</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>즉시구매</th>";
			if(data.auct.baynow_yn == true) {
				htmlStrProd += "		<td>" + data.auct.baynow_money + "원" + "</td>";
				htmlStrProd += "		<td>" + "즉시구매가능" + "</td>";
			}
			else {
				htmlStrProd += "		<td>" + " - 원 " + "</td>";
				htmlStrProd += "		<td>" + "즉시구매불가" + "</td>";
			}
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>판매자정보</th>";
			htmlStrProd += "		<td colspan='2'>" + data.prod.member_nm + "(" + data.prod.member_id + ")</td>";
			htmlStrProd += "	</tr>";
			htmlStrProd += "	<tr>";
			htmlStrProd += "		<th class='detailTitle'>배송정보</th>";
			htmlStrProd += "		<td colspan='2'>" + data.deli.deli_div_nm + "</td>";
			htmlStrProd += "	</tr>";

			// 이미지 출력 영역 - imglist
			$.each(data.imglist, function(index, imglist){ 
				htmlStrImg += "			<div style='width:auto;'>"; //overflow: hidden
				htmlStrImg += "				<img src='/displayFile.do?fileName=" + imglist.filename + "' style='margin-left: auto; margin-right: auto; display: block; max-width:100%;'>";
				htmlStrImg += "			</div>";
			});
			
			// 상품설명 출력영역 - prod.content
			htmlStrContent += "	<tr>";
			htmlStrContent += "		<td>";
			htmlStrContent += "			<div id='content' style='width:auto;'>";
			htmlStrContent += data.prod.content;
			htmlStrContent += "			</div>";
			htmlStrContent += "		</td>";
			htmlStrContent += "	</tr>";
			
			$("#productdetailmessage").find("#prodinfo").html(htmlStrProd);
			
			$("#productdetailmessage").find("#imginfo").html(htmlStrImg);
			$("#productdetailmessage").find("#prodcontent").html(htmlStrContent);
			
			
			$("#productdetailModal").modal("show");
	    },
	    error : function(data) {
	    	console.log("data : " + data);
	    }
	 });
}
}); /* END 물품현황 AJAX */