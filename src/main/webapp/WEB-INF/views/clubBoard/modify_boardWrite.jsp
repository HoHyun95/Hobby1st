<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
	<form method="post" onsubmit="return confirm('정말 수정하시겠습니까?')"
		action="/clubBoard/updateBoard?cb_seq=${detail.cb_seq }&cpage=${cpage }&check_num=${check_num }&keyword=${keyword }&searchWord=${searchWord }">
		<!-- 글쓰기 Header -->
		<div style="padding-top: 40px;" class="container con22">
			<div class="head"
				style="border-bottom: 1px solid rgb(173, 173, 173); font-size: 20px; height: 50px;">
				<b># 게시판 수정하기</b>
			</div>

			<!-- 제목 입력 -->
			<div>
				<input name="cb_title" id="title"
					style="font-size: 12px; margin-top: 10px; margin-bottom: 10px; padding-left: 10px;"
					type="text" value="${detail.cb_writer }"
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


				<!-- textarea 태그에 작성 -->
				<div>
					<textarea name="cb_contents" id="summernote">${detail.cb_contents }</textarea>
				</div>


				<!-- 목록, 등록 버튼 생성 -->

				<div style="text-align: right;">
					<button type="button" id="back"
						class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
						style="margin-right: 5px; height: 65%;">돌아가기</button>


					<button id="modify_board"
						class="border border-green-500 text-green-500 hover:bg-green-400 hover:text-gray-100 rounded px-4 py-2"
						style="height: 65%;">수정하기</button>
				</div>
			</div>
		</div>
	</form>

	<script>
		// 제목 입력 안할시 에러
		$("#modify_board").on("click", function() {
			let regex = /([\s\S]){1,2000}/;
			let contents = $("#title").val();
			let result = regex.test(contents);
			if (!result) {
				alert("한글자 이상 입력해주세요.");
				return false;
			}
		})

		// <!-- '목록' 클릭시 게시판리스트로 돌아가기 -->
		$("#back").on("click", function() {
			history.go(-1);
		});

	</script>

	<!-- textarea에 summernote 적용 -->
	<script>
		$('#summernote').summernote({
			placeholder : 'input',
			tabsize : 2,
			height : 600,
			lang : "ko-KR",
			minHeight : null,
			maxHeight : null,
			focus : true,
			callbacks : {
				onImageUpload : function(files) {
					console.log(files[0]);
					sendFile(files[0], this);
				}
			}
		});
	</script>

	<!-- 이미지 업로드 -->
	<script>
		function sendFile(file, editor) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : "/imageUpload.pet",
				cache : false,
				contentType : false,
				enctype : "multipart/form-data",
				processData : false,
				success : function(sysName) {
					console.log(sysName + "b")

					setTimeout(function() {
						$(editor).summernote('insertImage',
								'/board/img/' + sysName);
					}, 3500);
				}
			});
		}
	</script>
</body>
</html>