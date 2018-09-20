<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<style>
.carousel-inner>.carousel-item>img {
	top: 0;
	left: 0;
	min-width: 100%;
	min-height: 400px;
	/* max-height: 400px; */
}
</style>
<div>
	<div id="carouselIndicators" class="carousel slide"
		data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselIndicators" data-slide-to="1"></li>
			<li data-target="#carouselIndicators" data-slide-to="2"></li>
			<li data-target="#carouselIndicators" data-slide-to="3"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/resources/images/main_cal6_1.jpg"
					alt="첫번째 슬라이드">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/images/main_cal7_1.jpg"
					alt="두번째 슬라이드">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/images/main_cal9.jpg"
					alt="세번째 슬라이드">
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="/resources/images/main_cal10.jpg"
					alt="세번째 슬라이드">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">이전</span>
		</a> <a class="carousel-control-next" href="#carouselIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">다음</span>
		</a>
	</div>
</div>
<div class="container">
	<div align="center">
		<a href="#"><img src="/resources/images/icons/fashion_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/living_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/homeItem_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/digital_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/culture_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/sports_ic.png"></a>
		<a href="#"><img src="/resources/images/icons/collection_ic.png"></a>
	</div>
</div>
<p>
<div id="carouselControls" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">a</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">b</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">c</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">d</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">e</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4">
						<a href="#">
							<div class="card mb-4 shadow-sm">
								<img class="card-img-top"
									src="https://picsum.photos/200/200/?random"
									alt="Card image cap">
								<div class="card-body">
									<p class="card-text">f</p>
									<div class="d-flex justify-content-between align-items-center">
										<small class="text-muted">viewConut:0</small> <small
											class="text-muted">9 mins</small>
									</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselControls"
			role="button" data-slide="prev"> <img
			src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0OTIgNDkyIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA0OTIgNDkyOyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjY0cHgiIGhlaWdodD0iNjRweCI+CjxnPgoJPGc+CgkJPHBhdGggZD0iTTE5OC42MDgsMjQ2LjEwNEwzODIuNjY0LDYyLjA0YzUuMDY4LTUuMDU2LDcuODU2LTExLjgxNiw3Ljg1Ni0xOS4wMjRjMC03LjIxMi0yLjc4OC0xMy45NjgtNy44NTYtMTkuMDMybC0xNi4xMjgtMTYuMTIgICAgQzM2MS40NzYsMi43OTIsMzU0LjcxMiwwLDM0Ny41MDQsMHMtMTMuOTY0LDIuNzkyLTE5LjAyOCw3Ljg2NEwxMDkuMzI4LDIyNy4wMDhjLTUuMDg0LDUuMDgtNy44NjgsMTEuODY4LTcuODQ4LDE5LjA4NCAgICBjLTAuMDIsNy4yNDgsMi43NiwxNC4wMjgsNy44NDgsMTkuMTEybDIxOC45NDQsMjE4LjkzMmM1LjA2NCw1LjA3MiwxMS44Miw3Ljg2NCwxOS4wMzIsNy44NjRjNy4yMDgsMCwxMy45NjQtMi43OTIsMTkuMDMyLTcuODY0ICAgIGwxNi4xMjQtMTYuMTJjMTAuNDkyLTEwLjQ5MiwxMC40OTItMjcuNTcyLDAtMzguMDZMMTk4LjYwOCwyNDYuMTA0eiIgZmlsbD0iIzAwMDAwMCIvPgoJPC9nPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+CjxnPgo8L2c+Cjwvc3ZnPgo=" />
			<span class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselControls"
			role="button" data-slide="next"> <img
			src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iTGF5ZXJfMSIgeD0iMHB4IiB5PSIwcHgiIHZpZXdCb3g9IjAgMCA0OTIuMDA0IDQ5Mi4wMDQiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDQ5Mi4wMDQgNDkyLjAwNDsiIHhtbDpzcGFjZT0icHJlc2VydmUiIHdpZHRoPSI2NHB4IiBoZWlnaHQ9IjY0cHgiPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0zODIuNjc4LDIyNi44MDRMMTYzLjczLDcuODZDMTU4LjY2NiwyLjc5MiwxNTEuOTA2LDAsMTQ0LjY5OCwwcy0xMy45NjgsMi43OTItMTkuMDMyLDcuODZsLTE2LjEyNCwxNi4xMiAgICBjLTEwLjQ5MiwxMC41MDQtMTAuNDkyLDI3LjU3NiwwLDM4LjA2NEwyOTMuMzk4LDI0NS45bC0xODQuMDYsMTg0LjA2Yy01LjA2NCw1LjA2OC03Ljg2LDExLjgyNC03Ljg2LDE5LjAyOCAgICBjMCw3LjIxMiwyLjc5NiwxMy45NjgsNy44NiwxOS4wNGwxNi4xMjQsMTYuMTE2YzUuMDY4LDUuMDY4LDExLjgyNCw3Ljg2LDE5LjAzMiw3Ljg2czEzLjk2OC0yLjc5MiwxOS4wMzItNy44NkwzODIuNjc4LDI2NSAgICBjNS4wNzYtNS4wODQsNy44NjQtMTEuODcyLDcuODQ4LTE5LjA4OEMzOTAuNTQyLDIzOC42NjgsMzg3Ljc1NCwyMzEuODg0LDM4Mi42NzgsMjI2LjgwNHoiIGZpbGw9IiMwMDAwMDAiLz4KCTwvZz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8Zz4KPC9nPgo8L3N2Zz4K" />
			<span class="sr-only">Next</span>
		</a>
	</div>
</div>