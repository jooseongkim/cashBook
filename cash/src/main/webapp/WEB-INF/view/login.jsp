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
	<!--로그인-->
	<form action="/login" method="post">
		<div>
			ID : <input type="text" name="id">
		</div>
		<div>
			PW : <input type="password" name="pw">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>

	</form>
	<!-- 공지 -->
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>notice_id</th>
					<th>notice_title</th>
					<!-- <th>notice_content</th> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${noticeList}">
					<tr>
						<td>${n.noticeId}</td>
						<td>${n.noticeTitle}</td>
					<%-- 	<td>${var.noticeContent}</td> --%>
						<!-- n.getNoticeContent() -->
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>