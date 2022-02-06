<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>calendar detail</title>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/main.min.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.10.0/locales-all.min.js'></script>
</head>
<body>
<form action="delete" method="get">
 <table border=1 style="text-align:center">
    <tr>
      <td colspan=2> <input type="text" value="${club_cl_name }" name="club_cl_name" readonly>
   </tr>
   <tr>
      <td> 제목
      <td> <input type="text" value="${title }" name="title" readonly>
   </tr>
    <tr>
      <td> 시작날짜
      <td> ${start }
   </tr>
   <c:if test="${end != 'null' }">
    <tr>
       <td> 종료날짜
       <td> ${end }
    </tr>
   </c:if>
   <tr>
      <td> 참여자
      <td> <input type="text">
   </tr>
   <tr>
      <td> 스케줄세부내용
      <td> <textarea style="resize: none;"></textarea>
   </tr>
    <tr>
      <td colspan=2> <button type="button" id="delete">스케줄 삭제</button>
   </tr> 
 </table>
 </form>
</body>
<script>
$("#delete").on("click",function() {
	$.ajax({
        type: "post",
        url: "/calendar/delete?club_cl_name=${club_cl_name}",
        data: {title:'${title}'}      
 	});
	alert("삭제성공!")
	window.close();
})
</script>
</html>