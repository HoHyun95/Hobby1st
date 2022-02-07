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
 <table border=1 style="text-align:center; height:500px; width:500px">
     <tr>
      <td colspan=2><h1>이건 팝업창입니다!</h1>
   </tr>
    <tr>
      <td> 동호회
      <td>${list.club }
   </tr>
   <tr>
      <td> 스케줄 제목 
      <td> ${list.title }
   </tr>
    <tr>
      <td> 시작날짜
      <td> ${list.day_start }
   </tr>
   <c:if test="${list.day_end != 'null' }">
    <tr>
       <td> 종료날짜
       <td> ${list.day_end }
    </tr>
   </c:if>
   <tr>
      <td> 참여자
      <td> <textarea style="resize:none; width:300px" id="memberWrite">${list.memberWrite }</textarea>     
   </tr>
   <tr>
      <td> 스케줄세부내용
      <td> <textarea style="resize: none; width:300px" id="detailWrite">${list.detailWrite }</textarea>
   </tr>
    <tr>
      <td colspan=2> 
      <button type="button" id="deleteWirte">스케줄 삭제</button>
      <button type="button" id="insert">내용등록</button>
   </tr> 
 </table>
 </form>
</body>
<script>
// 삭제요청 
$("#deleteWirte").on("click",function() {
	$.ajax({
        type: "post",
        url: "/calendar/delete?club_cl_name=${list.club}",
        data: {title:'${list.title}'}      
 	})
	alert("삭제성공!")
	opener.document.location.href="/calendar/do?club_cl_name=${list.club}"
	self.close();
	
	//location.reload();
	//window.close();
	

})

//내용등록 update로 
$("#insert").on("click",function() {
	var detail = document.getElementById("detailWrite").value
	var member = document.getElementById("memberWrite").value
	
	$.ajax({
		type: "post",
		url: "/calendar/insertDetail?club_cl_name=${list.club}",
		data: {detail:detail, member:member, title:'${list.title}'}
	})
	alert("내용등록성공!")
	opener.document.location.href="/calendar/do?club_cl_name=${list.club}"
	self.close();
})
</script>
</html>