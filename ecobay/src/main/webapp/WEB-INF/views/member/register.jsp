<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- ajax로그인 할 때 필요한 메타데이터 두 줄-->
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>join.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="/resources/js/memberRegister.js"></script>
<script>
$(function() {
    $( "#birth" ).flatpickr({
    	maxDate: 'today',
        dateFormat: 'Y-m-d',
        onReady: function (selectedDates, dateStr, instance) {
            $('#birth input').val(
                instance.formatDate(new Date(), 'Y-m-d')
            )
		}
    });
 });
	
</script>
<!-- ajax처리시 권한 스크립트-->
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


<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h1>회원가입 </h1>
   	    <hr>
	</div>
	<div class="col-md-12">
        <form name="myform" method="post" action="reg.do">
        <security:csrfInput/><!-- 폼태그 처리시 시큐리티 태그라이브러리 -->
        	<input type="hidden" id="phone" name="phone" value="">
        	<input type="hidden" id="member_id_join" name="member_id" value="">
        	
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<input class="form-control" id="member_name" name="member_name" type="text" placeholder="이름">
				</div>
			</div>
        	
        	<div class="form-group row row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id1">ID</label>
		        <div class="col-sm-3">
		        	<div class="input-group">
						<input class="form-control" id="member_id1" name="member_id1" type="text"/>
						<div class="input-group-append">
    						<span class="input-group-text" id="at">@</span>
  						</div>
						<select class="form-control" id="member_id2" name="member_id2">
							<option value="">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="daum.net">daum.net</option>
							<option value="직접입력">직접입력</option>
						</select>
					</div>
				</div>
				<div class="col-sm-3">
        			<div class="input-group">
						<input class="form-control" id="member_id3" name="member_id3" type="text" placeholder="직접입력"/>
						<div class="input-group-append">						
                			<button id="member_idck"class="btn btn-secondary" type="button">중복체크</button>
                		</div>
            		</div>
    			</div>
        		<div class="col-sm-3"></div>
        	</div>
			<div class="form-group row row">
				<label class="col-sm-3 col-form-label text-right text-right" for="member_pwd">비밀번호</label><!-- 8~16자리 -->
				<div class="col-sm-4">
					<input class="form-control" id="member_pwd" name="pwd" type="password" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="pwdck">비밀번호 확인</label>
				<div class="col-sm-4">
					<input class="form-control" id="pwdck" name="pwdck" type="password" placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label><!-- datepicker6자리로 바꾸기 930811-->
				<div class="col-sm-3">
					<input class="form-control" id="birth" name="birth" type="text" placeholder="생년월일">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
				<div class="col-sm-3 col-form-label">
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="man" name="gender" value="남" checked="checked">
						<label class="form-check-label" for="man">
						남</label>
					</div>
					<div class="form-check form-check-inline">
						<input class="form-check-input" type="radio" id="woman" name="gender" value="여">
						<label class="form-check-label" for="woman">
						여</label>	
					</div>
				</div>		
			</div>	
			
			<div class="form-group row">	
			<label class="col-sm-3 col-form-label text-right" for="phone1 phone2 phone3">번호</label>
				<div class="col-sm-3">
					<div class="input-group">				
					<select class="form-control" id="phone1" name="phon1e">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2">-</span>
  					</div>
					<input class="form-control" id="phone2" name="phone2" type="text">
					<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2">-</span>
  					</div>					
					<input class="form-control" id="phone3" name="phone3" type="text">
				</div>
				</div>	
			</div>    		
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="zipcode">주소</label>
				<div class="col-sm-3">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호" readonly="readonly">
						<span class="input-group-append">
	                    		<button id="searchCode" class="btn btn-secondary" type="button" >우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div> 
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr1" name="addr1" type="text" placeholder="도로명/지번" readonly="readonly">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr2" name="addr2" type="text" placeholder="상세주소">
				</div>	
			</div>
						
			<div class="form-group row">
				<div class="col-sm text-center">
					<input type="submit" id="regbutton" class="btn btn-lg btn-info" value="등록">&nbsp;
					<input type="reset" class="btn btn-lg btn-info" value="초기화">
				</div>	
			</div>     	
		</form>
	</div>
</article>

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

</body>

</html>