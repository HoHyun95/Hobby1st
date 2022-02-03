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
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <!-- 네이버 로그인스크립트  -->
  <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/clubHouse.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
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
      
   // 찜하기
      document.addEventListener("click", (event) => {
        const classListArray = event.target.classList.value.split(' ');
    	const isHeartButton = classListArray.find((classItem) => classItem === 'fa-heart');
    	if (event.target && isHeartButton) {
    	  event.target.classList.toggle("fas");
    	  event.target.classList.toggle("far");
    	  console.log(event.target.id);
    	  console.log(event);
    	  $.ajax({
              url: "/clubList/clubBoardRec?cl_id=" + event.target.id,
              type: "get",
              dataType: "json" 
          }).done((res) => {
        	  console.log(res);
          });
    	}
      });
   
      let clubIntro = document.getElementById("clubIntro");
   	  let club_member_list = document.getElementById("club_member_list");
   	  let club_board = document.getElementById("club_board");
   	  let club_chat = document.getElementById("club_chat");
   	  
   	  let clIntro_wrap = document.querySelector(".clIntro_wrap");
   	  let cm_list_wrap = document.querySelector(".cm_list_wrap");
   	  let club_board_wrap = document.querySelector(".club_board_wrap");
      let club_chat_wrap = document.querySelector(".club_chat_wrap"); 
   	  
   	  clubIntro.onclick = () => {
   		clubIntro.style.borderBottom = "3px solid var(--bg-color3)";
   		club_member_list.style.borderBottom = "none"; 
   		club_board.style.borderBottom = "none"; 
   		club_chat.style.borderBottom = "none"; 
   		
   		clIntro_wrap.style.display = "flex";
   		cm_list_wrap.style.display = "none";
   		club_board_wrap.style.display = "none";
   		club_chat_wrap.style.display = "none";
   	  }   
   	  
   	  club_member_list.onclick = () => {
   		clubIntro.style.borderBottom = "none";
   		club_member_list.style.borderBottom = "3px solid var(--bg-color3)";
   		club_board.style.borderBottom = "none"; 
   		club_chat.style.borderBottom = "none"; 
   		
   		clIntro_wrap.style.display = "none";
   		cm_list_wrap.style.display = "flex";
   		club_board_wrap.style.display = "none";
   		club_chat_wrap.style.display = "none";
   	  }
   
   	  club_board.onclick = () => {
   		clubIntro.style.borderBottom = "none";
   		club_member_list.style.borderBottom = "none"; 
   		club_board.style.borderBottom = "3px solid var(--bg-color3)";
   		club_chat.style.borderBottom = "none";   
   		
   		clIntro_wrap.style.display = "none";
   		cm_list_wrap.style.display = "none";
   		club_board_wrap.style.display = "flex";
   		club_chat_wrap.style.display = "none";
   	  }
   	  
   	  club_chat.onclick = () => {
   		clubIntro.style.borderBottom = "none";
   		club_member_list.style.borderBottom = "none"; 
   		club_board.style.borderBottom = "none";    
   		club_chat.style.borderBottom = "3px solid var(--bg-color3)";
   		
   		clIntro_wrap.style.display = "none";
   		cm_list_wrap.style.display = "none";
   		club_board_wrap.style.display = "none";
   		club_chat_wrap.style.display = "flex";
   	  }
    }
  </script>
</head>

<body>
  <!-- modal background -->
  <div class="modal_bg">

  </div>
  <!-- sign_in -->
  <jsp:include page="login.jsp"></jsp:include>
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
            <li class="menu_list_item">Hobby1st</i></li>
            <a href="/club"><li class="menu_list_item">동호회</li></a>
            <a href="/myPage"><li class="menu_list_item">마이페이지</li></a>
            <a href="/news"><li class="menu_list_item">NEWS</li></a>
            <a href="/fullpage"><li class="menu_list_item">Fullpage</li></a>
            <a href="/admin"><li class="menu_list_item">admin</li></a>
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
              <div class="likeBtn">
              <c:if test="${likeResult eq 0}">
                <i class="far fa-heart" id="${club.cl_id }"></i>
              </c:if>
 			  <c:if test="${likeResult eq 1}">
                <i class="fas fa-heart" id="${club.cl_id }"></i>   
              </c:if>        
              </div>
             	<c:if test="${checkMember eq 0}">
              	  <button type="button" id="joinClub"><i class="fas fa-user-check"></i> 가입하기</button>
              	</c:if>
              	<c:if test="${checkMember eq 1}">
              	  <button type="button" id="leaveClub"><i class="fas fa-door-open"></i> 동호회 탈퇴</button>
              	</c:if>
              	<c:if test="${checkMember eq 2}">
              	  <button type="button" id="controlClub"><i class="fas fa-address-book"></i> 동호회 관리</button>
                  <button type="button" id="breakClub"><i class="fas fa-door-open"></i> 동호회 해체하기</button>
              	</c:if>
              	<c:if test="${checkMember eq 3}">
              	  <button type="button" id="requestClub"><i class="fas fa-address-book"></i> 승인 대기 중</button>
              	</c:if>
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
        <!-- 동호회 소개 -->
        <div class="clIntro_wrap">
          <div class="clIntro_box">
               <a href="/calendar/do?club_cl_name=${club.cl_name }">캘린더 이동</a>
          </div>
        </div> 
        
        <!-- 동호회 회원 리스트 -->
	    <div class="cm_list_wrap">
	      <div class="cm_list_title">
	        <div class="cm_list_title_text">${club.cl_name } 동호회 회원 목록</div>
	      </div>
	      <div class="cm_list_item_wrap">
	        <c:forEach var="cm" items="${clubMemberInfo }">
	        <div class="cm_list_item">
	          <div class="cm_list_item_photo_area">
	            <div class="cm_list_item_photo">
	              <img src="images/man1.png">
	            </div>
	          </div>
	          <div class="cm_list_item_profile_area">
	            <c:if test="${cm.mem_id eq club.cl_boss_id}">
	              <span id="cm_list_admin_badge">ADMIN</span>
	            </c:if>
	            <div class="cm_list_item_profile_title">${cm.mem_name }(${cm.mem_id })</div>
	            <div class="cm_list_item_profile_item">닉네임 : ${cm.mem_nickname }</div>
	            <div class="cm_list_item_profile_item">생년월일 :${cm.mem_birthday }</div>
	            <div class="cm_list_item_profile_item">지역 : ${cm.mem_address }</div>
	            <div class="cm_list_item_profile_item">관심분야 : ${cm.mem_category_1 } / ${cm.mem_category_2 }</div>
	            <div class="cm_list_item_profile_item">최근 로그인 : ${cm.mem_lastlogin}</div>
	          </div>
	          <div class="cm_list_item_btns_area">
	            <div class="cm_list_item_btn1">
	              <i class="far fa-envelope"> EMAIL</i>
	            </div>
	            <div class="cm_list_item_btn2">
	              <i class="fas fa-mobile-alt"> PHONE</i>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
	      </div>
        </div>
        <!-- 동호회 게시판 -->
        <div class="club_board_wrap">
          <div class="club_board_title">
	        <div class="club_board_title_text">${club.cl_name } 동호회 게시판</div>
	      </div>
	      <div class="club_board_item_wrap">
          	<jsp:include page="clubBoard/boardList.jsp"></jsp:include>
          </div>
        </div>
        <!-- 동호회 채팅 -->
        <div class="club_chat_wrap">
             동호회 채팅
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
    
    <c:if test="${result eq '1' }">
		<script>
			alert("성공적으로 탈퇴되었습니다.");
		    location.href = "/clubHouse?cl_id=${cs_board_seq }";
		</script>
	</c:if>
  
    <script>
   	    // 가입하기 클릭시 가입 요청	
    	$("#joinClub").on("click", function() {
    		location.href = "/club/requestJoin?cs_board_seq=${club.cl_id}&cs_boss_id=${club.cl_boss_id}&cs_join_id=${mem_id}";
    	})
    	
    	// 해당 동호회 탈퇴하기
    	$("#leaveClub").on("click", function() {
    		location.href = "/club/leaveClub?cs_board_seq=${club.cl_id}&cs_join_id=${mem_id}";
    	})
    	
    	// 해당 동호회 해체시키기
    	$("#breakClub").on("click", function() {
    		let breakClub = confirm("정말로 해당 동호회를 해체시키겠습니까 ?");
    		if(breakClub){
    			location.href = "/club/breakClub?board_seq=${club.cl_id}";
    		}else{
    			alert("휴,,");
    		}
    	})
    	
    	$("#requestClub").on("click", function() {
    		let requestClub = confirm("가입요청을 취소하시겠습니까?");
    		if(requestClub){
    			location.href = "/club/joinCencel?cs_board_seq=${club.cl_id}&cs_join_id=${mem_id}";
    		}else{
    			return false;
    		}
    	})
    	
    </script>
    <jsp:include page="signUp.jsp"></jsp:include>
    
    
    
</body>

</html>