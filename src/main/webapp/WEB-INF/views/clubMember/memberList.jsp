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
								<c:forEach var="dto" items="${list }">
									<tr>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<div class="flex items-center">
												<div class="ml-3">
													<p class="text-gray-900 whitespace-no-wrap">1</p>
												</div>
											</div>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">서호현</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">suhoh01</p>
										</td>
										<td
											class="px-5 w-1/12 text-center text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">
												suhoh01@naver.com</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">문화생활</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">운동/스포츠</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">2020-01-02</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">2020-01-13
												19:37:23</p>
										</td>
										<td
											class="px-5 w-1/12 text-center py-5 border-b border-gray-200 bg-white text-sm">
											<p class="text-gray-900 whitespace-no-wrap">
												<button
													class="delBtn bg-white hover:bg-gray-100 text-gray-800 font-semibold py-2 px-4 border border-gray-400 rounded shadow">
													삭제<input type="hidden" class="seq_h" value="${dto.seq }">
												</button>
											</p>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>