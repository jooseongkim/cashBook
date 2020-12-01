<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="https://www.chartjs.org/samples/latest/style.css">
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	<h1 style="text-align: center;">2019년 총 수입 / 지출</h1>
	<!--차트1 생성-->
	<div class="content">
		<canvas id="pieChart"></canvas>
	</div>
	<!--table-->
	<div></div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">

	$.ajax({
		url : '${pageContext.request.contextPath}/totalOutAndInByYear/2019',
		type : 'get',
		success : function(data) {
			let randomColor1 = Math.floor(Math.random() * 256);
			let randomColor2 = Math.floor(Math.random() * 256);
			let randomColor3 = Math.floor(Math.random() * 256);
			let pieCtx = $('#pieChart');
			let pieChart = new Chart(pieCtx, {
				type : 'pie',
				data : {
					labels : [ '수입', '지출' ], //항목(범주)
					datasets : [ {
						backgroundColor : [ 'rgb(' + randomColor1 + ','
								+ randomColor2 + ',' + randomColor3 + ')' ],
						borderColor : [ 'rgb(' + randomColor1 + ','
								+ randomColor2 + ',' + randomColor3 + ')' ],
						data : [ data.수입, data.지출 ]
					//데이터
					}]
				},
				options : {}
			});
		}
	});
</script>
</html>