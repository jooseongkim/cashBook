<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbook List</title>
<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
<style type="text/css">
.buttonLod {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 40px;
	font-size: 1.6em;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
}

.buttonLod:hover {
	background: #fff;
	color: #1AAB8A;
}

.buttonLod:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.buttonLod:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.buttonLod:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 class="center" style="font-weight: bolder;">가계부 리스트</h1>
	<a href="${pageContext.request.contextPath}/admin/cashbookListExcel" style="text-decoration: none;"
	class="buttonLod" >전체 가계부 리스트를 출력</a>
	<div >
	<table border="1" class="type10">
		<thead style="text-align: center">
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
	</div>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a
			href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage-1}" class="page-link">이전</a></li>
		<li class="page-item"><a class="page-link">${currentPage}</a></li>
		<li class="page-item"><a class="page-link"
			href="${pageContext.request.contextPath}/admin/cashbookList/${currentPage+1}">다음</a></li>
	</ul>
</body>
</html>