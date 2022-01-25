<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ClubList</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/clubList/clubList.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


</head>
<body>

	<div class="container">
		<form action="/clubList/searchClub" method="get" id="search_form">
			<div class="search_area">
				<div class="search_area_inner">
					<select name="searchField" id="selectBox">
						<option value="cl_name">동호회명
						<option value="cl_local">지역
						<option value="cl_boss_name">동호회장
					</select>
					<div class="search_input_area">
						<div class="search_input_area_text">
							<input type="text" class="search_club" name="searchText"
								id="input_search" placeholder="찾고 싶은 동호회를 검색해 보세요!">
						</div>
						<div class="search_input_area_btn">


							<button type="button" id="search_btn">
								<i class="fas fa-search"></i>
							</button>

							<script>
                $('#search_btn').on('click', () => {
                  if($('#input_search').val() == "" ||
                  $('#input_search').val() == " "
                  ){
                    alert("공백은 허용되지않습니다");
                    $('#input_search').val() == "";
                  }else{
                    $('#search_form').submit();
                  }
                })
              </script>

						</div>
					</div>
				</div>
			</div>
		</form>


		<!-- 동호회 리스트 반복문 시작 -->
		<div class="fav_club_list_wrap">
			<div class="fav_club_list_row">
				<c:forEach var="clubList" items="${list }">
					<ul class="fav_club_list">
						<li class="fav_club_list_item_wrap">
							<div class="fav_club_list_item">
								<h2><a href="/clubMainIntro/clubIntro?cl_id=${clubList.CL_ID }">${clubList.CL_NAME }</a></h2>
								<b>${clubList.CL_BOSS_NAME}</b> <span>${clubList.CL_LOCAL }</span>
								<p>${clubList.CL_DESC }</p>
							</div>
						</li>

				</c:forEach>
				<!-- 동호회 리스트 반복문 종료 -->
				</ul>
			</div>
			<!--위에 ul div 수정시  CSS 무너짐 조심 -->


			<div class="fav_club_list_add_btn">
				<input type="button" value="5개 더보기">
			</div>
		</div>
	</div>
	
	<!-- 동호회 해체 알림 -->
	<c:if test="${break_result eq '1' }">
		<script>
			alert("해당 동호회가 해체되었습니다...");
		    location.href = "/club";
		</script>
	</c:if>

</body>
</html>