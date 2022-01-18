<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
        height: 360px;
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
               <div class="footer_submit">
                   <button class="button_login" type="submit">login</button>
               </div>
               <div class="footer_font">
                   <a class="a_login" href="/member/send_email">이메일찾기</a>
                   <a class="a_login" href="/member/sign_up">회원가입</a>
               </div>
           </div>
        </form>
        </div>
    </div>
	<script>
		$("#sign_up").on("click", function() {
			location.href = "/member/sign_up";
		})
	</script>
</body>
</html>