<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Club</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
#mini_container {
	width: 400px;
	height: 500px;
	margin: auto;
	border: 1px solid black;
}

#container_header {
	text-align: center;
}

#container_pic {
	margin: auto;
	text-align: center;
	width: 80%;
	height: 30%;
	border: 1px solid black;
}

#club_name {
	width: 94%;
	text-align: center;
}

.club_name_box {
	margin: auto;
}

.line_effect {
	margin: auto;
	margin-bottom: 5px;
	margin-top: 2px;
	border: 1px solid black;
	height: 0px;
	width: 80%;
}
</style>
</head>
<body>
	<div id="mini_container">
		<div id="container_header">동호회 등록</div>
		<div id="container_pic">
			동호회 대표사진 <input type="file" name="club_oriName" id="club_oriName">
		</div>

		<div class="club_name_box">
			<input type="text" id="club_name" name="club_name" placeholder="동호회명">
		</div>
		<div class="line_effect"></div>
		<div>
			<input type="text" name="club_master" placeholder="대표자">
		</div>
		<div class="line_effect"></div>
		<div>
			<input type="text" placeholder="휴대폰 번호를 -없이 입력해주세요">
		</div>
		<div class="line_effect"></div>
		<div>
			<select>
				<option>선택</option>
			</select>
		</div>
		<div class="line_effect"></div>

		<button id="container_nextBtn">다음</button>
	</div>
</body>
</html>