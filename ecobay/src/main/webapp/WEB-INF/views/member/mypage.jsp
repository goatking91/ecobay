<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
	
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		 
		$(function() {
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		});
</script>
</head>
<script>
$(document).ready(function(){	
	$('#confirmpwd').click(function(event){
		/* $('#myModal').css('z-index',99999); */
		$('#enter').text("");
		
		var pwd = $('#pwd').val();//입력받은값
		console.log(pwd);
		if(pwd.length == 0){
			$('#enter').text("비밀번호를 입력하세요");
	        return false;
		}
		$.ajax({
			async: true,
			type: 'POST',
			url : "/member/pwdcheck.do",
			data: pwd,
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				if(data.flag == false){
					$('#enter').text("올바른 비밀번호가 아닙니다");
					console.log(data);
					console.log(data.flag);
					return false;
				}else{
					location.href='/member/modify.do?member_id='+data.member_id;
					console.log(data.member_id);
					console.log(data.flag);
				}
	        },
	        error: function(data) {
				console.log("error :" + data);
			}
		});  
	})
	
	$('#edit_button').click(function(event){
		var pwd = $('#pwd').val();//입력받은값
        $('#pwdModal').modal('show');
	});
})
</script>

<hr>
<div class="container bootstrap snippet">
	<div class="row">
		<div class="col-sm-10"><h1>${member_name}</h1></div>
		<div class="col-sm-2"></div>
	</div>
	
	<div class="row">
		<!-- 왼쪽 sub_nav -->
		<div class="col-sm-3">
			<hr><br>
			<ul class="list-group">
            	<li class="list-group-item text-muted">Activity</li>
            	<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Shares</strong>
				    <span class="badge badge-primary badge-pill">14</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Likes</strong>
				    <span class="badge badge-primary badge-pill">13</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Posts</strong>
				    <span class="badge badge-primary badge-pill">37</span>
				</li>
				<li class="list-group-item d-flex justify-content-between align-items-center">
				    <strong>Followers</strong>
				    <span class="badge badge-primary badge-pill">78</span>
				</li>
			</ul> 
		</div>
		<!-- 왼쪽 sub_nav 끝 -->
		
		
		<!-- 탭 영역 -->
		<div class="col-sm-9">
			<nav class="nav nav-tabs" id="myTab" role="tablist">
				<a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">내 정보</a>
				<a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">판매</a>
				<a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">구매</a>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<div class="form-group row">
					<h2>&nbsp;&nbsp;${member.member_name}</h2>&nbsp;&nbsp; <h6 style="padding-top:15px">님의 정보입니다</h6>
				</div>
		<div class="col-sm-12">
	        <form>
	        	<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
					<div class="col-sm-4">
						<security:csrfInput/>
						<input class="form-control border-0 " style="background-color:white" id="member_name" name="member_name" type="text" value="${member.member_name}" readonly>
					</div>
				</div>
	        	
	        	<div class="form-group row">
	          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
			        <div class="col-sm-4">
			        	<div class="input-group">
							<input class="form-control border-0 " style="background-color:white" id="member_id" name="member_id" type="text" value="${member.member_id}" readonly>
						</div>
					</div>
	        		<div class="col-sm-3"></div>
	        	</div>
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label>
					<div class="col-sm-3">
						<input class="form-control border-0 " style="background-color:white" id="birth" name="birth" type="text" value="${member.birth}" readonly>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
					<div class="col-sm-3">
						<input class="form-control border-0 " style="background-color:white" id="gender" name="gender" type="text" value="${member.gender}" readonly>
					</div>
				</div>	
				
				<div class="form-group row">	
				<label class="col-sm-3 col-form-label text-right" for="phone">번호</label>
					<div class="col-sm-3">
						<input class="form-control border-0 " style="background-color:white" id="phone" name="phone" type="text" value="${member.phone}" readonly>
					</div>
				</div>    		
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-3">
						<input class="form-control border-0 " style="background-color:white" id="zipcode" name="zipcode" type="text" value="${member.zipcode}" readonly>	                  	
					</div>
				</div> 
				<div class="form-group row">
					<label class="col-sm-3 col-form-label text-right" for="addr1">주소</label>
					<div class="col-sm-6">
						<input class="form-control border-0 " style="background-color:white" id="addr1" name="addr1" type="text" value="${member.addr1}" readonly>
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-3"></div>
					<div class="col-sm-6">
						<input class="form-control border-0 " style="background-color:white" id="addr2" name="addr2" type="text" value="${member.addr2}" readonly>
					</div>	
				</div>
							
				<div class="form-group row">
					<div class="col-sm text-center">
						<input type="button" id="edit_button" class="btn btn-lg btn-info" value="수정">
					</div>	
				</div>     	
			</form>
		</div>
				</div>
				<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">menu1 탭</div>
				<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">menu2 탭</div>
			</div>
		</div>
		<!--탭 영역 끝-->
	</div>
</div>                


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="message">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>




<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">비밀번호를 입력해야 수정할 수 있습니다</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group">
		            <label for="pwd" class="col-form-label">비밀번호</label>
		            <input id="pwd" type="password" class="form-control">
		            <span id="enter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="confirmpwd" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

           