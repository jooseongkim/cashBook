<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Raleway'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/indexAndMenu.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#addBtn').click(function(){
			let html = '<div><input type="file" name="noticeFile" class="noticeFile"></div>';
			$('#fileInput').append(html);
		});

		$('#delBtn').click(function(){
			$('#fileInput').children().last().remove();
		})


		$('#modifyBtn').click(function(){
			if($('#noticeTitle').val().lenth < 1){
				alert('제목을 입력해 주세요.');
				return;
			} else if($('#noticeContent').val().length < 1){
				alert('내용을 입력해 주세요.');
				return;
			}
			let ck = true;
			$('.noticeFile').each(function(index, item){
				console.log($(item).val());
				if($(item).val() == '') {
					ck = false;
				}
			})
			if(ck == false) { // if(ck)a
				alert('선택하지 않은 파일이 1개 이상 있습니다');
			} else {
				$('#modifyNoticeForm').submit();
			}
		});
	});
</script>
</head>
<body>
	<!--공지사항 수정-->
	<h1>공지사항 수정</h1>
	<div>
		<form action="${pageContext.request.contextPath}/admin/modifyNotice" method="post" id="modifyNoticeForm" enctype="multipart/form-data">
			<table border="1">
				<tr>
					<td>번호</td>
					<td><input type="text" name="noticeId" id="noticeId"
						value="${notice.noticeId}" readonly="readonly"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle" id="noticeTitle"
						value="${notice.noticeTitle}"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent" cols="50" rows="10" id="noticeContent"> ${notice.noticeContent}</textarea></td>
				</tr>
				<tr>
					<td>생성 날짜</td>
					<td>
					<input type="text" name="noticeDate" value="${notice.noticeDate}" readonly="readonly"></td>
				</tr>
				 <c:forEach var="nf" items="${notice.noticeFileList}">
				<tr>
					<td>기존파일</td>
					<td><a
						href="${pageContext.request.contextPath}/upload/${nf.noticeFileName}">${nf.noticeFileName}</a>
						<c:if test="${not empty nf.noticeFileName}">
							<a
								href="${pageContext.request.contextPath }/admin/removeNoticefileOne/${notice.noticeId}/${nf.noticeFileName}">
								삭제</a>
						</c:if></td>
				</tr>
			</c:forEach>
			<tr>
				<td>File</td>
				<td>
					<div>
						<button type="button" id="addBtn">파일추가</button>
						<button type="button" id="delBtn">파일삭제</button>
					</div>
					<div id=fileInput></div>
				</td>
			</tr>
			</table>
			<button type="button" id="modifyBtn">수정</button>
		</form>
	</div>
</body>
</html>