<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link href="/resources/css/intro.css" rel="stylesheet">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=2o6VmluZLVKdzMGb28nx&submodules=geocoder"></script>


<div class="introHead container">
	<div class="row">
		<h2>
			<strong>에코베이 소개</strong>
		</h2>
	</div>
	
	<div class="row introDiv">
		<div class="col-md-4 clearFix pr50 pr0m">
			<p class="mb5 col-xs-6 col-sm-6 col-md-12"><img src="/resources/images/int01.jpg" alt="" class="wp100" /></p>
			<p class="mb5 col-xs-6 col-sm-6 col-md-12"><img src="/resources/images/int02.jpg" alt="" class="wp100"  /></p>
			<p class="mb5 col-xs-6 col-sm-6 col-md-12"><img src="/resources/images/int03.jpg" alt="" class="wp100"  /></p>
		</div>
		<div class="col-md-8">
			<p class="mb30 fs20 lineH30 mt30">
				<strong class="fcBlue">에코베이는 2018년 국내 최초의 중고 전문 경매사이트</strong>로 출발하여 지금까지 오랜 세월의 
				무게가 담긴 전적 및 고서적, 시인의 숨결이 담긴 시집, 손때 묻은 교과서, 추억의 사진, 만화책, 
				골동품 등 <strong class="fcBlue">월평균 1 건 이상의 거래가 이뤄지고 있는 마이너 경매 사이트</strong>입니다.
			</p>
			<p class="fs16i">
				에코베이는 수억원을 호가하는 고미술품, 작품이 거래된 적은 없으나 다른 곳에서는 관심조차 기울이지 않는 삶의 흔적들이 
				치열하게 경합되어 생각지 못한 높은 가격에 거래되고 있는 재미있는 장터입니다.
				<br />에코베이는 간단한 절차를 거쳐서 회원가입이 가능하며, 일반회원 인증 후에는 삶의추억이 묻어있는 다양한 제품들의 거래를 
				편리하게 사용 하실 수 있습니다.
				<br /><br />
				또한 매월 넷째주 수요일에는 에코베이의 대표 오프라인 행사인 삶의흔적 경매전이 열립니다.
				<br />매월 회원분들의 다양한 물품들이 출품되어 전문위원의 검수에 의해 최종 물품이 선정되며,
				해당 물품은 경매일 당일 에코베이 전용 전시장에서 전시되어 경매에 붙여집니다.
				<br /><br />
				시골집 다락방이나 서재, 창고, 헛간에서 빛을 잃고 사라져가는 우리의 소중한 삶의 흔적들이 생각나신다면
				에코베이를 반드시 기억해 주시기 바랍니다.
			</p>
		</div>
	</div>
	<hr>
</div>

	



<div class="introBottom container">
	<div class="row">
		<h2>
			<strong>오시는 길</strong>
		</h2>
	</div>
</div>

<div class="container mapDiv">
	<div class="row">
		<div id="map" style="width:100%; height:400px;">
		
		</div>
		
		<script>
			var mapOptions = {
				scrollWheel: false
			};
			var map = new naver.maps.Map('map', mapOptions);
			var myaddress = '서울특별시 서초구 강남대로53길 8 비트아카데미빌딩';// 도로명 주소나 지번 주소만 가능 (건물명 불가!!!!)
			

			naver.maps.Service.geocode({address: myaddress}, function(status, response) {
				if (status !== naver.maps.Service.Status.OK) {
					return alert(myaddress + '의 검색 결과가 없거나 기타 네트워크 에러');
				}
				var result = response.result;
				// 검색 결과 갯수: result.total
				// 첫번째 결과 결과 주소: result.items[0].address
				// 첫번째 검색 결과 좌표: result.items[0].point.y, result.items[0].point.x
				var myaddr = new naver.maps.Point(result.items[0].point.x, result.items[0].point.y);
				map.setCenter(myaddr); // 검색된 좌표로 지도 이동
				// 마커 표시
				var marker = new naver.maps.Marker({
					position: myaddr,
					map: map
				});
				
				var contentString = [
			        '<div class="iw_inner">',
			        '   <h3>비트캠프 서초센터</h3>',
			        '   <p>서울특별시 서초구 강남대로53길 8 비트아카데미빌딩<br />',
			        '    	<a href="http://localhost:7080/intro.do" target="_blank">www.ecobay.kr/</a>',
			        '   </p>',
			        '</div>'
			    ].join('');
				
				var infowindow = new naver.maps.InfoWindow({
				    content: contentString
				});
				
				// 마커 클릭 이벤트 처리
				naver.maps.Event.addListener(marker, "click", function(e) {
				    if (infowindow.getMap()) {
				        infowindow.close();
				    } else {
				        infowindow.open(map, marker);
				    }
				});

				infowindow.open(map, marker);
				
				
			});
		</script>
	</div>
	

</div>
















