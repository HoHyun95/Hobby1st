<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
  
  <!-- 네이버 로그인 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>

<title>Sign_in</title>
<Style>
    .a_login{
        text-decoration-line:none;
        color: black;
        font-size: 14px;
        margin-left: 10px;
        margin-right: 20px;
    }
    .a_login:hover{
        font-size: 15px;
        font-weight: 600;
    }   
    *{box-sizing: border-box;}
    .login_wrap{
        margin: auto;
        border: 1px solid black;
        text-align: center;
        width: 300px;
        height: 400px;
        }
    .lbody{
        line-height: 30px;
        margin-top: 12px;
    }
    .lfooter{
        margin-top: 10px ;
        line-height: 45px;
    }
    #body_box{
        outline: 1px solid rgb(158, 128, 247, 0.9);
        width: 250px;
        height: 30px;
    }
    #body_box:hover{
        background: aliceblue;
    }       
    .button_login{
        color: white; background-color: rgb(158, 128, 247, 0.9); border-color: white;
        width: 260px;
        height: 30px;
        font-size: 14px;
        }

    .button_login:hover{
        cursor: pointer;
        font-weight: 600;

    }
    .body_idfont{
        margin-left: 22px;
        font-size: 14px;
        text-align: left;
    }
    .body_passfont{
        margin-left: 22px;
        font-size: 14px;
        text-align: left;
    }
</Style>
</head>
<body>
     <div class="login_main">
        <div class="login_wrap">
           <div class="head">
               <div class="head_log"><h2>WelCome</h2></div>
               <div class="head_font"><span><b>어서오세요 환영합니다!</b></span></div>     
           </div>
        <form action="/member/login" method="post">
           <div class="lbody">
               <div class="body_idfont"><h7>아이디</h7></div>
               <div class="body_idbox"><input type="text" placeholder="User ID" id="body_box" name="mem_id"></div>
               <div class="body_passfont"><h7>비밀번호</h7></div>
               <div class="body_pass"><input type="password" placeholder="User Password" id="body_box" name="mem_pass"></div>
           </div>
           <div class="lfooter">
               <div id="message">
                   왜 안되냐고 정보 나오라고
               </div>

               <div class="footer_submit">
                   <button class="button_login" type="submit">login</button>
               </div>
               <div id="button_area">
                   <div id="naverIdLogin"></div>
               </div>
               
               <div class="footer_font">
                   <a class="a_login" href="/member/send_email">이메일찾기</a>
                   <a class="a_login" href="/member/sign_up">회원가입</a>
               </div>
           </div>
        </form>
        </div>
    </div>
    
      <script type="text/javascript">
      const naverLogin = new naver.LoginWithNaverId(
  			{
  				clientId: "lBYZ6xYGSN3wiVHC2ZK4",
  				callbackUrl: "http://localhost/member/sign_in",
  				loginButton: {color: "green", type: 4, height: 40}
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
              const birthday=naverLogin.user.getBirthday();

             if(age===null||age===undefined ){ 
                 alert("나이를 선택해주세요!");
                 naverLogin.reprompt(); 
                 return ;  
             }else if(birthday===null||birthday===undefined) {
            	 alert("생년월일을 선택해주세요!");
            	 naverLogin.reprompt();
            	 return;
             }else if(name===null||name===undefined) {
                 alert("이름을 선택해주세요!");
                 naverLogin.reprompt(); 
                 return ; 
             }else if(email===null||email===undefined) {
                 alert("이메일을 선택해주세요!");
                 naverLogin.reprompt(); 
                 return ; 
             }else if(mobile===null||mobile===undefined) {
                 alert("전화번호를 선택해주세요!");
                 naverLogin.reprompt(); 
                 return ; 
             }else{
              setLoginStatus(); 
             }
          }
        });
      
      function setLoginStatus(){
          const message_area=document.getElementById('message');
          message_area.innerHTML=`
              <h3> Login 성공 </h3>
              <div> 시이게 되나 봐라 : ${naverLogin}  </div>
              <div>user Nickname : ${naverLogin.user.nickname}.text</div>
              <div>user Age(범위) : ${naverLogin.user.age}</div>
              <div>user Birthday : ${naverLogin.user.birthday}</div>
          `;
    	  
          const button_area=document.getElementById('button_area');
          button_area.innerHTML="<button id='btn_logout' type='button'>로그아웃</button>";

          const logout=document.getElementById('btn_logout');
          logout.addEventListener('click',(e)=>{
              naverLogin.logout();
              location.replace("http://localhost/member/sign_in");
          })        	  
      }     
      </script>    
      <script>
  	  $("#sign_up").on("click", function() {
		location.href = "/member/sign_up";
	  })
      </script>    
</body>
</html>