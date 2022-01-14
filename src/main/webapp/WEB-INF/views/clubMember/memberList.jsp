<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

<style>
.navi {
	text-align: center;
	padding-top: 20px;
}
</style>

</head>


<body>

	<div style="margin: auto;" class="main-content w-full md:w-4/5 grid">
		<div class="bg-white p-8 rounded-md w-full">
			<div class="pb-6">
				<div>
					<h2 class="text-gray-600 font-semibold">회원 정보</h2>
				</div>
			</div>
			<div>
				<div class="sm:-mx-8 px-4 sm:px-8 py-4 overflow-x-auto">
					<div
						class="inline-block min-w-full shadow rounded-lg overflow-hidden">
						<table class="min-w-full">
							<thead>
								<tr class="member_table">
									<th
										class="px-8 w-1/12 py-3 text-left border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										#</th>
									<th
										class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										이름</th>
									<th
										class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										닉네임</th>
									<th
										class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										이메일</th>
									<th
										class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										관심사1</th>
									<th
										class="px-5 w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										관심사2</th>

									<th
										class=" w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										동호회 가입일</th>
									<th
										class=" w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										최종 로그인 시간</th>
									<th
										class=" w-1/12 py-3 text-center border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600">
										비고</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach var="dto" items="${memberList }" varStatus="status">
									<tr>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<div class="flex items-center">
												<div class="ml-3">
													<p class="text-gray-900 whitespace-no-wrap">${status.count + ((cpage -1) * 10) }</p>
												</div>
											</div>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">${dto.mem_name}</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">${dto.mem_nickname}</p>
										</td>
										<td
											class="px-5 w-1/12 text-center text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">
												${dto.mem_email}</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">${dto.mem_category_1}</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">${dto.mem_category_2}</p>
										</td>
										
											<td
												class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
												<p class="text-gray-900 whitespace-no-wrap">${clubMemberList[status.index].cm_sign_date }</p>
											</td>
										
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">${dto.mem_lastlogin }</p>
										</td>
										
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">
												<button
													class="delBtn bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">
													삭제 <input type="hidden" class="id_h" value="${dto.mem_id }">
													<input type="hidden" class="name_h" value="${dto.mem_name }">
												</button>
											</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							<tr>
								<td colspan="9" width=1000 align="center"></td>
							</tr>
						</table>
					</div>
					<div class="navi">${navi }</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 작성에 성공하였으면 알림띄우고 리스트로 돌아가기 -->
	<c:if test="${result eq '1' }">
		<script>
			alert("${bye_mem} 추방해버리기~!");
			location.href = "/clubMember/memberList?cpage=${cpage}";
		</script>
	</c:if>

	<script>
		// 페이징 스타일
		$(".paging").addClass("text-red-500 border border-red-500 hover:bg-red-500 hover:text-white font-bold text-xs px-4 py-2 rounded transition-all duration-150");
		
		// 멤버 추방하기
		
		$(".delBtn").on("click", function() {
				let id_h = $(this).find($(".id_h")).val();
				let name_h = $(this).find($(".name_h")).val();
				let out = name_h + "님을 정말 쫒아내시겠습니까 ?"
			if (confirm(out)) {
				location.href = "/clubMember/deleteMember?cpage=${cpage }&mem_id=" + id_h + "&mem_name=" + name_h;
				return true;
			} else {
				return false;
			}
		})
	</script>


	<!-- 페이징 스타일 변화 -->
	<c:choose>
		<c:when test="${cpage eq '1' }">
			<script>
				$("#paging1").addClass("bg-red-500");
				$( "#paging1" ).css("color","white").css("disabled","false");
				$( "#paging1" ).removeAttr('href');
			</script>
		</c:when>
		<c:when test="${cpage eq '2' }">
			<script>
				$("#paging2").addClass("bg-red-500");
				$( "#paging2" ).css("color","white").css("disabled","false");
				$( "#paging2" ).removeAttr('href');
			</script>
		</c:when>
		<c:when test="${cpage eq '3' }">
			<script>
				$("#paging3").addClass("bg-red-500");
				$( "#paging3" ).css("color","white").css("disabled","false");
				$( "#paging3" ).removeAttr('href');
			</script>
		</c:when>
	</c:choose>


</body>
</html>