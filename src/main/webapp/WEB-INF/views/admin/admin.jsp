<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
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

.dash {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.dash1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 25%;
}

.dash2 {
	width: 80%;
	border: 1px solid dimgray;
	height: 25%;
}

.dash3 {
	width: 80%;
	border: 1px solid dimgray;
	height: 25%;
}

.clubAdmin {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.clubAdmin1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 50%;
}

.boardAdmin {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.boardAdmin1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 20%;
}

.memberAdmin {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.memberAdmin1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 90%;
}

.QA {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.QA1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 40%;
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

.notice {
	height: 100%;
	width: 100%;
	padding: 30px 0px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	align-items: center;
}

.notice1 {
	width: 80%;
	border: 1px solid dimgray;
	height: 70%;
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
  
$(document).on("click","#dash", function() {
	
	$(".dash").show();
	$(".clubAdmin").hide();
	$(".boardAdmin").hide();
	$(".memberAdmin").hide();
	$(".QA").hide();
	$(".FAQ").hide();
	$(".notice").hide();
  
  })
 
 
 
  $(document).on("click","#clubAdmin", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").show();
	  $(".boardAdmin").hide();
	  $(".memberAdmin").hide();
	  $(".QA").hide();
	  $(".FAQ").hide();
	  $(".notice").hide();
  
  })
  
  $(document).on("click","#boardAdmin", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").hide();
	  $(".boardAdmin").show();
	  $(".memberAdmin").hide();
	  $(".QA").hide();
	  $(".FAQ").hide();
	  $(".notice").hide();
  
  })
  
  $(document).on("click","#memberAdmin", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").hide();
	  $(".boardAdmin").hide();
	  $(".memberAdmin").show();
	  $(".QA").hide();
	  $(".FAQ").hide();
	  $(".notice").hide();
  
  })
  
  $(document).on("click","#QA", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").hide();
	  $(".boardAdmin").hide();
	  $(".memberAdmin").hide();
	  $(".QA").show();
	  $(".FAQ").hide();
	  $(".notice").hide();
  
  })
  
  $(document).on("click","#FAQ", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").hide();
	  $(".boardAdmin").hide();
	  $(".memberAdmin").hide();
	  $(".QA").hide();
	  $(".FAQ").show();
	  $(".notice").hide();
  
  })
  
  $(document).on("click","#notice", function(){
	  
	  $(".dash").hide();
	  $(".clubAdmin").hide();
	  $(".boardAdmin").hide();
	  $(".memberAdmin").hide();
	  $(".QA").hide();
	  $(".FAQ").hide();
	  $(".notice").show();
  
  })
  
  
  
  
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
							<div class="menuName" id="dash">대시보드</div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-object-group"></i>
							</div>
							<div class="menuName" id="clubAdmin">동호회관리</div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="far fa-list-alt"></i>
							</div>
							<div class="menuName" id="boardAdmin">게시판관리</div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-address-card"></i>
							</div>
							<div class="menuName" id="memberAdmin">회원관리</div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fas fa-question-circle"></i>
							</div>
							<div class="menuName" id="QA">Q&A</div>
						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="fab fa-quora"></i>
							</div>
							<div class="menuName" id="FAQ">FAQ</div>

						</div>

						<div class="list_item">
							<div class="fontA">
								<i class="far fa-newspaper"></i>
							</div>
							<div class="menuName" id="notice">공지사항</div>

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

				<div class="dash">
					<div class="dash1"></div>

					<div class="dash2"></div>

					<div class="dash3"></div>
				</div>
				<!-- dash -->

				<div class="clubAdmin">
					<div class="clubAdmin1">

						<table class="table table-hover" id="table" border="1"
							align="center">
							<td colspan=11 align=center>동호회 목록</td>
							<tr>
								<td width=50>동호회 ID</td>
								<td width=70>동호회명</td>
								<td width=100>소개</td>
								<td width=50>동호회장</td>
								<td width=50>정원</td>
								<td width=50>지역</td>
								<td width=50>개설일</td>
								<td width=50>회원수</td>
								<td width=70>카테고리 대</td>
								<td width=70>카테고리 소</td>
								<td width=50>추천수</td>
								<td width=50>해체</td>
							</tr>


							<c:forEach var="dto" items="${allClub}">
								<tr>
									<td>${dto.CL_ID}</td>
									<td><a href="/clubHouse?cl_id=${dto.CL_ID }">${dto.CL_NAME }</a></td>
									<td>${dto.CL_DESC }</td>
									<td>${dto.CL_BOSS_ID }</td>
									<td>${dto.CL_MAXMEM }</td>
									<td>${dto.CL_LOCAL }</td>
									<%-- 				<td>${ }</td> --%>
									<td>${dto.CL_MEMCOUNT }</td>
									<td>${dto.CL_CATEGORY_ID }</td>
									<td>${dto.CL_DCATEGORY_ID }</td>
									<td>${dto.CL_REC_COUNT }</td>
									<td><button class="breakClub${dto.CL_ID }">해체</button></td>

									<script>
				$('.breakClub${dto.CL_ID }').on('click', () => {
					
					if(confirm("동호회를 해체 시키겠습니까?")){
						$.ajax({
							url: "/club/breakClubAdmin?board_seq=${dto.CL_ID}"
						}).done(function(result){
							if(result == 1){
								alert("성공적으로 해체하였습니다");
			
							}else{
								alert("동호회를 해체 하는 과정에서 문제가 발생하였습니다");
								location.reload();
								}
							})
						}
					});
							// 해체 후 존재하는 동호회만 다시 출력 구현 
				</script>

								</tr>
							</c:forEach>
						</table>


					</div>
				</div>
				<!-- clubAdmin -->


				<div class="boardAdmin">
					<div class="boardAdmin1">

						<table class="table table-hover" id="table" border="1"
							align="center">
							<td colspan=5 align=center>게시판</td>
							<tr>
								<td width=50>글 번호</td>
								<td width=320>게시물</td>
								<td width=100>작성자</td>
								<td width=100>작성날짜</td>
								<td width=70></td>
							</tr>

							<c:forEach var="dto" items="${allBoard}">

								<tr>
									<td>${dto.cb_seq}</td>
									<td><a
										href="/clubBoard/boardDetail?cb_seq=${dto.cb_seq }&check_num=1&cpage=1&keyword=&searchWord=">
											${dto.cb_title }</a></td>
									<td>${dto.cb_writer }</td>
									<td>${dto.detailDate }</td>
									<td><button type="button"
											class="boardDelBtn${dto.cb_seq }">삭제</button></td>

									<script>
				
				$('.boardDelBtn${dto.cb_seq}').on('click', () => {
					if(confirm("정말로 삭제하시겠습니까?")){
						$.ajax({
							url : "/clubBoard/deleteBoardAdmin?cb_seq=${dto.cb_seq}"
						}).done(function(result){
							if(result == 1){
								alert("성공적으로 삭제하였습니다");
							}else{
								alert("게시글을 삭제 하는 과정에서 문제가 발생하였습니다");
								location.reload();
									}
								})				
							}
						})
//x
				</script>


								</tr>
							</c:forEach>
						</table>

					</div>
				</div>

				<div class="memberAdmin">
					<div class="memberAdmin1">


						<table class="table table-hover" id="table" border="1"
							align="center">
							<td colspan=9 align=center>회원 목록</td>
							<tr>
								<td width=50>아이디</td>
								<td width=60>이름</td>
								<td width=100>연락처</td>
								<td width=100>이메일</td>
								<td width=70>생년월일</td>
								<td width=70>성별</td>
								<td width=100>주소</td>
								<td width=70>카테고리 대</td>
								<td width=70>카테고리 소</td>
								<td width=50>탈퇴</td>
							</tr>


							<c:forEach var="dto" items="${allMember}">
								<tr>
									<td>${dto.mem_id}</td>
									<td>${dto.mem_nickname }</td>
									<td>${dto.mem_phone }</td>
									<td>${dto.mem_email }</td>
									<td>${dto.mem_birthday }</td>
									<td>${dto.mem_gender }</td>
									<td>${dto.mem_address }</td>
									<td>${dto.mem_category_1 }</td>
									<td>${dto.mem_category_2 }</td>
									<td><button class="asignMem${dto.mem_id }">탈퇴</button></td>

									<script>
				$('.asignMem').on('click', () => {
					// 회원 탈퇴 RequestMapping 구현
				})
				</script>


								</tr>
							</c:forEach>
						</table>

					</div>
				</div>

				<div class="QA">
					<div class="QA1"></div>
				</div>

				<div class="FAQ">
					<div class="FAQ1"></div>
				</div>

				<div class="notice">
					<div class="notice1">

						<table class="table table-hover" id="table" border="1"
							align="center">
							<td colspan=5 align=center>공지사항</td>
							<tr>
								<td width=50>글 번호</td>
								<td width=320>공지사항</td>
								<td width=100>작성자</td>
								<td width=100>작성날짜</td>
								<td width=70></td>
							</tr>


							<c:forEach var="dto" items="${allNotice}">
								<tr>
									<td>${dto.notice_seq }</td>
									<td><a
										href="/notice/noticeDetail?notice_seq=${dto.notice_seq }&check_num=1&cpage=1&keyword=&searchWord=">
											${dto.notice_title }</a></td>
									<td>${dto.notice_writer }</td>
									<td>${dto.formDate }</td>
									<td><button type="button"
											class="noticeDelBtn${dto.notice_seq }">삭제</button></td>

									<script>
				
		
				$('.noticeDelBtn${dto.notice_seq}').on('click', () => {
					if(confirm("정말로 삭제하시겠습니까?")){
					$.ajax({
						url : "/notice/deleteNoticeAdmin?notice_seq=${dto.notice_seq}"
					}).done(function(result){
						if(result == 1){
							alert("성공적으로 삭제하였습니다");
						}else{
							alert("공지사항을 삭제 하는 과정에서 문제가 발생하였습니다");
							location.reload();
								}
							})
						}
					});
			
				
				
				</script>

								</tr>
							</c:forEach>
						</table>

					</div>
				</div>


			</div>
			<!--contents-->

		</div>
		<!--container-->


		<div class="footer">

			<div class="links">
				<div class="links_inner">
					<ul class="links_inner_list">
						<li class="links_inner_list_item">회사소개</li>
						<li class="links_inner_list_item">인재채용</li>
						<li class="links_inner_list_item">회원약관</li>
						<li class="links_inner_list_item">개인정보처리방침</li>
						<li class="links_inner_list_item">제휴문의</li>
						<li class="links_inner_list_item">고객센터</li>
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
								<li class="footer_desc_list_item">Hobby1st 고객센터
									02-1234-5678 (평일 09:00~18:00, 주말·공휴일 휴무)</li>
								<li class="footer_desc_list_item">(주)Hobby1st 04540, 서울특별시
									중구 남대문로 120, 대일빌딩 2F, 3F</li>
								<li class="footer_desc_list_item">Copyright (c)
									(주)Hobby1st. 2022 All rights reserved.</li>
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