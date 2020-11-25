<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#id').focus();
		$('#id').blur(function() {
			if($('#id').val() == '') {
				return;
			}
			// 비 동기요청으로 id값을 서버에 보내고 id값의 중복여부를 받아옴
			$.ajax({
				url:'/admin/idCkeck',
				type:'post',
				data:{id:$('#id').val()},
				success.function(data) {
					if(data == 'yes') {
							alert($('#id').val()+'는 사용 가능한 아이디입니다');
							$('#pw').focus();
							} else {
								alert($('#id').val()+'는 사용불가능한 아이디입니다');
								$('#id').select();
								$('#id').focus();
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>addMember</h1>
	<form method="post" action="${pageContext.request.contextPath}/admin/addMember">
		<div>
			ID : <input type="text" id="id" name="id" placeholder="아이디를 입력하세요">
		</div>

		<div>
			PW : <input type="password" id="pw" name="pw" placeholder="비밀번호">
		</div>
		<div>
			<button id="addMember" type="submit">회원가입</button>
		</div>
	</form>
</body>
</html>