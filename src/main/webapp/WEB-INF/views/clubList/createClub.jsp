<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Club</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
<style>
input {
	width: 88%;
	height: 48px;
	border: none;
	padding-left: 10px;
}

i {
	padding: 5px;
}

#nameSpan, #maxMemCheck {
	margin-left: 34px;
}

#club_container {
	width: 480px;
	height: 650px;
	margin: auto;
	border: 1px solid black;
}

#container_header {
	text-align: center;
}

#club_first_container, #club_second_container {
	width: 100%;
	height: 100%;
}

#image-container {
	margin: auto;
	text-align: center;
	width: 80%;
	height: 30%;
	border: 1px solid black;
}

.cl_boss_box>i {
	width: 15px;
	font-size: 20px;
	margin-right: 3px;
}

#cl_local{
text-align : center;
width : 97%;
height : 48px;
}

.line_effect {
	margin: auto;
	margin-bottom: 5px;
	margin-top: 2px;
	border: 1px solid rgb(44, 26, 26);
	height: 0px;
	width: 80%;
}

#club_second_container {
	display: none;
}

#cl_category, #cl_dCategory {
	margin: auto;
	border: 1px solid black;
	width: 80%;
	height: 20%;
}

.categories {
	display: flex;
}

.category {
	border: 1px solid blue;
	border-radius: 50%;
	height: 80%;
	width: 20%;
}

.category>input {
	border: none;
	height: 70%;
	width: 50%;
	margin: auto;
}
</style>
</head>
<body>

	<form action="/clubList/createClubProc" method="post"
		id="clubCreateForm">

		<!-- 	enctype="multipart/form-data" -->

		<div id="club_container">


			<input type="hidden" name="cl_boss_name" value="Hidden">

			<div id="container_header">동호회 등록</div>
			<div id="image-container">
				<img style="width: 100%; height: 100%;" id="preview-image">
			</div>

			<!--첫번째 컨테이너 시작 -->
			<div id="club_first_container">

				<div>
					<input style="display: block;" name="cl_photo" type="file"
						id="input-image">
				</div>

				<script>
function readImage(input) {
    if(input.files && input.files[0]) {
        const reader = new FileReader()
  
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }    
        reader.readAsDataURL(input.files[0])
    }
}
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
         </script>


				<div class="club_name_box">
					<i class="fas fa-users"></i> <input type="text" id="cl_name"
						name="cl_name" placeholder="동호회명을 입력해주세요">
					<div id="nameSpan"></div>
				</div>


				<script>
// ID값을 입력했을 때, 
$("#cl_name").on("blur", function() {
	$.ajax({
		url : "/clubList/nameCheck",
		data : {
			cl_name : $("#cl_name").val()
		}
	}).done(function(resp) {

		if ($("#cl_name").val() !== "") {
			if (resp > 0) {
				$('#nameSpan').text("이미 사용중인 동호회명입니다.");
				$('#cl_name').val('');
				$('#cl_name').focus();

			} 
			
			else {
				$('#nameSpan').text("");

			}
			
		} else {
			$('#nameSpan').text("동호회명을 입력해주세요");
		}

	});

});
</script>



				<div class="line_effect"></div>
				<div class="cl_boss_box">
					<i class="fas fa-male"></i> <input type="text" name="cl_boss_id"
						placeholder="대표자">
				</div>

				<!-- 		<div> -->
				<!-- 			<input type="text" name="cl_phone" placeholder="휴대폰 번호를 -없이 입력해주세요"> -->
				<!-- 		</div> -->
				<div class="line_effect"></div>

				<div>

					<i class="fas fa-users-cog"></i> <input type="text" id="maxMem"
						name="cl_maxMem" placeholder="최대정원을 정해주세요"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
					<div id="maxMemCheck"></div>
				</div>

				<script>


			$('#maxMem').on('blur', () => {				
			
				if($('#maxMem').val()>100){
					$('#maxMemCheck').text("정원은 100명을 초과할 수 없습니다");
					$('#maxMem').val("");
					maxMem.focus();
				}else{
					$('#maxMemCheck').text("");
				}
				
			})
			
				
				</script>

				<div class="line_effect"></div>


				<div>
					<select name="cl_local" id="cl_local">
						<option value="서울">서울
						<option value="경기">경기
						<option value="인천">인천
						<option value="부산">부산
						<option value="대구">대구
						<option value="광주">광주
						<option value="대전">대전
						<option value="울산">울산
						<option value="세종">세종
						<option value="강원">강원
					</select>
				</div>
				<div class="line_effect"></div>



				<!-- //다음 버튼 누르면 다음 작성페이지 불러온다 -->
				<button type="button" id="container_nextBtn">다음</button>
				<script>
				
				
		$('#container_nextBtn').on('click', () => {

	  		if ($("cl_name").val() == "") {
				alert("동호회명을 입력해주세요");
				return false;

			}
			if ($("#cl_maxMem").val() == "") {
				alert("정원을 입력해주세요");
				return false;

			}
			
			$('#club_first_container').hide(1000);
    	     $('#club_second_container').show(1000);
	        
		})
		</script>
				<!-- 		first container end line -->
			</div>
			<!-- 		first container end line -->



			<div id="club_second_container">
				<div>동호회 소개글</div>
				<textarea id="cl_desc" name="cl_desc" cols="30" rows="5"
					style="resize: none;"></textarea>
				<div>동호회 등록 대분류</div>

				<div id="cl_category" class="categories">
					<div class="category">
						<input type="text" name="cl_category_id" id="cl_category_id"
							placeholder="운동">
					</div>
				</div>

				<div>동호회 등록 소분류</div>

				<div id="cl_dCategory" class="categories">
					<div class="category">
						<input type="text" name="cl_dCategory_id" id="cl_dCategory_id"
							placeholder="풋살">
					</div>
				</div>

				<div id="second_btns">
					<button type="button" id="container_back">돌아가기</button>

					<!-- 정보 다 확인하고 js로 submit 시키기 -->
					<button type="button" id="clSubmit">등록하기</button>
				</div>
	</form>

	<script>
      $('#container_back').on('click', () => {
         $('#club_first_container').show(1000);
         $('#club_second_container').hide(1000);
      })

      
     $('#clSubmit').on('click', () => {
    	 
			
			if ($("cl.desc").html() == "") {
				alert("동호회 소개글을 입력해주세요");
				return false;

			}
			if ($("#cl_category_id").val() == "") {
				alert("관심있는 동호회 분류를 선택해주세요");
				return false;

			}

			if ($("#cl_dCategory_id").val() == "") {
				alert("관심있는 동호회 분류를 선택해주세요");
				return false;
			}
			
			if(
					$('#maxMemCheck').text() != "" ||
					$('#nameSpan').text() != ""	
			){
				alert("정보를 정확히 입력해주세요");
				
			}else{
				$('#clubCreateForm').submit();
			}

			
     })
   </script>
	<!--second container end line-->
	</div>
	<!--second container end line-->


	</div>
</body>
</html>