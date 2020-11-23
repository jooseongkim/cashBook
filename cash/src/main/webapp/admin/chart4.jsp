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
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1 style="text-align: center;">Chart 4</h1>
	<!--차트 생성-->

	<div >
		<div class="wrapper" style="max-width: 1560px; margin: auto">
			<canvas id="chart4"></canvas>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
$.ajax({
		url : '/radarDataSet',
		type : 'get',
		success : function(data) {
			console.log(data);

		let getData = [];
		$(data).each(function(index, item){
			getData.push(item.수익);
			console.log(item.수익);
		});
			
		let randomColor1 = Math.floor(Math.random() * 256);
		let randomColor2 = Math.floor(Math.random() * 256);
		let randomColor3 = Math.floor(Math.random() * 256);
		randomcolor = ['rgba(' + randomColor1 + ',' + randomColor2 + ',' + randomColor3 + ',0.2)']
		let radarCtx = $('#chart4');
		let chart = new Chart(radarCtx, {
			type: 'radar',
			data: {
				labels: ['2018','2019','2020'],
				datasets: [{
					label: '연도별 수익 현황',
					backgroundColor: [randomcolor,randomcolor,randomcolor],
					borderColor: [randomcolor,randomcolor,randomcolor],
					pointBackgroundColor: [randomcolor,randomcolor,randomcolor],
					
					data: getData
				}]
			},
			options: {
				legend: {
					position: 'top',
				},
				scale: {
					ticks: {
						beginAtZero: true
					}
				}
			}
		});
	}
});

</script>
</html>