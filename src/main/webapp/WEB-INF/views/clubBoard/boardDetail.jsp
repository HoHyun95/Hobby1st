<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<form method="post"
		action="/comment.pet?check_category=${check_category }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }">
		<!-- 게시판 상세보기 header 부분 -->
		<div class="body rounded-md">
			<div class="title space-y-1">

				<div class="text-2xl font-medium">
					<span>추천합니다</span>
				</div>
				<div>
					<span class="writer">suhoh01</span>
				</div>
				<div class="grid grid-cols-2 text-gray-400"
					style="padding-bottom: 10px; border-bottom: 1px solid rgb(202, 202, 202);">
					<div class="write_date text-sm">2022-01-14 22:30</div>
					<div class="text-right">
						<i class="far fa-eye"></i> 23
					</div>
				</div>
			</div>

			<!-- 게시글 본문내용 삽입 -->
			<div
				style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

				<div style="margin-top: 10px;">요거 괜찮습니다</div>

				<!-- 오른쪽 하단에 추천과 댓글수 조회 -->
				<div class="content_b text-right text-base">
					<br>

					<!-- 추천시 하트 아이콘이 변하고 추천수가 올라가는 기능 -->
					<button type="button" class="nice" id="good">
						<span style="font-size: 17px;" id="heart"> <c:choose>
								<c:when test="${user == 0 }">
									<i class='fas fa-heart'></i>
								</c:when>
								<c:otherwise>
									<i class='far fa-heart'></i>
								</c:otherwise>
							</c:choose>
						</span> 추천 <span id="good_n">3</span>
					</button>

					<span style="margin-left: 10px;"><i
						class="far fa-comment-dots"></i> 댓글 <span id="comment_n">4</span>
					</span>
				</div>
			</div>


			<!-- 댓글 삽입 기능 -->
			<c:forEach var="replyList" items="${replyList }" varStatus="status">
				<div class="input_commend">
					<table
						style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">


						<tr>
							<td rowspan="3"
								style="border-radius: 70%; height: 80px; width: 80px; padding-right: 10px;">
								<img id="profile"
								style="border-radius: 70%; height: 60px; width: 60px;"
								src="${list_profile.get(status.index)}" alt="">
							</td>
							<td style="padding-top: 10px; font-weight: 600; font-size: 16px;">${replyList.writer }</td>
						</tr>

						<tr>
							<td>
								<div id="content"
									style="width: 100%; min-height: 30px; font-size: 14px; overflow-y: hidden; resize: none;"
									rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.comments }
								</div>
							</td>
						</tr>

						<tr>
							<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.detailDate }
							</td>
							<c:if test="${replyList.writer eq loginID }">
								<td><button type="button" class="delComment"
										style="color: red; float: right; margin-right: 20px;">
										X<input class="replySeq" type="hidden"
											value="${replyList.seq }">
									</button></td>
							</c:if>
						</tr>
					</table>
				</div>
			</c:forEach>

			<!-- 댓글달기 기능 -->
			<div class="commend space-y-2 rounded-md"
				style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px;">
				<div class="writer font-bold">${loginID }</div>

				<!-- 댓글 입력받기 -->
				<div>
					<input type="hidden" name="seq" value="${list[0].seq }"> <input
						type="hidden" name="cpage" value="${cpage }">
					<textarea name="comment" id="message" placeholder="댓글을 남겨주세요."
						style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
						rows="1" onkeyup="resize(this)" onkeydown="resize(this)"></textarea>
					<!-- textarea 자동 높이조절-->
				</div>

				<div style="height: 20px;">
					<button id="commentBtn" class="summit float-right text-green-400"
						type="submit">등록</button>
				</div>
			</div>
		</div>
	</form>

	<!-- 수정하기 삭제하기 기능.  -->
	<div id="modi" style="margin: auto; width: 800px;">
		<c:if test="${list[0].id == loginID }">
			<button type="button" id="modify"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-left: 20px;">수정하기</button>
			<button type="button" id="delete"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-bottom: 70px;">삭제하기</button>
		</c:if>
	</div>

</body>
</html>