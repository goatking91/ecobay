<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<head>
	<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
</head>
<script>
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	 
	$(function() {
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	});
	
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
	
	$('#wishList-tap').click(function(){
		var member_id = $('#member_id').val();
		
		$.ajax({
			async: true,
			type: "POST",
			data: member_id,
			url : "/member/wishList.do/",
			dataType : "json",
			contentType: "application/json; charset=UTF-8",
			success : function(data) {
				console.log("1");
				
				$('#wishList').empty();

				var str = "";
				str = str + "<h3>관심 상품</h3>";
				str = str + "<div class='bg-light border-top border-bottom' style='padding:15px; margin:10px'>";
				str = str + "	<label class='checkbox'>";
				str = str + "		<input type='checkbox' id ='chK_all' name='chK_all'>";
				str = str + "	</label>";
				str = str + "	<input type='button' class='btn btn-default' value='선택상품 삭제'>";
				str = str + "</div>";
				console.log(str);
				
				$.each(data.arr, function(index, arr){
					var state_cd = arr.state_cd;
					if(state_cd == '3'){
						state_cd = "진행중";
					}else{
						state_cd = "경매종료";
					}
					
					str = str + "<div class='form-group row col-sm-12' style='padding:15px; margin:10px'>";
					str = str + "	<div class='col-sm-1' style='padding-top:35px'>";
					str = str + "		<input type='checkbox'>";
					str = str + "	</div>";	
					str = str + "	<div class='col-sm-3'><img src='/displayFile.do?fileName=" + arr.filename_thumb + "' style='margin-left: auto; margin-right: auto; display: block; width:60%;'></div>";
					str = str + "	<div class='col-sm-5' id='form-inline' style='padding-top:10px'>";
					str = str + "		<div style='font-size:8pt'>" + arr.acutdate_start_str + "~" + arr.acutdate_end_str + "</div>";
					str = str + "		<div><a style='color:grey; text-decoration: none' href='/product/detail.do?product_cd=" + arr.product_cd + "'>"+ arr.product_cd + "</a></div>";
					str = str + "		<div id='product_nm'>" + arr.product_nm + "</div>";
					str = str + "	</div>";
					str = str + "	<div id='' class='col-sm-3' align='right' style='padding-top:35px'>" + state_cd + "</div>";
					str = str + "</div>";
				});
				console.log(str);
				$('#wishList').append(str);
	        },
	        error: function(data) {
				console.log("error :" + data);
			}
		});  
		
	})
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
				<a class="nav-item nav-link active" id="myinfo-tap" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">내 정보</a>
				<a class="nav-item nav-link" id="sell-tap" data-toggle="tab" href="#sell" role="tab" aria-controls="nav-profile" aria-selected="false">판매</a>
				<a class="nav-item nav-link" id="buy-tap" data-toggle="tab" href="#buy" role="tab" aria-controls="nav-contact" aria-selected="false">구매</a>
				<a class="nav-item nav-link" id="wishList-tap" data-toggle="tab" href="#wishList" role="tab" aria-controls="nav-contact" aria-selected="false">관심상품리스트</a>
			</nav>
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="myinfo-tap">
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
		<div class="tab-pane fade" id="sell" role="tabpanel" aria-labelledby="sell">
			<!-- 판매상품 등록 -->
			<div id=""><!-- 어떤 항목 보여줄지/ 상품썸네일, 상품이름, 상품코드, 입찰현황? -->
				<div class="form-group row">
					<div><img src=""></div>
					<div id="product_cd">상품코드</div>
					<div id="product_nm">상품이름</div>
					<div></div>
				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="buy" role="tabpanel" aria-labelledby="buy">
			<!-- 낙찰물품 리스트, 결제하기 버튼 -->
			<h3>낙찰물품 리스트</h3>
			<div id=>
				<div class="bg-light border-top border-bottom" style="padding:15px; margin:10px">
					<label class="checkbox">
						<input type="checkbox" id ="chK_all" name="chK_all">
					</label>
					<input type="button" class="btn btn-default" value="선택상품 삭제">
				</div>
				<%-- <c:forEach var="list"  > --%>
					<div class="form-group row col-sm-12" style="padding:15px; margin:10px">
						<div class="col-sm-1" style="padding-top:35px">
							<input type="checkbox">
						</div>
						<div class="col-sm-3"><img src="/resources/images/noimg_s.gif"></div>
						<div class="col-sm-4" id="form-inline" style="padding-top:35px">
							<div id="product_cd">상품코드</div>
							<div id="product_nm">상품명</div>
						</div>
						<div id="" class="col-sm-4" align="right" style="padding-top:35px">입찰/진행상태</div>
					</div>
			<%-- 	</c:forEach> --%>
			</div>
		</div>
		<div style="margin:10px" class="tab-pane fade" id="wishList" role="tabpanel" aria-labelledby="whishList">
			<!-- 관심상품 등록 -->
			<%-- <h3>관심 상품</h3>
			<div id=>
				<div class="bg-light border-top border-bottom" style="padding:15px; margin:10px">
					<label class="checkbox">
						<input type="checkbox" id ="chK_all" name="chK_all">
					</label>
					<input type="button" class="btn btn-default" value="선택상품 삭제">
				</div>
				<c:forEach var="wishList" items="${wishList}">
					<div class="form-group row col-sm-12" style="padding:15px; margin:10px">
						<div class="col-sm-1" style="padding-top:35px">
							<input type="checkbox">
						</div>
						<div class="col-sm-3"><img src="/displayFile.do?fileName=${wishList.filename_thumb}" style="margin-left: auto; margin-right: auto; display: block; width=30%"></div>
						<div class="col-sm-4" id="form-inline" style="padding-top:35px">
							<div id="product_cd" value="${wishList.product_cd}"></div>
							<div id="product_nm" value="${wishList.prosuct_nm}"></div>
						</div>
						<div id="" class="col-sm-4" align="right" style="padding-top:35px">입찰/진행상태</div>
					</div>
				</c:forEach>
			</div> --%>
		</div>
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

           