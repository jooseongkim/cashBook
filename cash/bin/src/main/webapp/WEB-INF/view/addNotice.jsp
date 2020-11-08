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
	<h1>공지사항 추가</h1>
	<form action="/admin/addNotice" method="post">
		<div>
			<table border="1">
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent"></textarea></td>
				</tr>
			</table>
			<button type="submit">공지사항 입력</button>
		</div>
	</form>
</body>
</html>