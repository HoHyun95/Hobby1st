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
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
  <link rel="stylesheet" href="/css/default.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/club.css">
  <link rel="stylesheet" href="/css/createClub.css">
  <script>
    window.onload = () => {
      let id = '<%=(String)session.getAttribute("mem_id")%>';
      let loginform_btn = document.getElementById("loginform_btn");
      let close_btn = document.getElementById("close_btn");
      let sign_up = document.getElementById("sign_up");
      let main_bg_inner_bottom_list = document.querySelector(".main_bg_inner_bottom_list");
      let likeBtn = document.querySelectorAll(".likeBtn");
      let h3 = document.querySelectorAll("h3");
	  let hidden = document.querySelectorAll("input[type='hidden']");
	  let club_list_box = document.querySelectorAll(".club_list_box");
      let createMyClub = document.getElementById("createMyClub");
	  let createClub_close_btn = document.getElementById("createClub_close_btn");
      
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
      
      createMyClub.onclick = () => {
    	if(id == 'null') {
    		alert("로그인 후 이용 가능합니다.");
    		return false;
    	}
    	let modal_bg = document.querySelector(".modal_bg");  
    	let createClub_wrap = document.querySelector(".createClub_wrap");
    	modal_bg.style.zIndex = 10;
        modal_bg.style.display = "flex";
        createClub_wrap.style.zIndex = 12;
        createClub_wrap.style.display = "flex";
      }
      
 	  createClub_close_btn.onclick = () => {
 		let modal_bg = document.querySelector(".modal_bg");  
     	let createClub_wrap = document.querySelector(".createClub_wrap");
     	modal_bg.style.zIndex = -1;
        modal_bg.style.display = "none";
        createClub_wrap.style.zIndex = -1;
        createClub_wrap.style.display = "none";	  
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
      
      // 무한 스크롤
      let totalList;
      let likedList;
      let start;
      let end;
      if(id != 'null') {
    	likedList = ${fn:length(clubList)};
    	start = 1;
    	end = 10;
    	console.log(start);
    	console.log(end);
        totalList = ${fn:length(listCount)} - likedList;
      } else {
    	start = 11;
    	end = 20;
    	console.log(start);
    	console.log(end);
        totalList = ${fn:length(listCount)};
      }
  
      console.log(totalList);
      let count = 10;
     
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

      let lcount = likedList;
      window.addEventListener("scroll", throttle(() => {
    	if(start <= totalList) {
		if ((window.innerHeight + window.scrollY + 600) >= document.body.offsetHeight) {
		  $.ajax({
              url: "/splitList?start=" + (start) + "&end=" + (end), 
              type: "get",
              dataType: "json" 
          }).done((res) => {
          
          if(res.length > 0) {
        	lcount += res.length;
            console.log(lcount);
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
              div4.classList.add("likeBtn");
              if(id != 'null') {
                i.classList.add("far");
                i.classList.add("fa-heart");
              }
              i.id = res[k].cl_id;
            
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
    	
	}}, 1000));
    
    /* 동호회 생성 */
    let createClubBtn = document.getElementById("createClubBtn");
    let slideLeft = document.getElementById("slideLeft");
    let slideRight = document.getElementById("slideRight");
    let createClub_container = document.querySelector(".createClub_container");
    let MOVE_WIDTH = 528;
    let position = 0;

    let current_point = 0;

    let end_point = MOVE_WIDTH * 3;

    if (current_point == 0) {
      slideLeft.style.display = "none";
    }

    if (current_point == end_point) {
      slideRight.style.display = "none";
    }

    slideRight.onclick = () => {
      current_point += MOVE_WIDTH;
      if (current_point == end_point) {
        slideRight.style.display = "none";
        createClubBtn.style.display ="inline";
        slideLeft.style.display = "inline";
      } else if(current_point > 0) {
        slideLeft.style.display = "inline";
        createClubBtn.style.display ="none";
      }
      position -= MOVE_WIDTH;
      createClub_container.style.transform = "translateX(" + (position) + "px)";
      console.log(position);

    }

    slideLeft.onclick = () => {
      current_point -= MOVE_WIDTH;
      if (current_point == 0) {
        slideLeft.style.display = "none";
        slideRight.style.display = "inline";
        createClubBtn.style.display ="none";
      } else if(current_point < end_point) {
        slideRight.style.display = "inline";
        createClubBtn.style.display ="none";
      }
      position += MOVE_WIDTH;
      createClub_container.style.transform = "translateX(" + (position) + "px)";
      console.log(position);
    }    
    
    
    // 동호회 검색
    let search_input_area_btn = document.querySelector(".search_input_area_btn");
    let search_result_inner = document.querySelector(".search_result_inner");
    
    search_input_area_btn.onclick = () => {
      let selectBox = document.getElementById("selectBox");
      let search_club = document.querySelector(".search_club");
      let create_hobby1st_club = document.querySelector(".create_hobby1st_club");
      let search_result_title = document.querySelector(".search_result_title");
      
      $.ajax({
        url: "/clubList/searchClub",
        type: "get",
        data: {
          "searchField": (selectBox.value),
          "searchText": (search_club.value)
        },
        dataType: "json"
      }).done((res) => {
        console.log(res);
        create_hobby1st_club.style.display = "none";
        search_result_inner.style.display = "flex";
        search_result_title.innerText = "총 " + (res.length) + "건의 검색 결과가 있습니다.";
        if(search_result_inner.hasChildNodes()) {
          while (search_result_inner.hasChildNodes()) {	
            search_result_inner.removeChild(search_result_inner.firstChild);
    	  }
        }
        
        if(res.length > 0) {
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

            div1.classList.add("search_list_box_wrap");
            div2.classList.add("search_list_box");
            div3.classList.add("badge");
            div3.id = "theme1";
            div3.innerHTML = res[k].cl_category_id;
            div4.classList.add("likeBtn");
            if(id != 'null') {
              i.classList.add("far");
              i.classList.add("fa-heart");
            }
            i.id = res[k].cl_id;
          
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
            
            search_result_inner.appendChild(div1);
          }
        } else {
          create_hobby1st_club.style.display = "flex";
          search_result_inner.style.display = "none";
        }
      });
    }
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
              <c:when test="${mem_id !=null || admin != null }">
			<c:if test="${admin != null}">
                <li id="login_id"><b>관리자</b>님 환영합니다</li>
                </c:if>
              <c:if test="${mem_id != null}">
                <li id="login_id"><b>${mem_id }</b>님 환영합니다</li>
                </c:if>
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
            <c:if test="${admin != null }">
            <a href="/admin"><li class="menu_list_item">admin</li></a>
            </c:if>
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
            <input type="text" class="search_club" name="searchText" placeholder="찾고 싶은 동호회를 검색해 보세요!">
          </div>
          <div class="search_input_area_btn">
            <i class="fas fa-search"></i>
          </div>
        </div>
      </div>
    </div>
  
 	<div class="search_result_title"></div>
 
    <div class="search_result">
      <div class="search_result_inner">
        
      </div>
    </div>
    <!-- search end -->

    <!-- create club -->
    <div class="create_hobby1st_club">
      <div class="create_hobby1st_club_inner">
      <div class="create_hobby1st_club_inner_text">찾으시는 동호회가 없으신가요? </div>
        <input type="button" value="나만의 동호회를 만드세요!" id="createMyClub">
      </div>
    </div>
    <!-- create club end -->

    

    <!-- club_list_title -->
    <div class="club_list_title">
      <div class="club_list_title_contents"> 
        <div class="club_list_title_text"> Hobby1st 전체 동호회 </div>
      </div>
    </div>
    <!-- club_list_title end-->

    <!-- container -->
    <div class="container">
      <div class="club_list_wrap">
        <!-- <div class="no_search_result"> 
          <div class="no_search_result_text"> 검색 결과가 없습니다.</div>
        </div> -->
        <div class="club_list">
          <c:choose>
    		<c:when test="${sessionScope.mem_id eq null}">
			  <c:forEach var="cl" items="${clubList }">
              <div class="club_list_box_wrap">
                <div class="club_list_box">
                  <div class="badge" id="theme1">${cl.cl_category_id }</div>
                  <a href="/clubHouse?cl_id=${cl.cl_id }"><h3>${cl.cl_name}</h3></a>
                  <h5>${cl.cl_boss_name }</h5>
                  <h5>${cl.cl_local}</h5>
                  <c:choose>
			        <c:when test="${fn:length(cl.cl_desc) gt 15}">
			          <c:out value="${fn:substring(cl.cl_desc, 0, 15)}" />
			        </c:when>
			        <c:otherwise>
			          <h5><c:out value="${cl.cl_desc}" /></h5>
			        </c:otherwise>
			      </c:choose>
                </div>
              </div>
              </c:forEach>	
    		</c:when>
    		<c:otherwise>
    		  <c:choose>
    		    <c:when test="${fn:length(clubList) eq 0}">
    		      <c:forEach var="cl" items="${listCount }" begin="0" end="9">
		          <div class="club_list_box_wrap">
		            <div class="club_list_box">
		              <div class="badge" id="theme1">${cl.CL_CATEGORY_ID }</div>
		              <div class="likeBtn"><i class="far fa-heart" id=${cl.CL_ID }></i></div>
		              <a href="/clubHouse?cl_id=${cl.CL_ID }"><h3>${cl.CL_NAME}</h3></a>
		              <h5>${cl.CL_BOSS_NAME }</h5>
		              <h5>${cl.CL_LOCAL }</h5>
		              <c:choose>
					    <c:when test="${fn:length(cl.CL_DESC) gt 15}">
					      <c:out value="${fn:substring(cl.CL_DESC, 0, 15)}" />
					    </c:when>
					    <c:otherwise>
					      <h5><c:out value="${cl.CL_DESC}" /></h5>
					    </c:otherwise>
					  </c:choose>
		            </div>
		          </div>
		          </c:forEach>
    		    </c:when>
    		    <c:otherwise>
    		      <c:forEach var="cl" items="${clubList }">
		          <div class="club_list_box_wrap">
		            <div class="club_list_box">
		              <div class="badge" id="theme1">${cl.cl_category_id }</div>
		              <div class="likeBtn"><i class="fas fa-heart" id=${cl.cl_id }></i></div>
		              <a href="/clubHouse?cl_id=${cl.cl_id }"><h3>${cl.cl_name}</h3></a>
		              <h5>${cl.cl_boss_name }</h5>
		              <h5>${cl.cl_local }</h5>
		              <c:choose>
					    <c:when test="${fn:length(cl.cl_desc) gt 15}">
					      <c:out value="${fn:substring(cl.cl_desc, 0, 15)}" />
					    </c:when>
					    <c:otherwise>
					      <h5><c:out value="${cl.cl_desc}" /></h5>
					    </c:otherwise>
					  </c:choose>
		            </div>
		          </div>
		          </c:forEach>
    		    </c:otherwise>
    		  </c:choose>
    		</c:otherwise>
		  </c:choose>
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
  <div class="createClub_wrap">
    <form action="/clubList/createClubProc" method="post" id="clubCreateForm" enctype="multipart/form-data">
  	<span id="createClub_close_btn"><i class="far fa-times"></i></span>
    <span id="slideLeft"><i class="far fa-arrow-alt-circle-left"></i></span>
    <span id="slideRight"><i class="far fa-arrow-alt-circle-right"></i></span>
    <span id="createClub"><button id="createClubBtn">동호회 생성</button></span>
    <div class="createClub_container">
      <div class="steps_wrap">
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 1</span></div>
          <div class="steps_item_detail">동호회 기본 정보 등록</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 2</span></div>
          <div class="steps_item_detail">동호회 사진 등록</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 3</span></div>
          <div class="steps_item_detail">동호회 지역 선택</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 4</span></div>
          <div class="steps_item_detail">동호회 카테고리 선택</div>
        </div>
      </div>
      <div class="contents_wrap">
        <div class="contents_item_wrap">
          <div class="contents_item">
            <div class="desc">
              <h3>동호회의 기본 정보를 입력해 주세요!</h3>
              <h5>특별한 동호회명으로 회원들의 시선을 사로잡아 보세요!</h5>
            </div>
            <div class="title">
              <i class="fas fa-users"> 동호회명</i>
            </div>
            <div class="input">
              <input type="text" id="cl_name" maxlength="30" name="cl_name" placeholder="동호회명을 입력해주세요">
            </div>
            <span class="resultSpan" id="cl_name_valid"></span>
            <div class="title">
              <i class="fas fa-user"> 동호회장 ID</i>
            </div>
            <div class="input">
              <input type="text" id="cl_boss_id" maxlength="30" name="cl_boss_id" value="${mem_id}" readonly>
            </div>
            <div class="title">
              <i class="fas fa-user"> 동호회장 이름</i>
            </div>
            <div class="input">
              <input type="text" id="cl_boss_name" maxlength="30" name="cl_boss_name" value="${user_name}" readonly>
            </div>
            <div class="title">
              <i class="fas fa-users-cog"> 동호회 정원</i>
            </div>
              <span id="cl_maxMem_valid"></span>
            <div class="input">
              <input type="text" id="cl_maxMem" maxlength="3" name="cl_maxMem" placeholder="최대정원을 정해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
            </div>
            <div class="title">
              <i class="far fa-file-alt"> 동호회 소개</i>
            </div>
            <textarea id="cl_desc" name="cl_desc" cols="68" rows="10" style="resize: none;"></textarea>
          </div>
          <div class="contents_item">
            <div class="desc">
              <h3>동호회의 사진을 등록해 주세요!</h3>
              <h5>사진을 등록하지 않으시면 기본 이미지가 제공됩니다!</h5>
            </div>
            <div class="title">
              동호회 사진
            </div>
            <div class="img_box">
              <img src="" alt="이미지를 선택해 주세요" id="preview_img">
            </div>
            <div class="input">
              <input name="file" type="file" id="image-input" accept="image/*">
            </div>
          </div>
          <div class="contents_item">
            <div class="desc">
              <h3>동호회 주요 활동 지역을 입력해 주세요!</h3>
              <h5>지역 네트워크를 통해 활발하게 동호회 활동을 즐겨보세요!</h5>
            </div>
            <div class="title">
              <i class="fas fa-city"> 활동 지역</i>
            </div>
            <div class="input">
              <select name="cl_local" id="cl_local">
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="인천">인천</option>
                <option value="강원">강원</option>
                <option value="충북">충북</option>
                <option value="충남">충남</option>
                <option value="대전">대전</option>
                <option value="세종">세종</option>
                <option value="전북">전북</option>
                <option value="전남">전남</option>
                <option value="광주">광주</option>
                <option value="경북">경북</option>
                <option value="대구">대구</option>
                <option value="경남">경남</option>
                <option value="부산">부산</option>
                <option value="울산">울산</option>
                <option value="제주">제주</option>
              </select>
            </div>
          </div>
          <div class="contents_item">
            <div class="desc">
              <h3>동호회 카테고리를 입력해 주세요!</h3>
              <h5>Hobby1st에서 관심사가 같은 사람들과 동호회 활동을 즐겨보세요!</h5>
            </div>
            <div class="title">
              <i class="fas fa-archive"> 대분류</i>
            </div>
            <div class="input">
              <select name="cl_category_id" id="cl_category_id">
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
              </select>
            </div>
            <div class="title">
              <i class="fas fa-asterisk"> 소분류</i>
            </div>
            <div class="input">
              <select name="cl_dCategory_id" id="cl_dCategory_id">
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
                <option value="ITEM1">ITEM 1</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </div>
	</form>
	<script>
	  function readImage(input) {
	    if (input.files && input.files[0]) {
	      const reader = new FileReader()
	      reader.onload = e => {
	        const previewImage = document.getElementById("preview_img");
	        previewImage.src = e.target.result
	      }
	      reader.readAsDataURL(input.files[0])
	    }
	  }
	  
	  const inputImage = document.getElementById("image-input");
	  inputImage.addEventListener("change", e => {
	    readImage(e.target)
	  });
      

	  	  
	  let cl_name = document.querySelector('#cl_name');
	  let cl_name_valid = document.querySelector('#cl_name_valid');
	  
	  cl_name.addEventListener('blur', () => {
		  if(cl_name.value.length < 3){
			  cl_name_valid.innerHTML = "동호회명은 3자 이상으로 작성해주세요";
		  }else if(cl_name.value.length > 29){
			  cl_name_valid.innerHTML = "30자 이내로 작성해주세요";
		  }else{
			  cl_name_valid.innerHTML ="";
			  
			   $.ajax({
					  url : "/clubList/nameCheck",
					  data : { cl_name : cl_name.value }
					}).done((resp) => {

					  if (cl_name.value !== "") {
						if (resp > 0) {
						  cl_name_valid.innerHTML ="이미 사용중인 동호회명입니다";
						  cl_name.value="";
						  cl_name.focus();
						} else {
						  cl_name_valid.innerHTML="";
						}
					  } else {
						cl_name_valid.innerHTML="동호회명을 입력해주세요";
					  }
				    }); 
		  }
	  })
		  
		let cl_maxMem = document.querySelector('#cl_maxMem');
	  	cl_maxMem.addEventListener('blur', () => {
	  		if (cl_maxMem.value > 100){
	  			document.querySelector('#cl_maxMem_valid').innerHTML="정원은 100명을 초과할 수 없습니다";
	  			cl_maxMem.focus();
	  		}else{
	  			document.querySelector('#cl_maxMem_valid').innerHTML="";
	  		}
	  })
	  
	  //다음 버튼 클릭시 innerHTML 들어가 있다면 다음 페이지로 넘어가는 것 막고, 빈 곳이 있어도 막기 구현 (예정)
		  	  

	</script>
  </div>
</body>

</html>