<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.vote_title {
	font-size: large;
	font-weight: 600;
	margin-bottom: 5px;
}

.vote_write_date {
	font-size: small;
	color: gray;
}

.attend {
	font-size: small;
	text-align: right;
	padding-bottom: 20px;
	border-bottom: 1px solid rgb(199, 197, 197);
}

.vote_options {
	margin-top: 15px;
}

.answers {
	padding-bottom: 20px;
}

.vote {
	border-top: 1px solid rgb(199, 197, 197);
	padding-top: 20px;
	text-align: center;
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

.back {
  border: 1px solid #212121;
  padding: 3px 5px 3px 5px;
  font-size: 0.8rem;
  color: #212121;
  background-color: transparent;	
}

.back:hover {
  color: white;
  background-color: #212121;
  cursor: pointer;	
}
</style>

</head>
<body>


	<form class="form" action="/vote/voteComplete">
		<div class="container">
			<div class="vote_title">${voteDetail.vl_title }</div>

			<div class="vote_write_date">${voteDetail.formdDateDetail }</div>

			<div class="attend">
				<i class="fas fa-user-check"></i> ${voteDetail.vl_count }명 참여
			</div>

			<div class="vote_options">

				<c:if test="${voteDetail.vl_type eq 0 }">
					<c:forEach var="voteOption" items="${voteOption }"
						varStatus="status">

						<div class="answers">
							<input type="radio" name="option" id="option${status.index }"
								value="${voteOption.vo_seq }"> <label
								class="option_label" for="option${status.index }">${voteOption.vo_option }</label>
						</div>

					</c:forEach>
					<script>
						$("#option0").prop('checked',true);
					</script>
				</c:if>

				<c:if test="${voteDetail.vl_type eq 1 }">
					<c:forEach var="voteOption" items="${voteOption }"
						varStatus="status">

						<div class="answers">
							<input type="checkbox" name="option" id="option${status.index }"
								value="${voteOption.vo_seq }"> <label
								class="option_label" for="option${status.index }">${voteOption.vo_option }</label>
						</div>

					</c:forEach>
				</c:if>

			</div>

			<div class="vote">
				<button class="voteBtn"><i class="fas fa-pen-square"></i> 투표하기</button>
				&nbsp; &nbsp;
				<button type="button" class="back"><i class="fas fa-clipboard-list"></i> 목록으로</button>
			</div>
			<input type="hidden" name="vl_seq" value="${voteDetail.vl_seq }">
		</div>
	</form>

	<c:if test="${voteDetail.vl_type eq 1 }">
		<script>
			$(".form").attr("action","/vote/voteCompleteCB");
		</script>
	</c:if>
	
	<c:if test="${voteResult eq 1 }">
		<script>
			alert("투표에 참여해주셔서 감사합니다.");
			location.href="/vote/voteResultPage?vl_seq=${vl_seq}&voteState=2";
		</script>
	</c:if>


	<script>
		$(".back").on("click", function() {
			if(${voteState == 1}){
				location.href="/vote/previousVoteList";
			}else if(${voteState == 2}){
				location.href="/vote/presentVoteList";
			}
		})
	</script>

</body>
</html>