<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Sign_in</title>
</head>
<body>
	<form action="/member/login" method="post">
		<table border=1 align="center">
			<tr>
				<th>sign_in Page
			</tr>
			<tr>
				<td><input type="text" name="mem_id" placeholder="id">
			</tr>
			<tr>
				<td><input type="password" name="mem_pass" placeholder="pass">
			</tr>
			<tr>
			<!-- 이메일로 아이디찾기 구현 -->
				<th><input type="submit" value="submit">
					<button type="button" id="sign_up">Sign Up</button>
			</tr>
		</table>
	</form>
	<script>
		$("#sign_up").on("click", function() {
			location.href = "/member/sign_up";
		})
	</script>
</body>
</html>