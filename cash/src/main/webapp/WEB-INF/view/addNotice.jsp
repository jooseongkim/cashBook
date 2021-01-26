<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<jsp:include page="/WEB-INF/view/inc/css.jsp"></jsp:include>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	
$(document).ready(function(){
	$('#addBtn').click(function(){
		let html = '<div><input type="file" name="noticeFile" class="noticeFile"></div>';
		$('#fileInput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileInput').children().last().remove();
	})


	$('#submitBtn').click(function(){
		if($('#noticeTitle').val().lenth < 1){
			alert('제목을 입력해 주세요.');
			return;
		} else if($('#noticeContent').val().length < 1){
			alert('내용을 입력해 주세요.');
			return;
		}
		let ck = true;
		$('.noticeFileList').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)a
			alert('선택하지 않은 파일이 1개 이상 있습니다');
		} else {
			$('#AddNoticeForm').submit();
		}
	});
});
</script>
</head>
<body>
	<h1>공지사항 추가</h1>
	<form method="post" enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/admin/addNotice"
		id="AddNoticeForm">
		<div class="center container">
			<table class="table">
				<tr>
					<td>제목</td>
					<td><input type="text" name="noticeTitle" placeholder="제목을 입력" id="noticeTitle"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="noticeContent" rows="10" cols="50" id="noticeContent"></textarea></td>
				</tr>
				
				<tr>
					<td>파일 업로드</td>
					<td>
						<div>
							<button type="button" id="addBtn">파일추가</button>
							<button type="button" id="delBtn">파일삭제</button>
						</div>
						<div id="fileInput"></div>
					</td>
				</tr>
			</table>
			<button type="button" id="submitBtn">공지사항 입력</button>
		</div>
	</form>
</body>
</html>