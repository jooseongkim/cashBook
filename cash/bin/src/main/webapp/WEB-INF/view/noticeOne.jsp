<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- if/for문을 대신해주는 코드 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세 보기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>공지사항 상세보기</h1>
	<div>
		<table border="1">
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
		<a href="/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a> 
		<a href="/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
	</div>
</body>
</html>