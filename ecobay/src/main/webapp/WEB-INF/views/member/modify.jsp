<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h1>수정 </h1>
   	    <hr>
	</div>
	<div class="col-sm-12">
        <form name="myform" method="post" action="update.do">
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<input class="form-control" id="member_name" name="member_name" type="text" value="${member.member_name}" readonly>
				</div>
			</div>
        	<div class="form-group row row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
		        <div class="col-sm-3">
					<input class="form-control" id="member_id" name="member_id" type="text" value="${member.member_id}" readonly>
				</div>		
        	</div>
			<div class="form-group row row">
				<label class="col-sm-3 col-form-label text-right text-right" for="pwd">비밀번호</label><!-- 8~16자리 -->
				<div class="col-sm-4">
					<input class="form-control" id="pwd" name="pwd" type="password" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="pwdck">비밀번호 확인</label>
				<div class="col-sm-4">
					<input class="form-control" id="pwdck" name="pwdck" type="password" placeholder="비밀번호 확인">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="birth">생년월일</label>
				<div class="col-sm-3">
					<input class="form-control" id="birth" name="birth" type="text" value="${member.birth}" readonly>
				</div>
			</div>	
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="gender">성별</label>
					<div class="form-check form-check-inline">
						<input name="gender" value="${member.gender}" readonly>
					</div>	
			</div>	
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="phone">번호</label>
				<div class="col-sm-3">
					<input class="form-control" id="phone" name="phone" type="text" value="${member.phone}">
				</div>
			</div>	
			
			<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="zipcode">주소</label>
				<div class="col-sm-3">
					<div class="input-group">
						<input class="form-control" id="zipcode" name="zipcode" type="text" value="${member.zipcode}">
						<span class="input-group-append">
	                    		<button id="search" class="btn btn-secondary" >우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div> 
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr1" name="addr1" type="text" value="${member.addr1}">
				</div>	
			</div>
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr2" name="addr2" type="text" value="${member.addr2}">
				</div>	
			</div>
						
			<div class="form-group row">
				<div class="col-sm text-center">
					<input type="submit" class="btn btn-lg btn-info" value="수정완료">&nbsp;
					<input type="reset" class="btn btn-lg btn-info" value="초기화">
				</div>	
			</div>     	
		</form>
	</div>
</article>
</body>
</html>