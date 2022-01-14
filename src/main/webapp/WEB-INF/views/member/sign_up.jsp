<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Sign_up</title>
</head>
<body>
	<form action="/member/sign_up_last" method="post">
		<table border=1 align="center">
			<tr>
				<th colspan=2>signUp page
			</tr>
			<tr>
				<td>id
				<td><input type="text" placeholder="id" name="mem_id" id="id">
					<p id="id_check"></p>
					<p class="id_regexr"></p>
			</tr>
			<tr>
				<td>pass
				<td><input type="password" placeholder="pass" name="mem_pass" id="pass_check"
					class="pass" onChange="invaild()">
			</tr>
			<tr>
				<td>pass_Check
				<td><input type="password" placeholder="pass_check" id="pass_check2"
					onChange="invaild()" class="pass">
					<p class="pass_check"></p>
			</tr>
			<tr>
				<td>name
				<td><input type="text" placeholder="name" name="mem_name" id="name">
			</tr>
			<tr>
				<td>phone
				<td><input type="text" placeholder="phone" name="mem_phone" id="phone">
			</tr>
			<tr>
				<td>address
				<td><input type="text" placeholder="address" name="mem_address">
			</tr>
			<tr>
				<td>email
				<td><input type="text" placeholder="email" name="mem_email" id="email">
			</tr>
			<tr>
				<td>birthday
				<td><input type="date" name="mem_birthday" min="1988-01-01"
					max="2000-01-01">
			</tr>
			<tr>
				<td>gender
				<td><input type="radio" name="mem_gender" value="m"> <label
					for="m">M</label> <input type="radio" name="mem_gender" value="f">
					<label for="f">F</label>
			</tr>
			<tr>
				<th colspan=2>category
			</tr>
			<tr>
				<td colspan=2><input type="radio" name="mem_category_1"
					value="TEST1"> <label for="TEST1">test1</label> <input
					type="radio" name="mem_category_1" value="TEST2"> <label
					for="TEST2">test2</label>
			</tr>
			<tr>
				<td colspan=2><input type="radio" name="mem_category_2"
					value="TEST3"> <label for="TEST3">test3</label> <input
					type="radio" name="mem_category_2" value="TEST4"> <label
					for="TEST4">test4</label>
			</tr>
			<tr>
				<td colspan=2><button type="button" id="sign_in">return</button>
					<input type="submit" value="next">
			</tr>
		</table>
	</form>
	<script>
	 <!-- Auto id_Check -->
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
	   
	   
	   <!-- Auto id regexr -->
	   $("#id").focusout(function() {
		   var idcheck = RegExp(/^[A-Za-z0-9]{4,20}$/);
		   try{
		   if(idcheck.test($("#id").val())){
			   console.log("아이디 정규표현식 성공");
		   } else{
			   $("#id").val("");
			   alert("아이디는 4~20글자 사이의 영어(대,소)만 입력해주세요")
		   }
		   } catch (err) {
			   $("#id").val("");
		   }
	   });
	   
	   <!-- Auto pass regexr -->
	   $("#pass_check").focusout(function() {
		   var passcheck = RegExp(/^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\,.<>\/?]).{8,16}$/);
		   try{
		   if(passcheck.test($("#pass_check").val())){
			   console.log("비밀번호 정규표현식 성공");			   
		   } else{
			   $("#pass_check").val("");
			   alert("비밀번호는 8~16글자 사이 영문(대소), 숫자, 특수문자를 하나이상 입력해주세요")
		   }
		   } catch (err) {
			   $("#pass_check").val("");
		   }
	   });
	   
	   <!-- Auto name regexr -->
	   $("#name").focusout(function() {
		   var name_check = RegExp(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,6}$/);
		   try{
		   if(name_check.test($("#name").val())){
			   console.log("이름 정규표현식 성공");			   
		   } else{
			   $("#name").val("");	  
			   alert("이름은 2~6글자 사이의 한글만 입력해주세요.")
		   }
		   } catch (err) {
			   $("#name").val("");	  
		   }
	   });
	   
	   <!-- Auto phone regexr -->
	   $("#phone").focusout(function() {
		   var phone_check = RegExp(/^01[0179][0-9]{7,9}$/);
		   try{
		   if(phone_check.test($("#phone").val())){
			   console.log("전화번호 정규표현식 성공");			   
		   } else{
			   $("#phone").val("");	  
			   alert("전화번호는 12글자 이하 '-' 없이 입력해주세요.")
		   }
		   } catch (err) {
			   $("#phone").val("");	  
		   }
	   });
	
	   <!-- Auto email regexr -->
	   $("#email").focusout(function() {
		   var email_check = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		   try{
		   if(email_check.test($("#email").val())){
			   console.log("전화번호 정규표현식 성공");			   
		   } else{
			   $("#email").val("");	  
			   alert("이메일은 형식에맞게 '@' 을 작성해주세요.")
		   }
		   } catch (err) {
			   $("#email").val("");	  
		   }
	   });
	   
       <!-- this is right password?(Auto)-->
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
		
		
		<!-- return login -->
		sign_in.onclick = () => {
				location.href = "/member/sign_in";
	    }
	</script>
</body>
</html>