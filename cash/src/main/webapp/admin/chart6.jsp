<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://www.chartjs.org/samples/latest/style.css">
<script src="https://www.chartjs.org/dist/2.9.4/Chart.min.js"></script>
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script
	src="https://www.chartjs.org/samples/latest/charts/area/analyser.js"></script>
</head>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1 style="text-align: center;">Chart 6</h1>
	<!--차트 생성-->
	<div>
		<canvas id="chart6"></canvas>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
	$.ajax({
		url:'/TotalYearInCom',
		type:'get',
		success:function(data){
			let getData = [];
			$(data).each(function(index, item){
				getData.push(item.수입);
				console.log(item.수입);
			});
			function createConfig(pointStyle) {
				return {
					type: 'line',
					data: {
						labels: ['2018','2019','2020'],
						datasets: [{
							label: '수입',
							backgroundColor: window.chartColors.red,
							borderColor: window.chartColors.red,
							data: [getData],
							fill: false,
							pointRadius: 10,
							pointHoverRadius: 15,
							showLine: false // no line shown
						}]
					},
					options: {
						responsive: true,
						title: {
							display: true,
							text: 'Point Style: ' + pointStyle
						},
						legend: {
							display: false
						},
						elements: {
							point: {
								pointStyle: pointStyle
							}
						}
					}
				};
			}
			window.onload = function() {
				var container = document.querySelector('.container');
				['circle'].forEach(function(pointStyle) {
					var div = document.createElement('div');
					div.classList.add('chart-container');

					var canvas = document.createElement('chart6');
					div.appendChild(canvas);
					container.appendChild(div);

					var ctx = canvas.getContext('2d');
					var config = createConfig(pointStyle);
					new Chart(ctx, config);
				});
			};
		}
	});
</script>
</html>