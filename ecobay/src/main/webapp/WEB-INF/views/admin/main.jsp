<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>

<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.bundle.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.bundle.min.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.js"></script>
<script src = "/resources/lib/chart.js-2.7.3/dist/Chart.min.js"></script>

<div class="content-wrapper">
	<!-- 페이지 헤더(제목) -->
	<section class="content-header">
		<h1>
			통계
			<small>통계</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="/admin/main.do"><i class="fa fa-dashboard"></i>Home</a></li>
			<li class="active"><a href="/admin/main.do">통계</a></li>
		</ol>
	</section>
	<!-- /페이지 헤더(제목) -->


	<!-- 내용 -->
	<section class="content container">
		<div class="row">
			<div class="col-sm-6">
				<canvas id="canvas1" style="margin-left: 5px;"></canvas>
				
			</div>
			<div class="col-sm-6">
				<canvas id="canvas2" style="margin-left: 5px;"></canvas>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
				<canvas id="canvas3" style="margin-left: 5px;"></canvas>
			</div>
		</div>
		
	</section>
	<!-- /내용 -->
</div>

<script type="text/javascript">
$(function() {
	window.chartColors = {
			red: 'rgb(255, 99, 132)',
			orange: 'rgb(255, 159, 64)',
			lime: 'rgb(0, 255, 0)',
			yellow: 'rgb(255, 255, 0)',
			green: 'rgb(75, 192, 192)',
			blue: 'rgb(54, 162, 235)',
			purple: 'rgb(153, 102, 255)',
			darkred: 'rgb(139, 0, 0)',
			cyan: 'rgb(0, 255, 255)',
			navy: 'rgb(0, 0, 128)',
			grey: 'rgb(201, 203, 207)'
		};
	
	var chartColors = window.chartColors;
	
	var memberJoinDays = new Array();
	var memberJoinDaysM = new Array();
	var memberJoinDaysF = new Array();
	var productPayState = new Array();
	var productState = new Array();
	
	<c:forEach items="${memberJoinDays}" var="item">
		memberJoinDays.push("${item.val}");
	</c:forEach>
	<c:forEach items="${memberJoinDaysM}" var="item">
		memberJoinDaysM.push("${item.val}");
	</c:forEach>
	<c:forEach items="${memberJoinDaysF}" var="item">
		memberJoinDaysF.push("${item.val}");
	</c:forEach>
	<c:forEach items="${productPayState}" var="item">
		productPayState.push("${item.val}");
	</c:forEach>
	<c:forEach items="${productState}" var="item">
		productState.push("${item.val}");
	</c:forEach>
	
	chartDoughnut(); // 1
	chartPolarArea(); // 2
	chartLine(); // 3
	
	function chartDoughnut() {
		var configDoughnut = 
			{
				type: 'doughnut',
				data: {
						datasets: 
						[{
							data: productPayState,
							backgroundColor: 
							[
								Chart.helpers.color(chartColors.red).alpha(0.8).rgbString(),
								Chart.helpers.color(chartColors.orange).alpha(0.8).rgbString(),
								Chart.helpers.color(chartColors.blue).alpha(0.8).rgbString(),
							],
							label: '결제상태'
						}],
						labels: ['대기', '완료', '취소']
					}, 
				options: 
				{
					responsive: true,
					legend: { position: 'top', },
					title: { display: true, text: '결제상태' },
					animation: { animateRotate: true, animateScale: true }
				}
			};
		
		// 캔버스에 셋팅
		var ctxDoughnut = document.getElementById("canvas1").getContext("2d");
		window.myDoughnut = new Chart(ctxDoughnut, configDoughnut);
		window.myDoughnut.update();
	}

	
	function chartPolarArea() {
		var configPolarArea = 
			{
				type: 'polarArea',
				data: {
						datasets: 
						[{
							data: productState,
							backgroundColor: 
							[
								Chart.helpers.color(chartColors.red).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.orange).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.lime).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.green).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.darkred).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.cyan).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.yellow).alpha(0.5).rgbString(),
								Chart.helpers.color(chartColors.blue).alpha(0.5).rgbString(),
							],
							label: '물품상태'
						}],
						labels: ['요청', '요청취소', '승인', '승인취소', '낙찰', '유찰', '즉시구매', '구매취소']
					}, 
				options: 
				{
					type: Object,
					default: () => null,
					responsive: true,
					legend: { position: 'right', },
					title: { display: true, text: '물품상태' },
					scale: { ticks: { beginAtZero: true }, reverse: false },
					animation: { animateRotate: false, animateScale: true }
				}
			};
		
		// 캔버스에 셋팅
		var ctxPolarArea = document.getElementById("canvas2").getContext("2d");
		window.myPolarArea = new Chart(ctxPolarArea, configPolarArea);
		window.myPolarArea.update();
	}
	
	function chartLine() {
		var configLine =  
		{
			type: 'line',
			data: 
			{
				labels: ["6일전", "5일전", "4일전", "3일전", "2일전", "1일전", "오늘"], // 데이타들의 라벨. X축이 된다.
				datasets: 
				[{
					label: "회원가입수",
					fill: false,
					backgroundColor: chartColors.purple,
					borderColor: chartColors.purple,
					data: memberJoinDays
				},
				{
					label: "남자회원가입수",
					backgroundColor: chartColors.blue, 
					borderColor: chartColors.blue,
					data: memberJoinDaysM,
					fill: false
				}, 
				{
					label: "여자회원가입수",
					fill: false,
					backgroundColor: chartColors.red,
					borderColor: chartColors.red,
					data: memberJoinDaysF
				}]
			},
			options: 
			{
				responsive: true,
				title:{ display:true, text:'회원가입수현황' },
				tooltips: { mode: 'point', intersect: false, },
				hover: { mode: 'nearest', intersect: true },
				scales: 
				{
					xAxes: [{ display: true, scaleLabel: { display: true, labelString: '일' } }],
					yAxes: [{ display: true, scaleLabel: { display: true, labelString: '수' }, ticks: { beginAtZero: true}}]
				}
			}
		};
		
		// 캔버스에 셋팅
		var ctxLine = document.getElementById("canvas3").getContext("2d");
		window.myLine = new Chart(ctxLine, configLine);
		window.myLine.update();
	}
});
</script>
