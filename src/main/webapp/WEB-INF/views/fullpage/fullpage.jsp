<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<link rel="stylesheet" type="text/css" href="/css/fullpage/jquery.fullpage.css">
    <link rel="stylesheet" href="main.css"> <!--상단 바 용-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/jquery.fullPage.js"></script>
    <script src="/js/main.js"></script> 

<title>Fullpage</title>

<style>



#fp-nav ul li a span, 
.fp-slidesNav ul li a span { /* navi 바 색깔*/
    background: black;
}
.section{
    background-color:black;
    background-size: 100% 100%;
    /* opacity: 80%;  */
}

#section01{
    background-image: url("images/main/11.jpg");
}

/* #section02{
     background-image: url("22.jpg"); 
} */

#slide01{
    background-image: url("images/main/22.jpg");
    background-size: 100% 100%;
}

#slide02{
    background-image: url("images/main/111.jpg");
    background-size: 100% 100%;
}

#slide03{
    background-image: url("images/main/333.jpg");
    background-size: 100% 100%;
}

#section03{
    background-image: url("images/main/33.jpg");
}

#section04{
    background-image: url("images/main/444.jpg");
    opacity: 80%;
}

   
</style>


</head>
<body>
 


    <div id="fullpage">
        <div class="section" id="section01">
            <h1 style="color: white; text-align: center; font-size: 3.5rem; line-height: 20ch; "  >바쁜 일상속에서 하나의 취미</h1>
        </div> <!-- section01 -->
        <div class="section" id="section02">
            <div class="slide" id="slide01">
                <h3>slide 01</h3>
                <h1 style="color: white; text-align: center; font-size: 60px;">스포츠도 있구</h1>
            </div>
            <div class="slide" id="slide02">
                <h3>slide 02</h3>
                <h1 style="color: white; text-align: center; font-size: 60px;">사진도 있구</h1>
            </div>
            <div class="slide" id="slide03">
                <h3>slide 03</h3>
                <h1 style="color: white; text-align: center; font-size: 60px;">공부도 있구</h1>
            </div>
        </div> <!-- section02 -->
        <div class="section" id="section03">
            <h1 style="color: white; text-align: center; font-size: 60px;">저희 사이트는 주식정보도 제공해드려요!</h1>
        </div> <!-- section03 -->
        <div class="section" id="section04">
            <h2>section 4</h2>
            <h1>바쁜 일상 <br>
                자신이 좋아하는 취미를 여러사람과 함께 공유하며 <br>
                일상에 여유를 찾는것은 어떨까요?</h1>
        </div> <!-- section04 -->
        <div class="section fp-auto-height" id="section05" >
            <h2 style="color: white;">footer</h2>
        </div> <!-- footer -->
    </div> 



    




</body>
</html>