<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>calendar</title>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/locales-all.min.js'></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	//사이즈
    	height : '600px',
    	expandRows: true,
    	
    	//캘린더헤더부분
    	headerToolbar: {
    		left: 'prev,next today',
    		center: 'title',
    		right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek' 
    		},
        //첫페이지에서 보여지는 달
        initialView: 'dayGridMonth',
        
        //수정가능
        editable: true,
        
        //달력에 여러가지 날 선택가능
        selectable: true,
        
        //현재시간 보여주는 마크생성
        nowIndicator: true,
        
        //이벤트 오버할시 자동 크기 조절
        dayMaxEvents: true,
        locale: 'ko',
        //이벤트가 추가되면 발생하는 이벤트
        eventAdd: function(arg) {
            console.log(arg.event);
        },
        
        //이벤트 삭제
        eventClick: function(arg){  
        	console.log(arg.event);
        	if(confirm("정말로 삭제하시겠습니까?")){
            arg.event.remove();
        	}
        },
        
        //캘린더에서 드래그로 이벤트를 생성
        select: function(arg) {
        	var title = prompt('입력할 이벤트 :');
         	$.ajax({
                type:"get",
                url:"${path}/calendar/method?club=${club_cl_name}",
                data:
                {title:title}
         	});
        	if (title) {
        	calendar.addEvent({
        	title: title,
        	start: arg.start,
        	end: arg.end,
        	allDay: arg.allDay,
        	backgroundColor:"rgba(158, 128, 247, 0.9)", 
        	textColor:"white"
        	})
        }
        calendar.unselect()
        },
    });
    calendar.render();
    });
</script>
</head>
<body>
  <div id='calendar'></div>
 </body>
</html>