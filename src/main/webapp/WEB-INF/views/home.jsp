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
  <link rel="stylesheet" href="/css/style.css">
  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");

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

      const MOVE_WIDTH = 210;
      let position = 0;
      let offsetWidth = main_bg_inner_bottom_list.offsetWidth;
      let endpoint = offsetWidth - (MOVE_WIDTH * 6);
      console.log(offsetWidth);
      console.log(Math.abs(position));
      leftBtn.onclick = () => {
        if(Math.abs(position) < endpoint) {
          position -= MOVE_WIDTH;
          main_bg_inner_bottom_list.style.transform = `translateX(${position}px)`
        }
        console.log(Math.abs(position));
      }

      rightBtn.onclick = () => {
        if (position !== 0) {
          position += MOVE_WIDTH;
          main_bg_inner_bottom_list.style.transform = `translateX(${position}px)`
        }
        console.log(Math.abs(position));
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
            <img src="/images/LOGO.png">
          </div>
          <ul class="login_list">
            <c:choose>
              <c:when test="${mem_id !=null }">
                <span id="login_id"><b>${mem_id }</b>님 환영합니다</span>
                <a href="/member/logout">
                  <li class="login_list_item">로그아웃</li>
                </a>
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
            <li class="menu_list_item"><i class="fas fa-person-booth"> 마이페이지</i></li>
            <li class="menu_list_item"><i class="far fa-newspaper"> NEWS</i></li>
          </ul>
          <ul class="icon_list">
            <li class="icon_list_item"><a href="/clubMember/memberList?cpage=1"><i class="fab fa-facebook"></i></a></li>
            <li class="icon_list_item"><a href="/clubList/createClubPage"><i class="fab fa-instagram"></i></a></li>
            <li class="icon_list_item"><i class="fab fa-twitter"></i></li>
            <li class="icon_list_item"><i class="fab fa-github"></i></li>
            <li class="icon_list_item"><i class="fab fa-google"></i></li>
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
            <div class="arrow" id="right"><i class="fas fa-chevron-right"></i></div>
            <div class="arrow" id="left"><i class="fas fa-chevron-left"></i></div>
            <ul class="main_bg_inner_bottom_list">
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">
                  <h2>CLUB TITLE</h2>
                  <b>CLUB OWNER</b>
                  <span>CLUB LOC</span>
                  <p>CLUB DESC</p>
                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">

                </div>
              </li>
              <li class="main_bg_inner_bottom_list_item_wrap">
                <div class="main_bg_inner_bottom_list_item">
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="main_bg_bottom"></div>
    </div>

    <div class="hobby1st_dashboard">
      <div class="hobby1st_dashboard_inner">
        <div class="hobby1st_dashboard_inner_text">
          <span id="dashboard">Hobby1st와 함께 하는 동호회 <b>32,767</b>개, Hobby1st의 소중한 가입자 <b>213,432</b>명</h2></span>
        </div>
        <div class="hobby1st_dashboard_inner_text">
          <span id="dashboard2">여러분도 Hobby1st와 함께 꿈꿔왔던 취미 활동을 시작해 보세요!</span>
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
          <input type="button" value="5개 더보기">
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
  <div class="loginForm">
    <div class="logininput_wrap">
      <span id="close_btn"><i class="far fa-times"></i></span>
      <div class="logininput">
        <form action="/member/login" method="post">
          <table border=1 align="center">
            <tr>
              <th>sign_in Page
            </tr>
            <tr>
              <td><input type="text" name="mem_id" placeholder="id">
            </tr>
            <tr>
              <td><input type="password" name="mem_pass" placeholder="pass">
            </tr>
            <tr>
              <th><input type="submit" value="submit">
                <button type="button" id="sign_up">Sign Up</button>
            </tr>
          </table>
        </form>
      </div>
    </div>
  </div>
</body>

</html>