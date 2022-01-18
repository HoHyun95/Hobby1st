<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CLUB</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/club.css">
  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");
      let showMore = document.getElementById("showMore");
      let club_list_box = document.querySelectorAll(".club_list_box");

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

      for (let i = 0; i < club_list_box.length; i++) {
        club_list_box[i].onclick = () => {
          let clickedList = club_list_box[i].children[5].value;
          location.href = "/clublist/showList?name=club&value=" + clickedList;
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
            <a href="home"><img src="/images/LOGO.png"></a>
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
    <!-- text effect -->
    <div class="text_effect">
      <div class="text_effect_contents"> 
      <svg version="1.1" viewBox="0 0 1260 300">
        <symbol id="fade-text">
          <text x="50%" y="50%" text-anchor="middle">Hobby1st와 함께하는</text>
          <text x="50%" y="80%" text-anchor="middle">동호회 LIFE의 시작!</text>
        </symbol>
        <g>
          <use class="stroke" xlink:href="#fade-text" />
          <use class="fill" xlink:href="#fade-text" />
        </g>
      </svg>
      </div>
    </div>
    <!-- text effect end -->

    <!-- search -->
    <div class="search_area">
      <div class="search_area_inner">
        <div class="search_input_area">
          <div class="search_input_area_text">
            <select name="searchField" id="selectBox">
              <option value="cl_name">동호회명
              <option value="cl_local">지역
              <option value="cl_boss_name">동호회장
            </select>
            <input type="text" class="search_club" placeholder="찾고 싶은 동호회를 검색해 보세요!">
          </div>
          <div class="search_input_area_btn">
            <i class="fas fa-search"></i>
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="search_result">
      <div class="search_result_inner">

      </div>
    </div> -->
    <!-- search end -->

    <!-- create club -->
    <div class="create_hobby1st_club">
      <div class="create_hobby1st_club_inner">
        <div class="create_hobby1st_club_inner_text">찾으시는 동호회가 없으신가요? </div>
        <input type="button" value="나만의 동호회를 만드세요!">
      </div>
    </div>
    <!-- create club end -->

    <!-- club_list_title -->
    <div class="club_list_title">
      <div class="club_list_title_contents"> 
        <!-- <div class="club_list_title_text"> 20 개 / 총 동호회 수 456개 </div> -->
    </div>
    <!-- club_list_title end-->

    <!-- container -->
    <div class="container">
      <div class="club_list_wrap">
        <!-- <div class="no_search_result"> 
          <div class="no_search_result_text"> 검색 결과가 없습니다.</div>
        </div> -->
        <div class="club_list">
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme1">THEME1</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
              <input type="hidden" name="club" value="club1">
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme1">THEME1</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
              <input type="hidden" name="club" value="club2">
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme1">THEME1</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
              <input type="hidden" name="club" value="club3">
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme1">THEME1</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
              <input type="hidden" name="club" value="club4">
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme2">THEME2</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme2">THEME2</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme2">THEME2</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme2">THEME2</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme3">THEME3</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme3">THEME3</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme3">THEME3</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme3">THEME3</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme4">THEME4</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme4">THEME4</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme4">THEME4</div>
              <h3>Title</h3>
              <h5>OWNER</h5>
              <h5>LOC</h5>
              <h5>DESC</h5>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- container end -->
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
  <div class="loginForm">
    <div class="logininput_wrap">
      <span id="close_btn"><i class="far fa-times"></i></span>
      <div class="logininput">
        <form action="/member/login" method="post">
          <table border=1 align="center">
            <tr>
              <th>Login Page
            </tr>
            <tr>
              <td><input type="text" name="mem_id" placeholder="id">
            </tr>
            <tr>
              <td><input type="password" name="mem_pass" placeholder="pass">
            </tr>
            <tr>
              <th><input type="submit" value="login">
                <button type="button" id="sign_up">Sign Up</button>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</body>

</html>