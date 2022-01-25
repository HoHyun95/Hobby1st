<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CREATE CLUB</title>
  <link rel="stylesheet" href="css/default.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link rel="stylesheet" href="css/createClub.css">
  <script>
    window.onload = () => {
      let createClubBtn = document.getElementById("createClubBtn");
      let slideLeft = document.getElementById("slideLeft");
      let slideRight = document.getElementById("slideRight");
      let createClub_container = document.querySelector(".createClub_container");
      let MOVE_WIDTH = 528;
      let position = 0;

      let current_point = 0;

      let end_point = MOVE_WIDTH * 3;

      if (current_point == 0) {
        slideLeft.style.display = "none";
      }

      if (current_point == end_point) {
        slideRight.style.display = "none";
      }

      slideRight.onclick = () => {
        current_point += MOVE_WIDTH;
        if (current_point == end_point) {
          slideRight.style.display = "none";
          createClubBtn.style.display ="inline";
          slideLeft.style.display = "inline";
        } else if(current_point > 0) {
          slideLeft.style.display = "inline";
          createClubBtn.style.display ="none";
        }
        position -= MOVE_WIDTH;
        createClub_container.style.transform = "translateX(" + (position) + "px)";
        console.log(position);

      }

      slideLeft.onclick = () => {
        current_point -= MOVE_WIDTH;
        if (current_point == 0) {
          slideLeft.style.display = "none";
          slideRight.style.display = "inline";
          createClubBtn.style.display ="none";
        } else if(current_point < end_point) {
          slideRight.style.display = "inline";
          createClubBtn.style.display ="none";
        }
        position += MOVE_WIDTH;
        createClub_container.style.transform = "translateX(" + (position) + "px)";
        console.log(position);

      }
    }
  </script>
</head>

<body>
  <div class="createClub_wrap">
    <div class="createClub_container">
      <span id="createClub_close_btn"><i class="far fa-times"></i></span>
      <span id="slideLeft"><i class="far fa-arrow-alt-circle-left"></i></span>
      <span id="slideRight"><i class="far fa-arrow-alt-circle-right"></i></span>
      <span id="createClub"><button id="createClubBtn">동호회 생성</button></span>
      <div class="steps_wrap">
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 1</span></div>
          <div class="steps_item_detail">동호회 기본 정보 등록</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 2</span></div>
          <div class="steps_item_detail">동호회 사진 등록</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 3</span></div>
          <div class="steps_item_detail">동호회 지역 선택</div>
        </div>
        <div class="steps_item_wrap">
          <div class="steps_item_line">
            <hr class="active_bg">
          </div>
          <div class="steps_item_title"><span class="active_text">STEP 4</span></div>
          <div class="steps_item_detail">동호회 카테고리 선택</div>
        </div>
      </div>
      <div class="contents_wrap">
        <div class="contents_item_wrap">
          <div class="contents_item">
            <div class="desc">
              <h3>동호회의 기본 정보를 입력해 주세요!</h3>
              <h5>특별한 동호회명으로 회원들의 시선을 사로잡아 보세요!</h5>
            </div>
            <div class="title">
              <i class="fas fa-users"> 동호회명</i>
            </div>
            <div class="input">
              <input type="text" id="cl_name" maxlength="30" name="cl_name" placeholder="동호회명을 입력해주세요">
            </div>
            <div class="title">
              <i class="fas fa-users"> 동호회장 ID</i>
            </div>
            <div class="input">
              <input type="text" id="cl_boss_id" maxlength="30" name="cl_boss_id" value="11hertz" readonly>
            </div>
            <div class="title">
              <i class="fas fa-users-cog"> 동호회 정원</i>
            </div>
            <div class="input">
              <input type="text" id="cl_maxMem" maxlength="3" name="cl_maxMem" placeholder="최대정원을 정해주세요" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
            </div>
            <div class="title">
              <i class="far fa-file-alt"> 동호회 소개</i>
            </div>
            <textarea id="cl_desc" name="cl_desc" cols="68" rows="10" style="resize: none;"></textarea>
          </div>
          <div class="contents_item">
            <div class="desc">
              <h3>동호회의 사진을 등록해 주세요!</h3>
              <h5>사진을 등록하지 않으시면 기본 이미지가 제공됩니다!</h5>
            </div>
            <div class="title">
              동호회 사진
            </div>
            <div class="img_box">
              
            </div>
            <div class="input">
              <input name="file" type="file" id="input-image">
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
              <select name="cl_category" id="cl_category">
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
              <select name="cl_category" id="cl_category">
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
    </div>
  </div>
</body>

</html>