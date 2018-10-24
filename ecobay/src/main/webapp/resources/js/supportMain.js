$(function(){
		/* ajax 시큐리티 토큰 */
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
		
	    loadNoticeAjax();
	    loadFaqAjax();
		
	});
	
	

	function loadNoticeAjax() {
		$.ajax({
			url : "/ajaxnoticelist.do",
			method : "POST",
	        cache : false,
	        success : function(data) {
				var htmlStr = "";
				for (var i = 0; i < data.noticeTopList.length; i++) {
					
					htmlStr += "<tr>";
					htmlStr += "<td>" + (i+1) + "</td>";
					htmlStr += "<td><a href='/support/notice/noticedetail.do?idx="+ data.noticeTopList[i].notice_idx +"'>" + data.noticeTopList[i].title + "</a></td>";
					htmlStr += "<tr>";
				}
	            $('#noticeTbody').empty();
	            $('#noticeTbody').append(htmlStr);
	            $('#noticeTbody').val('');
	        },
	        error : function(jqXHR, data) {
	        	console.log("error :"+ jqXHR.status);
	        	console.log("data : " + data);
	        }
	    });
	}
	
	
	function loadFaqAjax() {
		$.ajax({
			url : "/ajaxfaqlist.do",
			method : "POST",
	        cache : false,
	        success : function(data) {
				var htmlStr = "";
				for (var i = 0; i < data.faqTopList.length; i++) {
					htmlStr += "<tr>";
					htmlStr += "<td>" + (i+1) + "</td>";
					htmlStr += "<td><a id='" + data.faqTopList[i].faq_idx + "' href='#'>" + data.faqTopList[i].title + "</a></td>";
					htmlStr += "<tr>";
				}
		            $('#faqTbody').empty();
		            $('#faqTbody').append(htmlStr);             
		            $('#faqTbody').val('');
	        },
	        error : function(jqXHR) {
	        	console.log("error :"+ jqXHR.status);
	        }
	    });
	}