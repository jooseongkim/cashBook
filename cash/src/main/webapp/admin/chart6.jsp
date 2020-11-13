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
	<h1>Chart 6</h1>
	<!--차트1 생성-->
	<div>
		<canvas id="chart6"></canvas>
	</div>
	<!--table-->
	<div></div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script type="text/javascript">
	$.ajax({
		url:'',
		type:'',
		data:'',
		success:funtion(data){
				/*
				json문자열 -> 데이터셋(chart.js가 원하는 데이터셋) -> chart
				  */
			}
		});
</script>
</html>