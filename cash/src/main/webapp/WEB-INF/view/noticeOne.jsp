<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- if/for문을 대신해주는 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 보기</title>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
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
	<h1 class="center" style="font-weight: bolder;">공지사항 상세보기</h1>
	<div>
		<table border="1" class="container">
			<tr>
				<td>번호</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>${notice.noticeContent}</td>
			</tr>
			<tr>
				<td>생성 날짜</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
		
	</div>
	<hr>
		<h3 class="center">첨부 파일 리스트</h3>
		<c:forEach var="nf" items="${notice.noticeFileList}">
			<table border="1">
				<tr>
					<td>파일</td>
					<td><a href="${pageContext.request.contextPath}/upload/${nf.noticeFileName}">${nf.noticeFileName}</a></td>
				</tr>
				<tr>
					<td>파일 사이즈</td>
					<td>${nf.noticeFileSize}</td>
				</tr>
				<tr>
					<td>파일 타입</td>
					<td>${nf.noticeFileType}</td>
				</tr>
			</table>
		</c:forEach>
		<br>
		<div class="center">
			<a href="${pageContext.request.contextPath}/admin/modifyNotice/${notice.noticeId}">수정</a>
			<a href="${pageContext.request.contextPath}/admin/removeNotice/${notice.noticeId}">삭제</a>
		</div>
</body>
</html>