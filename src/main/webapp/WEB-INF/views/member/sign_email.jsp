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
	<form action="find_email" method="post">
		<table border=1>
			<tr>
				<th colspan=2>인증할 이메일(요청시 10분 내외로 회신됩니다)
			</tr>
			<tr>
				<td><input type="text" name="email" id="user_email">
				<td><button type="submit">제출</button>
			</tr>
			<c:if test ="${result eq 0}">
			<tr>
			    <td colspan=2>등록 이메일이 없습니다! 이메일을 입력해주세요!</h7>
			</tr>
			</c:if>
			<tr>
				<td>인증하기 
				<c:if test = "${random_num != null}">
				<td>사용자에게 전송된 인증번호 : '${random_num }'
				<input type="text" value="${random_num }" hidden id="dum">
				</c:if>
			</tr>
			<tr>
				<td><input type="text" id="email_num">
				<td><button type="button" id="emailNum_btn">제출</button>
			</tr>
		</table>
	</form>
	

 <script>
 $("#emailNum_btn").on("click",function(){
	 if($("#dum").val() === $("#email_num").val()){
		 alert("이메일 인증성공!");
		 location.href = "/member/emailOk";
	 } else {
			 alert("인증번호가 다릅니다");
	 }
 })
 
 </script>
</html>