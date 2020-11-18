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

	<div class="content">
		<div class="wrapper" style="max-width: 512px; margin: auto">
			<canvas id="chart4"></canvas>
		</div>
		<div id="chart-analyser" class="analyser"></div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
	$.ajax({
		url : '/radarDataSet/',
		
		console.log(data);
	var presets = window.chartColors;
	var utils = Samples.utils;
	var inputs = {
		min : 8,
		max : 16,
		count : 8,
		decimals : 2,
		continuity : 1
	};

	function generateData() {
		// radar chart doesn't support stacked values, let's do it manually
		var values = utils.numbers(inputs);
		inputs.from = values;
		return values;
	}

	function generateLabels() {
		return utils.months({
			count : inputs.count
		});
	}

	utils.srand(42);

	var data = {
		labels : generateLabels(),
		datasets : [ {
			backgroundColor : utils.transparentize(presets.red),
			borderColor : presets.red,
			data : generateData(),
			label : 'D0'
		}, {
			backgroundColor : utils.transparentize(presets.orange),
			borderColor : presets.orange,
			data : generateData(),
			hidden : true,
			label : 'D1',
			fill : '-1'
		}, {
			backgroundColor : utils.transparentize(presets.yellow),
			borderColor : presets.yellow,
			data : generateData(),
			label : 'D2',
			fill : 1
		}, {
			backgroundColor : utils.transparentize(presets.green),
			borderColor : presets.green,
			data : generateData(),
			label : 'D3',
			fill : false
		}, {
			backgroundColor : utils.transparentize(presets.blue),
			borderColor : presets.blue,
			data : generateData(),
			label : 'D4',
			fill : '-1'
		}, {
			backgroundColor : utils.transparentize(presets.purple),
			borderColor : presets.purple,
			data : generateData(),
			label : 'D5',
			fill : '-1'
		} ]
	};

	var options = {
		maintainAspectRatio : true,
		spanGaps : false,
		elements : {
			line : {
				tension : 0.000001
			}
		},
		plugins : {
			filler : {
				propagate : false
			},
			'samples-filler-analyser' : {
				target : 'chart-analyser'
			}
		}
	};

	var chart = new Chart('chart4', {
		type : 'radar',
		data : [data.수익],
		options : options
	});
	});
</script>
</html>