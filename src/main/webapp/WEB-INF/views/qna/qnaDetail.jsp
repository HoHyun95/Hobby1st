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
				<span>${detail.qna_title } </span>
			</div>
			<div class="profile" style="height: 70px; border-bottom: 1px solid rgb(202, 202, 202);">
				<div style="width: 10%; height: 50px;">
					<img id="profile"
									style="border-radius: 70%; height: 60px; width: 55px;"
									src="${writerProfile}" alt="">
				</div>

				<div style="width: 90%; height: 50px;">
					<div>
					<span class="writer">${detail.qna_writer }</span>
				</div>
				<div class="grid grid-cols-2 text-gray-400 pt-1"
					style="padding-bottom: 10px;">
					<div class="write_date text-sm">${detail.detailDate }</div>
					<div class="text-right">
						<i class="far fa-eye"></i> ${detail.qna_view_count }
					</div>
				</div>
				</div>
				
			</div>
		</div>

		<!-- 게시글 본문내용 삽입 -->
		<div
			style="border-bottom: 1px solid rgb(202, 202, 202); padding-bottom: 15px;">

			<div style="margin-top: 10px;">${detail.qna_contents }</div>

			<!-- 오른쪽 하단에 추천과 댓글수 조회 -->
			<div class="content_b text-right text-base">
				<br>

            <!-- 댓글 개수 주석-->
				<span style="margin-left: 10px;"><i
					class="far fa-comment-dots"></i> 댓글 <span id="comment_n">${replycount }</span>
				</span>
			</div>
		</div>


		<!-- 댓글 삽입 기능 -->
		<c:forEach var="replyList" items="${replyList }" varStatus="status">
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${replyList.deep eq '0'}"> --%>
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
									style="padding-top: 10px; font-weight: 600; font-size: 16px;">${replyList.qnar_writer }</td>
							</tr>

							<tr>
								<td>
									<div id="content"
										style="width: 100%; min-height: 30px; font-size: 14px; overflow-y: hidden; resize: none;"
										rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.qnar_reply }
									</div>
								</td>
							</tr>

							<tr>
<%-- 								<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.formDate} --%>
<!-- 									&nbsp -->
								
								</td>
								<c:if test="${replyList.qnar_writer eq mem_id }">
									<td><button type="button" class="delReply"
											style="color: red; float: right; margin-right: 20px;">
											X<input class="replySeq" type="hidden"
												value="${replyList.qnar_seq }">
										</button></td>
								</c:if>
							</tr>
						</table>
					</div>

					<!------ 답글 쓰기 ------->
					<tr>
						<form method="post"
							action="/qna/insertReply_rec?qna_seq=${detail.qna_seq }&qnar_seq=${replyList.qnar_seq }&check_num=${check_num } &keyword=${keyword }&searchWord=${searchWord }">
							<!-- 답글달기 기능 -->
							<div id="reply_rec${replyList.qnar_seq }"
								class="commend space-y-2 rounded-md"
								style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px; display: none; width: 90%; height: 80%; margin-left: 73px;">
                                 
                        <!-- 주석 -->        
								<div class="writer font-bold">${user_nickName }</div>

								<!-- 답글 입력받기 -->
								<div>
									<input type="hidden" name="seq_r" value="${detail.qna_seq }">
									<input type="hidden" name="cpage" value="${cpage }">
									<textarea name="qnar_reply" id="message"
										placeholder="${replyList.qnar_writer }님에게 남기는 댓글."
										style="width: 100%; min-height: 30px; overflow-y: hidden; resize: none;"
										rows="1" onkeyup="resize(this)" onkeydown="resize(this)"></textarea>
									<!-- textarea 자동 높이조절-->
								</div>

								<div style="height: 20px;">

									<button id="commentBtn"
										class="summit float-right text-green-400" type="submit">등록</button>

									<button type="button" id="cencelBtn${replyList.qnar_seq }"
										class="summit float-right text-green-400" type="submit"
										style="margin-right: 15px;">취소</button>
								</div>
							</div>
						</form>
					</tr>
				
<%-- 				</c:when> --%>



<%-- 				<c:when test="${replyList.deep eq '1'}"> --%>
<!-- 					<div style="border-bottom: 1px solid rgb(202, 202, 202);" -->
<!-- 						class="input_commend"> -->
<!-- 						<table style="width: 90%; margin-top: 15px; margin-left: 73px;"> -->
<!-- 							<tr> -->
<!-- 								<td rowspan="3" -->
<!-- 									style="border-radius: 70%; height: 77px; width: 75px; padding-right: 1px;"> -->
<!-- 									<img id="profile" -->
<!-- 									style="border-radius: 70%; height: 60px; width: 60px;" -->
<%-- 									src="${reply_profile.get(status.index)}" alt=""> --%>
<!-- 								</td> -->
<!-- 								<td -->
<%-- 									style="padding-top: 10px; font-weight: 600; font-size: 16px;">${replyList.qnar_writer } --%>
<!-- 								</td> -->
<!-- 							</tr> -->

<!-- 							<tr> -->
<!-- 								<td> -->
<!-- 									<div id="content" -->
<!-- 										style="width: 100%; min-height: 30px; font-size: 14px; overflow-y: hidden; resize: none;" -->
<%-- 										rows="1" onkeyup="resize(this)" onkeydown="resize(this)">${replyList.qnar_reply } --%>
<!-- 									</div> -->
<!-- 								</td> -->
<!-- 							</tr> -->

<!-- 							<tr> -->
<%-- 								<td class="text-sm text-gray-400" style="padding-bottom: 10px;">${replyList.detailDate } --%>
<!-- 								</td> -->
<%-- 								<c:if test="${replyList.qnar_writer eq mem_id }"> --%>
<!-- 									<td><button type="button" class="delReply_r" -->
<!-- 											style="color: red; float: right; margin-right: 20px;"> -->
<!-- 											X<input class="replySeq_r" type="hidden" -->
<%-- 												value="${replyList.cbr_r_seq }"> --%>
<!-- 										</button></td> -->
<%-- 								</c:if> --%>
<!-- 							</tr> -->
<!-- 						</table> -->
<!-- 					</div> -->
<%-- 				</c:when> --%>

<%-- 			</c:choose> --%>


		</c:forEach>
		<form method="post"
			action="/qna/insertReply?qna_seq=${detail.qna_seq }&check_num=${check_num } &keyword=${keyword }&searchWord=${searchWord }">
			<!-- 댓글달기 기능 -->
			<div class="commend space-y-2 rounded-md"
				style="padding: 15px; border: 1px solid rgb(187, 186, 186); margin-top: 15px;">
				<div class="writer font-bold">${user_qna_writer }</div>

				<!-- 댓글 입력받기 -->
				<div>
					<input type="hidden" name="seq" value="${detail.qna_seq }">
					<input type="hidden" name="cpage" value="${cpage }">
					<textarea name="qnar_reply" id="message" placeholder="댓글을 남겨주세요."
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
		<c:if test="${detail.qna_writer == mem_id }">
			<button type="button" id="modify"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-left: 20px;">수정하기</button>
			<button type="button" id="delete"
				class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
				style="float: right; margin-bottom: 70px;">삭제하기</button>
		</c:if>
	</div>

	<script>
		
		
		
	
	
	
	
		// 댓글 textarea 자동 높이조절
		function resize(obj) {

			obj.style.height = "1px";
			obj.style.height = (12 + obj.scrollHeight) + "px";
		};
		
		
		// 댓글 삭제 기능
		$(".delReply").on("click", function() {
			let replySeq = $(this).find(".replySeq").val();
			 if (confirm("정말 삭제하시겠습니까?")) {
				location.href = "/qna/deleteReply?cpage=${cpage }&qna_seq=${detail.qna_seq}&qnar_seq=" + replySeq + "&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord}" ;
			} 
		})
		
		
		// 뒤로가기
		$("#back").on("click", function() {
			 if(${check_num} == 1){
				location.href = "/qna/qnaList?cpage=${cpage}";
			}else if(${check_num} == 2){
				 location.href = "/qna/searchQna?cpage=${cpage}&keyword=${keyword }&searchWord=${searchWord }";
			} 
		})
			
			
		// 게시글 수정하기
		$("#modify").on("click", function() {
				location.href = "/qna/modifyQna?qna_seq=${detail.qna_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				
		}) 

		 // 게시글 삭제하기
		 $("#delete").on("click", function() {
			 if (confirm("정말 삭제하시겠습니까? 하시겠습니까??")) {
				location.href = "/qna/deleteQna?qna_seq=${detail.qna_seq}&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }";
				 /* history.back(); */
				
				self.close();
			}
		}) 
	
	</script>

</body>
</html>