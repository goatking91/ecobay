$(function() {
	$('#content').summernote({
		lang: 'ko-KR',
        height: 350
    });
	
	$('#faqRegBtn').click(function(event){
		var category = $('#category').val();
		var title = $('#title').val();
		var content = $('#content').val();
		
		var modalBtnHtml = "<button type='button' class='btn btn-primary' data-dismiss='modal'>확인</button>";
		if (category == null || category == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("카테고리를 선택해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else if (title == null || title == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("제목을 입력해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else if (content == null || content == '') {
			
			$('.modal-title').text("안내");
			$('.modal-body').find('p').text("내용을 입력해주세요.");
			$('.modal-footer').html(modalBtnHtml);
			$('#myModal').modal('show');
			return false;
			
		} else {
			$('#faqRegForm').submit();
		}
		
	});
});