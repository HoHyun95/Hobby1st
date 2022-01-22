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
  <title>CLUB</title>
  <!-- 네이버 로그인스크립트  -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
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
      let likeBtn = document.querySelectorAll("#likeBtn");
      let h3 = document.querySelectorAll("h3");
	  let hidden = document.querySelectorAll("input[type='hidden']");
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

      document.addEventListener('click', (e) => {
        if(e.target && e.target.id== 'likeBtn'){
          e.target.classList.toggle("fas");
        }
      });
      
      
      // 무한 스크롤
      let totalList = ${fn:length(clubList)}
      console.log(totalList);
      let count = 10;
      let start = 11;
      let end = 20;
      
      function throttle(fn, delay) { 
        let timer; return function() { 
    	  if(!timer) { 
    	    timer = setTimeout(()=> { 
    		  timer = null; 
    		  fn.apply(this,arguments);
    	    }, delay) 
    	  } 
        } 
      }

      
      
      window.addEventListener("scroll", throttle(() => {
    	if(start < totalList) {
		if ((window.innerHeight + window.scrollY + 150) >= document.body.offsetHeight) {
		  $.ajax({
              url: "/splitList?start=" + (start) + "&end=" + (end), 
              type: "get",
              dataType: "json" 
          }).done((res) => {
          
          if(res.length > 0) {
       		start += count;
            end += res.length; 
              
            for(let k = 0; k < res.length; k++) {
              let div1 = document.createElement("div");
              let div2 = document.createElement("div");
              let div3 = document.createElement("div");
              let div4 = document.createElement("div");

              let a = document.createElement("a");
              let h3 = document.createElement("h3");
              let h5_1 = document.createElement("h5");
              let h5_2 = document.createElement("h5");
              let h5_3 = document.createElement("h5");
              let i = document.createElement("i");
              let input = document.createElement("input");

              div1.classList.add("club_list_box_wrap");
              div2.classList.add("club_list_box");
              div3.classList.add("badge");
              div3.id = "theme1";
              div3.innerHTML = res[k].cl_category_id;
              div4.classList.add("like");
                  
              i.classList.add("far");
              i.classList.add("fa-heart");
              i.id = "likeBtn";
            
              a.href = "/clubHouse?cl_id="+res[k].cl_id;
              h3.innerHTML = res[k].cl_name;
              h5_1.innerHTML = res[k].cl_boss_name;
              h5_2.innerHTML = res[k].cl_local;
              h5_3.innerHTML = res[k].cl_desc;
     
              div4.appendChild(i);
              div2.appendChild(div3);
              div2.appendChild(div4);
              a.appendChild(h3);
              div2.appendChild(a);
              div2.appendChild(h5_1);
              div2.appendChild(h5_2);
              div2.appendChild(h5_3);
              div1.appendChild(div2);

              document.querySelector('.club_list').appendChild(div1);
          
            }
          }
        }); 	
	  }
      }
	}, 1000));
  
    
    $(document).on("click",".club_list_box_wrap", function() {
    	console.log("a");
    	alert("아아앙아아아아아!!!!!!");
    })
    
    /* 네이버 로그인 */ 
      const naverLogin = new naver.LoginWithNaverId(
    			{
    				clientId: "lBYZ6xYGSN3wiVHC2ZK4",
    				callbackUrl: "http://localhost/",
    			}
    		);
      
      if (!window._babelPolyfill) {
    	  require("babel-polyfill");
    	  }
        naverLogin.init();
        
        naverLogin.getLoginStatus(function (status) {
            if (status) {        	  
          	  const name=naverLogin.user.getName();
          	  const email=naverLogin.user.getEmail();
          	  const gender=naverLogin.user.getGender();
          	  const mobile=naverLogin.user.getMobile();
              const age=naverLogin.user.getAge();
              const birthyear=naverLogin.user.getBirthyear();
              const birthday=naverLogin.user.getBirthday();
              const nickname=naverLogin.user.getNickName();

               if(age===null||age===undefined ){ 
                   alert("나이를 선택해주세요!");
                   naverLogin.reprompt(); 
                   return  
               }else if(birthday===null||birthday===undefined) {
              	   alert("생년월일을 선택해주세요!");
              	   naverLogin.reprompt();
              	   return
               }else if(name===null||name===undefined) {
                   alert("이름을 선택해주세요!");
                   naverLogin.reprompt(); 
                   return
               }else if(email===null||email===undefined) {
                   alert("이메일을 선택해주세요!");
                   naverLogin.reprompt(); 
                   return
               }else if(mobile===null||mobile===undefined) {
                   alert("전화번호를 선택해주세요!");
                   naverLogin.reprompt(); 
                   return
               }else if(nickname===null||nickname===undefined) {
                   alert("닉네임을 선택해주세요!");
                   naverLogin.reprompt(); 
                   return 
               }else{
                   const message_area=document.getElementById('naver_message');
                   message_area.innerHTML=`
                   <input type=text name=naver_id value=` + nickname + `>
                   <input type=text name=naver_mobile value=` + mobile + `>
                   <input type=text name=naver_email value=` + email + `>
                   <input type=text name=naver_name value=` + name + `>
                   <input type=text name=naver_nickname value=` + nickname + `>
                   <input type=text name=naver_birthyear value=` + birthyear + `>
                   <input type=text name=naver_birthday value=` + birthday + `>
                   <input type=text name=naver_gender value=` + gender + `>
                   `
                   setLoginStatus(); 
               }
            }
          });
        function setLoginStatus(){ 	  
            const button_area=document.getElementById('naver');
            button_area.innerHTML="<button id='naverIdLogin' type='submit'>Naver LOGIN</button>";
     	  
            const logout=document.getElementById('btn_logout');
            logout.addEventListener('click',(e)=>{
                naverLogin.logout();
            });   
        }
        document.getElementById('loginid').onclick = () => {
            var mem_id = document.getElementById('mem_id').value
            var mem_pass = document.getElementById('mem_pass').value
            console.log(mem_id);
            console.log(mem_pass)
            
            location.href = "/member/logind?mem_id="+(mem_id)+"&mem_pass="+(mem_pass);
        }
    }
  </script>
</head>

<body>
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
        <div class="club_list_title_text"> 총 ${fn:length(clubList)}개의 동호회가 있습니다.</div>
    </div>
    <!-- club_list_title end-->

    <!-- container -->
    <div class="container">
      <div class="club_list_wrap">
        <!-- <div class="no_search_result"> 
          <div class="no_search_result_text"> 검색 결과가 없습니다.</div>
        </div> -->
        <div class="club_list">
          <c:forEach var="cl" items="${clubList }" begin="0" end="9" step="1">
          <div class="club_list_box_wrap">
            <div class="club_list_box">
              <div class="badge" id="theme1">${cl.CL_CATEGORY_ID }</div>
              <div class="like"><i class="far fa-heart" id="likeBtn"></i></div>
              <a href="/clubHouse?cl_id=${cl.CL_ID }"><h3>${cl.CL_NAME }</h3></a>
              <h5>${cl.CL_BOSS_NAME }</h5>
              <h5>${cl.CL_LOCAL }</h5>
              <c:choose>
			    <c:when test="${fn:length(cl.cl_desc) gt 15}">
			      <c:out value="${fn:substring(cl.cl_desc, 0, 15)}" />
			    </c:when>
			    <c:otherwise>
			      <h5><c:out value="${cl.CL_DESC}" /></h5>
			    </c:otherwise>
			  </c:choose>
            </div>
          </div>
          </c:forEach>
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
  
</body>

</html>