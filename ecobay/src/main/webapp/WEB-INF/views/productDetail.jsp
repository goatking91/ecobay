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

		.product-detail-thum 
		{
		    padding-right: 40px;
		}
		
		.gallery-thumbs-container .bx-prev, .gallery-thumbs-container .bx-next 
		{
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
		
		.gallery-thumbs-container .bx-prev 
		{
		    left: 0;
		    background: url(/resources/images/image-arrow-left.png) no-repeat;
		}
		
		.product-detail-thum .gallery-thumbs-container .bx-next 
		{
		    right: 0;
		    background: url(/resources/images/image-arrow-right.png) no-repeat;
		}
		
		.gallery-thumbs-container .bx-next
		{
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
	</style>
	
	
	<script type="text/javascript">
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
</script>
	
	
</head>
<body>
	<br>
	<div class="container">
		<div class="row">
			<h4>제목출력부분....</h4>
		</div>
	</div>
	<div id="subContentsWrap">
		<div id="product-detail-info" class="row" style="margin-bottom: 50px;"><!--  important; -->
			<div class="product-detail-thum col-sm-12 col-md-6" style="padding-right: 40px;">
				<div class="bx-wrapper" style="max-width: 100%; margin: 0px auto; position: relative;">
					<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 502px;">
						<div id="gallery" class="gallery-images" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(-460px, 0px, 0px);">
							<div id="imgBig" class="imgBig bx-clone" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';" alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';" alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
							<div id="imgBig" class="imgBig" style="float: left; list-style: none; position: relative; width: 460px;">
								<p><img src="" onerror="this.src='/resources/images/noimg.gif';"  alt="" class="imgTypeW" data-zoom-image=""></p>
							</div>
						</div>
					</div>
				</div>

				<div class="gallery-thumbs-container mt30">
					<p id="slider-next" class="slider-next"><a class="bx-next" href="">Next</a></p>
					<p id="slider-prev" class="slider-prev"><a class="bx-prev" href="">Prev</a></p>
					<div class="bx-wrapper" style="max-width: 432px; margin: 0px auto;">
						<div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 105px;">
							<ul id="gallery-thumbs" class="" style="width: 1015%; position: relative; transition-duration: 0s; transform: translate3d(-40px, 0px, 0px);">
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb pager-active">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
								<li class="thumb-item" style="float: left; list-style: none; position: relative; width: 98px;">
									<div class="thumb ">
										<a href="#none">
											<img src="" onerror="this.src='/resources/images/noimg_s.gif';" alt="" class="imgTypeW">
										</a>
									</div>
								</li>
							</ul>
						</div>
						<div class="bx-controls"></div>
					</div>
				</div>
			</div>
				<div class="product-detail-spec col-sm-12 col-md-6">
					<div class="tableDefault style2">
						<h3>
							<div>현재가</div>
							<div class="now-price">4,000</div>
							<div class="text-right"><p class="btn btn-blue"><i class="	fa fa-clock-o"></i> 남은시간 <span id="remain">경매종료</span></p></div>
						</h3>
						<table>
						<caption></caption>
						<colgroup>
							<col>
							<col>
						</colgroup>	
							<tbody>
							<tr>
								<th>물품번호</th>
								<td>
									1806ZBPLME8
									<a href="#none" onclick="go112('1806ZBPLME8');" class="btn btn-gray2">신고</a>
								</td>
							</tr>
							<tr>
								<th>경매기간</th>
								<td>2018/09/03 10:31:20 ~ <br class="visible-xs">2018/09/13 10:31:20</td>
							</tr>
							<tr>
								<th>시작가</th>
								<td>
									
										
										4,000원
									
								</td>
							</tr>
							<tr>
								<th>입찰단위</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>즉시구매</th>
								<td>
									
										
										즉시구매불가능
									
								</td>
							</tr>
							<tr>
								<th>최고입찰자</th>
								<td></td>
							</tr>
							<tr>
								<th>입찰방식</th>
								<td>비공개</td>
							</tr>
							<tr>
								<th>입찰 수</th>
								<td>0 &nbsp;&nbsp;&nbsp;&nbsp;<a href="#none" onclick="bidObj.bidListDefault();" class="btn btn-gray3"><i class="fcGold fa fa-file-text-o"></i> 경매기록보기 &gt;</a></td>
							</tr>
							</tbody>
							<tbody>
							<tr>
								<th>배송방법</th>
								<td>택배, 착불[구매자]</td>
							</tr>
							<tr>
								<th>배송비용</th>
								<td>착불3,500원</td>
							</tr>
							<tr>
								<th>묶음배송</th>
								<td>
									
										
										가능
										
									
									&nbsp;&nbsp;&nbsp;
									<p class="fcRed dpInblock">*도서산간지역은 배송비 외에 도선료비가 추가발생</p>
								</td>
							</tr>
							</tbody>
							<tbody>
							<tr>
								<th>원산지</th>
								<td>한국</td>
							</tr>
							</tbody>
						</table>
						<!--  -->
						<table class="mt30 visible-lg visible-md visible-sm">
							<caption></caption>
							<colgroup>
								<col>
								<col>
								<col>
								<col>
							</colgroup>
							<tbody><tr class="bdr-bottom last">
								<th>판매자 ID</th>
								<td>
									
										
										
											sam67
										
									
								</td>
								<th>판매등급</th>
								<td>NEW</td>
							</tr>
							<tr class="bdr-bottom">
								<th>판매자 신용도</th>
								<td><a href="#none" onclick="creditObj.sellerCreditView('1');" class="btn btn-gray3 wp100"><i class="fa fa-line-chart fcGold"></i> 신용도 확인 &gt;</a></td>
								<th>판매자 단골등록</th>
								<td><a href="#none" onclick="favrObj.favrsellForm();" class="btn btn-gray3 wp100"><i class="fa fa-star-o fcGold"></i> 등록하기 &gt;</a></td>
							</tr>
							<tr class="bdr-bottom">
								<th class="pb8">판매자 다른물품</th>
								<td class="pb8"><span class="lineH32">31건</span> <a href="#none" onclick="window.open('/kobay/unisrch/unisrch.do?datafield=SC&amp;qry=sam67');" class="btn btn-gray2 pull-right">더보기 &gt;</a></td>
								<th class="pb8">판매자 구매후기</th>
								<td class="pb8"><span class="lineH32">0건</span> <a href="#none" onclick="evalObj.evalForm();" class="btn btn-gray2 pull-right">더보기 &gt;</a></td>
							</tr>
						</tbody></table>
						<!-- 모바일 -->
						<table class="mt30 visible-xs">
							<caption></caption>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody><tr class="bdr-bottom last">
								<th>판매자 ID</th>
								<td>
									
										
										
											sam67
										
									
								</td>
							</tr>
							<tr class="bdr-bottom first last">
								<th>판매등급</th>
								<td>NEW</td>
							</tr>
							<tr class="bdr-bottom first last">
								<th>판매자 신용도</th>
								<td><a href="#none" onclick="creditObj.sellerCreditView('1');" class="btn btn-gray3 wp100"><i class="fa fa-line-chart fcGold"></i> 신용도 확인 &gt;</a></td>
							</tr>
							<tr class="bdr-bottom first last">
								<th>판매자 단골등록</th>
								<td><a href="#none" onclick="favrObj.favrsellForm();" class="btn btn-gray3 wp100"><i class="fa fa-star-o fcGold"></i> 등록하기 &gt;</a></td>
							</tr>
							<tr class="bdr-bottom first last">
								<th>판매자 다른물품</th>
								<td><span class="lineH32">31건</span> <a href="/kobay/unisrch/unisrch.do?qry=sam67" class="btn btn-gray2 pull-right">더보기 &gt;</a></td>
							</tr>
							<tr class=" first last">
								<th>판매자 구매후기</th>
								<td><span class="lineH32">0건</span> <a href="#none" onclick="evalObj.evalForm();" class="btn btn-gray2 pull-right">더보기 &gt;</a></td>
							</tr>
						</tbody></table>
						<!-- //모바일 -->
					</div>
					<div class="btnArea row mt30">
						
							
								
									
										
											
												<p class="col-sm-4 btn-block-xs"><a href="#none" onclick="bidObj.bidFormLoad();" class="btn btn-blue btn-lg fs16 wp100">입찰하기</a></p>
											
											
										
										<p class="col-sm-4 btn-block-xs"><a href="#none" onclick="favrObj.favrAdd();" class="btn btn-gold btn-lg fs16 wp100">관심물품</a></p>
										<p class="col-sm-4 btn-block-xs"><a href="#none" onclick="boardObj.InquiryWriteInit();" class="btn btn-gray2 btn-lg fs16 wp100">문의하기</a></p>
										
									
									
								
							
							
						
					</div>
				</div>
				
			</div>
	</div>




	<div class="container">
		<form name="iform" class="form-horizontal" method="post">
		</form>
	</div>
</body>
</html>