<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Page</title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <!-- 네이버 로그인스크립트  -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/myPage.css">
  <link rel="stylesheet" href="/css/footer.css">
  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");
      let showMore = document.getElementById("showMore");
      let myclub_list_box = document.querySelectorAll(".myclub_list_box");
      
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
      
      for (let i = 0; i < myclub_list_box.length; i++) {
        myclub_list_box[i].onclick = () => {
          let clickedList = myclub_list_box[i].children[5].value;
          location.href = "/clubHouse?cl_id=" + clickedList;
        }
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
            <a href="/fullpage"><li class="menu_list_item"><i class="far fa-newspaper"> Fullpage</i></li></a>
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
    <!-- profile -->
    <div class="profile">
      <div class="profile_box">
        <div class="profile_contents_area">
          <div class="profile_photo_area">
            <div class="profile_photo">
              <img src="images/default.jpg">
            </div>
          </div>
          <div class="profile_text_area">
            <div class="profile_text">
              <div class="profile_text_name">${memberInfo.mem_name }</div>
              <div class="profile_text_loc"><i class="fas fa-building"></i> ${memberInfo.mem_address }</div>
              <div class="profile_text_email"><i class="far fa-envelope"></i> ${memberInfo.mem_email }</div>
              <div class="profile_text_phone"><i class="fas fa-phone-alt"></i> ${memberInfo.mem_phone }</div>
            </div>
          </div>
        </div>
        <div class="profile_btn_area">
          <div class="profile_btn">
            <div class="btn_item">
              <button type="button" id="showProfile"><i class="far fa-address-card"></i> 내 계정 정보 </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- profile end -->
    
    <!-- profile_dashboard -->
    <div class="profile_dashboard">
      <div class="profile_dashboard_text">DASHBOARD</div>
      <div class="profile_dashboard_contents_wrap">
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-award" id="my"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">내 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_make)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-user-friends" id="join"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">가입한 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_join)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="far fa-thumbs-up" id="like"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">관심 동호회</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubList_interest)}</div>
          </div>
        </div>
        <div class="profile_dashboard_contents">
          <div class="profile_dashboard_contents_icon">
            <i class="fas fa-pen-square" id="write_count"></i>
          </div>
          <div class="profile_dashboard_contents_desc">
            <div class="profile_dashboard_contents_desc_title">작성글 수</div>
            <div class="profile_dashboard_contents_desc_no">${fn:length(clubBoardList)}</div>
          </div>
        </div>
      </div>
    </div>
    <!-- profile_dashboard end-->

    <!-- recent_act -->
    <div class="recent_act">
      <div class="recent_act_title_text">RECENT ACTIVITY</div>
      <div class="recent_act_contents_wrap">
        <div class="recent_act_contents_header">
          <div class="recent_act_contents_header_list">ACTIVITY</div>
          <div class="recent_act_contents_header_list">CLUB</div>
          <div class="recent_act_contents_header_list">STATUS</div>
          <div class="recent_act_contents_header_list">DATE</div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> Hobby1st 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            Hobby1st
          </div>
          <div class="recent_act_contents_list">
            <span id="no1">신청완료</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-19
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 주식/코인 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            DDeokSangCoinClub
          </div>
          <div class="recent_act_contents_list">
            <span id="no2">승인대기중</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-13
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 프론트엔드 개발 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            Reaction
          </div>
          <div class="recent_act_contents_list">
            <span id="no3">승인완료</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-01
          </div>
        </div>
        <div class="recent_act_contents">
          <div class="recent_act_contents_list">
            <i class="fas fa-sign-in-alt"></i> 풋살 동호회에 가입 신청
          </div>
          <div class="recent_act_contents_list">
            FC KH
          </div>
          <div class="recent_act_contents_list">
            <span id="no4">승인거절</span>
          </div>
          <div class="recent_act_contents_list">
            2022-01-01
          </div>
        </div>
      </div>
    </div>
    <!-- recent_act end -->

    <!-- container -->
    <div class="container">
      <div class="myclub_list_title_text">MY CLUB LIST</div>
      <div class="myclub_list_wrap">
        <div class="myclub_list">
          <c:if test="${fn:length(clubList_make) eq 0 && fn:length(clubList_join) eq 0 && fn:length(clubList_interest) eq 0}">
          	<div class="no_join_club">
          	  <div class="no_join_club_text">가입하신 동호회가 없습니다.</div>
          	</div>
          </c:if>
          <c:forEach var="my" items="${clubList_make }">
          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="my">MY</div>
              <h3>${my.cl_name }</h3>
              <h5>${my.cl_boss_name }</h5>
              <h5>${my.cl_local }</h5>
              <c:choose>
			    <c:when test="${fn:length(my.cl_desc) gt 15}">
			      <c:out value="${fn:substring(my.cl_desc, 0, 15)}" />
			    </c:when>
			    <c:otherwise>
			      <h5><c:out value="${my.cl_desc}" /></h5>
			    </c:otherwise>
			  </c:choose>
           	  <input type="hidden" name="cl_id" value="${my.cl_id }">
            </div>
          </div>
          </c:forEach>
          
		  <c:forEach var="join" items="${clubList_join }">
          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="join">JOIN</div>
              <h3>${join.cl_name }</h3>
              <h5>${join.cl_boss_name }</h5>
              <h5>${join.cl_local }</h5>
              <c:choose>
			    <c:when test="${fn:length(join.cl_desc) gt 15}">
			      <c:out value="${fn:substring(join.cl_desc, 0, 15)}" />
			    </c:when>
			    <c:otherwise>
			      <h5><c:out value="${join.cl_desc}" /></h5>
			    </c:otherwise>
			  </c:choose>
           	  <input type="hidden" name="cl_id" value="${join.cl_id }">
            </div>
          </div>
		  </c:forEach>
		  
		  <c:forEach var="like" items="${clubList_interest }">
          <div class="myclub_list_box_wrap">
            <div class="myclub_list_box">
              <div class="badge" id="like">LIKE</div>
              <h3>${like.cl_name }</h3>
              <h5>${like.cl_boss_name }</h5>
              <h5>${like.cl_local }</h5>
              <c:choose>
			    <c:when test="${fn:length(like.cl_desc) gt 15}">
			      <c:out value="${fn:substring(like.cl_desc, 0, 15)}" />
			    </c:when>
			    <c:otherwise>
			      <h5><c:out value="${like.cl_desc}" /></h5>
			    </c:otherwise>
			  </c:choose>
           	  <input type="hidden" name="cl_id" value="${like.cl_id }">
            </div>
          </div>
          </c:forEach>
          
        </div>
      </div>
    </div>
    <!-- container end -->
    <!-- test start -->
    <div>
    	<table border=1>
    		<c:forEach var="mem" items="${joinMemberInfo }" varStatus="status">
    			<tr>
    				<td> 동호회 명 : ${joinClubInfo[status.index].cl_name }
    				<td> 가입자 성함 : ${mem.mem_name }
    				<td> 생년 월일 : ${mem.mem_birthday }
    				<td> 성별 : ${mem.mem_gender }
    				<td> 거주지 : ${mem.mem_address }
    				<td> 관심 1 : ${mem.mem_category_1 }
    				<td> 관심 2 : ${mem.mem_category_2 }
    				<td class="arbtn"> 
    					<button class="approve">수락 </button>
    					<button class="refuse">거절 </button>
    					<input type="hidden" class="cl_id" value="${joinClubInfo[status.index].cl_id }">
    					<input type="hidden" class="mem_id" value="${mem.mem_id }">
    			</tr>
    			
    			
    		</c:forEach>
    	</table>
    </div>
    
    <!-- test end -->

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
  <jsp:include page="/WEB-INF/views/login.jsp"></jsp:include>
  <script>
  // 동호회 가입 승인
 	 $(".approve").on("click", function() {
 		let cl_id = $(this).siblings(".cl_id").val();
 		let mem_id = $(this).siblings(".mem_id").val();
 		
 		 alert("가입요청을 수락하였습니다.");
 		 
		location.href = "/club/joinApprove?cs_board_seq=" + cl_id + "&cs_join_id=" + mem_id;
	 })

  // 동호회 가입 거절
	 $(".refuse").on("click", function() {
		 let cl_id = $(this).siblings(".cl_id").val();
	 	 let mem_id = $(this).siblings(".mem_id").val();
	 	 
		 alert("가입요청을 거절하였습니다.");
		 
		location.href = "/club/joinRefuse?cs_board_seq=" + cl_id + "&cs_join_id=" + mem_id;
	 })
	 
  	
  </script>
</body>


</html>