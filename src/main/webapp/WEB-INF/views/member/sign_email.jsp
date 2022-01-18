<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<title>user_email</title>
</head>
<body>
	<form action="send_email" method="post">
		<table border=1>
			<tr>
				<th colspan=2>인증할 이메일(요청시 10분 내외로 회신됩니다)
			</tr>
			<tr>
				<td><input type="text" name="email">
				<td><button type="submit">제출</button>
			</tr>
			<tr>
				<th colspan=2>인증번호
			</tr>
			<tr>
				<td><input type="text" name="email_num"> <input
					type="text" value="${num }" hidden>
				<td><button type="button" id="emailNum_btn">제출</button>
			</tr>
		</table>
	</form>

	<script>
    $("#emailNum_btn").on("click",function() {
    	location.href = "/member/email_num?email_num=${email_num}";
    })
  </script>
</html>