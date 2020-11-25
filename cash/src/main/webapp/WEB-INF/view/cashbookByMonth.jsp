<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.sunday a {
				color: #FF0000;
			}
			.saturday a {
				color: #0000FF;
			}
			.weekday a {
				color: #000000;
			}
			
			th {
				width: ${100/7}%;
			}
			td {
				height: 80px;
				vertical-align: top;
			}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookByMonth</h1>
	<!-- 다이어리 -->
	 <div>
      ${currentMonth}월 수입 합계 : ${sumIn}
   </div>
   <div>
      ${currentMonth}월 지출 합계 : ${sumOut}
   </div>

	<h3>
	<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/pre/${currentYear}/${currentMonth-1}">[이전달]</a>
	${currentYear }년${currentMonth}월
	<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/next/${currentYear}/${currentMonth+1}">[다음달]</a>
	</h3>
	
	<div>
		<table border="1">
			<thead>
				<tr>
					<th class="sunday">일</th>		
					<th>월</th>		
					<th>화</th>		
					<th>수</th>		
					<th>목</th>		
					<th>금</th>		
					<th>토</th>		
				</tr>
			</thead>
			<tbody>
				<tr>
					<!-- 이게 for문 대신. 1~31까지 -->
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1) }" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1 }">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0 }">
							<td>
							<!--  <div><!-- 날짜
									<a href="/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}">
										${i-(firstDayOfWeek-1)}
									</a>
								</div> -->
								<!-- 일요일 -->
								<c:if test="${i % 7 == 1}">
									<div class="sunday">
										<a href="${pageContext.request.contextPath}/admin/cashbookByDay/sun/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
								
								<!-- 토요일 -->
								<c:if test="${i % 7 == 0}">
									<div class="saturday">
										<a href="${pageContext.request.contextPath}/admin/cashbookByDay/sat/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
								
								<!-- 평일 (월요일 ~ 금요일) -->
								<c:if test="${i % 7 != 1 && i % 7 != 0}">
									<div class="weekday">
										<a href="${pageContext.request.contextPath}/admin/cashbookByDay/wek/${currentYear}/${currentMonth}/${i - (firstDayOfWeek - 1)}">${i - (firstDayOfWeek - 1)}</a>
									</div>
								</c:if>
							
							<!-- 지출/수입 목록이 있는 날씨를 cashList에서 검색 -->
							<c:forEach var="c" items="${cashList}">
								<c:if test="${i-(firstDayOfWeek-1)== c.dday }">
									<c:if test="${c.cashbookKind == '수입' }">
										<div>수입 : ${c.cashbookPrice }</div>
								</c:if>
									<c:if test="${c.cashbookKind == '지출' }">
										<div>지출 : ${c.cashbookPrice }</div>
								</c:if>
								</c:if>
							</c:forEach>
							</td>
							</c:if>
						<!--<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>-->
						<c:if test="${i !=(lastDay+(firstDayOfWeek- 1))}">
							<c:if test="${i%7 == 0 }">
								<tr></tr>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 !=0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>