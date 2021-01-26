<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style type="text/css">
.homeImg {
	background-image: url("");
}

.h3 {
	text-align: center;
	font-size: 25px;
	font-weight: 600;
	text-transform: uppercase;
	color: #000000;
}

.box {
	box-sizing: border-box;
}

.body {
	background-image: url("lightGray.jpg");
	text-align: center;
}

.button {
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

.button:hover {
	background: #fff;
	color: #1AAB8A;
}

.button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

.button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

.container {
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}

.table {
	width:100%;
	border:1px solid $color-form-highlight;
}
.table-header {
	display:flex;
	width:100%;
	background:#000;
	padding:($half-spacing-unit * 1.5) 0;
}
.table-row {
	display:flex;
	width:100%;
	padding:($half-spacing-unit * 1.5) 0;
	
	&:nth-of-type(odd) {
		background:$color-form-highlight;
	}
}

.center {
	text-align: center;
}

.left {
	text-align: left;
}

.label {
	height: 40px;
}
</style>
</head>
<body class="body" style="margin-top: 100px">
	<!--로그인-->
	<form action="${pageContext.request.contextPath}/login" method="post" class="box">
		<h3 class="h3">Login</h3>
		<div class="center">
			<input type="text" name="id" placeholder="goodee" class="label left">
		</div>
		<div>&nbsp;</div>
		<div class="center">
			<input type="password" name="pw" placeholder="1234" class="label left">
		</div>
		<div>&nbsp;</div>
		<div>
			<button type="submit" class="button">로그인</button>
		</div>
	</form>
	<hr>
	<!-- 공지 -->
	<div class="center container">
		<h3 class="h3">공지사항</h3>
		<table class="table">
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