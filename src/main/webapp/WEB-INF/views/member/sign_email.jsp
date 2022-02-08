<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>user_email</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/signUp.css">
</head>
<body>
 <div class="email_wrap">
 	<form action="find_email" method="post">
       <div class="email_container"> 
         
         <!-- 머리 -->
         <div class="steps_item_wrap">
            <div class="steps_item_line">
            <hr class="active_bg">
            </div>
            <div class="steps_item_title"><span class="active_text">STEP 0</span></div>
            <div class="steps_item_detail">이메일찾기!</div>
         </div>
       
         <!-- 몸통 -->
        <div class="contents_wrap">
          <div class="contents_item_wrap">
            <div class="contents_item">
                 <div class="desc">
                    <h3>인증할 이메일 주소를 입력해주세요!</h3>                 
                 </div>                        
                 <div class="title">
                    <i class="fas fa-envelope">회원 이메일</i>
                    <c:choose>
                    <c:when test ="${result eq 0}">
                    <span class="validResult" id="mem_email_Result">등록된 이메일이 없습니다!</span>
                    </c:when>
                    <c:when test ="${result eq 1}">
                    <span class="validResult" id="mem_email_Result3">메일인증이 성공했습니다!</span>
                    </c:when>
                    </c:choose>
                 </div>
                 <div class="input">
                    <input type="text" id="user_email" name="email" placeholder="이메일입력">
                    <button type="submit" id="sendEmail">메일전송</button>
                 </div>
                 
                 <div class="title" id="number" style="display: none;"> 
                    <i class="fas fa-envelope">인증번호</i>
                    <span class="validResult" id="mem_email_Result2"></span>
                 </div>
                 <div class="input" id="number1" style="display: none;">
                    <input type="text" id="email_num" placeholder="인증번호입력">
                    <button type="button" id="emailNum_btn">인증하기</button>
                 </div>
                 
                 <div class="title" style="display:none" id="member_lo">
                    <i class="fas fa-envelope">사용자 정보</i><br>
                     아이디 : ${members.mem_id }<br>
                     비밀번호 : ${members.mem_pass }
                 </div>
            </div>
          </div>
        </div>
       </div>        
    </form>
 </div>
 <script>
 $("#emailNum_btn").on("click",function(){
	 if('${random_num}' === $("#email_num").val()){
         $("#mem_email_Result2").text("인증번호가 일치합니다!");
         $("#email_num").text("");
		 $("#member_lo").show();
	 } else {
         $("#mem_email_Result2").text("인증번호가 다릅니다");
         $("#email_num").text("");
		 $("#member_lo").hide();
	 }
 })
 /* 이메일 인증성공시에만 보임!  */
 $("#mem_email_Result3").show(function(){
	 $("#number").show()
	 $("#number1").show()
 })
 </script>
</html>