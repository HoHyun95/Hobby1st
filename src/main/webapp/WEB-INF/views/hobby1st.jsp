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
  <link rel="stylesheet" href="/css/hobby1st.css">
  <link rel="stylesheet" href="/css/header.css">
  <link rel="stylesheet" href="/css/footer.css">
  <link rel="stylesheet" href="/css/login.css">
  <link rel="stylesheet" href="/css/signUp.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
      
      sign_up.onclick = () => {
    	let modal_bg = document.querySelector(".modal_bg");
        let loginForm = document.querySelector(".loginForm");
        let signUp_wrap = document.querySelector(".signUp_wrap");
        loginForm.style.zIndex = -1;
        loginForm.style.display = "none";  
        signUp_wrap.style.zIndex = 11;
        signUp_wrap.style.display = "flex";
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
        
        let mem_id = document.getElementById("mem_id");
        let mem_id_Result = document.getElementById("mem_id_Result");
        
        let mem_pass = document.getElementById("mem_pass");
        let mem_pw_Result = document.getElementById("mem_pw_Result");
        
        let mem_pass2 = document.getElementById("mem_pass2");
        let mem_pw2_Result = document.getElementById("mem_pw2_Result");
        
        let mem_name = document.getElementById("mem_name");
        let mem_name_Result = document.getElementById("mem_name_Result");
        
        let mem_nickname = document.getElementById("mem_nickname");
        let mem_nickname_Result = document.getElementById("mem_nickname_Result");
        
        let mem_birthday = document.getElementById("mem_birthday");
        let mem_birthday_Result = document.getElementById("mem_birthday_Result");
        
        let mem_phone = document.getElementById("mem_phone");
        let mem_phone_Result = document.getElementById("mem_phone_Result");
        
        let mem_email = document.getElementById("mem_email");
        let mem_email_Result = document.getElementById("mem_email_Result");
        
        let select_gender = document.getElementById("select_gender");
        let mem_gender_Result = document.getElementById("mem_gender_Result");
        
        let mem_address = document.getElementById("mem_address");
        let mem_address_Result = document.getElementById("mem_address_Result");
        
        
        mem_id.onblur = () => {
          if(mem_id.value == "") {
        	mem_id_Result.style.color = "tomato";
            mem_id_Result.innerText = "ID를 입력해 주세요";  
          } else {
            $.ajax({
		      url : "/member/idCheck",
			  data: {id: mem_id.value}
			}).done(function(resp){
		      if(resp == "1") {
		    	mem_id_Result.style.color = "tomato";
		    	mem_id_Result.innerText = "중복된 아이디입니다.";
		    	mem_id.value = ""
			    mem_id.focus();
			  } else if(resp == "0") {
				mem_id_Result.style.color = "forestgreen";
				mem_id_Result.innerText = "사용 가능한 아이디입니다.";    
			  }
			})
          }
        }
        
        mem_id.onkeyup = () => {
          if(mem_id.value != "") {
            mem_id_Result.innerText = "";
          }	  	
        }
        
        mem_pass.onblur = () => {
          if(mem_pass.value == "") {
        	mem_pw_Result.innerText = "패스워드를 입력해 주세요";	  
          }
        }
        
        mem_pass.onkeyup = () => {
          if(mem_pass.value != "") {
        	mem_pw_Result.innerText = "";  
          }  	
        }
        
        mem_pass2.onblur = () => {
          if(mem_pass2.value == "") {
            mem_pw2_Result.innerText = "패스워드를 한번 더 입력해 주세요";	  
          }	
        }

        mem_pass2.onkeyup = () => {
          if(mem_pass2.value != "") {
        	  mem_pw2_Result.innerText = "";  
          }  	
        }
        
        mem_name.onblur = () => {
          if(mem_name.value == "") {
        	mem_name_Result.innerText = "이름을 입력해 주세요";	  
          }	
        }

        mem_name.onkeyup = () => {
          if(mem_name.value != "") {
        	mem_name_Result.innerText = "";  
          }  	
        }
        
        mem_nickname.onblur = () => {
          if(mem_nickname.value == "") {
        	mem_nickname_Result.innerText = "닉네임을 입력해 주세요";	  
          }	
        }

        mem_nickname.onkeyup = () => {
          if(mem_nickname.value != "") {
        	mem_nickname_Result.innerText = "";  
          }  	
        }
        
        mem_birthday.onblur = () => {
          if(mem_birthday.value == "") {
        	mem_birthday_Result.innerText = "생일을 입력해 주세요";	  
          }	
        }

        mem_birthday.onkeyup = () => {
          if(mem_birthday.value != "") {
        	mem_birthday_Result.innerText = "";  
          }  	
        }
        
        mem_phone.onblur = () => {
          if(mem_phone.value == "") {
        	mem_phone_Result.innerText = "전화번호를 입력해 주세요";	  
          }	
        }

        mem_phone.onkeyup = () => {
          if(mem_phone.value != "") {
        	mem_phone_Result.innerText = "";  
          }  	
        }
        
        mem_email.onblur = () => {
          if(mem_email.value == "") {
        	mem_email_Result.innerText = "전화번호를 입력해 주세요";	  
          }	
        }

        mem_email.onkeyup = () => {
          if(mem_email.value != "") {
        	mem_email_Result.innerText = "";  
          }  	
        }
        
        select_gender.onblur = () => {
          if(select_gender.options[0].selected) {
        	mem_gender_Result.innerText = "성별을 선택해 주세요";	  
          }	
        }
        
        select_gender.onclick = () => {
          if(select_gender.options[1].selected || select_gender.options[2].selected) {
        	mem_gender_Result.innerText = "";  
          }  	
        }
        
        mem_address.onblur = () => {
          if(mem_address.options[0].selected) {
        	mem_address_Result.innerText = "지역을 선택해 주세요";	  
          }	
        }
        
        mem_address.onclick = () => {
          if(!mem_address.options[0].selected) {
        	mem_address_Result.innerText = "";  
          }  	
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
          if (mem_id.value != "" && mem_pass.value != "" && mem_pass2.value != "" && 
              mem_name.value != "" && mem_nickname.value != "" && mem_birthday.value != "" && 
        	  mem_phone.value != "" && mem_email.value != "" && !select_gender.options[0].selected) {
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
          
          } else {
            alert("정보를 모두 입력해 주세요");	  
          }
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

        const previewImage = document.getElementById("preview_img");
        select_gender.addEventListener("change", (e) => {
          if(e.target.id == "select_gender" && e.target.value == "M") {
            previewImage.src = "/images/man" + (getRandomNum(1, 3)) +".png";
          } else if(e.target.id == "select_gender" && e.target.value == "F") {
            previewImage.src = "/images/woman" + (getRandomNum(1, 3)) +".png";
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
    }
  </script>
</head>

<body>
  <div class="modal_bg">

  </div>
  <!-- sign_in -->
  <jsp:include page="login.jsp"></jsp:include>
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
            <a href="/Hobby1st"><li class="menu_list_item">Hobby1st</i></li></a>
            <a href="/club"><li class="menu_list_item">동호회</li></a>
            <a href="/myPage"><li class="menu_list_item">마이페이지</li></a>
            <a href="/news"><li class="menu_list_item">NEWS</li></a>
            <a href="/vote"><li class="menu_list_item">VOTE</li></a>
            <!-- <a href="/fullpage"><li class="menu_list_item">Fullpage</li></a> -->
            <c:if test="${admin != null }">
            <a href="/admin"><li class="menu_list_item">admin</li></a>
            </c:if>
          </ul>
        </div>
      </div>
    </div>
  <div class="landing_page_wrap">
    <div class="landing_page_section1">
      <img src="/images/landing_back.jpg">
      <div class="landing_page_section1_title">
        <div class="landing_page_section1_title1">
          사람과 사람을 잇다!
        </div>
        <div class="landing_page_section1_title2">
          Hobby1st와 함께 시작하는 동호회 Life의 시작!
        </div>
      </div>
      <div class="landing_page_section1_contents">
        <p class="landing_page_section1_contents_text">
          코로나로 인해 우울한 일상 속에서 새로운 재미를 찾아보세요! <br>
          관심사가 같은 사람들과 소통하고 일상을 공유하고, 같은 지역 사람들과 추억을 공유하고 현재를 기록해보세요!
        </p>
      </div>
      <div class="landing_page_section1_btn">
        <button type="button" id="createId">지금 시작해보기!</button>
      </div>
      <div class="custom-shape-divider-bottom-1644245818">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
          <path
            d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V0H0V27.35A600.21,600.21,0,0,0,321.39,56.44Z"
            class="shape-fill"></path>
        </svg>
      </div>
    </div>
    <div class="landing_page_section2">
      <div class="section2_list_wrap">
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-file-code"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Don't dream, Be it!
            </div>
            <div class="list_contents_title2">
              개발 동호회
            </div>
            <p class="list_contents_text">
              꿈꾸던 모든 것들을 개발을 통해 만들어보세요! <br>
              Java, Python, Javascript <br>
              같은 분야의 언어를 공부하는 사람들과 <br>
              함께 꿈을 실현해 보세요!
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-people-carry"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Love the life you live!
            </div>
            <div class="list_contents_title2">
              사회공헌활동 동호회
            </div>
            <p class="list_contents_text">
              Live the life you love! <br>
              스스로 행복한 삶을 살며 <br>
              도움의 손길이 필요한 사람들과 <br>
              함께 행복한 삶을 나누어 보세요!
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-utensils"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              You Only Live Once!
            </div>
            <div class="list_contents_title2">
              맛집 동호회
            </div>
            <p class="list_contents_text">
              오늘 먹을 것을 내일로 미루지 말라! <br>
              한식, 일식, 중식, 양식 <br>
              입맛이 같은 다양한 사람들과 <br>
              오늘의 맛집을 탐방해 보세요!
            </p>
          </div>
        </div>
      </div>

      <div class="section2_list_wrap">
        <div class="section2_list">
          <div class="list_icon"><i class="far fa-futbol"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              No Sweat! No Sweet!
            </div>
            <div class="list_contents_title2">
              스포츠 동호회
            </div>
            <p class="list_contents_text">
              No Pain! No Gain! <br>
              땀흘려본 자만이 달콤한 기쁨을 얻을 수 있다! <br>
              축구, 풋살, 농구, 야구, 배구, 헬스 등 <br>
              같은 운동을 하며 함께 땀흘리며 <br>
              건강과 행복 두 마리 토끼를 모두 잡아보세요!
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-chart-line"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Life is all about Timing!
            </div>
            <div class="list_contents_title2">
              주식/코인 동호회
            </div>
            <p class="list_contents_text">
              인생은 타이밍이다! <br>
              기다리고 버티는 자가 승리한다! <br>
              쥐꼬리 월급 재테크가 필요하신가요? <br>
              물려있는 종목이 하나도 없을 때까지 <br>
              존버는 승리한다! 함께 투자해 보세요!
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-music"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Music is my life!
            </div>
            <div class="list_contents_title2">
              음악 동호회
            </div>
            <p class="list_contents_text">
              Music is like a box of chocolates! <br>
              음악은 마치 초콜릿 상자와 같아서, <br>
              발라드, R&B, 댄스, 힙합, 트로트, 클래식 <br>
              여러 장르로 다양한 감정을 전달해 줄 겁니다! <br>
              예측할 수 없는 음악의 세계에서 함께 해보세요!
            </p>
          </div>
        </div>
      </div>

      <div class="section2_list_wrap">
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-user-friends"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Who is your IDOL?
            </div>
            <div class="list_contents_title2">
              남자아이돌/여자아이돌 동호회
            </div>
            <p class="list_contents_text">
              당신의 아이돌은 누구인가요? <br>
              반복되는 일상 속에서 <br>
              지루함을 날려줄 나의 IDOL! <br>
              같은 IDOL 팬덤과 함께 일상의 재미를 찾아보세요!
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-cookie-bite"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Follow the heart!
            </div>
            <div class="list_contents_title2">
              핸드메이드 동호회
            </div>
            <p class="list_contents_text">
              수공예품, 커피, 홈쿠킹, 홈베이킹 <br>
              내 손으로 만들어내는 마스터피스! <br>
              같은 취미, 하지만 서로 다른 아이디어로 <br>
              나만의 개성이 들어간 작품을 만들어 보세요! 
            </p>
          </div>
        </div>
        <div class="section2_list">
          <div class="list_icon"><i class="fas fa-map-marked-alt"></i></div>
          <div class="list_contents">
            <div class="list_contents_title1">
              Life is a journey!
            </div>
            <div class="list_contents_title2">
              지역 동호회
            </div>
            <p class="list_contents_text">
              인생은 긴 여정입니다. <br>
              긴 여정을 함께 할 동반자가 필요하신가요? <br>
              17개의 지역 가운데 내가 사는 지역은 어디인가요? <br>
              같은 지역에서 추억을 함께 공유하고 <br>
              해당 지역의 미래를 함께 만들어 보세요!
            </p>
          </div>
        </div>
      </div>
    </div>

    <div class="landing_page_section3">
      <div class="custom-shape-divider-top-1644251607">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
            <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
            <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
        </svg>
      </div>
      <div class="landing_page_section3_title">
        원하는 동호회가 없으신가요? 지금 바로 만들어 보세요!
      </div>
      <div class="landing_page_section3_btn">
        <button type="button" id="createClub">동호회 만들어보기!</button>
      </div>
      <div class="custom-shape-divider-bottom-1644251677">
        <svg data-name="Layer 1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" opacity=".25" class="shape-fill"></path>
            <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" opacity=".5" class="shape-fill"></path>
            <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" class="shape-fill"></path>
        </svg>
      </div>
    </div>
    <div class="landing_page_section4">
      <div class="landing_page_section4_title">
        Hobby1st 만든 사람들
      </div>
      <div class="lp_item_wrap">
        <div class="lp_item">
          <div class="lp_item_photo_area">
            <div class="lp_item_photo">
              <img src="images/man1.png">
            </div>
          </div>
          <div class="lp_item_profile_area">
            <span id="lp_admin_badge">ADMIN</span>
            <div class="lp_item_profile_title">이름</div>
            <div class="lp_item_profile_item">FRONT / BACK / DB / AWS</div>
            <div class="lp_item_profile_item">생년월일</div>
            <div class="lp_item_profile_item">COMMENT</div>
          </div>
        </div>
        <div class="lp_item">
          <div class="lp_item_photo_area">
            <div class="lp_item_photo">
              <img src="images/man1.png">
            </div>
          </div>
          <div class="lp_item_profile_area">
            <span id="lp_admin_badge">ADMIN</span>
            <div class="lp_item_profile_title">이름</div>
            <div class="lp_item_profile_item">FRONT / BACK / DB / AWS</div>
            <div class="lp_item_profile_item">생년월일</div>
            <div class="lp_item_profile_item">COMMENT</div>
          </div>
        </div>
        <div class="lp_item">
          <div class="lp_item_photo_area">
            <div class="lp_item_photo">
              <img src="images/man1.png">
            </div>
          </div>
          <div class="lp_item_profile_area">
            <span id="lp_admin_badge">ADMIN</span>
            <div class="lp_item_profile_title">이름</div>
            <div class="lp_item_profile_item">FRONT / BACK / DB / AWS</div>
            <div class="lp_item_profile_item">생년월일</div>
            <div class="lp_item_profile_item">COMMENT</div>
          </div>
        </div>
        <div class="lp_item">
          <div class="lp_item_photo_area">
            <div class="lp_item_photo">
              <img src="images/man1.png">
            </div>
          </div>
          <div class="lp_item_profile_area">
            <span id="lp_admin_badge">ADMIN</span>
            <div class="lp_item_profile_title">이름</div>
            <div class="lp_item_profile_item">FRONT / BACK / DB / AWS</div>
            <div class="lp_item_profile_item">생년월일</div>
            <div class="lp_item_profile_item">COMMENT</div>
          </div>
        </div>
        <div class="lp_item">
          <div class="lp_item_photo_area">
            <div class="lp_item_photo">
              <img src="images/man1.png">
            </div>
          </div>
          <div class="lp_item_profile_area">
            <span id="lp_admin_badge">ADMIN</span>
            <div class="lp_item_profile_title">이름</div>
            <div class="lp_item_profile_item">FRONT / BACK / DB / AWS</div>
            <div class="lp_item_profile_item">생년월일</div>
            <div class="lp_item_profile_item">COMMENT</div>
          </div>
        </div>
      </div>
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
  <jsp:include page="signUp.jsp"></jsp:include>
</body>

</html>