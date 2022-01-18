<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>

	<div>
<img src="${pageContext.request.contextPath}/clubPic/${list[0].CLP_PHOTO}" width="700px" height="400px">
		<div>사진 : ${list[0].CLP_PHOTO }</div>
		<div>동호회 : ${list[0].CL_NAME }</div>
		<div>보스 : ${list[0].CL_BOSS_ID }</div>
		<div>보스 : ${list[0].CL_BOSS_NAME }</div>
		<div>설명 : ${list[0].CL_DESC }</div>
	</div>
</body>
</html>





