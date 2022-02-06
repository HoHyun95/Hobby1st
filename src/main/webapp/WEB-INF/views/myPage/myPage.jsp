<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      let modal_bg = document.querySelector(".modal_bg");
      let loginForm = document.querySelector(".loginForm");
      
      loginform_btn.onclick = () => {
        modal_bg.style.zIndex = 10;
        modal_bg.style.display = "flex";
        loginForm.style.zIndex = 11;
        loginForm.style.display = "flex";
      }
      
      close_btn.onclick = () => {
        modal_bg.style.zIndex = -1;
        modal_bg.style.display = "none";
        loginForm.style.zIndex = -1;
        loginForm.style.display = "none";
      }

      for (let i = 0; i < myclub_list_box.length; i++) {
        myclub_list_box[i].onclick = () => {
          let clickedList = myclub_list_box[i].children[5].value;
          location.href = "/clubHouse?cl_id=" + clickedList;
        }
      }
      
      let mModify_wrap = document.querySelector(".mModify_wrap");
      let mModifyform_btn = document.getElementById("mModifyform_btn");
      let mModify_close_btn = document.getElementById("mModify_close_btn");
      let mModifyBtn = document.getElementById("mModifyBtn");
      let mModify_slideLeft = document.getElementById("mModify_slideLeft");
      let mModify_slideRight = document.getElementById("mModify_slideRight");
      let mModify_container = document.querySelector(".mModify_container");
      let mModify_MOVE_WIDTH = 528;
      let mModify_position = 0;

      mModifyform_btn.onclick = () => {
        modal_bg.style.zIndex = 10;
        modal_bg.style.display = "flex";
        mModify_wrap.style.zIndex = 11;
        mModify_wrap.style.display = "flex";
      }

      mModify_close_btn.onclick = () => {
        modal_bg.style.zIndex = -1;
        modal_bg.style.display = "none";
        mModify_wrap.style.zIndex = -1;
        mModify_wrap.style.display = "none";
      }

      let mModify_current_point = 0;

      let mModify_end_point = mModify_MOVE_WIDTH * 3;

      if (mModify_current_point == 0) {
        mModify_slideLeft.style.display = "none";
      }

      if (mModify_current_point == mModify_end_point) {
        mModify_slideRight.style.display = "none";
      }

      mModify_slideRight.onclick = () => {
        // if (m_id.value != "" && m_pass.value != "" && m_pass2.value != "" &&
        //   m_name.value != "" && m_nickname.value != "" && m_birthday.value != "" &&
        //   m_phone.value != "" && m_email.value != "" && !select_gender.options[0].selected) {
          mModify_current_point += mModify_MOVE_WIDTH;

          if (mModify_current_point == mModify_end_point) {
            mModify_slideRight.style.display = "none";
            mModifyBtn.style.display = "inline";
            mModify_slideLeft.style.display = "inline";
          } else if (mModify_current_point > 0) {
            mModify_slideLeft.style.display = "inline";
            mModifyBtn.style.display = "none";
          }

          mModify_position -= mModify_MOVE_WIDTH;
          mModify_container.style.transform = "translateX(" + (mModify_position) + "px)";

        // } else {
        //   alert("정보를 모두 입력해 주세요");
        // }
      }

      mModify_slideLeft.onclick = () => {
        mModify_current_point -= mModify_MOVE_WIDTH;
        if (mModify_current_point == 0) {
          mModify_slideLeft.style.display = "none";
          mModify_slideRight.style.display = "inline";
          mModifyBtn.style.display = "none";
        } else if (mModify_current_point < mModify_end_point) {
          mModify_slideRight.style.display = "inline";
          mModifyBtn.style.display = "none";
        }
        mModify_position += mModify_MOVE_WIDTH;
        mModify_container.style.transform = "translateX(" + (mModify_position) + "px)";
      }

      let city = document.querySelectorAll(".city");
      const cities = [...city];

      let option = document.querySelectorAll("#cl_local option");
      const options = [...option];

      document.addEventListener("change", (e) => {
        for (let i = 0; i < cities.length; i++) {
          if (e.target.value == cities[i].id) {
            cities[i].classList.add("active");
          } else {
            cities[i].classList.remove("active");
          }
        }
      })
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
            <li class="menu_list_item">Hobby1st</i></li>
            <a href="/club"><li class="menu_list_item">동호회</li></a>
            <a href="/myPage"><li class="menu_list_item">마이페이지</li></a>
            <a href="/news"><li class="menu_list_item">NEWS</li></a>
            <a href="/fullpage"><li class="menu_list_item">Fullpage</li></a>
            <c:if test="${admin != null}">
            <a href="/admin"><li class="menu_list_item">admin</li></a>
            </c:if>
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
              <img src="${memberInfo.mem_photo }">
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
              <button type="button" id="mModifyform_btn"><i class="far fa-address-card"></i> 내 정보 수정 </button>
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
      <div class="recent_act_title_text">최근 활동</div>
      <div class="recent_act_contents_wrap">
        <div class="recent_act_contents_header">
          <div class="recent_act_contents_header_list">ACTIVITY</div>
          <div class="recent_act_contents_header_list">CLUB</div>
          <div class="recent_act_contents_header_list">STATUS</div>
          <div class="recent_act_contents_header_list">DATE</div>
        </div>
       
        <c:forEach var="rStateInfo" items="${recentlyStateInfo }" varStatus="status">
        <div class="recent_act_contents">
          <c:choose>
            <c:when test="${rStateInfo.cs_state eq 1 }">
              <div class="recent_act_contents_list">
                ${recentlyClubInfo[status.index].cl_name } 동호회에 가입 신청
              </div>
              <div class="recent_act_contents_list">
                ${recentlyClubInfo[status.index].cl_name }
              </div>
              <div class="recent_act_contents_list">
                <span id="no1">신청완료</span>
              </div>
              <div class="recent_act_contents_list">
				<fmt:formatDate value="${rStateInfo.cs_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
              </div>
            </c:when>
            <c:when test="${rStateInfo.cs_state eq 2 }">
              <div class="recent_act_contents_list">
                ${recentlyClubInfo[status.index].cl_name } 동호회 가입 승인
              </div>
              <div class="recent_act_contents_list">
                ${recentlyClubInfo[status.index].cl_name }
              </div>
              <div class="recent_act_contents_list">
                <span id="no3">승인완료</span>
              </div>
              <div class="recent_act_contents_list">
                <fmt:formatDate value="${rStateInfo.cs_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
              </div>
            </c:when>
            <c:when test="${rStateInfo.cs_state eq 3 }">
              <div class="recent_act_contents_list">
               ${recentlyClubInfo[status.index].cl_name } 동호회 가입 거절
              </div>
              <div class="recent_act_contents_list">
                ${recentlyClubInfo[status.index].cl_name }
              </div>
              <div class="recent_act_contents_list">
                <span id="no4">승인거절</span>
              </div>
              <div class="recent_act_contents_list">
                <fmt:formatDate value="${rStateInfo.cs_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
              </div>
            </c:when>
          </c:choose>
        </div>
        </c:forEach>
      </div>
    </div>
    <!-- recent_act end -->

    <c:if test="${fn:length(clubList_make) gt 0 && fn:length(joinMemberInfo) gt 0}">
	<!-- club control -->
    <div class="club_control">
      <div class="club_control_title_text">내 동호회 가입 신청 현황</div>
      <div class="club_control_contents_wrap">
        <div class="club_control_contents_header">
          <div class="club_control_contents_header_list">동호회명</div>
          <div class="club_control_contents_header_list">신청자명</div>
          <div class="club_control_contents_header_list">생년월일</div>
          <div class="club_control_contents_header_list">성별</div>
          <div class="club_control_contents_header_list">거주지</div>
          <div class="club_control_contents_header_list">관심1</div>
          <div class="club_control_contents_header_list">관심2</div>
          <div class="club_control_contents_header_list">수락여부</div>
        </div>

        <c:forEach var="mem" items="${joinMemberInfo }" varStatus="status">
        <div class="club_control_contents">
          <div class="club_control_contents_list">
            ${joinClubInfo[status.index].cl_name }  
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_name }
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_birthday }
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_gender }
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_address }
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_category_1 }
          </div>
          <div class="club_control_contents_list">
            ${mem.mem_category_2 }
          </div>
          <div class="club_control_contents_list">
            <button class="approve">수락 </button>
    		<button class="refuse">거절 </button>
    		<input type="hidden" class="cl_id" value="${joinClubInfo[status.index].cl_id }">
    		<input type="hidden" class="mem_id" value="${mem.mem_id }">
          </div>
        </div>
        </c:forEach>
      </div>
    </div>
    <!-- recent_act end -->
	</c:if>
    <!-- container -->
    <div class="container">
      <div class="myclub_list_title_text">나의 동호회 목록</div>
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
  <jsp:include page="/WEB-INF/views/modifyMember.jsp"></jsp:include>
  <!-- sign_in -->
  <jsp:include page="/WEB-INF/views/login.jsp"></jsp:include>
  
  
  <!-- 회원정보 수정 완료 -->
  <c:if test="${result eq 1 }">
  	<script>
  		alert("회원정보가 수정되었습니다.");
  		location.href = "/myPage";
  	</script>
  </c:if>
  
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