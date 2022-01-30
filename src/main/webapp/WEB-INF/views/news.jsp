<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
  <link rel="stylesheet" href="/css/news.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/signUp.css">
  <script>
    window.onload = () => {
       let id = '<%=(String)session.getAttribute("mem_id")%>';
       let loginform_btn = document.getElementById("loginform_btn");
       let signupform_btn = document.getElementById("signupform_btn");
       let close_btn = document.getElementById("close_btn");
       let sign_up = document.getElementById("sign_up");

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

       /* 회원가입 */
       let signUp_close_btn = document.getElementById("signUp_close_btn");
       let signUpBtn = document.getElementById("signUpBtn");
       let signUp_slideLeft = document.getElementById("signUp_slideLeft");
       let signUp_slideRight = document.getElementById("signUp_slideRight");
       let signUp_container = document.querySelector(".signUp_container");
       let signUp_MOVE_WIDTH = 528;
       let signUp_position = 0;

       signupform_btn.onclick = () => {
         let modal_bg = document.querySelector(".modal_bg");
         let signUp_wrap = document.querySelector(".signUp_wrap");
         modal_bg.style.zIndex = 10;
         modal_bg.style.display = "flex";
         signUp_wrap.style.zIndex = 11;
         signUp_wrap.style.display = "flex";
       }

       signUp_close_btn.onclick = () => {
         let modal_bg = document.querySelector(".modal_bg");
         let signUp_wrap = document.querySelector(".signUp_wrap");
         modal_bg.style.zIndex = -1;
         modal_bg.style.display = "none";
         signUp_wrap.style.zIndex = -1;
         signUp_wrap.style.display = "none";
       }


       let signUp_current_point = 0;

       let signUp_end_point = signUp_MOVE_WIDTH * 3;

       if (signUp_current_point == 0) {
         signUp_slideLeft.style.display = "none";
       }

       if (signUp_current_point == signUp_end_point) {
         signUp_slideRight.style.display = "none";
       }

       signUp_slideRight.onclick = () => {
         signUp_current_point += signUp_MOVE_WIDTH;
         if (signUp_current_point == signUp_end_point) {
           signUp_slideRight.style.display = "none";
           signUpBtn.style.display = "inline";
           signUp_slideLeft.style.display = "inline";
         } else if (signUp_current_point > 0) {
           signUp_slideLeft.style.display = "inline";
           signUpBtn.style.display = "none";
         }
         signUp_position -= signUp_MOVE_WIDTH;
         signUp_container.style.transform = "translateX(" + (signUp_position) + "px)";
       }

       signUp_slideLeft.onclick = () => {
         signUp_current_point -= signUp_MOVE_WIDTH;
         if (signUp_current_point == 0) {
           signUp_slideLeft.style.display = "none";
           signUp_slideRight.style.display = "inline";
           signUpBtn.style.display = "none";
         } else if (signUp_current_point < signUp_end_point) {
           signUp_slideRight.style.display = "inline";
           signUpBtn.style.display = "none";
         }
         signUp_position += signUp_MOVE_WIDTH;
         signUp_container.style.transform = "translateX(" + (signUp_position) + "px)";
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

       let getRandomNum = (min, max) => {
         min = Math.ceil(min);
         max = Math.floor(max);
         return Math.floor(Math.random() * (max - min + 1)) + min;
       }

       let select_gender = document.getElementById("select_gender");
       const previewImage = document.getElementById("preview_img");
       select_gender.addEventListener("change", (e) => {
         if (e.target.id == "select_gender" && e.target.value == "M") {
           previewImage.src = "/images/man" + (getRandomNum(1, 3)) + ".png";
         } else if (e.target.id == "select_gender" && e.target.value == "F") {
           previewImage.src = "/images/woman" + (getRandomNum(1, 3)) + ".png";
         }
       })

       function readImage(input) {
         if (input.files && input.files[0]) {
           const reader = new FileReader()
           reader.onload = e => {
             previewImage.src = e.target.result;
           }
           reader.readAsDataURL(input.files[0])
         }
       }

       const inputImage = document.getElementById("input-image");
       inputImage.addEventListener("change", e => {
         readImage(e.target)
       });

       signUp_close_btn.onclick = () => {
         let modal_bg = document.querySelector(".modal_bg");
         let signUp_wrap = document.querySelector(".signUp_wrap");
         modal_bg.style.zIndex = -1;
         modal_bg.style.display = "none";
         signUp_wrap.style.zIndex = -1;
         signUp_wrap.style.display = "none";
       }

      // news menu toggle btn
      let notice = document.getElementById("notice");
      let qna = document.getElementById("qna");
      let faq = document.getElementById("faq");

      let notice_wrap = document.querySelector(".notice_wrap");
      let qna_wrap = document.querySelector(".qna_wrap");
      let faq_wrap = document.querySelector(".faq_wrap");

      notice.onclick = () => {
        notice.style.borderBottom = "3px solid var(--bg-color3)";
        qna.style.borderBottom = "none";
        faq.style.borderBottom = "none";

        notice_wrap.style.display = "flex";
        qna_wrap.style.display = "none";
        faq_wrap.style.display = "none";
      }

      qna.onclick = () => {
        notice.style.borderBottom = "none";
        qna.style.borderBottom = "3px solid var(--bg-color3)";
        faq.style.borderBottom = "none";

        notice_wrap.style.display = "none";
        qna_wrap.style.display = "flex";
        faq_wrap.style.display = "none";
      }

      faq.onclick = () => {
        notice.style.borderBottom = "none";
        qna.style.borderBottom = "none";
        faq.style.borderBottom = "3px solid var(--bg-color3)";

        notice_wrap.style.display = "none";
        qna_wrap.style.display = "none";
        faq_wrap.style.display = "flex";
      }
    }
  </script>
</head>

<body>
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
                <li class="login_list_item" id="signupform_btn" style="display:none">회원가입</li>
              </c:when>
              <c:otherwise>
                <li class="login_list_item" id="loginform_btn">로그인</li>
                <li class="login_list_item" id="signupform_btn">회원가입</li>
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
            <a href="/clubList/createClubPage"><li class="icon_list_item"><i class="fab fa-github"></i></li></a>
            <a href="/chat/clubChat"><li class="icon_list_item"><i class="fab fa-google"></i></li></a>
          </ul>
        </div>
      </div>
    </div>

    <div class="news">
      <div class="news_box">
        <div class="news_nav">
          <div class="news_title">
            <h2>NEWS</h2>
          </div>
          <div class="news_menu_list">
            <div class="news_menu_list_item" id="notice">공지사항</div>
            <div class="news_menu_list_item" id="qna">Q&A</div>
            <div class="news_menu_list_item" id="faq">FAQ</div>
          </div>
        </div>
      </div>
      <div class="notice_wrap">
        <!-- 공지사항 -->
        <div class="notice_accordian">
          <c:forEach var="notice" items="${noticeList }" varStatus="status">
          <input type="checkbox" id="notice${status.count }">
          <label for="notice${status.count }">${notice.notice_title } 
            <span id="notice_writeDate"><fmt:formatDate value="${notice.notice_write_date}" pattern="yyyy-MM-dd HH:mm"/></span>
            <em><i class="fas fa-chevron-circle-down"></i></em>
          </label>
          <div>
          ${notice.notice_contents }
          </div>
          </c:forEach>
        </div>
      </div>
      <!-- QnA -->
      <div class="qna_wrap">
        <div class="qna_board">
          QNA BOARD
        </div>
      </div>
      <!-- FAQ -->
      <div class="faq_wrap">
        <div class="faq_accordian">
          <c:forEach var="faq" items="${faqList }" varStatus="status">
          <input type="checkbox" id="faq${status.count }">
          <label for="faq${status.count }">${faq.faq_title }<em><i class="fas fa-chevron-circle-down"></i></em></label>
          <div>
            <p>
              ${faq.faq_contents }
            </p>
          </div>
          </c:forEach>
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
  <jsp:include page="signUp.jsp"></jsp:include>
</body>

</html>