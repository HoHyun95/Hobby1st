<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<!-- login -->
	<c:choose>
		<c:when test="${mem_id !=null }">
		    ${mem_id }님<br> 
			<a href="/member/logout">로그아웃</a><br>
			<a href="">마이페이지</a>
		</c:when>
        <c:otherwise>
        	<a href="/member/sign_in">로그인 버튼입니다.</a>
        </c:otherwise>
	</c:choose>
</body>
</html>