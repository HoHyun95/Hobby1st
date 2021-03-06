<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ admin</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/footer.css">
<style>
* {
	box-sizing: border-box;
}

div {
	/* border: 1px solid black; */
	
}

.wrap {
	width: 1260px;
	margin: 0 auto;
}

.header {
	height: 100px;
	display: flex;
	border: 1px solid dimgray;
}

.logo {
	width: 25%;
}

.logo img {
	width: 100%;
	height: 100%;
	padding: 10px 10px 10px 10px;
}

.temp {
	width: 75%;
}

.container {
	display: flex;
}

.sidebar {
	width: 20%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	padding: 30px 0px;
}

.contents {
	width: 75%;
	height: 600px;

	/* padding: 30px 20px 30px 20px; */
}

.list {
	display: flex;
	flex-direction: column;
	width: 100%;
	align-items: center;
}

.list_item_wrap {
	width: 100%;
}

.list_item_wrap :hover {
	cursor: pointer;
	color: skyblue;
}

.list_item {
	border: 1px solid dimgray;
	display: flex;
}

.fontA {
	/* border: 1px solid dimgray; */
	width: 25%;
	text-align: right;
}

.menuName {
	/* border: 1px solid dimgray; */
	width: 75%;
}

.list_item i {
	padding: 0px 10px 0 0;
}

.adminID {
	height: 75px;
	border: 1px solid dimgray;
	display: flex;
	/* justify-content: space-around; */
}

.imgbox {
	/* border: 1px solid dimgray; */
	width: 25%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.loginImg {
	display: flex;
	width: 40px;
	height: 40px;
	overflow: hidden;
	border-radius: 25px;
}

.loginID {
	/* border: 1px solid dimgray; */
	width: 45%;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.desc {
	font-size: 0.7rem;
}

.button {
	/* border: 1px solid dimgray; */
	width: 30%;
	display: flex;
	justify-content: center;
	align-items: center;
}

.button i {
	font-size: 1.5rem;
}

.FAQ {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.FAQ1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 30%;
}


.list_item {
	padding: 10px 0px 10px 20px;
}

.footer {
	/* height: 100px;
      background-color: gray; */
	/* clear: both; */
	
}
</style>


<script>
  
  
  
</script>


</head>
<body>
	<div class="wrap">

		<div class="header">
			<div class="logo">
				<img src="/images/LOGO.png">
			</div>
			<div class="temp"></div>
		</div>
		<!--header-->

		<div class="container">

			<div class="sidebar">

				<div class="list">
					<div class="list_item_wrap">

						<div class="list_item">

							<div class="fontA">
								<i class="fas fa-sliders-h"></i>
							</div>
							<div class="menuName" id="dash"><a href="/admin">????????????</a></div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-object-group"></i>
							</div>
							<div class="menuName" id="clubAdmin"><a href="/admin/clubAdmin?cpage=1">???????????????</a></div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="far fa-list-alt"></i>
							</div>
							<div class="menuName" id="boardAdmin"><a href="/admin/boardAdmin?cpage=1">???????????????</a></div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-address-card"></i>
							</div>
							<div class="menuName" id="memberAdmin"><a href="/admin/memberAdmin?cpage=1">????????????</a></div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-question-circle"></i>
							</div>
							<div class="menuName" id="QA"><a href="/admin/qaAdmin">Q&A</a></div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fab fa-quora"></i>
							</div>
							<div class="menuName" id="FAQ"><a href="/admin/faqAdmin">FAQ</a></div>

						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="far fa-newspaper"></i>
							</div>
							<div class="menuName" id="notice"><a href="/admin/noticeAdmin">????????????</a></div>

						</div>
					</div>
				</div>

				<div class="adminID">

					<div class="imgbox">
						<div class="loginImg">
							<img src="">
						</div>
					</div>
					<div class="loginID">
						<div class="id">LoginID</div>
						<div class="desc">ddd</div>
					</div>
					<div class="button">
						<i class="fas fa-sign-out-alt"></i>
					</div>

				</div>

			</div>
			<!--sidebar-->


			<div class="contents">

				

				<div class="FAQ">
					<div class="FAQ1"></div>
				</div>

				


			</div>
			<!--contents-->

		</div>
		<!--container-->


		<div class="footer">

			<div class="links">
				<div class="links_inner">
					<ul class="links_inner_list">
						<li class="links_inner_list_item">????????????</li>
						<li class="links_inner_list_item">????????????</li>
						<li class="links_inner_list_item">????????????</li>
						<li class="links_inner_list_item">????????????????????????</li>
						<li class="links_inner_list_item">????????????</li>
						<li class="links_inner_list_item">????????????</li>
					</ul>
				</div>
			</div>

			<div class="footer">
				<div class="footer_inner">
					<div class="footer_logo">
						<img src="/images/LOGO.png">
					</div>
					<div class="footer_contents">
						<div class="footer_desc">
							<ul class="footer_desc_list">
								<li class="footer_desc_list_item">Hobby1st ????????????
									02-1234-5678 (?????? 09:00~18:00, ????????????????? ??????)</li>
								<li class="footer_desc_list_item">(???)Hobby1st 04540, ???????????????
									?????? ???????????? 120, ???????????? 2F, 3F</li>
								<li class="footer_desc_list_item">Copyright (c)
									(???)Hobby1st. 2022 All rights reserved.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!--footer-->


	</div>


</body>
</html>