<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexAndMenu.css" />
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
		<table border="1" class="center">
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
						<td><a href="${pageContext.request.contextPath}/admin/noticeOne/${n.noticeId}">${n.noticeTitle}</a></td>
						<%-- <td>${n.noticeContent}</td> --%>
						<td>${n.noticeDate}</td>
						<%--  <!-- n.getNoticeContent() --> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div ><a href="${pageContext.request.contextPath}/admin/addNotice">공지사항 추가</a></div>
	</div>
	
	<c:if test="${currentPage>1}">
		<div class="center">
			<a 
				href="${pageContext.request.contextPath}/noticeList/${currentPage-1}">이전</a>
		</div>
	</c:if>
	<c:if test="${currentPage<lastPage}">
		<div class="center">
			<a 
				href="${pageContext.request.contextPath}/noticeList/${currentPage+1}">다음</a>
		</div>
	</c:if>
</body>
</html>
