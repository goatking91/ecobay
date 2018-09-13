<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<link rel="/resource/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#datepicker" ).css('z-index', 99999999999999).datepicker();
} );
</script>
<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h1>회원가입 </h1>
   	    <hr>
	</div>
	<div class="col-md-12" style="padding-left:35%">
        <form class="form-horizontal" name="myform" method="post" action="" onsubmit=" ;return false;">
        	<div class="form-group">
          		<label class="col-sm-3 control-label" for="member_id">ID</label>
		        <div class="col-sm-6">
		        	<div class="input-group">
						<input class="form-control" id="member_id" name="member_id" type="text"/>
						&nbsp;&nbsp;@&nbsp;&nbsp;
						
						<select class="form-control" id="member_id2" name="member_id2" type="text">
							<option value="선택">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="naver.com">gmail.com</option>
							<option value="naver.com">daum.net</option>
							<option value="직접입력">직접입력</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input class="form-control" id="member_id2" name="member_id2" type="text" placeholder="직접입력"/>
						&nbsp;&nbsp;
                    	<button class="btn btn-defualt">중복체크</button>
                	</div>
        		</div>
        	</div>
        	
			<div class="form-group">
				<label class="col-sm-3 control-label" for="pwd">비밀번호</label><!-- 8~16자리 -->
				<div class="col-sm-4">
					<input class="form-control" id="pwd" name="pwd" type="password" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="pwdck">비밀번호 확인</label>
				<div class="col-sm-4">
					<input class="form-control" id="pwdck" name="pwdck" type="password" placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label" for="birth">생년월일</label>
				<div class="col-sm-3">
					<input class="form-control" id="datepicker" name="datepicker" type="text" placeholder="생년월일"><!-- datepicker6자리 930811-->
				</div>
			</div>			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="zipcode">주소</label>
				<div class="col-sm-4">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호"><!-- datepicker6자리 930811-->
						<span class="input-group-append">
	                    		<button class="btn btn-defualt">우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div> 
			<div class="form-group">
				<div class="col-sm-5">
					<input class="form-control" id="addr1" name="addr1" type="text" placeholder="도로명/지번">
				</div>	
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<input class="form-control" id="addr2" name="addr2" type="text" placeholder="상세주소">
				</div>	
			</div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label" for="gender">성별</label>
				<div class="col-sm-3">
					<input type="radio" id="gender" name="gender" value="남" checked="checked">남&nbsp;&nbsp;
					<input type="radio" id="gender" name="gender" value="여">여
				</div>	
			</div>
			
			<label class="col-sm-3 control-label" for="phone1 phone2 phone3">번호</label>
			<div class="form-group form-inline">	
				<div class="col-sm">
					<select class="form-control col-sm" id="phone1" name="phone1">
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="010">017</option>
					</select>
					<input class="form-control col-sm-1" id="phone2" name="phone2" type="text">
					<input class="form-control col-sm-1" id="phone3" name="phone3" type="text">
				</div>	
			</div>    
			<div class="form-group">
				<div class="col-sm-3">
					<input type="submit" class="btn btn-lg btn-info" value="등록">
					<input type="reset" class="btn btn-lg btn-info" value="초기화">
				</div>	
			</div>     	
		</form>
	</div>
</article>

<!-- 

			</tr>
			<tr>
				<td></td>
				<td align="center">
					<input type="submit" class="btn btn-info" value="등록">
					<input type="reset" class="btn btn-info" value="초기화">
				</td>
			</tr>		
		</table> -->

</body>
</html>