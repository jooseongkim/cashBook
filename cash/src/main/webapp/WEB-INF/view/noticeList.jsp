<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항</h1>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<!-- <th>내용</th> -->
					<th>생성 날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td><a href="/admin/noticeOne/${n.noticeId}">${n.noticeTitle}</a></td>
						<%-- <td>${n.noticeContent}</td> --%>
						<td>${n.noticeDate}</td>
						<%--  <!-- n.getNoticeContent() --> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/admin/addNotice">공지사항 추가</a>
	</div>
</body>
</html>
