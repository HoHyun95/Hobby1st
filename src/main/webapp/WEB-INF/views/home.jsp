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
	<!-- 네비바에서 로그인 버튼 누르면 이동하는 주소값은 "/member/sign_in" 입니다. -->
	<c:choose>
		<c:when test="${login_id !=null }">
		    ${login_id }님<br> 
			<a href="/member/logout">로그아웃</a><br>
		</c:when>
        <c:otherwise>
        	<a href="/member/sign_in">로그인버튼입니다.</a><br>
        </c:otherwise>
	</c:choose>
	
	<a href="/clubList/createClubPage">동호회 리스트 페이지 입니다</a><br>
	
	
	<a href="/clubMember/memberList">동호회 회원정보</a>
	
	
</body>
</html>