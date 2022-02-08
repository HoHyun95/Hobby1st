
<!--
=========================================================
* Material Dashboard 2 - v3.0.0
=========================================================

* Product Page: https://www.creative-tim.com/product/material-dashboard
* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <link rel="stylesheet" href="/css/footer.css">
  <title>
   	게시판 관리
  </title>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700,900|Roboto+Slab:400,700" />
  <!-- Nucleo Icons -->
  <link href="../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <!-- Material Icons -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Round" rel="stylesheet">
  <!-- CSS Files -->
  <link id="pagestyle" href="../assets/css/material-dashboard.css?v=3.0.0" rel="stylesheet" />
  <style>
    button {
      border: 1px solid tomato;
      padding: 3px 5px 3px 5px;
      font-size: 0.8rem;
      color: tomato;
      background-color: transparent;
    }
  </style>
</head>

<body class="g-sidenav-show  bg-gray-200">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href="/" >
        <img src="../assets/img/logo-ct.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold text-white">Hobby1st</span>
      </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto  max-height-vh-100" id="sidenav-collapse-main">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link text-white " href="/admin">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">dashboard</i>
            </div>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="/admin/clubAdmin?cpage=1">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">동호회관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white active bg-gradient-primary " href="/admin/boardAdmin?cpage=1">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">게시판관리</span>
          </a>
         </li>
         <li class="nav-item">
          <a class="nav-link text-white" href="/admin/noticeAdmin?cpage=1">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">table_view</i>
            </div>
            <span class="nav-link-text ms-1">공지사항 관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="/admin/memberAdmin?cpage=1">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">receipt_long</i>
            </div>
            <span class="nav-link-text ms-1">회원관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white " href="/admin/voteAdmin">
            <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
              <i class="material-icons opacity-10">receipt_long</i>
            </div>
            <span class="nav-link-text ms-1">투표관리</span>
          </a>
        </li>
        
      </ul>
    </div>
    <div class="sidenav-footer position-absolute w-100 bottom-0 ">
      <div class="mx-3">
        <a href="/admin/logout" class="btn bg-gradient-primary mt-4 w-100"  type="button">Logout</a>
      </div>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="javascript:;">관리자</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">게시판 관리</li>
          </ol>
          <h6 class="font-weight-bolder mb-0">게시판 관리</h6>
        </nav>
       
       </div>
    </nav>
    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12">
          <div class="card my-4">
            <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
              <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                <h6 class="text-white text-capitalize ps-3">게시판 관리</h6>
              </div>
            </div>
            <div class="card-body px-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                    <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글번호</th>
                      <!-- <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글 번호</th> -->
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">게시물</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성자</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성날짜</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7"></th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="dto" items="${adminClubBoard}">
                    <tr> <!-- for 문 시작점 -->
                      
                      <td>
                        <p class="text-xs font-weight-bold mb-0 text-center">${dto.cb_seq }</p>
                      </td> 
                      <td>
                        <p class="text-xs font-weight-bold mb-0"><a href="/clubBoard/boardDetail?cb_seq=${dto.cb_seq }&check_num=1&cpage=1&keyword=&searchWord=">
											${dto.cb_title }</a></p>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${dto.cb_writer }</span>
                      </td>
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold">${dto.detailDate }</span>
                      </td>
                      
                      <td class="align-middle text-center">
                        <button class="boardDelBtn${dto.cb_seq } text-secondary font-weight-bold text-xs">삭제</button>
                      </td>
              
                      
				<script>					
					
				$('.boardDelBtn${dto.cb_seq}').on('click', () => {
					if(confirm("정말로 삭제하시겠습니까?")){
						$.ajax({
							url : "/clubBoard/deleteBoardAdmin?cb_seq=${dto.cb_seq}"
						}).done(function(result){
							if(result == 1){
								alert("성공적으로 삭제하였습니다");
							}else{
								alert("게시글을 삭제 하는 과정에서 문제가 발생하였습니다");
								location.reload();
									}
								})				
							}
						})
//x
				
				</script>
                      
                    </tr> <!-- for문 마지막 -->
                   </c:forEach>
                  </tbody>
                </table>
                	<div class="navi" style="text-align : center; line-height: 60px">
						${navi }
					</div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
       <div class="footer">

			<div class="footer">
				<div class="footer_inner">
					<div class="footer_logo">
						<img src="/images/LOGO.png">
					</div>
					<div class="footer_contents">
						<div class="footer_desc">
							<ul class="footer_desc_list">
								<li class="footer_desc_list_item">Hobby1st 고객센터
									02-1234-5678 (평일 09:00~18:00, 주말·공휴일 휴무)</li>
								<li class="footer_desc_list_item">(주)Hobby1st 04540, 서울특별시
									중구 남대문로 120, 대일빌딩 2F, 3F</li>
								<li class="footer_desc_list_item">Copyright (c)
									(주)Hobby1st. 2022 All rights reserved.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!--footer-->
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="material-icons py-2">settings</i>
    </a>
    <div class="card shadow-lg">
      <div class="card-header pb-0 pt-3">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Hobby1st</h5>
          <p>관리자 페이지</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="material-icons">clear</i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">클릭 색깔</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">사이드 바 색 선택</h6>
          <p class="text-sm">Black or White</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-dark px-3 mb-2 active" data-class="bg-gradient-dark" onclick="sidebarType(this)">Dark</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-dark px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">You can change the sidenav type just on desktop view.</p>
        
        <hr class="horizontal dark my-3">
        <div class="mt-2 d-flex">
          <h6 class="mb-0">Light / Dark</h6>
          <div class="form-check form-switch ps-0 ms-auto my-auto">
            <input class="form-check-input mt-1 ms-auto" type="checkbox" id="dark-version" onclick="darkMode(this)">
          </div>
        </div>
        <hr class="horizontal dark my-sm-4">
      </div>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="../assets/js/core/popper.min.js"></script>
  <script src="../assets/js/core/bootstrap.min.js"></script>
  <script src="../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="../assets/js/material-dashboard.min.js?v=3.0.0"></script>
</body>

</html>