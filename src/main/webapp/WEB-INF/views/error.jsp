<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>ERROR PAGE</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
  <style>
    html {
      height: 100%;
      font-family: 'Nanum Brush Script', cursive';

    }

    body {
      position: relative;
      margin: 0;
      padding: 0;
      width: 100%;
      height: 100%;
      background-image: url("/images/background.jpg");
      background-size: 100vw 100vh;
      overflow: hidden;
    }

    h1,
    h2,
    h3,
    h4,
    h5,
    div {
      margin: 0;
      padding: 0;
      overflow: hidden;
      font-family: 'Nanum Brush Script', cursive;
    }

    .wrap {
      width: 100vw;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .text {
      width: 75%;
      height: 50%;
      font-weight: 900;
      z-index: 5;
      color: white;
      text-align: center;
    }

    .one {
      font-size: 2.5rem;
      color: rgb(29, 67, 105);
    }

    .two {
      font-size: 5rem;
    }

    .three {
      font-size: 2.5rem;
      color: white;
    }

    input[type="button"] {
      width: 150px;
      margin-top: 30px;
      padding: 7px 10px 7px 10px;
      font-size: 1.4rem;
      font-family: 'Nanum Brush Script', cursive;
      font-weight: 900;
      color: rgb(29, 67, 105);
      border: 1px solid rgb(29, 67, 105);
      background-color: rgba(255, 255, 255, 0.2);
    }

    input[type="button"]:hover {
      cursor: pointer;
      background-color: rgba(255, 255, 255, 0.5);
    }

    @media screen and (max-width: 950px) {
      .text {
        width: 50%;
        height: 50%;
        font-weight: 900;
        z-index: 5;
        color: white;
        text-align: center;
      }

      .one {
        font-size: 1.5rem;
        color: rgb(29, 67, 105);
      }

      .two {
        font-size: 2.5rem;
      }

      .three {
        font-size: 1.5rem;
        color: white;
      }
    }

    input[type="button"] {
      width: 125px;
      margin-top: 15px;
      padding: 2px 5px 2px 5px;
      font-size: 1.4rem;
      font-family: 'Nanum Brush Script', cursive;
      font-weight: 900;
      color: rgb(29, 67, 105);
      border: 1px solid rgb(29, 67, 105);
      background-color: rgba(255, 255, 255, 0.2);
    }

    input[type="button"]:hover {
      cursor: pointer;
      background-color: rgba(255, 255, 255, 0.5);
    }
  </style>
  <script>
    window.onload = () => {
      let home = document.getElementById("home");

      home.onclick = () => {
        location.href = "/";
      }
    }
  </script>
</head>

<body>
  <div class="wrap">
    <div class="text">
      <div class="one">404 ERROR</div>
      <div class="two">Oh! I think you're lost</div>
      <div class="three">It looks like the page you're looking for doesn't exist.</div>
      <div class="btn">
        <input type="button" value="Go back home" id="home">
      </div>
    </div>
  </div>
</body>

</html>