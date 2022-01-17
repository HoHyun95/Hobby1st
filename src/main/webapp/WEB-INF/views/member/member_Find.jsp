<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>Find email</title>
</head>
<body>
	<form action="/member/email_send" method="post">
		<table border=1> 
			<tr>
				<th colspan=2>find your email!
			</tr>
			<tr>
				<td><input type="text" name="user_email" placeholder="email@ 형식으로 적기">
				<td><button type="submit">전송!</button>
			</tr>
		</table>
	</form>

	<form action="/member/email_send_1" method="post">
		<table border=1>
			<tr>
				<th colspan=2>인증번호!
			</tr>
			<tr>
				<td><input type="text" name="anw" placeholder="전송받은 인증번호">
				<td><button type="submit">전송!</button>
			</tr>
		</table>
	</form>
</body>
</html>