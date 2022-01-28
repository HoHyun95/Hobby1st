<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/login.css">
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
                  <input type="text" name="mem_id" maxlength="20">
                </div>
              </div>
              <div class="login_input_contents_input_pw">
                <div class="login_input_contents_title">
                  PASSWORD
                </div>
                <div class="login_input_contents_input_box">
                  <input type="password" name="mem_pass" maxlength="20" autocomplete="off">
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
                <button id="loginid" type="button">LOGIN</button>
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