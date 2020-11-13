<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<!--공지사항 수정-->
	<h1>공지사항 수정</h1>
	<div>
		<form action="/admin/modifyNotice" method="post">
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="noticeId"
						value="${notice.noticeId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle"
						value="${notice.noticeTitle}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent"> ${notice.noticeContent}</textarea></td>
				</tr>
				<tr>
					<td>생성 날짜</td>
					<td><input type="text" name="noticeDate"
						value="${notice.noticeDate}" readonly="readonly"></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>