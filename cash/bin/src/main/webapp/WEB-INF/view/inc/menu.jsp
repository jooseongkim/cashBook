<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/WEB-INF/view/inc/indexAndMenu.css"/>
</head>
<body class="body">
	<div id="navBar" class="container gray highlightTextIn">
		<a href="/admin/index">메인페이지</a> 
		<a href="/admin/cashbookByMonth">월별 가계부</a> 
		<a href="/admin/noticeList">공지사항</a> 
		<a href="/admin/cashbookList/1">가계부 리스트</a> 
		<a href="http://localhost:8080/cashStats.html">연도별 월간 총 지출액</a> 
		<a href="/admin/chart1.jsp">차트</a> 
		<a href="/admin/logout">logout</a>
		<a href="/admin/addMember">사용자 추가</a>
		</div>
</body>
</html>