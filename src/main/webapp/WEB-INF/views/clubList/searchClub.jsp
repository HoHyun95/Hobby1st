<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search List about Club</title>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link rel="stylesheet" href="/css/clubList/searchClub.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>

	<div class="container">
		<form action="/clubList/searchClub" method="post" id="search_form">
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
                    return; 
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

		<div class="fav_club_list_wrap">
			<div class="fav_club_list_row">

				<c:choose>
					<c:when test="${searchList!= null }">
						<c:forEach var="clubList" items="${searchList }">
							<ul class="fav_club_list">
								<li class="fav_club_list_item_wrap">
									<div class="fav_club_list_item">
										<h2><a href="/clubList/clubInfo?cl_id=${clubList.cl_id }">${clubList.cl_name }</a></h2>
										<b>${clubList.cl_boss_name}</b> <span>${clubList.cl_local }</span>
										<p>${clubList.cl_desc }</p>
									</div>
								</li>
						</c:forEach>

					</c:when>

					<c:otherwise>
						<div>검색 결과가 존재하지않습니다</div>
					</c:otherwise>

				</c:choose>

				</ul>
			</div>


			<!-- 			<div class="fav_club_list_add_btn"> -->
			<!-- 				<input type="button" value="5개 더보기"> -->
			<!-- 			</div> -->
		</div>
	</div>


</body>
</html>