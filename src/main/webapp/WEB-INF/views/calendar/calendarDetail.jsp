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
 <table border=1 style="text-align:center; hegiht:500px; width:500px">
     <tr>
      <td colspan=2><h1>이건 팝업창입니다!</h1>
   </tr>
    <tr>
      <td> 동호회
      <td>${club_cl_name }
   </tr>
   <tr>
      <td> 스케줄 제목 
      <td> ${title }
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
      <td> <input type="text" id="member" placeholder="셀렉으로하는게 좋을까요?">
   </tr>
   <tr>
      <td> 스케줄세부내용
      <td> <textarea style="resize: none; hegiht:400px; width:300px" id="detail"></textarea>
   </tr>
    <tr>
      <td colspan=2> 
      <button type="button" id="delete">스케줄 삭제</button>
      <button type="button" id="insert">내용등록</button>
   </tr> 
 </table>
 </form>
</body>
<script>
// 삭제요청 
$("#delete").on("click",function() {
	$.ajax({
        type: "post",
        url: "/calendar/delete?club_cl_name=${club_cl_name}",
        data: {title:'${title}'}      
 	})
	alert("삭제성공!??? 새로고침하세요")
	window.close();
	

})

//내용 이너조인으로 등록
$("#insert").on("click",function() {
	var detail = document.getElementById("detail").value
	var member = document.getElementById("member").value
	
	$.ajax({
		type: "post",
		url: "/calendar/insertDetail?club_cl_name=${club_cl_name}",
		data: {detail:detail, member:member}
	})
	alert("내용등록성공!")
	window.close();
})
</script>
</html>