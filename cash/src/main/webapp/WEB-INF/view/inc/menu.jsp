
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel="stylesheet" href="/css/indexAndMenu.css" />
</head>
<body >
	<div class="container teal borderYtoX">
	<h1 class="h1 font">My CashBook Project</h1>
	<br>
	<br>
			<a href="${pageContext.request.contextPath}/admin/index">����������</a>
			<a href="${pageContext.request.contextPath}/admin/cashbookByMonth">���� �����</a>
			<a href="${pageContext.request.contextPath}/admin/noticeList/1">��������</a>
			<a href="${pageContext.request.contextPath}/admin/cashbookList/1">����� ����Ʈ</a>
			<a href="${pageContext.request.contextPath}/admin/chart1.jsp">��Ʈ</a>
			<a href="${pageContext.request.contextPath}/admin/addMember">����� �߰�</a>
			<a href="${pageContext.request.contextPath}/admin/logout">logout</a>
	</div >
</body>
</html>
