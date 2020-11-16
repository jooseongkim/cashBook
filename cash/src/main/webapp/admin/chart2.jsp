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
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1>연도별 월간 총 지출액</h1>
	<!--차트1 생성-->
	<div>
		<canvas id="chart2"></canvas>
	</div>
	<!--table-->
	<div></div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
	$.ajax({
		url : '/totalMonthlyExpendituresByYear',
		type : 'get',
		success : function(data) {
			let randomColor1 = Math.floor(Math.random() * 256);
			let randomColor2 = Math.floor(Math.random() * 256);
			let randomColor3 = Math.floor(Math.random() * 256);
			var ctx = document.getElementById('myChart').getContext('2d');
			var chart = new Chart(ctx, {
				type : 'bar', // chart의 종류 = bar 차트
				data : {
					labels : [ '1', '2', '3', '4', '5', '6', '7', '8', '9',
							'10', '11', '12' ],
					datasets : [ {
						label : 'total Expenditures By Months',
						backgroundColor : [ 'rgb(' + randomColor1 + ','
								+ randomColor2 + ',' + randomColor3 + ')' ],
						borderColor : [ 'rgb(' + randomColor1 + ','
								+ randomColor2 + ',' + randomColor3 + ')' ],
						data : [ data.January, data.February, data.March,
								data.April, data.May, data.June, data.July,
								data.August, data.September, data.October,
								data.November, data.December ],

						borderWidth : 1
					} ]
				}, // chart안에 사용되는 모든 데이터(x,y축 이름, dataset)
				options : {}
			});
		}
	});
</script>
</html>