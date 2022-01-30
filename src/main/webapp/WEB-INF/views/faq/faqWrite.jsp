<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

</head>
<body>


	<div id="container">
		<form action="/faq/faqInsert" method="post">

			<div style="padding-top: 40px;" class="container con22">
				<div class="head"
					style="border-bottom: 1px solid rgb(173, 173, 173); font-size: 20px; height: 50px;">

				</div>

				<div>
					<!-- faq_title -->
					<input name="faq_title" id="title"
						style="font-size: 12px; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"
						type="text" placeholder="제목을 입력해 주세요."
						class="
							placeholder-gray-400
							text-gray-600 
							relative
							bg-white bg-white
							rounded
							text-sm
							border border-gray-400
							outline-none
							focus:outline-none focus:ring
							w-10/12
							h-14
						 " />

					<div>
						<!-- faq_contents  -->
						<textarea name="faq_contents"></textarea>
					</div>


					<button id="faqInsertBtn"
						class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
						style="height: 65%;">등록</button>
				</div>
			</div>
	</div>
	</div>
	</form>



</body>
</html>