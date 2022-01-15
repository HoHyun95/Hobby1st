<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
div {
	border: 1px solid black
}

/* container */
.container {
	width: 100%;
	height: 100%;
}

.fav_club_list_title, hr {
	width: 1260px;
	margin: 0 auto;
}

.fav_club_list_title_text {
	padding: 10px;
}

.fav_club_list_wrap {
	width: 1260px;
	margin: 0 auto;
	display: flex;
	flex-direction: column;
	justify-content: center;
}

.fav_club_list_row {
	width: 100%;
	overflow: hidden;
	display: flex;
	justify-content: center;
	padding: 20px 0px;
}

.fav_club_list_item_wrap {
	padding: 0px 10px;
}

.fav_club_list {
	display: flex;
	justify-content: center;
	align-items: center;
	list-style-type: none;
}

.fav_club_list_item {
	border: 1px solid var(- -color1);
	width: 200px;
	height: 250px;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	text-align: center;
}

.fav_club_list_add_btn {
	width: 100%;
	padding: 50px 0px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.fav_club_list_add_btn input[type="button"] {
	width: 150px;
	height: 30px;
	font-size: 0.9rem;
	font-weight: 900;
	background-color: transparent;
	border: 2px solid var(- -color1);
	color: var(- -color1);
}

.fav_club_list_add_btn input[type="button"]:hover {
	background-color: var(- -color1);
	color: var(- -color2);
	cursor: pointer;
}

/* search_area */
.search_area {
	width: 100%;
	height: 150px;
}

.search_area_inner {
	width: 1260px;
	margin: 0 auto;
	height: 150px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.search_input_area {
	width: 80%;
	height: 50%;
	display: flex;
}

.search_input_area_text {
	width: 93%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: 1px solid var(- -bg-color);
}

.search_input_area_text input {
	width: 100%;
	height: 70%;
	font-size: 2rem;
	border: none;
	padding: 20px;
}

.search_input_area_text input:focus {
	outline: none;
}

.search_input_area_text input::placeholder {
	color: lavender;
}

.search_input_area_btn {
	width: 7%;
	display: flex;
	justify-content: center;
	align-items: center;
	border: none;
	background-color: var(- -bg-color);
	color: var(- -color2);
}

.search_input_area_btn i {
	font-size: 2rem;
}

.search_input_area_btn i:hover {
	cursor: pointer;
}
/* search_area end */
</style>
</head>
<body>



	<div id=temp_container>
		<div class="container">

			<div class="search_area">
				<div class="search_area_inner">
					<div class="search_input_area">
						<div class="search_input_area_text">
							<input type="text" class="search_club"
								placeholder="찾고 싶은 동호회를 검색해 보세요!">
						</div>
						<div class="search_input_area_btn">
							<i class="fas fa-search"></i>
						</div>
					</div>
				</div>
			</div>

			<div class="fav_club_list_title">
				<div class="fav_club_list_title_text">
					<h4>인기 동호회</h4>
				</div>
				<hr>
			</div>

			<div class="fav_club_list_wrap">
				<div class="fav_club_list_row">
					<c:forEach var="clubList" items="${list }">
						<ul class="fav_club_list">
							<li class="fav_club_list_item_wrap">
								<div class="fav_club_list_item">
									<h2>${clubList.CL_NAME }</h2>
									<b>${clubList.CL_BOSS_NAME}</b> <span>${clubList.CL_LOCAL }</span>
									<p>${clubList.CL_DESC }</p>
								</div>
							</li>
					</c:forEach>


					</ul>
				</div>

				<div class="fav_club_list_add_btn">
					<input type="button" value="5개 더보기">
				</div>
			</div>
		</div>

	</div>
</body>
</html>