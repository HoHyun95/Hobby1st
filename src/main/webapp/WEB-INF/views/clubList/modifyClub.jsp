<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
	<div class="createClub_wrap">
		<form action="/clubList/modifyClubProc" method="post" id="clubModifyForm" enctype="multipart/form-data">
		 <span id="createClub_close_btn"><i class="far fa-times"></i></span>
		<span id="slideLeft"><i class="far fa-arrow-alt-circle-left"></i></span>
		<span id="slideRight"><i class="far fa-arrow-alt-circle-right"></i></span>
		<span id="createClub"><button type="button" id="modifyClubBtn">동호회 수정</button></span>
		<div class="createClub_container">
		  <div class="steps_wrap">
			 <div class="steps_item_wrap">
				<div class="steps_item_line">
				  <hr class="active_bg">
				</div>
				<div class="steps_item_title"><span class="active_text">STEP 1</span></div>
				<div class="steps_item_detail">동호회 기본 정보 수정</div>
			 </div>
			 <div class="steps_item_wrap">
				<div class="steps_item_line">
				  <hr class="active_bg">
				</div>
				<div class="steps_item_title"><span class="active_text">STEP 2</span></div>
				<div class="steps_item_detail">동호회 사진 수정</div>
			 </div>
			 <div class="steps_item_wrap">
				<div class="steps_item_line">
				  <hr class="active_bg">
				</div>
				<div class="steps_item_title"><span class="active_text">STEP 3</span></div>
				<div class="steps_item_detail">동호회 지역 수정</div>
			 </div>
			 <div class="steps_item_wrap">
				<div class="steps_item_line">
				  <hr class="active_bg">
				</div>
				<div class="steps_item_title"><span class="active_text">STEP 4</span></div>
				<div class="steps_item_detail">동호회 카테고리 수정</div>
			 </div>
		  </div>
		  <div class="contents_wrap">
			 <div class="contents_item_wrap">
				<div class="contents_item">
				  <div class="desc">
				<input type="hidden" name="cl_id" value="${club[0].cl_id }">
				  </div>
				  <div class="title">
					 <i class="fas fa-users"> 동호회명</i>
				  </div>
				  <div class="input">
					 <input type="text" id="cl_name" maxlength="30" name="cl_name" value="${club[0].cl_name}" readonly>
				  </div>
				  <span class="resultSpan" id="cl_name_valid"></span>
				  <div class="title">
					 <i class="fas fa-user"> 동호회장 ID</i>
				  </div>
				  <div class="input">
					 <input type="text" id="cl_boss_id" maxlength="30" name="cl_boss_id" value="${mem_id}" readonly>
				  </div>
				  <div class="title">
					 <i class="fas fa-user"> 동호회장 이름</i>
				  </div>
				  <div class="input">
					 <input type="text" id="cl_boss_name" maxlength="30" name="cl_boss_name" value="${user_name}" readonly>
				  </div>
				  <div class="title">
					 <i class="fas fa-users-cog"> 동호회 정원</i>
				  </div>
					 <span id="cl_maxMem_valid"></span>
				  <div class="input">
					 <input type="text" id="cl_maxMem" maxlength="3" name="cl_maxMem" value="${club[0].cl_maxMem }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
				  </div>
				  <div class="title">
					 <i class="far fa-file-alt"> 동호회 소개</i>
				  </div>
				  <textarea id="cl_desc" name="cl_desc" cols="68" rows="10" style="resize: none;" placeholder="동호회 소개글을 작성해주세요">${club[0].cl_desc }</textarea>
				</div>
				 <span class="resultSpan" id="cl_desc_valid"></span>
				<div class="contents_item">
				  <div class="desc">
					 <h3>동호회의 사진을 등록해 주세요!</h3>
					 <h5>사진을 등록하지 않으시면 기본 이미지가 제공됩니다!</h5>
				  </div>
				  <div class="title">
					 동호회 사진
				  </div>
				  <div class="img_box">
					 <img src="${club[0].cl_photo }" alt="" id="preview_img" name="cl_photo">
				  </div>
				  <div class="input">
					 <input name="file" type="file" id="image-input" accept="image/*">
				  </div>
				</div>
				<div class="contents_item">
				  <div class="desc">
					 <h3>동호회 주요 활동 지역을 입력해 주세요!</h3>
					 <h5>지역 네트워크를 통해 활발하게 동호회 활동을 즐겨보세요!</h5>
				  </div>
				  <div class="title">
					 <i class="fas fa-city"> 활동 지역</i>
				  </div>
				  <div class="input">
					 <select name="cl_local" id="cl_local">
						<option value="서울">서울</option>
						<option value="경기">경기</option>
						<option value="인천">인천</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="대전">대전</option>
						<option value="세종">세종</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="광주">광주</option>
						<option value="경북">경북</option>
						<option value="대구">대구</option>
						<option value="경남">경남</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="제주">제주</option>
					 </select>
				  </div>
				</div>
				<div class="contents_item">
				  <div class="desc">
					 <h3>동호회 카테고리를 입력해 주세요!</h3>
					 <h5>Hobby1st에서 관심사가 같은 사람들과 동호회 활동을 즐겨보세요!</h5>
				  </div>
				  <div class="title">
					 <i class="fas fa-archive"> 대분류</i>
				  </div>
				  <div class="input">
					 <select name="cl_category_id" id="cl_category_id">
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
					 </select>
				  </div>
				  <div class="title">
					 <i class="fas fa-asterisk"> 소분류</i>
				  </div>
				  <div class="input">
					 <select name="cl_dCategory_id" id="cl_dCategory_id">
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
						<option value="ITEM1">ITEM 1</option>
					 </select>
				  </div>
				</div>
			 </div>
		  </div>
	  </form>
		</div>
	  
	  <script>
	  function readImage(input) {
		    if (input.files && input.files[0]) {
		      const reader = new FileReader()
		      reader.onload = e => {
		        const previewImage = document.getElementById("preview_img");
		        previewImage.src = e.target.result
		      }
		      reader.readAsDataURL(input.files[0])
		    }
		  }
		  
		  const inputImage = document.getElementById("image-input");
		  inputImage.addEventListener("change", e => {
		    readImage(e.target)
		  });
		  
		  
// 		  $('#cl_name').on('keyup', () => {
// 				if(
// 					$('#cl_name').val().length < 3
// 				){
// 					$('#nameSpan').text("동호회명은 3자 이상으로 작성해주세요");
// 				}else if($('#cl_name').val().length > 29){
// 					$('#nameSpan').text("30자 이내로 작성해주세요");
// 				}else{
// 					$('#nameSpan').text("");
// 				}
// 			})
	  
// 	  let cl_name = document.querySelector('#cl_name');
// 	  let cl_name_valid = document.querySelector('#cl_name_valid');
	  
// 	  cl_name.addEventListener('blur', () => {
// 		  if(cl_name.value.length < 3){
// 			  cl_name_valid.innerHTML = "동호회명은 3자 이상으로 작성해주세요";
// 		  }else if(cl_name.value.length > 29){
// 			  cl_name_valid.innerHTML = "30자 이내로 작성해주세요";
// 		  }else{
// 			  cl_name_valid.innerHTML ="";
			  
// 			   $.ajax({
// 					  url : "/clubList/nameCheck",
// 					  data : { cl_name : cl_name.value }
// 					}).done((resp) => {

// 					  if (cl_name.value !== "") {
// 						if (resp > 0) {
// 						  cl_name_valid.innerHTML ="이미 사용중인 동호회명입니다";
// 						  cl_name.value="";
// 						  cl_name.focus();
// 						} else {
// 						  cl_name_valid.innerHTML="";
// 						}
// 					  } else {
// 						cl_name_valid.innerHTML="동호회명을 입력해주세요";
// 					  }
// 				    }); 
// 		  }
// 	  })
	  
	  
	  	let cl_maxMem = document.querySelector('#cl_maxMem');
	  	cl_maxMem.addEventListener('blur', () => {
	  		if (cl_maxMem.value > 100){
	  			document.querySelector('#cl_maxMem_valid').innerHTML="정원은 100명을 초과할 수 없습니다";
	  			cl_maxMem.focus();
	  		}else{
	  			document.querySelector('#cl_maxMem_valid').innerHTML="";
	  		}
	  })
	 
	  
	  document.querySelector('#modifyClubBtn').addEventListener('click', () => {
			if ($("#cl_desc").val() == "") {
				alert("동호회 소개글을 입력해주세요");
				return false;
			}
			if(
				$('#cl_maxMem_valid').text() != "" ||
				$('#cl_name_valid').text() != ""   ||	
				$('#cl_desc_valid').text() != ""
			){
				alert("정보를 정확히 입력해주세요");	
	  		}if($('#image-input').val == null){
		  		alert("동호회 대표 사진을 등록해주세요");
		  		return false;
	  	   }else{
			$('#clubModifyForm').submit();
		  }}
	  )
	  
	  
	  
	  </script>

</body>
</html>