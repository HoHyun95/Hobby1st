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
 
   <form action="/member/member_add" method="post">
       이게 되나?
       <input type="text" name="mem_name" value="${mem_name }" hidden>
       <input type="text" name="dd">
       <input type="submit" value="this?">
   </form>
 
</body>
</html>