<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Club</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="/css/clubList/createClub.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
	integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
	crossorigin="anonymous">
</head>
<body>

	<form action="/clubList/createClubProc" method="post"
		id="clubCreateForm" enctype="multipart/form-data">


		<div id="club_container">


			<div id="container_header">동호회 등록</div>
			<div id="image-container">
				<img style="width: 100%; height: 100%;" id="preview-image">
			</div>

			<!--첫번째 컨테이너 시작 -->
			<div id="club_first_container">

				<div>
					<input style="display: block;" name="file" type="file"
						id="input-image">
				</div>

				<script>


$(document).ready(function() {
    $("input:file[name='cl_photo']").change(function () {
		
        let str = $(this).val();
        let fileName = str.split('\\').pop().toLowerCase();
        checkFileName(fileName);
    });
});

function checkFileName(str){
 
 let ext =  str.split('.').pop().toLowerCase();
 if($.inArray(ext, ['png','jpg', 'jpeg']) == -1) {

	  alert(ext+'파일은 업로드 하실 수 없습니다.');
	  $('#input-image').val("");
 }

 var pattern =   /[\{\}\/?,;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
 if(pattern.test(str) ){
	  alert('파일명에 특수문자를 제거해주세요.');
	  $('#input-image').val("");
 }
}



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
						maxlength="30" name="cl_name" placeholder="동호회명을 입력해주세요">
					<div id="nameSpan"></div>
				</div>

				<script>



$('#cl_name').on('keyup', () => {
	
	if(
		$('#cl_name').val().length < 3
	){
		console.log('sdad');
		$('#nameSpan').text("동호회명은 3자 이상으로 작성해주세요");
	}else if($('#cl_name').val().length > 29){
		$('#nameSpan').text("30자 이내로 작성해주세요");
	}else{
		$('#nameSpan').text("");
	}
})


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
			} else {
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
					<i class="fas fa-male"></i> <input type="text"
						placeholder="${mem_id }" disabled> <input
						type="hidden" value="${user_name }" name="cl_boss_name">
					<input type="hidden" name="cl_boss_id" value="${mem_id }">
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
				
//다음 버튼 클릭시 동호회명 , 정원 입력했는지 확인한다.
		$('#container_nextBtn').on('click', () => {
			
				
	  		if ($("#cl_name").val() == "") {
				alert("동호회명을 입력해주세요");
				return false;

			}
			if ($("#maxMem").val() == "") {
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


				<!-- 동호회 카테고리 임시 로직 -->
				<!-- 				<div id="categoryBoxes"> -->
				<!-- 					<div id="categoryBox_music" class="category"> -->
				<!-- 						<span>음악</span> <input type="hidden" name="cl_category_id" -->
				<!-- 							class="cl_category_id" id="music_category"> -->
				<!-- 					</div> -->

				<!-- 					<div id="categoryBox_sports" class="category"> -->
				<!-- 						<span>스포츠</span> <input type="hidden" name="cl_category_id" -->
				<!-- 							class="cl_category_id" id="sports_category"> -->
				<!-- 					</div> -->
				<!-- 				</div> -->

				<script> 

// 등록하기 클릭시 동호회 분류가 선택되어있는지 확인한
//  $('#clSubmit').on('click', () => {
//     if($('.cl_category_id').val=""){
//        alert('관심있는 동호회 분류를 선택해주세요');
//     }
//  })

 //음악 카테고리 출력시 다른 카테고리에 값 무효화 시키고 음악 값을 넣어준다. 
//  $('#categoryBox_music').on('click', () => {
//     $('.cl_category_id').val="";
//     $('#music_category').val="음악";
//  })

//  $('#categoryBox_sprots').on('click', () => {
//     $('.cl_category_id').val="";
//     $('#sports_category').val="스포츠";
//  })
		
</script>

				<!-- 동호회 카테고리 임시 로직 끝  -->




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

	<!-- 돌아가기 버튼 클릭시 첫번째 컨테이너 나타내고 두번째 컨테이너 숨긴다. -->
	<script>
      $('#container_back').on('click', () => {
         $('#club_first_container').show(1000);
         $('#club_second_container').hide(1000);
      })

	//등록하기 버튼 클릭시 작성되어있지 않은 곳이 있는지 확인 
     $('#clSubmit').on('click', () => {
    	 
			
			if ($("#cl_desc").val() == "") {
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
			
			//동호회 이름 및 정원을 기재하지않거나, 정규식에 부합하는 경우 메세지를 출력하는데 메세지가 있다면 Submit 막는다.
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