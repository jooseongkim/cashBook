
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
	<div class="containerMenu cyan borderYtoX">
	<h1 class="h1 font">My CashBook Project</h1>
	<br>
	<br>
			<a href="${pageContext.request.contextPath}/admin/index">메인페이지</a>
			<a href="${pageContext.request.contextPath}/admin/cashbookByMonth">월별 가계부</a>
			<a href="${pageContext.request.contextPath}/admin/noticeList/1">공지사항</a>
			<a href="${pageContext.request.contextPath}/admin/cashbookList/1">가계부 리스트</a>
			<a href="${pageContext.request.contextPath}/admin/chart1.jsp">차트</a>
			<a href="${pageContext.request.contextPath}/admin/addMember">사용자 추가</a>
			<a href="${pageContext.request.contextPath}/admin/logout">logout</a>
	</div >
</body>
</html>
