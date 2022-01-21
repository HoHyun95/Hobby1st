<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>sign_up_last</title>
<style>
 *{box-sizing: border-box;}
    .login_wrap{
        margin: auto;
        border: 1px solid black;
        text-align: center;
        width: 300px;
        height: 100%;
        }
    .lbody{
        line-height: 30px;
        margin-top: 12px;
    }
    .lfooter{
        margin-top: 10px ;
        line-height: 45px;
        height: 60px;
    }
    .body_box{
        width: 250px;
        height: 30px;
        outline: 1px solid rgb(158, 128, 247, 0.9);
    }
    .body_box_profile{
        line-height: 50px;
        border-radius: 35%;
        margin: auto;
        width: 200px;
        height: 150px;
        outline: 2px solid rgb(158, 128, 247, 0.9);
    }
    #photo{
        border-radius: 35%;
        width: 100%;
        height: 100%;
    }
    .body_box:hover{
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
    .body_font{
        margin-top: 10px;
        font-size: 14px;
        text-align: center;
    }
    .lhead{
        line-height: 110%;
        height: 30px;
    }

    .head_produce{
        margin: auto;
        margin-left: 55px;
        margin-top: 10px;
        width: 200px;
        height: 30px;
    }

    .num1{
        height: 22px;
        width: 22px;
        border-radius: 100px;
        background-color: rgb(158, 128, 247, 0.9);
        color: white;
        border: 1px solid  rgb(158, 128, 247, 0.9);
        float: left;
    }
    .num1_1{
        margin-top: 10px;
        height: 3px;
        width: 60px;
        border-radius: 100px;
        background-color: rgb(158, 128, 247, 0.9);
        color: white;
        border : 1px solid  rgb(158, 128, 247, 0.9);
        float: left;
    }
    .num2{
        height: 22px;
        width: 22px;
        border-radius: 100px;
        background-color: rgb(158, 128, 247, 0.9);
        color: white;
        border: 1px solid  rgb(158, 128, 247, 0.9);
        float: left;
    }
    .num2_2{
        margin-top: 10px;
        height: 3px;
        width: 60px;
        background-color: rgb(158, 128, 247, 0.9);
        border-radius: 100px;
        border : 1px solid  rgb(158, 128, 247, 0.9);
        float: left;
    }
    .num3{
        height: 22px;
        width: 22px;
        border-radius: 100px;
        border: 1px solid  rgb(158, 128, 247, 0.9);
        float: left;
        background-color: rgb(158, 128, 247, 0.9);
        color: white;
    }
    .filebox label {
        width: 80px;
        height: 25px;
        display: inline-block;
        padding: .5em .75em;
        color: white;
        font-size: 13px;
        line-height: 80%;
        vertical-align: middle;
        background-color: rgba(162, 136, 240, 0.9);
        cursor: pointer;
    }
    .filebox label:hover {
        font-weight: 600;

    }
    .filebox input[type="file"] {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0;
    }
</style>
</head>
<body>
    <div class="login_main">
        <div class="login_wrap">
           <div class="lhead">
               <div class="head_produce">
                   <div class="num1"><b>1</b></div>
                   <div class="num1_1"></div>
                   <div class="num2"><b>2</b></div>
                   <div class="num2_2"></div>
                   <div class="num3"><b>3</b></div>
               </div>
           </div>
        <form action="/member/member_add" method="post" enctype="multipart/form-data">
            <!-- sgin_upPage 에서 사용자가 입력한 값 -->
            <input type="text" name="mem_id" value="${mem_id }" hidden>
            <input type="text" name="mem_pass" value="${mem_pass }" hidden>
            <input type="text" name="mem_name" value="${mem_name }" hidden>
            <input type="text" name="mem_phone" value="${mem_phone }" hidden>
            <input type="text" name="mem_email" value="${mem_email }" hidden>
            <input type="text" name="mem_birthday" value="${mem_birthday }" hidden>
            <input type="text" name="mem_address" value="${mem_address }" hidden>
            <input type="text" name="mem_gender" value="${mem_gender }" hidden>
            <input type="text" name="mem_category_1" value="${mem_category_1 }" hidden>
            <input type="text" name="mem_category_2" value="${mem_category_2 }" hidden>

           <div class="lbody">
               <div class="body_box_wrap">
                <div class="body_box_profile">
                    <img src="/images/6.jpg" id="photo">
                </div>
               </div>
               <div class="body_font">
                <h7><b>당신의 프로필을 등록하세요!</b></h7>
               </div>
               <div class="body_box_wrap">
                 <div class="filebox">
                 <label for="photo_file">Upload!</label>
                 <input type="file" class="body_box" id="photo_file" name="mem_photo" accept="image/gif, image/jpeg, image/png"
                 onchange="file_check(this)">
                </div>
               </div>

               <div class="body_font">
                   <h7><b>당신의 닉네임을 등록하세요!</b></h7>
                </div>
               <div class="body_box_wrap">
                   <input type="text" placeholder="User Nick Name" class="body_box" name="mem_nickname" id="nick">
                </div>
            </div>
            <div class="lfooter">
                <div class="footer_submit">
                    <button class="button_login" type="submit" id="null_check">Sign Up!</button>
                </div>
            </div>
            </form>
          </div>
        </div>
            <script>
            $("#null_check").on("click",function() {
                let nick = $("#nick").val();
                if(nick === ""){
                	alert("닉네임을 입력해주세요")
                	return false;
                	}
                })
                
                $(function() {
                    $("#photo_file").on("change", function(){
                    readURL(this);
                    });
                });
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                        $('#photo').attr("src", e.target.result);
                        }
                        reader.readAsDataURL(input.files[0]);
                    }
                }
                
                function file_check(e) {
                	 var fileName = document.getElementById("photo_file").value;
                     var idxDot = fileName.lastIndexOf(".") + 1;
                     var filetype = fileName.substr(idxDot, fileName.length).toLowerCase();
                	                	
                	if(filetype=="jpg" || filetype=="gif" || filetype=="png" || filetype=="jpeg" || filetype=="bmp"){
                		alert("프로필 등록이 성공했습니다!");
                	} else {
                	    alert("이미지를 선택해주세요");
                        parent = e.parentNode
                        node = parent.replaceChild(e.cloneNode(true),e);
                        $("#photo").attr("src", "/images/6.jpg");
                        return false;
                	}	
                }
        </script>
  </body>
</html>