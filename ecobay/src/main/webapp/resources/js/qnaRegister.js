$(function() {
	
	/*======================================================================================*/
	// ajax처리시 권한 스크립트
	/*======================================================================================*/
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	
	$('#content').summernote({
		lang: 'ko-KR',
        height: 350,
        callbacks: {
        	onImageUpload: function(files, editor, welEditable) {
        		for (var i = files.length - 1; i >= 0; i--) {
        			sendFile(files[i], this);
        		}
        	}
        } 
      });
	
	function sendFile(file, el) {
	      var form_data = new FormData();
	      form_data.append('file', file);
	      $.ajax({
	        data: form_data,
	        type: "POST",
	        url: '/editUploadAjax.do',
	        cache: false,
	        contentType: false,
	        enctype: 'multipart/form-data',
	        processData: false,
	        success: function(url) {
	          $(el).summernote('editor.insertImage', url);
	        }
	      });
	 }
});