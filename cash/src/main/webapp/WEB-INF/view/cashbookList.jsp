<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbook List</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>가계부 리스트</h1>
	<a href="${pageContext.request.contextPath}/admin/cashbookListExcel">전체 가계부 리스트를 출력</a>
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>수입/지출</th>
				<th>카테고리</th>
				<th>가격</th>
				<th>내용</th>
				<th>기록일시</th>
				<th>생성 날짜</th>
				<th>수정 날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td>${c.cashbookDate}</td>
					<td>${c.createDate}</td>
					<td>${c.updateDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}">[이전]</a>
		 <a href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">[다음]</a>
	</div>
</body>
</html>