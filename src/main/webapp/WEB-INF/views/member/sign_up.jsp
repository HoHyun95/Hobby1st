3<%@ page language="java" contentType="text/html; charset=UTF-8"
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
    .body_emailbox{
        width: 145px;
        height: 30px;
        outline: 1px solid rgb(158, 128, 247, 0.9);
    }
    .body_emailbox2{
        width: 100px;
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
    #id_check2{
        color: red;
        font-size: 11px;
    }
    #address_check{
        color: red;
        font-size: 11px;
    }
    #pass_check{
        color: red;
        font-size: 4px;   
    }
    #pass_check_2{
        color: red;
        font-size: 4px;   
    }
    #name_check{
        color: red;
        font-size: 11px;   
    }
    #phone_check{
        color: red;
        font-size: 11px;   
    }
    #email_check{
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
                   <h7><b>?????????</b></h7>
                   <h7 id="id_check"></h7>
                   <h7 id="id_check2"></h7>
                </div>
               <div class="body_box_wrap">
                   <input type="text" placeholder="User ID" class="body_box" name="mem_id" id="id">
                </div>

               <div class="body_font">
                   <h7><b>????????????</b></h7>
                   <h7 id="pass_check"></h7>
                </div>
               <div class="body_box_wrap">
                   <input type="password" placeholder="User Password" class="body_box" onchange="invaild()" name="mem_pass" id="pass">
                </div>

                <div class="body_font">
                    <h7><b>???????????? ??????</b></h7>
                    <h7 id="pass_check_2"></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="password" placeholder="User Password" class="body_box" onchange="invaild()" id="pass_2">
                 </div>

                 <div class="body_font">
                    <h7><b>??????</b></h7>
                    <h7 id="name_check"></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Name" class="body_box" name="mem_name" id="name">
                 </div>

                 <div class="body_font">
                    <h7><b>????????????</b></h7>
                    <h7 id="phone_check"></h7>
                </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Phone Numeber" class="body_box" name="mem_phone" id="phone">
                 </div>

                 <div class="body_font">
                    <h7><b>??????</b></h7>
                    <h7 id="address_check"></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="text" placeholder="User Address" class="body_box" name="mem_address" id="address">
                 </div>

                 <div class="body_font">
                    <h7><b>?????????</b></h7>
                    <h7 id="email_check"></h7>
                 </div>

                <div class="body_box_wrap">
                    <input type="text" placeholder="User Email" class="body_emailbox" name="mem_email" id="email">
                    <select name="mem_email" class="body_emailbox2">
                        <option value="@google.com">google.com</option>
                        <option value="@nate.com">nate.com</option>
                        <option value="@naver.com" selected>naver.com</option>
                        <option value="@daum.net">daum.net</option>
                    </select>           
                </div>

                 <div class="body_font">
                    <h7><b>????????????</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <input type="date" placeholder="User Email" class="body_box" name="mem_birthday" id="birthday"
                    min="1988-01-01" max="2005-12-31" value="2005-12-31">
                 </div>

                 <div class="body_font">
                    <h7><b>??????</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio">
                        <label class="box-radio-input"><input type="radio" id="gender" name="mem_gender" value="M" checked="checked"><span>M</span></label>
                        <label class="box-radio-input"><input type="radio" id="gender" name="mem_gender" value="F"><span>F</span></label>
                    </div>
                </div>

                <div class="body_font">
                    <h7><b>?????? ?????????</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio_category">
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_1"
                            name="mem_category_1" value="?????????"><span>#?????????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_2"
                            name="mem_category_1"value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_3" 
                            name="mem_category_1"value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_4" 
                            name="mem_category_1"value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_5" 
                            name="mem_category_1"value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_6" 
                            name="mem_category_1"value="??????" checked="checked"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_7"
                            name="mem_category_1"value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" id="cp_item_8"
                            name="mem_category_1"value="?????????"><span>#?????????</span></label>
                    </div>
                </div>

                <div id="category-tag_1" style="display: none;">
                <div class="body_font">
                    <h7><b>#?????????</b></h7>
                 </div>
                <div class="body_box_wrap">
                    <div class="body_box_radio_category">
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                        <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                    </div>
                </div>
                </div>
                <div id="category-tag_2" style="display: none;">
                    <div class="body_font">
                        <h7><b>#??????</b></h7>
                     </div>
                    <div class="body_box_wrap">
                        <div class="body_box_radio_category">
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="??????"><span>#??????</span></label>
                            <label class="box-radio-input_category"><input type="radio" name="mem_category_2" value="?????????"><span>#?????????</span></label>
                        </div>
                    </div>
                    </div>
           </div>

           <div class="lfooter">
               <div class="footer_submit">
                   <button class="button_login" type="submit" id="null_check">Next!</button>
               </div>
           </div>
        </form>
        </div>
    </div>
	<script>
	   $("#pass_2").blur(function() {
	       if($("#pass").val() != $("#pass_2").val()) {
	    	  $("#pass").val("")
		      $("#pass_check_2").text("#??????????????? ???????????? ????????????.")
	       } else if($("#pass").val() == $("#pass_2").val()) {
			  $("#pass_check_2").text("");
	       }     
	   })
	
       $("#null_check").on("click",function() {
           let id = $("#id").val();
           let pass = $("#pass").val()
           let pass_2 = $("#pass_2").val()
           let name = $("#name").val()
           let phone = $("#phone").val()
           let address = $("#address").val()
           let email = $("#email").val()
           if(id === "") {
               alert("???????????? ??????????????????")
               $("#id").focus();
               return false;
           }else if(pass === "") {
               alert("??????????????? ??????????????????")
               $("#pass").focus();
               return false;
           }else if(pass_2 === "") {
        	   alert("???????????? ??????????????? ????????????!")
        	   $("#pass_2").focus();
        	   return false;
           }else if($("#pass").val() != $("#pass_2").val()) {
        	   alert("???????????? ??????????????? ?????? ??????????????????!")
        	   $("#pass").val("");
        	   return false;	   
           }else if(name === "") {
               alert("????????? ??????????????????")
               $("#name").focus();
               return false;
           }else if(phone === "") {
               alert("??????????????? ??????????????????")
               $("#phone").focus();
               return false;
           }else if(address === "") {
               alert("????????? ??????????????????")
               $("#address").focus();
               return false;
           }else if(email === ""){
               alert("???????????? ??????????????????")
               $("#email").focus();
               return false;
        }
    })

	   $("#id").blur(function() {
		   var idcheck = RegExp(/^[A-Za-z0-9]{4,16}$/);
		   if(idcheck.test($("#id").val())){
			   console.log("????????? ??????????????? ??????");
               $("#id_check2").text("");
               $("#id_check").text("");
		   } else{
			   $("#id").val("");
               $("#id_check").text("");
               $("#id_check2").text("#4~16??? ????????? ????????? ????????? ??????")
		   }
	   })
	   
	  
       $("#pass").blur(function() {
        var passcheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\,.<>\/?]).{8,16}$/);
		   if(passcheck.test($("#pass").val())){
			   console.log("???????????? ??????????????? ??????");	
               $("#pass_check").text("");		   
		   } else{
			   $("#pass").val("");
               $("#pass_check").text("#8~16??? ?????? ??????,??????,???????????? 1??? ????????????")
		   }
        })
        $("#name").blur(function() {
		   var name_check = RegExp(/^[???-???]{2,6}$/);
		   if(name_check.test($("#name").val())){
			   console.log("?????? ??????????????? ??????");		
               $("#name_check").text("");		   
		   } else{
			   $("#name").val("");	  
               $("#name_check").text("#2~6??? ????????? ????????? ??????????????????.");		   
		   }
	   })
       $("#phone").blur(function() {
		   var phone_check = RegExp(/^01[0179][0-9]{7,9}$/);
		   if(phone_check.test($("#phone").val())){
			   console.log("???????????? ??????????????? ??????");
               $("#phone_check").text("");		   			   
		   } else{
			   $("#phone").val("");	  
			   $("#phone_check").text("#12??? ?????? '-' ?????? ??????????????????.");
		   }
	   })
       $("#address").blur(function() {
		   var address_check = RegExp(/^[???-???]{2,6}$/);
		   if(address_check.test($("#address").val())){
			   console.log("?????? ??????????????? ??????");		
               $("#address_check").text("");		   
		   } else{
			   $("#address").val("");	  
               $("#address_check").text("#'???????????????' ????????? ??????????????????");		   
		   }
	   })

       $("#email").blur(function() {
		   var email_check = RegExp(/^[A-Za-z0-9]{2,21}$/);
		   try{
		   if(email_check.test($("#email").val())){
			   console.log("????????? ??????????????? ??????");
               $("#email_check").text("");			   
		   } else{
			   $("#email").val("");	  
			   $("#email_check").text("#2~21?????? ????????????");
		   }
		   } catch (err) {
			   $("#email").val("");	  
		   }
	   })

	 $("#cp_item_1").on("click",function(){
	        $("#category-tag_1").show();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_2").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").show();
	 })
	 $("#cp_item_3").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_4").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_5").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_6").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_7").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })
	 $("#cp_item_8").on("click",function(){
	        $("#category-tag_1").hide();
	        $("#category-tag_2").hide();
	 })		
			id.onblur = () => {
				   $.ajax({
					   url : "/member/id_check",
					   data: {id:$("#id").val()}
				   }).done(function(resp){
					 if(resp == "1") {
						 $("#id_check").text("#????????? ??????????????????.")
						 $("#id").val("");
					 } else if(resp == "0") {
						 console.log("????????? ??????????????????")
						 $("#id_check").focus()
					 }
				   })
			   }
	</script>
  </body>
</html>