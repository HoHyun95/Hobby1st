<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.0.js">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js">
</script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

<style>
* {
	box-sizing: border-box;
}

.body {
	border: 1px solid rgb(202, 202, 202);
	width: 800px;
	margin: auto;
	padding: 30px;
	margin-bottom: 20px;
}

.profile>div{
	float: left;
}
</style>
</head>

<body>

	<!-- 목록으로 돌아가기 -->
	<div
		style="height: 60px; margin: auto; width: 800px; margin-top: 100px;">
		<button type="button" id="back"
			class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
			style="float: right;">목록</button>
	</div>
	


	<!-- 게시판 상세보기 header 부분 -->
	<div class="body rounded-md">
		<div class="title space-y-1">

			<div class="text-2xl font-medium">
				<span>${detail.notice_title } </span>
			</div>
			<div class="profile" style="height: 70px; border-bottom: 1px solid rgb(202, 202, 202);">
				<div style="width: 10%; height: 50px;">
					
					<!-- 임시 주석-->
					
					
					<img id="profile"
									style="border-radius: 70%; height: 60px; width: 55px;"
									src="${writerProfile}" alt="">

									<!-- 임시 주석-->
				</div>


				<div style="width: 90%; height: 50px;">
					<div>
					<span class="writer">관리자</span>
				</div>
				<div class="grid grid-cols-2 text-gray-400 pt-1"
					style="padding-bottom: 10px;">
					<div class="write_date text-sm">${detail.formDate }</div>
					<div class="text-right">
						<i class="far fa-eye"></i> ${detail.notice_view_count }
					</div>
				</div>
				</div>
				
			</div>
		</div>

		<!-- 게시글 본문내용 삽입 -->
		<div
			style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

			<div style="margin-top: 10px;">${detail.notice_contents }</div>

			<!-- 오른쪽 하단에 추천과 댓글수 조회 -->
			<div class="content_b text-right text-base">
				<br>


			

	<!-- 수정하기 삭제하기 기능.  -->
	<div id="modi" style="margin: auto; width: 800px;">
		<c:if test="${detail.notice_writer == mem_id }">
			<button type="button" id="modify"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-left: 20px;">수정하기</button>
			<button type="button" id="delete"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-bottom: 70px;">삭제하기</button>
		</c:if>
	</div>

	<script>
		
		


		// 뒤로가기
		$("#back").on("click", function() {
			if(${check_num} == 1){
				location.href = "/notice/noticeList?cpage=${cpage}";
			}else if(${check_num} == 2){
					// 임시 주석 //
				 location.href = "/notice/searchBoard?cpage=${cpage}&keyword=${keyword }&searchWord=${searchWord }";
				 	// 임시 주석 //
			}
		})
			
			
		// 게시글 수정하기
		$("#modify").on("click", function() {
				location.href = "/notice/modifyNotice?notice_seq=${detail.notice_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				
		}) 

		 // 게시글 삭제하기
		 $("#delete").on("click", function() {
			 if (confirm("정말 삭제하시겠습니까? 하시겠습니까??")) {
				location.href = "/notice/deleteNotice?notice_seq=${detail.notice_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				 /* history.back(); */
			}
		}) 
	
	</script>

</body>
</html>