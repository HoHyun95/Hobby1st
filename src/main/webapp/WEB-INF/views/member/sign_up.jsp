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
	<!-- 작업순서 -->
	<!-- 1. 기능구현(진행중) 2. 디자인(미완료) 3. 정규표현식을 통한 제약(미완료) 4. 이메일인증(미완료)  -->
	<!-- signUp_page -->
	<form action="/member/sign_up_last" method="post">
		<table border=1 align="center">
			<tr>
				<th colspan=2>signUp page
			</tr>
			<tr>
				<td>id
				<td><input type="text" placeholder="id" name="mem_id">
					<!-- 아이디 중복확인 기능 추가 -->
			</tr>
			<tr>
				<td>pass
				<td><input type="password" placeholder="pass" name="mem_pass">
					<!-- 비밀번호 중복확인 기능 추가 -->
			</tr>
			<tr>
				<td>name
				<td><input type="text" placeholder="name" name="mem_name">
			</tr>
			<tr>
				<td>phone
				<td><input type="text" placeholder="phone" name="mem_phone">
			</tr>
			<tr>
				<td>email
				<td><input type="text" placeholder="email" name="mem_email">
			</tr>
			<tr>
				<td>birthday
				<td><input type="date" name="mem_birthday" min="1988-01-01"
					max="2000-01-01">
			</tr>
			<tr>
				<td>gender
				<td><input type="radio" name="mem_gender" value="male">
					<label for="male">M</label> <input type="radio"
					name="mem_gender" value="female"> <label for="female">F</label>
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
	    $("#sign_in").on("click", function() {
			location.href = "/member/sign_in";
		})
	</script>
</body>
</html>