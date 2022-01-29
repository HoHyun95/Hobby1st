<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>QnA</title>
   <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

<style>
.title:hover {
	color: rgb(231, 75, 55);
}
</style>
</head>
<body>

  	<!-- 글쓰기 버튼 -->
	<div class="btn">
		<div style="text-align: right; width: 85%;">
			<button type="button" id="writeBtn"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-1.5"
				style="margin-right: 10px; margin-top: 10px;">문의하기</button>
		</div>
	</div>

	<!-- 공지사항 -->
	<div class="board" style="width: 70%; height: 100%; margin: auto;">

		<div class="bg-white rounded-lg shadow-lg py-6" style="height: 100%;">
			<!-- 공지사항 큰 틀-->

			<div class="block overflow-x-auto mx-6">
				<!-- QnA 메인 작업 -->
				<table class="w-full">
					<thead>
						<tr class="text-gray-800 border border-b-0 text-center">
							<th colspan="6" class="px-4 py-3" style="width: 100%;">#
								QnA
						</tr>

						<!-- 공지사항 상단 목차 -->
						<tr class="text-gray-800 border border-b-0 text-center text-sm">
							<th class="px-4 py-3 w-1/12">#</th>
							<th class="px-4 py-3 w-7/12">제목</th>
							<th class="px-4 py-3 w-1/12">작성자</th>
							<th class="px-4 py-3 w-1/12">등록일</th>
							<th class="px-4 py-3 w-1/12">조회수</th>

						</tr>
					</thead>

					<!------------------------------------- 공지사항 작성 ------------------------------------->
					<tbody>
						<c:forEach var="dto" items="${qnaList }" varStatus="status">
							<tr
								class="w-full font-light text-gray-700 bg-gray-50 whitespace-no-wrap border border-b-0 text-sm hover:bg-gray-200">
								<td class="px-4 py-4 text-center">${totalNoticeCount - ((cpage-1) * 10) - status.index}</td>

								<td class="title px-4 py-4" style="cursor: pointer;"
									onclick="location.href='/qna/qnaDetail?qna_seq=${dto.qna_seq }&check_num=${check_num }&cpage=${cpage }&keyword=${keyword }&searchWord=${searchWord}'">
									${dto.qna_title }</td>
								<td class="px-4 py-4 text-center">${dto.qna_writer}</td>
								<td class="px-4 py-4 text-center">${dto.detailDate }</td>
								<td class="px-4 py-4 text-center">${dto.qna_view_count }</td>

							</tr>
						</c:forEach>
					</tbody>
					<!--------------------------------------- 게시판 작성 끝 --------------------------------------->
				</table>
			</div>
		</div>
	</div>

	<!-- 게시판 페이징 밑 글쓰기 -->
	<div class="footer"
		style="width: 70%; height: 60px; background-color: rgba(224, 223, 223, 0.288); margin: auto;">
		<div class="navi" style="text-align: center; line-height: 60px">
			${navi }
			<button type="button" id="writeBtn"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 "
				style="margin-right: 10px; margin-top: 10px; height: 35px; line-height: 35px; float: right;">문의하기
			</button>
		</div>


	</div>
  

	<!-- 검색 기능 -->
	<form method="post"
		action="/qna/searchQna?cpage=${cpage }&check_num=2">
		<div>
			<div class=""
				style="text-align: center; height: 70px; margin-bottom: 100px;">

				 <select name="keyword"
					class="rounded border appearance-none border-gray-300 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-200 focus:border-indigo-500 text-base pl-3 pr-10 w-auto">
					<option>제목</option>
				</select> <input type="hidden" name="cpage" value="${cpage }">
				<input id="searchWord" name="searchWord" type="text"
					placeholder="Search"
					class="
           px-2
                py-1
                placeholder-gray-400
                text-gray-600 
                relative
                bg-white bg-white
                rounded
                text-sm
                border border-gray-400
                outline-none
                focus:outline-none focus:ring
                w-5/12
                h-10
              " />

				<button id="search"
					class="border border-gray-500 text-black-500 bg-Gray-400 bg-gray-200 rounded px-4 py-1.5"
					style="margin-top: 15px;">검색</button>
			</div>
		</div>
	</form>


	<!----------------------------------- 메인 스크립트 ------------------------------------->

	<script>
	// 페이징 스타일
	$(".paging").addClass("text-red-500 border border-red-500 hover:bg-red-500 hover:text-white font-bold text-xs px-4 py-2 rounded transition-all duration-150");
	
	
		$("#writeBtn").on("click", function() {
			location.href = "/qna/qnaWrite?"
		});
	</script>
</body>
</html>