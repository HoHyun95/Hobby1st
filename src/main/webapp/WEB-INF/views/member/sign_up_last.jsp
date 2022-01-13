<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sign_up_last</title>
</head>
<body>
	<!-- 작업순서 -->
	<!-- 1. 기능구현(진행중) 2. 디자인(미완료) 3. 정규표현식을 통한 제약(미완료) 4. 이메일인증(미완료)  -->
	<!-- signUp_lastPage -->

	<form action="/member/member_add" method="post"
		enctype="multipart/form-data">
		<!-- sgin_upPage 에서 사용자가 입력한 값 -->
		<input type="text" name="mem_name" value="${mem_id }" hidden>
		<input type="text" name="mem_name" value="${mem_pass }" hidden>
		<input type="text" name="mem_name" value="${mem_name }" hidden>
		<input type="text" name="mem_name" value="${mem_email }" hidden>
		<input type="text" name="mem_name" value="${mem_birthday }" hidden>
		<input type="text" name="mem_name" value="${mem_gender }" hidden>
		<input type="text" name="mem_name" value="${mem_category_1 }" hidden>
		<input type="text" name="mem_name" value="${mem_category_2 }" hidden>

		<table border=1 align="center">
			<tr>
				<td colspan=2><img src="">
			</tr>
			<tr>
				<td colspan=2><input type="file" name="mem_photo" id="photo" multiple>
			</tr>
			<tr>
				<td>NickName
				<td><input type="text">
			</tr>
			<tr>
				<td colspan=2><input type="submit" value="submit">
			</tr>
		</table>
	</form>
	
	<script>
	$("#photo").on("change",function(){
		readURL(this);
	})
	function readURL(input){
		if
	}
	
	</script>
</body>
</html>