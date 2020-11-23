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
<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
<script src="https://www.chartjs.org/dist/2.9.4/Chart.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1 style="text-align: center;">Chart 5</h1>
	<!--차트1 생성-->
	<div>
		<canvas id="chart5"></canvas>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
	$.ajax({
		url : '/totalYearExpenditures',
		type : 'get',
		success : function(data) {
			console.log(data);
			let getData = [];
			$(data).each(function(index, item) {
				getData.push(item.지출);
				console.log(item.지출);
			});
			var color = Chart.helpers.color;
			var scatterChartData = {
					datasets: [{
						borderColor: window.chartColors.red,
						backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
						label: ['2018','2019','2020'],
						data: [{
							getData
						}]
					}]
				};
			var ctx = document.getElementById('chart5').getContext('2d');
			window.myScatter = Chart.Scatter(ctx, {
				data : getData,
				options : {
					title : {
						display : true,
						text : '연도별 지출 총 합계'
					},
					scales : {
						xAxes : [ {
							type : 'logarithmic',
							position : 'bottom',
							ticks : {
								userCallback : function(tick) {
									var remain = tick
											/ (Math.pow(10, Math
													.floor(Chart.helpers
															.log10(tick))));
									if (remain === 1 || remain === 2
											|| remain === 5) {
										return tick.toString() + 'Hz';
									}
									return '';
								},
							},
							scaleLabel : {
								labelString : 'Frequency',
								display : true,
							}
						} ],
						yAxes : [ {
							type : 'linear',
							ticks : {
								userCallback : function(tick) {
									return tick.toString() + 'year';
								}
							},
							scaleLabel : {
								labelString : 'Voltage',
								display : true
							}
						} ]
					}
				}
			});
		}
	});
</script>
</html>