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
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/style.css">
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

      const MOVE_WIDTH = 240;
      let position = 0;
      let offsetWidth = main_bg_inner_bottom_list.offsetWidth;
      let endpoint = offsetWidth - (MOVE_WIDTH * 6);
      let leftBtn = document.getElementById("leftBtn");
      let rightBtn = document.getElementById("rightBtn");
      
      leftBtn.onclick = () => {
        if (position !== 0) {
          position += MOVE_WIDTH;
          main_bg_inner_bottom_list.style.transform = "translateX(" + (position) + "px)";
        }
      }

      rightBtn.onclick = () => {
        if (Math.abs(position) < endpoint) {
          position -= MOVE_WIDTH;
          main_bg_inner_bottom_list.style.transform = "translateX(" + (position) + "px)";
        }
      }

      let maxCount = 30;
      let listCount = 23;
      if(maxCount > listCount) {
        maxCount = listCount;
      }
      let count = 5;
      let target = 5;
      showMore.onclick = () => {
        listCount -= 5;
        if(listCount > 0 && listCount < 5) {
          target = listCount % 5;
        }

        if (count <= maxCount-1) {
          count += 5;

          let div = document.querySelector(".fav_club_list_add_btn");
          let div1 = document.createElement("div");
          div1.classList.add("fav_club_list_row");
          let ul = document.createElement("ul");
          ul.classList.add("fav_club_list");

          for (let i = 0; i < target; i++) {
            let li = document.createElement("li");
            li.classList.add("fav_club_list_item_wrap");
            let div2 = document.createElement("div");
            div2.classList.add("fav_club_list_item");
            let h2 = document.createElement("h2");
            h2.innerText = "CLUB TITLE";
            let b = document.createElement("b");
            b.innerText = "CLUB OWNER";
            let span1 = document.createElement("span");
            span1.innerText = "CLUB LOC";
            let span2 = document.createElement("span");
            span2.innerText = "CLUB DESC";

            div2.appendChild(h2);
            div2.appendChild(b);
            div2.appendChild(span1);
            div2.appendChild(span2);
            li.appendChild(div2);
            ul.appendChild(li);
          }
          div1.appendChild(ul);
          div.before(div1);
        }
        if(count >= maxCount) {
          showMore.style.display = "none";
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
            <li class="menu_list_item"><i class="far fa-handshake"> 동호회</i></li>
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
    <div class="main_bg">
      <div class="main_bg_top"></div>
      <div class="main_bg_inner_box">
        <div class="main_bg_inner_wrap">
          <div class="main_bg_inner_top">
            <ul class="main_bg_inner_top_list">
              <li class="main_bg_inner_top_list_item">#Theme1</li>
              <li class="main_bg_inner_top_list_item">#Theme2</li>
              <li class="main_bg_inner_top_list_item">#Theme3</li>
              <li class="main_bg_inner_top_list_item">#Theme4</li>
            </ul>
          </div>
          <div class="main_bg_inner_bottom">
            <div class="arrow" id="right"><i class="fas fa-chevron-right" id="rightBtn"></i></div>
            <div class="arrow" id="left"><i class="fas fa-chevron-left" id="leftBtn"></i></div>
            <ul class="main_bg_inner_bottom_list">
              <c:forEach var="clubList" items="${list }">
                <li class="main_bg_inner_bottom_list_item_wrap">
                  <div class="main_bg_inner_bottom_list_item">
                    <h2>${clubList.CL_NAME }</h2>
                    <b>${clubList.CL_BOSS_NAME}</b> 
                    <span>${clubList.CL_LOCAL }</span>
                    <span>${clubList.CL_DESC }</span>
                  </div>
                </li>
              </c:forEach>
            </ul>
          </div>
        </div>
      </div>
      <div class="main_bg_bottom"></div>
    </div>

    <div class="hobby1st_dashboard">
      <div class="hobby1st_dashboard_inner">
        <div class="hobby1st_dashboard_inner_text">
          <span id="dashboard">Hobby1st의 소중한 회원 수 ${memberCount } 명</span>
        </div>
        <div class="hobby1st_dashboard_inner_text">
          <span id="dashboard2">현재 ${clCount }개의 동호회에서 ${clmemCount }명이 함께 하고 있습니다!!</span>
        </div>
      </div>
    </div>
    <div class="create_hobby1st_club">
      <div class="create_hobby1st_club_inner">
        <input type="button" value="동호회 만들어보기">
      </div>
    </div>

    <div class="search_area">
      <div class="search_area_inner">
        <div class="search_input_area">
          <div class="search_input_area_text">
            <input type="text" class="search_club" placeholder="찾고 싶은 동호회를 검색해 보세요!">
          </div>
          <div class="search_input_area_btn">
            <i class="fas fa-search"></i>
          </div>
        </div>
      </div>
    </div>
    <div class="search_result">
      <div class="search_result_inner">
        <!-- <div class="fav_club_list_row">
          <ul class="fav_club_list">
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
          </ul>
        </div> -->
      </div>
    </div>

    <div class="container">
      <div class="fav_club_list_title">
        <div class="fav_club_list_title_text">
          <h4>인기 동호회</h4>
        </div>
        <hr>
      </div>
      <div class="fav_club_list_wrap">
        <div class="fav_club_list_row">
          <ul class="fav_club_list">
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
            <li class="fav_club_list_item_wrap">
              <div class="fav_club_list_item">
                <h2>CLUB TITLE</h2>
                <b>CLUB OWNER</b>
                <span>CLUB LOC</span>
                <p>CLUB DESC</p>
              </div>
            </li>
          </ul>
        </div>

        <div class="fav_club_list_add_btn">
          <input type="button" value="더보기" id="showMore">
        </div>
      </div>
    </div>
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