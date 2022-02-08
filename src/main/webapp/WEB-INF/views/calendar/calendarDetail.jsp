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
<style>
	.mainBox{
	    margin-left: 55pt;
		border: 1px solid black;
		width: 500px;
		height: 380px;
	}
	.main_head{
		text-align: center;
		background-color: #f1f3f4;
		border: 1px solid white;
	}
	.main_body{
		line-height: 250%;
	}
	.calendar_list{
		background-color: white;
        font-size: medium;
		line-height: 250%;
		height: 50px;
	}
	.calendar_list:hover{
		cursor: pointer;
		background-color: #f1f3f4;
		border-radius: 20%;
	}
	.title{
		margin-left: 25pt;
	}

	textarea{
		border: none;
		resize:none; 
		width:350px;
		height: 20px;
	}
	textarea:hover{
		cursor: pointer;
		background-color: #f1f3f4;
	}
	button{
		font-weight: 550;
		height: 50px;
		width: 110px;
		font-size: 15px;
        border: none;
		background-color: white;
	}
	button:hover{
		cursor: pointer;
		color: white;
		border-radius: 20%;
		background-color: rgb(158, 128, 247, 0.9);
	}
	#membeinput:hover{
		cursor: pointer;
	}
	#bodys:hover{
		cursor: pointer;
	}
</style>
</head>
<body>
<form action="delete" method="get">
 <div class="mainBox">
    <div class="main_wrap">
	   <div class="main_head">
		  <div class="navi">
			<h3>${list.club }</h3>
		  </div>
		  <div class="calendar_list">
            <span>${list.day_start }</span>
			<c:if test="${list.day_end != 'null' }">
			<span>- ${list.day_end }</span>
			</c:if>	
		  </div>
	   </div>

	   <div class="main_body">
          <div class="title">
              <span>제목 : </span><span> ${list.title } </span>
		  </div>
          <div class="title">
              <span>참여자 : </span>
              
              <c:choose>
              <c:when test="${list.memberWrite eq 'No Message'}">
              <span id="membeinput">참여자 등록하기</span>
              </c:when>
                 
              <c:when test="${list.memberWrite eq list.memberWrite }">
              <div id="memberinput">
              <textarea id="memberWrite">${list.memberWrite }</textarea>
              </div>
              </c:when> 
              
              </c:choose>
              
              <div id="memberinput" style="display: none;">
              <textarea id="memberWrite">${list.memberWrite }</textarea>
              </div>
              
		  </div>
          <div class="title">
              <span>설명 : </span>
              
              <c:choose>
              <c:when test="${list.detailWrite eq 'No Message' }">
              <span id="bodys">설명 등록하기</span>
              </c:when>
              <c:when test="${list.detailWrite eq list.detailWrite }">
              <div id="bodyinput">
              <textarea id="detailWrite">${list.detailWrite }</textarea>
              </div>
              </c:when>
               </c:choose>
               
               
              <div id="bodyinput" style="display: none;">
              <textarea id="detailWrite">${list.detailWrite }</textarea>
              </div>
              
		  </div>
          <div class="title">
			<button type="button" id="insert">내용등록</button>
			<button type="button" id="deleteWirte">삭제</button>
		  </div>
	   </div>
	</div>
  </div>
 </form>
</body>
<script>
//등록하기를 누르면 내용이 나옴
$("#membeinput").on("click",function(){
	$("#memberinput").show();
	$("#membeinput").hide();
})

$("#bodys").on("click",function(){
	$("#bodyinput").show();
	$("#bodys").hide();
})

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