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
	width: 30%;
	margin: auto;
	margin-top: 100px;
	border: 1px solid rgb(199, 197, 197);
	padding-left: 2%;
	padding-right: 2%;
	padding: 2%;
	border-radius: 10px;
}

.vote_title {
	font-size: large;
	font-weight: 600;
	margin-bottom: 5px;
}

.vote_write_date {
	font-size: small;
	color: gray;
}

.attend {
	font-size: small;
	text-align: right;
	padding-bottom: 20px;
	border-bottom: 1px solid rgb(199, 197, 197);
}

.vote_options {
	margin-top: 15px;
}

.answers {
	padding-bottom: 20px;
}

.vote {
	border-top: 1px solid rgb(199, 197, 197);
	padding-top: 20px;
	text-align: center;
}
</style>

</head>
<body>

	<form action="">
		<div class="container">
			<div class="vote_title">뭐</div>

			<div class="vote_write_date">2022년 1월 29일 오후 9:00</div>

			<div class="attend">
				<i class="fas fa-user-check"></i> 3명 참여
			</div>

			<div class="vote_options">
				<div class="answers">
					<input type="radio" name="option" id="option1" value=""> <label
						class="option_label" for="option1">Java</label>
				</div>

				<div class="answers">
					<input type="radio" name="option" id="option1" value=""> <label
						class="option_label" for="option1">nonno</label>
				</div>

				<div class="answers">
					<input type="radio" name="option" id="option1" value=""> <label
						class="option_label" for="option1">gg</label>
				</div>

				<div class="answers">
					<input type="radio" name="option" id="option1" value=""> <label
						class="option_label" for="option1">아</label>
				</div>
			</div>

			<div class="vote">
				<button class="voteBtn">투표하기</button>
				&nbsp; &nbsp;
				<button class="back">목록으로</button>
			</div>

		</div>
	</form>

</body>
</html>