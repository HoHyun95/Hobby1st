<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>calendar</title>
<style TYPE="text/css">
* {
	text-align: center;
	margin: auto;
}

a {
	text-decoration-line: none;
	color: black;
}

.navigation {
	font-size: 15pt;
	height: 50px;
	line-height: 200%;
}

.calendar {
	width: 700px;
	height: 700px;
}

.calendar_body {
	width: 600px;
	height: 600px;
}

.calendar_wrap_top {
	background-color: rgba(158, 128, 247, 0.9);
	color: white;
	font-weight: bold;
}

.sun_day {
	color: red;
}

.sat_day {
	color: blue;
}
.low_box{
	line-height: 250%;
    height: 50px;
}
.today{
	background-color: gray;
	font-weight: bold;
}
button{
    width: 50pt;
	height: 20pt;
}
.sun:hover{
    cursor: pointer;
}
</style>
</head>
<body>
	<form id="calendarFrm" action="/calendar/do" method="get">
		<div class="calendar">
			<!-- 클럽이름 -->
			<div class="club_name">
				<h2>
					어서오세요!<br> ${club_cl_name }동호회의 캘린더 입니다!
				</h2>
			</div>

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year"
					href="/calendar/do?year=${today_info.search_year-1}&month=${today_info.search_month-1}&club_cl_name=${club_cl_name}">
					&lt;&lt; <!-- 이전해 -->
				</a> <a class="before_after_month"
					href="/calendar/do?year=${today_info.before_year}&month=${today_info.before_month}&club_cl_name=${club_cl_name}">
					&lt; <!-- 이전달 -->
				</a> <span class="this_month"> &nbsp;${today_info.search_year}. <c:if
						test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> <a class="before_after_month"
					href="/calendar/do?year=${today_info.after_year}&month=${today_info.after_month}&club_cl_name=${club_cl_name}">
					<!-- 다음달 --> &gt;
				</a> <a class="before_after_year"
					href="/calendar/do?year=${today_info.search_year+1}&month=${today_info.search_month-1}&club_cl_name=${club_cl_name}">
					<!-- 다음해 --> &gt;&gt;
				</a>
			</div>
			<table class="calendar_body" border=1>
				<tr class="calendar_wrap_top">
					<td class="day sun">일</td>
					<td class="day">월</td>
					<td class="day">화</td>
					<td class="day">수</td>
					<td class="day">목</td>
					<td class="day">금</td>
					<td class="day sat">토</td>
				</tr>
				<tr>
					<c:forEach var="dateList" items="${dateList}"
						varStatus="date_status">
						<c:choose>
							<c:when test="${dateList.value=='today'}">
								<td class="today">
									<div class="date">${dateList.date}</div>
									<div></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat">${dateList.date}</div>
									<div></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun" onclick="sun_click()">${dateList.date}</div>
						<div></div>
					</td>
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date">${dateList.date}</div>
							<div></div>
						</td>
					</c:otherwise>
					</c:choose>
					</c:forEach>
			</table>
            <div class="low_box">
               <button type="button">저장</button>
            </div>
		</div>
	</form>
	<script>
	function sun_click() {
		alert("일요일을 눌렀군요~ 곳 스케줄적는 란이 생길겁니다")
	}
	</script>
</body>
</html>
