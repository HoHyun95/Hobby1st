<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
<style>
* {
	box-sizing: border-box;
}

div {
	
}

.container {
	width: 80%;
	margin: auto;
}

.container>div {
	float: left;
}

.vote_list {
	width: 300px;
	margin: 30px;
	margin-top: 100px;
	border: 1px solid rgb(0, 0, 0);
	padding-left: 2%;
	padding-right: 2%;
	padding: 1%;
	border-radius: 10px;
}

.vote_title {
	margin-bottom: 20px;
	font-weight: 600;
	font-size: 20px;
}

.attend {
	text-align: right;
	margin-bottom: 30px;
	font-size: 14px;
}

.start_date {
	font-size: small;
	margin-bottom: 5px;
}

.end_date {
	font-size: small;
	color: rgb(236, 73, 9);
	margin-bottom: 10px;
}

.btn {
	text-align: center;
}
</style>
</head>
<body>

	<div class="container">
		<c:forEach var="dto" items="${vote_list }" varStatus="status">
			<div class="vote_list">
				<div class="vote_title">${dto.vl_title }</div>

				<div class="attend">
					<i class="fas fa-user-check"></i> ${dto.vl_count }명 참여
				</div>

				<div class="start_date">투표 시작일 : ${dto.formdDate }</div>

				<div class="end_date">투표 종료일 : ${dto.vl_end_date }</div>

				<div class="btn">
					<button>투표하러가기</button>
					&nbsp;
					<button>결과보기</button>
				</div>
			</div>
		</c:forEach>
	</div>

</body>
</html>