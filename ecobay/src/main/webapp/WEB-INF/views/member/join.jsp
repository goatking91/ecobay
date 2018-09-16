<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join.jsp</title>
</head>
<script>
$(function() {
    $( "#birth" ).datepicker({
    	beforeShow: function() {
				$('#search').css('z-index', 1); 
			}
    });
 });
	
</script>
<body>
<article>
	<div class="page-header" style="padding:2%">
   	    <h1>회원가입 </h1>
   	    <hr>
	</div>
	<div class="col-md-12">
        <form name="myform" method="post" action="create.do">
        	<div class="form-group row">
				<label class="col-sm-3 col-form-label text-right" for="member_name">이름</label>
				<div class="col-sm-4">
					<input class="form-control" id="member_name" name="member_name" type="text" placeholder="이름">
				</div>
			</div>
        	
        	<div class="form-group row row">
          		<label class="col-sm-3 col-form-label text-right text-right" for="member_id">ID</label>
		        <div class="col-sm-3">
		        	<div class="input-group">
						<input class="form-control" id="member_id" name="member_id" type="text"/>
						<div class="input-group-append">
    						<span class="input-group-text" id="basic-addon2">@</span>
  						</div>
						<select class="form-control" id="member_id2" name="member_id2" type="text">
							<option value="선택">선택</option>
							<option value="naver.com">naver.com</option>
							<option value="naver.com">gmail.com</option>
							<option value="naver.com">daum.net</option>
							<option value="직접입력">직접입력</option>
						</select>
					</div>
				</div>
				<div class="col-sm-3">
        			<div class="input-group">
						<input class="form-control" id="member_id3" name="member_id3" type="text" placeholder="직접입력" readonly/>
						<div class="input-group-append">						
                			<button class="btn btn-secondary">중복체크</button>
                		</div>
            		</div>
    			</div>
        		<div class="col-sm-3"></div>
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
			<label class="col-sm-3 col-form-label text-right" for="phone phone2 phone3">번호</label>
				<div class="col-sm-3">
					<div class="input-group">				
					<select class="form-control" id="phone" name="phone">
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
						<input class="form-control" id="zipcode" name="zipcode" type="text" placeholder="우편번호"><!-- datepicker6자리 930811-->
						<span class="input-group-append">
	                    		<button id="search" class="btn btn-secondary" >우편번호찾기</button>
	                  	</span>
					</div>	                  	
				</div>
			</div> 
			<div class="form-group row">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
					<input class="form-control" id="addr1" name="addr1" type="text" placeholder="도로명/지번">
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
					<input type="submit" class="btn btn-lg btn-info" value="등록">&nbsp;
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