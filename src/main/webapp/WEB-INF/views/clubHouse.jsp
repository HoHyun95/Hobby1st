<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hobby1st</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <!-- 네이버 로그인스크립트  -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/clubHouse.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");
      let showMore = document.getElementById("showMore");

      loginform_btn.onclick = () => {
        let modal_bg = document.querySelector(".modal_bg");
        let loginForm = document.querySelector(".loginForm");
        modal_bg.style.zIndex = 10;
        modal_bg.style.display = "flex";
        loginForm.style.zIndex = 11;
        loginForm.style.display = "flex";
      }
      close_btn.onclick = () => {
        let modal_bg = document.querySelector(".modal_bg");
        let loginForm = document.querySelector(".loginForm");
        modal_bg.style.zIndex = -1;
        modal_bg.style.display = "none";
        loginForm.style.zIndex = -1;
        loginForm.style.display = "none";
      }

      sign_up.onclick = () => {
        location.href = "/member/sign_up";
      }
    }
  </script>
</head>

<body>
  <div class="wrap">
    <div class="header">
      <div class="header_inner">
        <div class="header_inner_top">
          <div class="logo">
            <a href="/"><img src="/images/LOGO.png"></a>
          </div>
          <ul class="login_list">
            <c:choose>
              <c:when test="${mem_id !=null }">
                <li id="login_id"><b>${mem_id }</b>님 환영합니다</li>
                <a href="/member/logout">
                  <li class="login_list_item">로그아웃</li>
                </a>
                <li class="login_list_item" id="loginform_btn" style="display:none">로그인</li>
                <li class="login_list_item" id="signup_btn" style="display:none">회원가입</li>
              </c:when>
              <c:otherwise>
                <li class="login_list_item" id="loginform_btn">로그인</li>
                <li class="login_list_item" id="signup_btn">회원가입</li>
              </c:otherwise>
            </c:choose>
          </ul>
        </div>
        <div class="header_inner_bottom">
          <ul class="menu_list">
            <li class="menu_list_item"><i class="fas fa-stream"></i></li>
            <li class="menu_list_item"><i class="fab fa-hubspot"> Hobby1st</i></li>
            <a href="/club"><li class="menu_list_item"><i class="far fa-handshake"> 동호회</i></li></a>
            <a href="/myPage"><li class="menu_list_item"><i class="fas fa-person-booth"> 마이페이지</i></li></a>
            <li class="menu_list_item"><i class="far fa-newspaper"> NEWS</i></li>
            <a href="/fullpage"><li class="menu_list_item"><i class="far fa-newspaper"> Main</i></li></a>
          </ul>
          <ul class="icon_list">
            <a href="/clubMember/memberList?cpage=1"><li class="icon_list_item"><i class="fab fa-facebook"></i></li></a>
            <a href="/clubList/createClubPage"><li class="icon_list_item"><i class="fab fa-instagram"></i></li></a>
            <a href="/clubBoard/boardList?cpage=1"><li class="icon_list_item"><i class="fab fa-twitter"></i></li></a>
            <a href="/clubList/clubListPage"><li class="icon_list_item"><i class="fab fa-github"></i></li></a>
            <a href="/chat/clubChat"><li class="icon_list_item"><i class="fab fa-google"></i></li></a>
          </ul>
        </div>
      </div>
    </div>
    <!-- club_profile -->
    <div class="club_profile_area">
      <div class="club_profile">
        <div class="club_profile_box">
          <div class="club_profile_desc">
            <div class="club_profile_desc_contents">
              <div class="club_profile_title">${club.cl_name }</div>
              <div class="club_profile_member_count">${club.cl_memCount } / ${club.cl_maxMem }</div>
              <div class="club_profile_loc">${club.cl_local }</div>
              <div class="club_profile_themes">${club.cl_category_id } / ${club.cl_dCategory_id }</div>
            </div>
          </div>
          <div class="club_profile_btns">
            <div class="club_profile_btns_item">
             	<c:if test="${checkMember eq 0}">
              	  <button type="button" id="joinClub"><i class="fas fa-user-check"></i> 가입하기</button>
              	</c:if>
              	<c:if test="${checkMember eq 1}">
              	  <button type="button" id="leaveClub"><i class="fas fa-door-open"></i> 동호회 탈퇴</button>
              	</c:if>
              	<c:if test="${checkMember eq 2}">
              	  <button type="button" id="controlClub"><i class="fas fa-address-book"></i> 동호회 관리</button>
                  <button type="button" id="leaveClub"><i class="fas fa-door-open"></i> 동호회 탈퇴</button>
              	</c:if>
              	<c:if test="${checkMember eq 3}">
              	  <button type="button" id="requestClub"><i class="fas fa-address-book"></i> 동호회 랄랄랄라라라랄</button>
              	</c:if>
              <!-- <button type="button" id="likeClub"><i class="far fa-heart"></i> LIKE</button>
              <button type="button" id="likeClubCancel"><i class="far fa-heart"></i> LIKE</button> -->
            </div>
          </div>
        </div>
      </div>
      <div class="club_profile_photo">
        <div class="club_profile_photo_box">
          <img src="${club.cl_photo }">
        </div>
      </div>
    </div>
    <!-- club_profile end -->

    <!-- clubHouse -->
    <div class="clubHouse">
      <div class="clubHouse_box">
        <div class="clubHouse_nav">
          <div class="clubHouse_title">
            <h2>CLUBHOUSE</h2>
          </div>
          <div class="clubHouse_menu_list">
            <div class="clubHouse_menu_list_item" id="clubIntro">동호회 소개</div>
            <div class="clubHouse_menu_list_item" id="club_member_list">회원 목록</div>
            <div class="clubHouse_menu_list_item" id="club_board">게시판</div>
            <div class="clubHouse_menu_list_item" id="club_chat">채팅</div>
          </div>
        </div>
      </div>
      <div class="clubHouse_contents">
        <div class="clubHouse_contents_box_wrap">
          <div class="clubHouse_contents_box">
               <a href="/calendar/do?club_cl_name=${club.cl_name }">캘린더 이동</a>
          </div>
        </div>
      </div>
    </div>
      <!-- clubHouse end -->
      <div class="links">
        <div class="links_inner">
          <ul class="links_inner_list">
            <li class="links_inner_list_item">회사소개</li>
            <li class="links_inner_list_item">인재채용</li>
            <li class="links_inner_list_item">회원약관</li>
            <li class="links_inner_list_item">개인정보처리방침</li>
            <li class="links_inner_list_item">제휴문의</li>
            <li class="links_inner_list_item">고객센터</li>
          </ul>
        </div>
      </div>
      <div class="footer">
        <div class="footer_inner">
          <div class="footer_logo">
            <img src="/images/LOGO.png">
          </div>
          <div class="footer_contents">
            <div class="footer_desc">
              <ul class="footer_desc_list">
                <li class="footer_desc_list_item">Hobby1st 고객센터 02-1234-5678 (평일 09:00~18:00, 주말·공휴일 휴무)</li>
                <li class="footer_desc_list_item">(주)Hobby1st 04540, 서울특별시 중구 남대문로 120, 대일빌딩 2F, 3F</li>
                <li class="footer_desc_list_item">Copyright (c) (주)Hobby1st. 2022 All rights reserved.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- modal background -->
    <div class="modal_bg">

    </div>
    <!-- sign_in -->
    <jsp:include page="login.jsp"></jsp:include>
    
    <script>
    // 가입하기 클릭시 가입 요청
    	$("#joinClub").on("click", function() {
    		location.href = "/club/requestJoin?cs_board_seq=${club.cl_id}&cs_boss_id=${club.cl_boss_id}&cs_join_id=${mem_id}";
    	})
    	
    </script>
    
    
    
    
</body>

</html>