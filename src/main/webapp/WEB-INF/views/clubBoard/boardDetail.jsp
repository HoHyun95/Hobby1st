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
				<span>${detail.cb_title } </span>
			</div>
			<div class="profile" style="height: 70px; border-bottom: 1px solid rgb(202, 202, 202);">
				<div style="width: 10%; height: 50px;">
					<img id="profile"
									style="border-radius: 70%; height: 60px; width: 55px;"
									src="${writerProfile}" alt="">
				</div>

				<div style="width: 90%; height: 50px;">
					<div>
					<span class="writer">${detail.cb_nickname }</span>
				</div>
				<div class="grid grid-cols-2 text-gray-400 pt-1"
					style="padding-bottom: 10px;">
					<div class="write_date text-sm">${detail.detailDate }</div>
					<div class="text-right">
						<i class="far fa-eye"></i> ${detail.cb_view_count }
					</div>
				</div>
				</div>
				
			</div>
		</div>

		<!-- 게시글 본문내용 삽입 -->
		<div
			style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

			<div style="margin-top: 10px;">${detail.cb_contents }</div>

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
					</span> 추천 <span id="good_n">${detail.cb_like_count }</span>
				</button>

				<span style="margin-left: 10px;"><i
					class="far fa-comment-dots"></i> 댓글 <span id="comment_n">${replycount }</span>
				</span>
			</div>
		</div>


		<!-- 댓글 삽입 기능 -->
		<c:forEach var="replyList" items="${replyList }" varStatus="status">
			<c:choose>
				<c:when test="${replyList.deep eq '0'}">
					<div class="input_commend">
						<table
							style="border-bottom: 1px solid rgb(202, 202, 202); width: 100%; margin-top: 15px;">


							<tr>
								<td rowspan="3"
									style="border-radius: 70%; height: 77px; width: 75px; padding-right: 1px;">
									<img id="profile"
									style="border-radius: 70%; height: 60px; width: 60px;"
									src="${reply_profile.get(status.index)}" alt="">
								</td>
								<td
									style="padding-top: 10px; font-weight: 600; font-size: 16px;">${replyList.cbr_nickname }</td>
							</tr>

							<tr>
								<td>
									<div id="content"
										style="width: 100%; min-height: 30px; font-size: 14px; overflow-y: hidden; resize: none;"
										rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.cbr_reply }
									</div>
								</td>
							</tr>

							<tr>
								<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.detailDate }
									&nbsp
									<button class="reply_r${replyList.cbr_seq }" type="button">답글쓰기
									</button>
								</td>
								<c:if test="${replyList.cbr_writer eq mem_id }">
									<td><button type="button" class="delReply"
											style="color: red; float: right; margin-right: 20px;">
											X<input class="replySeq" type="hidden"
												value="${replyList.cbr_seq }">
										</button></td>
								</c:if>
							</tr>
						</table>
					</div>

					<!------ 답글 쓰기 ------->
					<tr>
						<form method="post"
							action="/clubBoard/insertReply_rec?cb_seq=${detail.cb_seq }&cbr_seq=${replyList.cbr_seq }&check_num=${check_num } &keyword=${keyword }&searchWord=${searchWord }">
							<!-- 답글달기 기능 -->
							<div id="reply_rec${replyList.cbr_seq }"
								class="commend space-y-2 rounded-md"
								style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px; display: none; width: 90%; height: 80%; margin-left: 73px;">
								<div class="writer font-bold">${user_nickName }</div>

								<!-- 답글 입력받기 -->
								<div>
									<input type="hidden" name="seq_r" value="${detail.cb_seq }">
									<input type="hidden" name="cpage" value="${cpage }">
									<textarea name="cbr_reply" id="message"
										placeholder="${replyList.cbr_nickname }님에게 남기는 댓글."
										style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
										rows="1" onkeyup="resize(this)" onkeydown="resize(this)"></textarea>
									<!-- textarea 자동 높이조절-->
								</div>

								<div style="height: 20px;">

									<button id="commentBtn"
										class="summit float-right text-green-400" type="submit">등록</button>

									<button type="button" id="cencelBtn${replyList.cbr_seq }"
										class="summit float-right text-green-400" type="submit"
										style="margin-right: 15px;">취소</button>
								</div>
							</div>
						</form>
					</tr>
					<script>
						// 대댓글 작성 창 띄우기
						$(".reply_r${replyList.cbr_seq }").on("click", function() {
							$("#reply_rec${replyList.cbr_seq }").css('display','block');
						})
		
						// 대댓글 창 취소
						$("#cencelBtn${replyList.cbr_seq }").on("click", function() {
							$("#reply_rec${replyList.cbr_seq }").css('display','none');
						})
		
					</script>
				</c:when>



				<c:when test="${replyList.deep eq '1'}">
					<div style="border-bottom: 1px solid rgb(202, 202, 202);"
						class="input_commend">
						<table style="width: 90%; margin-top: 15px; margin-left: 73px;">
							<tr>
								<td rowspan="3"
									style="border-radius: 70%; height: 77px; width: 75px; padding-right: 1px;">
									<img id="profile"
									style="border-radius: 70%; height: 60px; width: 60px;"
									src="${reply_profile.get(status.index)}" alt="">
								</td>
								<td
									style="padding-top: 10px; font-weight: 600; font-size: 16px;">${replyList.cbr_nickname }
								</td>
							</tr>

							<tr>
								<td>
									<div id="content"
										style="width: 100%; min-height: 30px; font-size: 14px; overflow-y: hidden; resize: none;"
										rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.cbr_reply }
									</div>
								</td>
							</tr>

							<tr>
								<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.detailDate }
								</td>
								<c:if test="${replyList.cbr_writer eq mem_id }">
									<td><button type="button" class="delReply_r"
											style="color: red; float: right; margin-right: 20px;">
											X<input class="replySeq_r" type="hidden"
												value="${replyList.cbr_r_seq }">
										</button></td>
								</c:if>
							</tr>
						</table>
					</div>
				</c:when>

			</c:choose>


		</c:forEach>
		<form method="post"
			action="/clubBoard/insertReply?cb_seq=${detail.cb_seq }&check_num=${check_num } &keyword=${keyword }&searchWord=${searchWord }">
			<!-- 댓글달기 기능 -->
			<div class="commend space-y-2 rounded-md"
				style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px;">
				<div class="writer font-bold">${user_nickName }</div>

				<!-- 댓글 입력받기 -->
				<div>
					<input type="hidden" name="seq" value="${detail.cb_seq }">
					<input type="hidden" name="cpage" value="${cpage }">
					<textarea name="cbr_reply" id="message" placeholder="댓글을 남겨주세요."
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
		<c:if test="${detail.cb_writer == mem_id }">
			<button type="button" id="modify"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-left: 20px;">수정하기</button>
				</c:if>
			<c:if test="${admin != null  || detail.cb_writer == mem_id}">
			<button type="button" id="delete"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-bottom: 70px;">삭제하기</button>
				</c:if>
	</div>

	<script>
		
		
		
	
		// 추천 기능
		$("#good").on("click", function() {
			if(${mem_id != null}){
				$.ajax({
					url : "/clubBoard/clubBoardRec?cb_seq=${detail.cb_seq }",
					dataType: "json"
				}).done(function(resp){
					console.log(resp);
					$("#good_n").text(resp[0]);
					if(resp[1] == 1){
						$("#heart").html("<i class='fas fa-heart'></i>");
					}else if(resp[1] == 0){
						$("#heart").html("<i class='far fa-heart'></i>");
					}
				});
			}else{
				alert("로그인 후 이용가능합니다.")
			}
		})
	
	
		// 댓글 textarea 자동 높이조절
		function resize(obj) {

			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		};
		
		// 비회원시 댓글 쓰기 막기
		$("#commentBtn").on("click",function() {
			if(${mem_id == null}){
				alert("로그인 후 이용해주세요.");
			return false;
			}else{
				 let regex = /([\s\S]){1,2000}/;
				   let contents = $("#message").val();
				   let result = regex.test(contents);
				   if(!result){
				       alert("한글자 이상 입력해주세요.");
				       return false;
				   }
			}
		})
		
		// 댓글 삭제 기능
		$(".delReply").on("click", function() {
			let replySeq = $(this).find(".replySeq").val();
			 if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/clubBoard/deleteReply?cpage=${cpage }&cb_seq=${detail.cb_seq}&cbr_seq=" + replySeq + "&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord}" ;
			} 
		})
		
		// 대댓글 삭제 기능
		$(".delReply_r").on("click", function() {
			let replySeq_r = $(this).find(".replySeq_r").val();
			 if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/clubBoard/deleteReply_r?cpage=${cpage }&cb_seq=${detail.cb_seq}&cbr_r_seq=" + replySeq_r + "&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord}" ;
			} 
		})
		
		// 뒤로가기
		$("#back").on("click", function() {
			if(${check_num} == 1){
				location.href = "/clubBoard/boardList?cpage=${cpage}&cb_club_id=${cb_club_id}";
			}else if(${check_num} == 2){
				 location.href = "/clubBoard/searchBoard?cpage=${cpage}&keyword=${keyword }&searchWord=${searchWord }&cb_club_id=${cb_club_id}";
			}
		})
			
			
		// 게시글 수정하기
		$("#modify").on("click", function() {
				location.href = "/clubBoard/modifyBoard?cb_seq=${detail.cb_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				
		}) 

		 // 게시글 삭제하기
		 $("#delete").on("click", function() {
			 if (confirm("정말 삭제하시겠습니까? 하시겠습니까??")) {
				location.href = "/clubBoard/deleteBoard?cb_seq=${detail.cb_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				 /* history.back(); */
			}
		}) 
	
	</script>

</body>
</html>