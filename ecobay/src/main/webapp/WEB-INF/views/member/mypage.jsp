<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<style>
b, strong {
    font-weight: bolder;
    margin: 20px;
}
</style>
<script src="/resources/js/memberMypage.js"></script>


<hr>
<div class="container bootstrap snippet" >
	<div class="row">
		<div class="col-sm-10"><h1>${member_name}</h1></div>
		<div class="col-sm-2"></div>
	</div>

	<div class="row">
		<!-- 왼쪽 sub_nav -->
		<div class="col-sm-2">
			<ul class="list-group" id="myTab">
				<li style="list-style:none; color:#5ebded; text-align:center;"><h1><b>MYPAGE</b></h1></li>
            	<li class="list-group-item text-muted" style="text-align:center; padding:1.5rem 1.25rem;">
            		<a style="color:black" id="myinfo-tap" data-toggle="tab" href="#nav-home" role="tab">내 정보</a>
            	</li>
            	<li class="list-group-item sell_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
            		<a style="color:black" id="pwdChange-tap" data-toggle="tab" href="#pwdChange" role="tab">비밀번호 변경</a>
				</li>
            	<li class="list-group-item sell_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="sellList-tap" data-toggle="tab" href="#sellList" role="tab">내 판매상품</a>
				</li>
				<li class="list-group-item menu_buyList" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="buyList-tap" data-toggle="tab" href="#buyList" role="tab">내 구매상품</a>
				</li>
				<li class="list-group-item menu_wish" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="wishList-tap" data-toggle="tab" href="#wishList" role="tab">관심상품</a> 
				</li>
				<li class="list-group-item menu_qna" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="qnaList-tap" data-toggle="tab" href="#qnaList" role="tab">1:1문의 내역</a> 
				</li>
				<li class="list-group-item menu_getout" style="text-align:center; padding:1.5rem 1.25rem;">
					<a style="color:black" id="getout-tap" data-toggle="tab" href="#getout" role="tab">탈퇴하기</a> 
				</li>
			</ul> 
		</div>
		<!-- 왼쪽 sub_nav 끝 -->
		
		
		<!-- 탭 영역 -->
		<div class="col-sm-10" style="margin-bottom:20px;">
			
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="myinfo-tap" >
					<div class="form-group row">
						<div class="col-sm-12" align="center">
							<h1>개인정보 관리</h1>
						</div>
					</div>
					<hr style="margin-bottom:3rem; width:800px">

					<div class="col-sm-12">
				        <form>
				        	<div class="form-group row">
				        		<div class="col-sm-4"></div>
<%-- 								<label class="col-sm-8 col-form-label text-left" id="member_name" for="member_name"><b>이름</b>${member.member_name}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>이름</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="member_name">${member.member_name}</div>
							</div>
							<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>
				        	<div class="form-group row">
				        		<div class="col-sm-4"></div>
<%-- 				          		<label class="col-sm-8 col-form-label text-left"  for="member_id"><b>ID</b>${member.member_id}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>ID</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="member_name">${member.member_id}</div>
								<input id="member_id" name="member_id" type="hidden" value="${member.member_id}" readonly>
								<security:csrfInput/>
				        	</div>
				        	<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>
							<div class="form-group row">
								<div class="col-sm-4"></div>
<%-- 								<label class="col-sm-8 col-form-label text-left" id="birth" for="birth"><b>생년월일</b> ${member.birth}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>생년월일</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="member_birth">${member.birth}</div>
							</div>
							<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>
							<div class="form-group row">
								<div class="col-sm-4"></div>
<%-- 								<label class="col-sm-8 col-form-label text-left" id="gender" for="gender"><b>성별</b>${member.gender}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>성별</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="member_gender">${member.gender}</div>
								
							</div>	
							<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>
							<div class="form-group row">
								<div class="col-sm-4"></div>	
<%-- 								<label class="col-sm-8 col-form-label text-left" id="phone" for="phone"><b>번호</b>${member.phone}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>번호</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="phone">${member.phone}</div>
							</div>
							<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>    		
							<div class="form-group row">
								<div class="col-sm-4"></div>	
<%-- 								<label class="col-sm-8 col-form-label text-left" id="zipcode" for="zipcode"><b>주소</b>${member.zipcode}(우편번호)</label> --%>
								<div class="col-sm-2" style="padding-right:0;"><b>주소</b></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="zipcode">${member.zipcode}</div>
							</div> 
							<div class="form-group row">
								<div class="col-sm-4"></div>	
<%-- 								<label class="col-sm-7 col-form-label text-left" id="addr1" for="addr1">${member.addr1}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="addr1">${member.addr1}</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-4"></div>	
<%-- 								<label class="col-sm-7 col-form-label text-left" id="addr2" for="addr2">${member.addr2}</label> --%>
								<div class="col-sm-2" style="padding-right:0;"></div>
								<div class="col-sm-4" style="padding-left:0;" align='left' id="addr2">${member.addr2}</div>
							</div>
							<div align="center">
								<hr style="margin:1rem; width:600px; ">
				        	</div>			
							<div class="form-group row">
								<div class="col-sm text-center">
									<input type="button" id="edit_button" class="btn btn-lg btn-primary" value="수정">
								</div>	
							</div>     	
						</form>
					</div>
				</div>
				<!-- 리스트 들어가는 부분 -->
				<div class="tab-pane fade" id="pwdChange" role="tabpanel" aria-labelledby="pwdChange">
					<div class="form-group row">
						<div class="col-sm-12" align="center">
							<h1>비밀번호 변경</h1>
						</div>
					</div>
					<hr style="margin-bottom:3rem; width:800px">
					<div class="form-group row" style="align:center;">
						<div class="col-sm-1"></div>	
						<label class="col-sm-4 col-form-label text-right text-right" id="pwdlabel" for="pwd">비밀번호</label>
						<div class="col-sm-4">
							<input class="form-control" id="cpwd" name="pwd" type="password" placeholder="기존 비밀번호를 입력해주세요">
							<span id="warning" style="color: red"></span>
						</div>
						<div class="col-sm-3"></div>
					</div>
					<div class="form-group row">
						<div class="col-sm-1"></div>
						<label class="col-sm-4 col-form-label text-right" id="pwdcklabel" for="pwdck">비밀번호 확인</label>
						<div class="col-sm-4">
							<input class="form-control" id="cpwdck" name="cpwdck" type="password" placeholder="비밀번호를 한 번 더 입력해주세요">
							<span id="warning2" style="color: red"></span>
						</div>
						<div class="col-sm-3"></div>
					</div>
					<div align="center">
								<hr style="margin:3rem; width:800px; ">
				   	</div>	
					<div class="form-group row">
						<div class="col-sm text-center">
							<input type="button" id="change" class="btn btn-lg btn-primary" value="확인">
						</div>	
					</div>    
				</div>
				<div class="tab-pane fade" id="sellList" role="tabpanel" aria-labelledby="sellList"></div>
				<div class="tab-pane fade" id="buyList" role="tabpanel" aria-labelledby="buyList"></div>
				<div class="tab-pane fade" id="wishList" role="tabpanel" aria-labelledby="wishList"></div>
				<div class="tab-pane fade" id="qnaList" role="tabpanel" aria-labelledby="qnaList"></div>
			</div>
		</div>
		<!--탭 영역 끝-->
	</div>
</div>                

<!-- 모달 -->

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

<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="myModallabel" aria-hidden="true">
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
		          <div id="logoutMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="logoutYes">확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="myModall" tabindex="-1" role="dialog" aria-labelledby="myModallabell" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="outChkMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='yes'>확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 요청취소 -->
<div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="changeModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
	      	<div class="row">
	      		<div class="col-md">
		          <div id="changeMessage">
					<h4 align="center"></h4>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='ok'>확인</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="pwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="pwdModallabel">비밀번호를 입력해주세요</h5>
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

<div class="modal fade" id="outPwdModal" tabindex="-1" role="dialog" aria-labelledby="findIdModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">비밀번호를 입력해주세요</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <form>
	      	<div class="row">
		      	<div class="col-md">
		          <div class="form-group">
		            <label for="outPwd" class="col-form-label">비밀번호</label>
		            <input id="outPwd" type="password" class="form-control">
		            <span id="outEnter" style="color: red"></span>
		          </div>
		       </div>
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="outConfirmPwd" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- 구매취소 -->
<div class="modal fade" id="paycanModal" tabindex="-1" role="dialog" aria-labelledby="paycanModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="paycanmodaltitle">안내</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
        	<input type="hidden" style="display: none;" class="form-control" id="paycanproduct_cd" name="product_cd" value="">
	      	<div class="row">
	      		<div class="col-md">
		          <div id="paycanMessage">
					<h5 align="center"></h5>
		          </div>
		      </div>		      	
		   </div>
	      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='paycanokbtn'>확인</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>

<!-- 1:1문의 상세 -->
<div class="modal fade" id="qnaModal" tabindex="-1" role="dialog" aria-labelledby="qnaModal" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modaltitlee">1:1문의</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      	<div class="container">
		      	<div class="row text-primary">내 질문</div>
		      	<div class="row" style="margin-top:15px;">
		          <div id="mregdate">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
		      	<div class="row">
		          <div id="mtitle">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
				
				<div class="row">
		          <div id="mcontent">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
	  		</div>
	  		<div class="container">
		  		<div class="row text-danger" style="margin-top:15px;">답변</div>
		  		<div class="row" style="margin-top:15px;">
		          <div id="a_regdate">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
		  		<div class="row" >
		          <div id="a_id">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
				
				<div class="row">
		          <div id="a_content">
					<h6 align="center"></h6>
		          </div>		      		      	
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal" id='ok'>확인</button>
      </div>
    </div>
  </div>
</div>

           