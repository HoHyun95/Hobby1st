<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />

    <style>
        * {
            box-sizing: border-box;
        }

        div{
            
        }

        .container{
            width: 50%;
            margin: auto;
            margin-top: 100px;
            border: 1px solid rgb(199, 197, 197);
        }

        .write{
            text-align: center;
        }

        .items{
            text-align: center;
            padding-left: 5%;
            padding-right: 5%;
            border: 1px solid rgb(199, 197, 197);
        }


        .title_input{
            width: 100%;
            height: 50px;
        }

        .answers_input{
            width: 100%;
            height: 40px;
            margin-bottom: 5px;
        }
        .control_answers{
            margin-top: 10px;
            margin-bottom: 15px;
        }

        .pick_type{
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .write{
            margin-top: 20px;

            margin-bottom: 20px;
        }

        .edate{
            margin-top: 10px;
            text-align: center;
        }
        
    </style>
</head>

<body>

    <form action="voteWrite">

    
    <div class="container">
        <div class="title">
            <input class="title_input" type="text" placeholder="투표 제목">
        </div>

        <div class="items">
            <div class="pick_type">
                <input type="radio" name="pick" id="pick1" value="0" checked>
                <label  class="pick1_label" for="pick1">단일선택</label>
    
                <input type="radio" name="pick" id="pick2" value="1">
                <label class="pick1_labe2" for="pick2">중복선택</label>
            </div>
    
            <div class="answers" style="display: block;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력" value="">
            </div>
    
            <div class="answers" style="display: block;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" type="text" name="option" placeholder="항목 입력">
            </div>
    
    
            <div class="control_answers">
                <button type="button" class="minus_aw"> - 항목 줄이기</button>
                &nbsp; &nbsp;
                <button type="button" class="plus_aw"> + 항목 추가</button>
            </div>
        </div>
        
        

        <div class="edate">
            
                
            
    
            <div class="end_date">
                <i class="far fa-clock"></i>

                마감시간 설정
                <select name="edateY">
                    <option value="2022">2022</option>
                    <option value="2023">2023</option>
                </select>년
    
                <select name="edateM">
                    <script>
                        for(i=1; i<=12; i++) {                       
                            document.write("<option value='"+ i + "'>" + i + "</option>");                  
                        }
                    </script>
                </select>월
    
                <select name="edateD">
                    <script>
                        for(i=1; i<=31; i++) {                       
                            document.write("<option value='"+ i + "'>" + i + "</option>");                  
                        }
                    </script>
                </select>일
            </div>
        </div>

        

        <div class="write">
            <button type="reset">다시 작성</button>
            <button>작성하기</button>
        </div>
        
    </div>
</form>

    <script>
        let index = 1;

        $(".plus_aw").on("click", function() {
            if(index >= 9) {
                alert("최대 10개까지 등록가능합니다.");
                return false;
            }
            index = index + 1;
            $(".items").children(".answers").eq(index).css('display','block');
            $(".items").children(".answers").eq(index).children("input").val("")
            
        })

        $(".minus_aw").on("click", function() {
            
            if(index < 2) {
                alert("최대 2개 이상은 등록하셔야합니다.");
                return false;
            }

            $(".items").children(".answers").eq(index).css('display','none');
            index = index - 1;
        })
    </script>

</body>
</html>