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
/*  보기 쉽게 무늬만 한거니 없애셔도 상관 없읍니다! */
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
    border:none;
	background-color: white;
    width: 20pt;
	height: 20pt;
	color: blue;
}
 button{
    cursor: pointer;
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
	 <c:forEach var="dateList" items="${dateList}" varStatus="date_status">
		<c:choose>
		    <!-- 시스템상 "오늘" 날짜 -->
			<c:when test="${dateList.value=='today'}">
					 		 <td class="today">
							 	<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">	
						        <!-- 만약에 "오늘"에 데이터가 담겨있으면 출력됨 -->
						        <c:forEach var="result" items="${result }" varStatus="status">
						        	<c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
						                <div id="num_message_${dateList.date}">
						 		 	 	        ${result.schedule }<br>
						 		 		        ${result.schedule_detail }<br>	
						                </div>
						             </c:if>
						        </c:forEach>
						        </div>
					 		 </td>
			 <!-- 값을 담기 위한 더미데이터 -->	 		 
                   <c:forEach var="result" items="${result }" varStatus="status">
					     <c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
					         <td class="today" hidden>
								<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">이거보이면 충재문의</div>
					        </td>
					     </c:if>					
				   </c:forEach>					   					    
				</c:when>	
		
			<!-- 시스템상 "토요일" 날짜 -->
			<c:when test="${date_status.index%7==6}">
							<td class="sat_day">
								<div class="sat" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">
						         <c:forEach var="result" items="${result }" varStatus="status">
						        	<c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
						                <div id="num_message_${dateList.date}">
						 		 	 	        ${result.schedule }<br>
						 		 		        ${result.schedule_detail }
						                </div>
						             </c:if>
						        </c:forEach>					        
						        </div>
							</td>
						
                   <c:forEach var="result" items="${result }" varStatus="status">
					     <c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
					         <td class="sat_day" hidden>
								<div class="sat" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">이거보이면 충재문의</div>
					        </td>
					     </c:if>					
				   </c:forEach>					   					    
				</c:when>	
		
			<!-- 시스템상 "일요일" 날짜 -->
			<c:when test="${date_status.index%7==0}">
				</tr>
				 <tr>
					<td class="sun_day">
						<div class="sun" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						<div id="num_message_${dateList.date}">
							<c:forEach var="result" items="${result }" varStatus="status">
						        	<c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
						                <div id="num_message_${dateList.date}">
						 		 	 	        ${result.schedule }<br>
						 		 		        ${result.schedule_detail }		
						                </div>
						             </c:if>
						        </c:forEach>	
						</div>
				    <c:forEach var="result" items="${result }" varStatus="status">
					     <c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
					         <td class="sun_day" hidden>
								<div class="sun" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">이거보이면 충재문의</div>
					        </td>
					     </c:if>					
				   </c:forEach>		
					</td>
					</c:when>
		   <!-- 시스템상 "평일" 날짜 -->
					<c:otherwise>
						<td class="normal_day">
							<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
					    	<div id="num_message_${dateList.date}">
							<c:forEach var="result" items="${result }" varStatus="status">
						        	<c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
						                <div id="num_message_${dateList.date}">
						 		 	 	        ${result.schedule }<br>
						 		 		        ${result.schedule_detail }		
						                </div>
						             </c:if>
						    </c:forEach>						    	
					    	</div>
						</td>
						<c:forEach var="result" items="${result }" varStatus="status">
					     <c:if test="${result.date == dateList.date && result.month == today_info.search_month && result.year == today_info.search_year }">
					         <td class="normal_day" hidden>
								<div class="date" onclick="number_click('${dateList.date}')">${dateList.date}</div>
						        <div id="num_message_${dateList.date}">이거보이면 충재문의</div>
					        </td>
					     </c:if>					
				       </c:forEach>		
					  </c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
		</div>
	<script>
	/*캘린더 내에서 날짜를 클릭하면 "input - submit" 자동생성 */
	function number_click(a) {
		const message_area=document.getElementById('num_message_' + a);
        message_area.innerHTML=`        
        <form action="/calendar/input_calendar" method="get">
        <div id="message_box">
        <input type=text name='year' value=${today_info.search_year} hidden>
		<input type=text name='month' value=${today_info.search_month} hidden>
		<input type=text name='value' value='${club_cl_name }' hidden>
        <input type="text" name='date' value=`+a+` hidden>
        title
        <br>
        <input type=text name='schedule' placeholder="null입력"><br>
        message
        <br>
        <input type=text name='schedule_detail' placeholder="시 애러납니다">
        <button type="submit" id='test_btn'>V</button> 
        <div>
        </form>
        `
	}
	/*서브밋에 이벤트효과(사실무의미 한것 같은데 지우면 코드가 작동이 안됩니다.) */
	const test_btn = document.getElementById('test_btn');
	test_btn.onclick = () => {
		alert("정상작동")
		if($("#schedule").val() == "" || $("#schedule_detail").val() == ""){
			alert("인풋박스 채워주세요")
		} else{
			location.href = "/calendar/input_calendar";
		}
	}
	/*중복되는 행을 합침 */
	$(window).load(function () {
		$(".sat_day").each(function () {
			var rows = $(".sat_day:contains('" + $(this).text() + "')");

			if (rows.length > 1) {
				rows.eq(0).attr("rowspan", rows.length);
				rows.not(":eq(0)").remove(); 
			} 
		});
	    
	});

	</script>
</body>
</html>
