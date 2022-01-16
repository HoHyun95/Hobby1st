<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="UTF-8">
<title>sign_up_last</title>
</head>
<body>


	<form action="/member/member_add" method="post"
		enctype="multipart/form-data">
		
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

		<table border=1 align="center">
			<tr>
				<td colspan=2><img src="" id="photo" style="width:300px;height:300px;">
			</tr>
			<tr>
				<td colspan=2><input type="file" name="mem_photo"
					id="photo_file" accept="image/jpg">
			</tr>
			<tr>
				<td>NickName
				<td><input type="text" name="mem_nickname">
			</tr>
			<tr>
				<td colspan=2>
				<button type="button" id="return">return</button>
			    <input type="submit" value="signUp!">
			</tr>
		</table>
	</form>

	<script>
	<!-- 회원가입 첫 페이지로 이동합니다 -->
    $("#return").on("click", function() {
		location.href = "/member/sign_up";
	})
	
	<!-- 사용자가 올린 파일을 보여줍니다.-->
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
	</script>
</body>
</html>