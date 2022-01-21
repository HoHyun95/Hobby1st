<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 네이버 로그인스크립트  -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/login.css">

  <script>
    window.onload = () => {
      let loginform_btn = document.getElementById("loginform_btn");
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
        location.href = "/member/sign_up";
      }

      /* 네이버 로그인 */ 
      const naverLogin = new naver.LoginWithNaverId(
    			{
    				clientId: "lBYZ6xYGSN3wiVHC2ZK4",
    				callbackUrl: "http://localhost/",
    			}
    		);
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
        document.getElementById('logind').onclick = () => {
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
  <div class="loginForm">
    <div class="login_wrap">
    <div class="login_box_wrap">
      <span id="close_btn"><i class="far fa-times"></i></span>
      <div class="login_box">
        <div class="login_box_img_wrap">
          <div class="login_box_img">
            <img src="images/LOGO.png">
          </div>
        </div>
        <div class="intro_text">Hobby1st와 함께 당신의 취미를 공유해 보세요!</div>
        <div class="login_input_wrap">
          <div class="login_input">
            <div class="login_input_contents_wrap">
              <form action="/member/login" method="post">
              <div class="login_input_contents_input_id">
                <div class="login_input_contents_title">
                  ID
                </div>
                <div class="login_input_contents_input_box">
                  <input type="text" id="mem_id" maxlength="20">
                </div>
              </div>
              <div class="login_input_contents_input_pw">
                <div class="login_input_contents_title">
                  PASSWORD
                </div>
                <div class="login_input_contents_input_box">
                  <input type="password" id="mem_pass" maxlength="20">
                </div>
              </div>
              <div class="input_btn1">
                <div class="sign_up">ID가 없으신가요? 
                  <a href="/member/sign_up"><span id="sign_up">회원가입</span></a>
                </div>
                <div class="findItem">
                  <a class="a_login" href="/member/send_email"><span id="findEmail">EMAIL 찾기</span></a>
                </div>
              </div>
              <div class="input_btn2">
                <button type='button' id="logind">LOGIN</button>
              </div>
              <div class="divide_line">
                <div class="divide_line_item"></div>
                <div class="divide_line_item text">Or Continue with</div>
                <div class="divide_line_item"></div>
              </div>
              <div id="naver">
                 <a id="naverIdLogin_loginButton" href="#">
                 <button type="button" id="naverIdLogin"> Naver SignUp </button></a>             
              </div>
                <div id="naver_message" style="display: none;"></div>
   			  </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </div>
</body>
</html>