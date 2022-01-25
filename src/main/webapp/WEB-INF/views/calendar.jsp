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
td {
    height: 100px;
    width: 100px;
    style: word-break:break-all;
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
input[type="text"]{
    width: 80%;
	height: 100%;
}
</style>
</head>
<body>
	<form id="calendarFrm" action="/calendar/input_calendar" method="get">
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
				<input type=text name='year' value=${today_info.search_year} hidden>
				<input type=text name='month' value=${today_info.search_month} hidden>
				<input type=text name='value' value=${club_cl_name } hidden>
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
									<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						            <div id="num_message_${dateList.date}"></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==6}">
								<td class="sat_day">
									<div class="sat" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						            <div id="num_message_${dateList.date}"></div>
								</td>
							</c:when>
							<c:when test="${date_status.index%7==0}">
				</tr>
				<tr>
					<td class="sun_day">
						<div class="sun" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						<div id="num_message_${dateList.date}"></div>
					</td>
					</c:when>
					<c:otherwise>
						<td class="normal_day">
							<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
					    	<div id="num_message_${dateList.date}"></div>
						</td>
					</c:otherwise>
					</c:choose>
					</c:forEach>
			</table>
            <div class="low_box">
               <button type="submit" id="test_btn">저장</button>
            </div>
		</div>
	</form>
	<script>
	/*인풋에 테두리 없애고 보이게 하고싶습니다 기훈님! (디자인 설계시 요청..) */
	function number_click(a) {
		const message_area=document.getElementById('num_message_' + a);

        message_area.innerHTML=`
        <input type="text" name=date value=`+a+` hidden>
        타이틀<br><input type=text name='schedule'><br>
        내용<br><input type=text name='schedule_detail'>
        `
	}
	
	const test_btn = document.getElementById('test_btn');
	test_btn.onclick = () => {
        var test1 = document.getElementById('test1').value
        var test2 = document.getElementById('test2').value		
		location.href = "/calendar/test?test1="+(test1)+"&test2="+(test2);
	}

	</script>
</body>
</html>
