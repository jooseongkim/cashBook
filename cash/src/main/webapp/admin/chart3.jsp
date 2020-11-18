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
	<h1 style="text-align: center;">Chart 3</h1>
	<!--차트3 생성-->
	<div class="content">
		<div class="wrapper">
			<div class="input-group mb-3">
				<input type="text" placeholder="연도 입력" id="year">
				<button id="insert" type="button">Go</button>
			</div>
			<canvas id="chart3"></canvas>
		</div>

		<div id="chart-analyser" class="analyser"></div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
$('#insert').click(function(){
	$.ajax({
		url : '/lineDataset/'+$('#year').val(),
		type : 'get',
		success : function(data) {
	console.log(data);
				let randomColor1 = Math.floor(Math.random() * 256);
				let randomColor2 = Math.floor(Math.random() * 256);
				let randomColor3 = Math.floor(Math.random() * 256);
				randomcolor = ['rgb(' + randomColor1 + ',' + randomColor2 + ',' + randomColor3 + ')']
				let lineCtx = $('#chart3');
				let chart = new Chart(lineCtx, {
					type : 'line',
					data : {
						
						labels : [ '1', '2', '3', '4', '5', '6', '7',
							'8', '9', '10', '11', '12'  ], //항목(범주)
						datasets : [ {
							label : '수입',
							backgroundColor : [ randomcolor ],
							borderColor : [ 'rgb(' + randomColor1 + ','
									+ randomColor2 + ',' + randomColor3 + ')' ],
							data : [ data.January, data.February,
								data.March, data.April, data.May,
								data.June, data.July, data.August,
								data.September, data.October,
								data.November, data.December]
						//데이터
						}]
					},
					options: {}
				});
			}
		});
	});
		
/* 		var chart = new Chart('chart3', {
			type: 'line',
			data: data,
			options: options
		}); */


	</script>
</html>
