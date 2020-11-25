<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>Index</h1>
	<!-- 공지 -->
	<div>
		<table border="1">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<!-- <th>notice_content</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="var" items="${noticeList}">
				<tr>
					<td>${var.noticeId}</td>
					<td>${var.noticeTitle}</td>
					<%-- <td>${var.noticeContent}</td> <!-- n.getNoticeContent() --> --%>
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
	<!-- 수입/지출 -->
	<div>
			<table border="1">
		<thead>
			<tr><th>날짜</th>
				<th>수입</th>
				<th>지출</th>
				<th>합계</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="io" items="${inOutList}">
				<tr>
					<!-- 날짜 , 수입 , 지출 , 합계 -->
					<td>${io["날짜"]}</td>  <!-- io.get("날짜") -->
					<td>${io["수입"]}</td>
					<td>${io["지출"]}</td>
					<td>${io["합계"]}</td>
				</tr>
			</c:forEach>
		</tbody>	
		</table>
	</div>
</body>
</html>