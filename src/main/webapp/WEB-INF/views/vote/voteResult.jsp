<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	/* border: 1px solid black; */
	
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

.select {
	font-size: small;
	color: gray;
	margin-top: 5px;
}

.btn {
	text-align: center;
	margin-top: 35px;
}

.vote_option>div {
	float: left;
}

.vote_option {
	margin-bottom: 5px;
}

.option {
	font-size: small;
}

.vote_count {
	font-size: small;
	color: gray;
}

.option_bar>div {
	height: 13px;
	float: left;
}

.vote_result {
	margin-top: 20px;
}

.title {
	font-weight: 600;
}

.end_date {
	font-size: small;
	color: rgb(236, 73, 9);
	margin-bottom: 10px;
	border-bottom: 1px solid rgb(199, 197, 197);
	margin-top: 5px;
	padding-bottom: 10px;
}

.voteBtn {
  border: 1px solid mediumaquamarine;
  padding: 3px 5px 3px 5px;
  font-size: 0.8rem;
  color: mediumaquamarine;
  background-color: transparent;
}

.voteBtn:hover {
  color: white;
  background-color: mediumaquamarine;
  cursor: pointer;
}

.backBtn {
  border: 1px solid #212121;
  padding: 3px 5px 3px 5px;
  font-size: 0.8rem;
  color: #212121;
  background-color: transparent;	
}

.backBtn:hover {
  color: white;
  background-color: #212121;
  cursor: pointer;	
}

.voteCom {
  border: 1px solid tomato;
  padding: 3px 5px 3px 5px;
  font-size: 0.8rem;
  color: tomato;
  background-color: transparent;	
}
</style>

</head>

<body>

	<!-- 오늘 날자 구하기 -->
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<div class="container">
		<div class="vote_list">
			<div class="vote_title">
				<div class="title"><i class="fas fa-vote-yea"></i> ${voteDetail.vl_title }</div>
				<div class="select">복수 선택</div>

				<div class="end_date">투표 종료일 : ${voteDetail.vl_end_date }</div>
			</div>
			<c:forEach var="dto" items="${voteOption }" varStatus="status">
				<div class="vote_result">
					<div class="vote_option">
						<span class="option">${dto.vo_option }</span> <span
							class="vote_count" style="float: right;"><i
							class="fas fa-user-check"></i> ${dto.vo_count }명</span>
					</div>

					<div class="option_bar">
						<div class="result${dto.vo_seq }"
							style="background-color: gray; width: ${resultCount[status.index]}%;"></div>
						<div class="back"
							style="background-color: rgb(235, 233, 233); width: ${resultCountM[status.index]}%;"></div>
					</div>
				</div>
			</c:forEach>
			<div class="btn">
				<c:if test="${voteCheck eq 1 }">
					<button class="voteCom"><i class="fas fa-user-check"></i> 투표 완료</button>
				</c:if>
				<c:if test="${voteCheck eq 0 }">
					<button class="voteBtn"> <i class="fas fa-pen-square"></i> 투표하기</button>
				</c:if>


				&nbsp;
				<button class="backBtn"><i class="fas fa-clipboard-list"></i> 목록으로</button>
			</div>
		</div>
	</div>

	<c:if test="${today > voteDetail.vl_end_date }">
		<script>
			$(".voteCom").css('display', 'none');
			$(".voteBtn").css('display', 'none');
			/* $(".result${optionRank[0].vo_seq}").css('background-color','rgb(240, 209, 35)'); */
		</script>
		<c:forEach var="option" items="${optionRank }" varStatus="status">
			<c:if test="${optionRank[0].vo_count eq option.vo_count }">
				<script>
					$(".result${optionRank[status.index].vo_seq}").css(
							'background-color', 'rgb(240, 209, 35)');
				</script>
			</c:if>
		</c:forEach>
	</c:if>




	<script>
		// 목록으로
		$(".backBtn").on("click", function() {
			if(${voteState == 1}){
				location.href="/vote/previousVoteList";
			}else if(${voteState == 2}){
				location.href="/vote/presentVoteList";
			}
		})

		// 투표하기
		$(".voteBtn").on("click", function() {
			location.href = "/vote/detailPage?vl_seq=${voteDetail.vl_seq}";
		})
	</script>



</body>
</html>