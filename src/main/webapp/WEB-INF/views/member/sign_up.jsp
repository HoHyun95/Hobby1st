<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Sign_up</title>
<Style>
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
    .body_box_radio{
        line-height: 50px;
        margin: auto;
        width: 250px;
        height: 50px;
        outline: 2px solid rgb(158, 128, 247, 0.9);
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
        margin-left: 22px;
        font-size: 14px;
        text-align: left;
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
    }
    .head_produce{
        text-align: center;
    }
    #id_check{
        color: red;
        font-size: 11px;
    }
    .pass_check{
        color: red;
        font-size: 11px;   
    }

    .box-radio-input input[type="radio"]{
	display:none;
    }

    .box-radio-input input[type="radio"] + span{
    font-size: 15px;
	display: inline-block;
    border-radius: 100%;
	background: none;
	border:1px solid rgb(158, 128, 247, 0.9);
	padding:0px 10px;
	text-align:center;
	height:30px;
	line-height:28px;
    width: 37px;
	font-weight: 600;
	cursor:pointer;
    }

    .box-radio-input input[type="radio"]:checked + span{
	border:1px rgb(158, 128, 247, 0.9);
	background:rgb(158, 128, 247, 0.9);
	color:#fff;
    }

    .box-radio-input_category input[type="radio"]{
	display:none;
    }

    .box-radio-input_category input[type="radio"] + span{
    font-size: 10px;
	display: inline-block;
	background: none;
	border:1px solid rgb(158, 128, 247, 0.9);
	padding:0px 10px;
	text-align:center;
	height:30px;
	line-height:28px;
    width: 60px;
	font-weight: 600;
	cursor:pointer;
    }

    .box-radio-input_category input[type="radio"]:checked + span{
	border:1px rgb(158, 128, 247, 0.9);
	background:rgb(158, 128, 247, 0.9);
	color:#fff;
    }
</Style>
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
        <form action="/member/sign_up_last" method="post">
           <div class="lbody">
               <div class="body_font">
                   <h7><b>아이디</b></h7>
                   <h7 id="id_check">#잘못된 아이디입니다</h7>
                </div>
               <div class="body_box_wrap">
                   <input type="text" placeholder="User ID" class="body_box" name="mem_id">
                </div>

               <div class="body_font">
                   <h7><b>비밀번호</b></h7>
                </div>
               <div class="body_box_wrap">
                   <input type="password" placeholder="User Password" class="body_box" onchange="invaild()" name="mem_pass">
                </div>

                <div class="body_font">
                    <h7><b>비밀번호 확인</b></h7>
                    <h7 class="pass_check">#잘못된 비밀번호입니다</h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="password" placeholder="User Password" class="body_box" onchange="invaild()">
                 </div>

                 <div class="body_font">
                    <h7><b>이름</b></h7>
                    <h7 id="id_check">#잘못된 이름입니다</h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Name" class="body_box" name="mem_name">
                 </div>

                 <div class="body_font">
                    <h7><b>전화번호</b></h7>
                    <h7 id="id_check">#잘못된 번호입니다</h7>
                </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Phone Numeber" class="body_box" name="mem_phone">
                 </div>

                 <div class="body_font">
                    <h7><b>주소</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Address" class="body_box" name="mem_address">
                 </div>

                 <div class="body_font">
                    <h7><b>이메일</b></h7>
                    <h7 id="id_check">#잘못된 이메일입니다</h7>
                 </div>

                <div class="body_box_wrap">
                    <input type="text" placeholder="User Email" class="body_box" name="mem_email">
                 </div>

                 <div class="body_font">
                    <h7><b>생년월일</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="date" placeholder="User Email" class="body_box" name="mem_birthday"
                    min="1988-01-01" max="2005-12-31">
                 </div>

                 <div class="body_font">
                    <h7><b>성별</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio">
                        <label class="box-radio-input"><input type="radio" name="mem_gender" value="M"><span>M</span></label>
                        <label class="box-radio-input"><input type="radio" name="mem_gender" value="F"><span>F</span></label>
                    </div>
                </div>

                <div class="body_font">
                    <h7><b>나의 관심사</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio_category">
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_1"
                            name="mem_category_1" value="스포츠"><span>#스포츠</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_2"
                            name="mem_category_1"value="문화"><span>#문화</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_3" 
                            name="mem_category_1"value="음악"><span>#음악</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_4" 
                            name="mem_category_1"value="오락"><span>#오락</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_5" 
                            name="mem_category_1"value="음식"><span>#음식</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_6" 
                            name="mem_category_1"value="독서"><span>#독서</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_7"
                            name="mem_category_1"value="여행"><span>#여행</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_8"
                            name="mem_category_1"value="스터디"><span>#스터디</span></label>
                    </div>
                </div>

                <div id="category-tag_1" style="display: none;">
                <div class="body_font">
                    <h7><b>#스포츠</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio_category">
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="자전거"><span>#자전거</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="축구"><span>#축구</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="농구"><span>#농구</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="테니스"><span>#테니스</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="야구"><span>#야구</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="요가"><span>#요가</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="복싱"><span>#복싱</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="마라톤"><span>#마라톤</span></label>
                    </div>
                </div>
                </div>
                <div id="category-tag_2" style="display: none;">
                    <div class="body_font">
                        <h7><b>#문화</b></h7>
                     </div>
                    <div class="body_box_wrap">
                        <div class="body_box_radio_category">
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="영화"><span>#영화</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="드라마"><span>#드라마</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="애니"><span>#애니</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="연극"><span>#연극</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="게임"><span>#게임</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="만화책"><span>#만화책</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="산책"><span>#산책</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="혜화역"><span>#혜화역</span></label>
                        </div>
                    </div>
                    </div>
           </div>

           <div class="lfooter">
               <div class="footer_submit">
                   <button class="button_login" type="submit" >Next!</button>
               </div>
           </div>
        </form>
        </div>
           <a href="/member/sign_in">수정된로그인창 들어가기(삭제예정)</a>
    </div>
	<script>

	
	 $("#cp_item_1").on("click",function(){
	        $("#category-tag_1").show();
	        $("#category-tag_2").hide();
	       })
	       $("#cp_item_2").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").show();
	       })

	       function invaild(e) {
				let pwArr = document.getElementsByClassName("pass")
				if (checkPw(pwArr[0].value)) {
					if (pwArr[1].value) {
						let text = pwArr[0].value === pwArr[1].value ? "Right pass"
								: "Not pass"
						document.getElementsByClassName("pass_check")[0].innerHTML = text;
					}
				} else {
					document.getElementsByClassName("pass_check")[0].innerHTML = "Null pass"
				}
			}
			function checkPw(val) {
				let result = true
				if (val == "")
					result = false
				return result;
			}
			
			id.onblur = () => {
				   $.ajax({
					   url : "/member/id_check",
					   data: {id:$("#id").val()}
				   }).done(function(resp){
					 if(resp == "1") {
						 $("#id_check").text("이미 존재하는 아이디입니다")
						 $("#id").val("");
					 } else if(resp == "0") {
						 $("#id_check").text("사용가능한 아이디입니다 ")
					 }
				   })
			   }
	</script>
  </body>
</html>