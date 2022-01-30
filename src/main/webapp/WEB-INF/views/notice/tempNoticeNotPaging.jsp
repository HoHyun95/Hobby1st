<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>


	<table class="table table-hover" id="table" border="1" align="center">
		<td colspan=3 align=center>FAQ</td>
		<tr>
			<td width=50>seq</td>
			<td width=60>title</td>
			<td width=100>contents</td>
		</tr>


		<c:forEach var="dto" items="${noticeListNotPaging}">
			<tr>
				<td>${dto.notice_seq}</td>
				<td>${dto.notice_title }</td>
				<td>${dto.notice_contents }</td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>