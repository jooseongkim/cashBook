<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Raleway'>
	<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 class="text-center">Index</h1>
	<!-- 공지 -->
	<div class="pricing-box-container">
		<table class="type05">
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
	<hr>
	<!-- 수입/지출 -->
	<!-- 날짜 , 수입 , 지출 , 합계 -->
	<div class="pricing-box-container" id="pricing">
		<c:forEach var="io" items="${inOutList}">
			<div class="price_card alpha" style="font-weight: bolder;">
				<div class="header">
					<span class="price">${io["날짜"]}</span>
					<hr>
				</div>
				<ul class="features">
					<li>수입:&nbsp;${io["수입"]}원<br></li>
				</ul>
				<hr>
				<ul class="features">
					<li>지출:&nbsp;${io["지출"]}원</li>
				</ul>
				<hr>
				<ul class="features">
					<li>합계:&nbsp;${io["합계"]}원</li>
				</ul>
			</div>
		</c:forEach>
	</div>
</body>
</html>