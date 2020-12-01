<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
<style type="text/css">
.center {
	text-align: center;
	margin: auto;
	font-style: normal;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 class="center" style="font-weight: bolder;">공지사항</h1>
	<div>
		<table border="1" class="type05">
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
						<td><a
							href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}">${n.noticeTitle}</a></td>
						<%-- <td>${n.noticeContent}</td> --%>
						<td>${n.noticeDate}</td>
						<%--  <!-- n.getNoticeContent() --> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div style="text-align: right">
		<a href="${pageContext.request.contextPath}/admin/addNotice"
			class="big-button"> 공지사항 작성</a>
			<br>
			<br>
			<br>
	</div>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a
			href="${pageContext.request.contextPath}/admin/noticeList/${currentPage-1}" class="page-link">이전</a></li>
		<li class="page-item"><a class="page-link">${currentPage}</a></li>
		<li class="page-item"><a class="page-link"
			href="${pageContext.request.contextPath}/admin/noticeList/${currentPage+1}">다음</a></li>
	</ul>
</body>
</html>
