<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<title>상품상세보기</title>
	<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
	
	<style type="text/css">
		a 
		{
		    color: #337ab7;
		    text-decoration: none;
		}

		.text-right
		{
			padding-right: 0;
		    display: table-cell;
		    text-align: right;
		}

		.product-detail-thum 
		{
		    padding-right: 40px;
		}
		
		.product-detail-thum .gallery-thumbs-container
		{
			margin-top: 30px;
		}
		
		.product-detail-thum .gallery-thumbs-container .bx-prev 
		{
	    	left: 10;
		    background: url(/resources/images/image-arrow-left.png) no-repeat;
		    position: absolute;
		    font-size: 0;
		    width: 15px;
		    height: 28px;
		    overflow: hidden;
		    text-indent: -100px;
		    top: 50%;
		    margin-top: -14px;
		    z-index: 100;
		}
		
		.product-detail-thum .gallery-thumbs-container .bx-next 
		{
		    right: 0;
		    background: url(/resources/images/image-arrow-right.png) no-repeat;
   		    position: absolute;
		    font-size: 0;
		    width: 15px;
		    height: 28px;
		    overflow: hidden;
		    text-indent: -100px;
		    top: 50%;
		    margin-top: -14px;
		    z-index: 100;
		}
		
		.product-detail-thum .imgBig 
		{
		    display: table;
		    width: 100%;
		    height: 500px;
		    border: 1px solid #ddd;
		}
		
		.thumb.pager-active 
		{
		    border: 1px solid #114da5;
		}
		
		.product-detail-spec
		{
		    padding-left: 20px;
		}
		
		.detailTitle
		{
			width:25%;
			text-align:right;
			background-color: #F2F2F2; 
			vertical-align: middle;
		}
	</style>
	
	
<!-- 	<script type="text/javascript">
	var itemCnt = "8";
	$(function()
	{
		if ($('#gallery-thumbs').length > 0) 
		{
			var thumb = $('#gallery-thumbs').find('.thumb');
			var visibleThumbs = 5;
			var gallerySlider = $('#gallery').bxSlider({
				controls: false,
				pager: false,
				easing: 'easeInOutQuint',
				infiniteLoop: true,
				speed: 500,
				auto: false,
				adaptiveHeight : true,
				onSlideAfter: function (currentSlideNumber) 
				{
					var currentSlideNumber = gallerySlider.getCurrentSlide();
					thumb.removeClass('pager-active');
					thumb.eq(currentSlideNumber).addClass('pager-active');
				},
				onSlideNext: function () 
				{
					var currentSlideNumber = gallerySlider.getCurrentSlide();
					slideThumbs(currentSlideNumber, visibleThumbs);
				},
				onSlidePrev: function () 
				{
					var currentSlideNumber = gallerySlider.getCurrentSlide();
					slideThumbs(currentSlideNumber, visibleThumbs);
				},
			});
	
			thumb.click(function (e) 
			{
				imageNum=$(this).closest('.thumb-item').index();
				$(".zoomContainer").remove();
				gallerySlider.goToSlide($(this).closest('.thumb-item').index());
				e.preventDefault();
			});
			
			var thumbsSlider = $('#gallery-thumbs').bxSlider({
				controls: true,
				pager: false,
				easing: 'easeInOutQuint',
				infiniteLoop: false,
				hideControlOnEnd : true,
				minSlides: 4,
				maxSlides: 4,
				slideWidth: itemCnt=="1"?150:itemCnt=="2"?120:itemCnt=="3"?114:itemCnt=="4"?110:108, 
				slideMargin: 0,
				nextSelector: '#slider-next',
				prevSelector: '#slider-prev',
				onSliderLoad: function(idx) {
					//$(".bx-wrapper").css("max-width", "");
				}
			});
	
			function slideThumbs(currentSlideNumber, visibleThumbs) 
			{
				var m = Math.floor(currentSlideNumber / visibleThumbs);
				var slideTo = m * visibleThumbs;
				thumbsSlider.goToSlide(m);
			}
	
			$('#gallery-thumbs').find('.thumb').click(function () 
			{
				$('#gallery-thumbs').find('.thumb').removeClass('pager-active');
				$(this).addClass('pager-active');
			});
		}
	});
</script>  -->
	
	
</head>
<body>
	<br>
	<!-- 제목(상품명) 출력영역 -->
	<div class="container">
		<div class="row">
			<h4>제목 출력(productNm)</h4>
		</div>
	</div>

	<!-- 상품상세내역 출력영역 -->
	<div class="container">
		<div id="product-detail-info" class="row" style="margin-bottom: 50px;"><!--  important; -->
		
			<!-- 이미지 출력 영역 시작 -->
			<div class="product-detail-thum col-sm-12 col-md-6" style="padding-right: 40px;">
			
				<!-- 큰이미지 출력영역 -->
				<div class="bx-wrapper" style="max-width: 100%; margin: 0px auto; position: relative;">
					<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 400px;">
						<div id="gallery" class="gallery-images" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(-400px, 0px, 0px);">
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';" alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';" alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 400px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
						</div>
					</div>
				</div>

				<!-- 작은이미지 출력영역 -->
				<div class="gallery-thumbs-container">
					<p id="slider-next" class="slider-next"><a class="bx-next" href="">Next</a></p>
					<p id="slider-prev" class="slider-prev"><a class="bx-prev" href="">Prev</a></p>
					<div class="bx-wrapper" style="max-width: 432px; margin: 0px auto;">
						<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 105px;">
							<ul id="gallery-thumbs" class="" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(-40px, 0px, 0px);">
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb pager-active">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 90px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--  이미지 출력영역 끝 -->

			<!-- 상품정보 출력영역 -->
			<div class="product-detail-spec col-sm-12 col-md-6">
				<div class="table-responsive">
					<table class="table">
						<tr>
							<th style="text-align: right;"><h4>현재가</h4></th>
							<td><input type="text" size="10" name="moneyBid" id="moneyBid" style="border: none;" readOnly value="입찰최고금액"></td>
							<td style="text-align: right;"><button type="button" class="btn btn-secondary btn-sm" name="remainingTime" id="remainingTime">남은시간 <span id="remain">XX일 XX시 XX분 XX초</span></button></td>
						</tr>
						
						<tr>
							<th class="detailTitle">상품번호</th>
							<td colspan="2">상품번호(productCd)</td>
						</tr>
						
						<tr>
							<th class="detailTitle">경매기간</th>
							<td colspan="2">경매시작일시(acutdateStart) ~ 경매종료일시(acutdateEnd)</td>
						</tr>
						
						<tr>
							<th class="detailTitle">시작가</th>
							<td colspan="2">시작가(moneyFirst)</td>
						</tr>
						<tr>
							<th class="detailTitle">입찰단위</th>
							<td colspan="2">입찰단위(moneyUnit)</td>
						</tr>
						<tr>
							<th class="detailTitle">즉시구매</th>
							<td colspan="2">구매여부(baynowYn)가 false이면 즉시구매불가능(baynowMoney)</td>
						</tr>
						<tr>
							<th class="detailTitle">입찰수</th>
							<td>입찰내역 count</td>
							<td style="text-align: center;"><button type="button" class="btn btn-outline-dark btn-sm" name="bidCnt" id="bidCnt">경매기록보기</button></td>
						</tr>
						<tr>
							<th class="detailTitle">배송정보</th>
							<td colspan="2">배송구분명(deliDivNm)</td>
						</tr>
						<tr>
							<th class="detailTitle">판매자정보</th>
							<td colspan="2">상품판매자ID(memberId)</td>
						</tr>
						
						<tr>
							<td colspan="3" style="vertical-align: middle; text-align: center;"><button type="button" class="btn btn-primary" href="#none" onclick="" >입찰하기</button></td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 상품정보 출력영역 끝 -->
			
			<!-- 탭 영역 -->
			<div class="col-sm-9">
				<nav class="nav nav-tabs" id="myTab" role="tablist">
					<a class="nav-item nav-link active" id="nav-content-tab" data-toggle="tab" href="#nav-content" role="tab" aria-controls="nav-content" aria-selected="true">상품정보</a>
					<a class="nav-item nav-link" id="nav-qna-tab" data-toggle="tab" href="#nav-qna" role="tab" aria-controls="nav-qna" aria-selected="false">상품문의</a>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-content" role="tabpanel" aria-labelledby="nav-content-tab">상품설명</div>
					<div class="tab-pane fade" id="nav-qna" role="tabpanel" aria-labelledby="nav-qna-tab">상품문의</div>
				</div>
			</div>
		<!--탭 영역 끝-->
		</div>
	</div>




	<div class="container">
		<form name="iform" class="form-horizontal" method="post">
		</form>
	</div>
</body>
</html>