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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <style>
        * {
            box-sizing: border-box;
        }

        div{
            
        }

        .container{
            width: 30%;
            margin: auto;
            margin-top: 100px;
            border: 1px solid rgb(177, 177, 177);
            border-radius: 10px;
            padding: 1.5%;
        }

        .write{
            text-align: center;
        }

        .items{
            text-align: center;
            padding-left: 5%;
            padding-right: 5%;
            border-bottom: 1px solid rgb(177, 177, 177);
        }
        
        .title{
            border-bottom: 1px solid rgb(177, 177, 177);
        }


        .title_input{
            padding: 2%;
            width: 100%;
            height: 50px;
            border: 0px;
        }

        .answers_input{
            border-radius: 5px;
            border: 1px solid rgb(177, 177, 177);
            width: 100%;
            height: 40px;
            margin-bottom: 5px;
        }
        .control_answers{
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .pick_type{
            margin-top: 20px;
            margin-bottom: 20px;
        }

        .write{
            margin-top: 20px;

            
        }

        .edate{
            margin-top: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .answers{
            margin-bottom: 20px;
        }
        
         .ui-widget-header { border: 0px solid #dddddd; background: #fff; } 

	 .ui-datepicker-calendar>thead>tr>th { font-size: 14px !important; } 
	
	 .ui-datepicker .ui-datepicker-header { position: relative; padding: 10px 0; } 
	
	 .ui-state-default,
	 .ui-widget-content .ui-state-default,
	 .ui-widget-header .ui-state-default,
	 .ui-button,
	 html .ui-button.ui-state-disabled:hover,
	 html .ui-button.ui-state-disabled:active { border: 0px solid #c5c5c5; background-color: transparent; font-weight: normal; color: #454545; text-align: center; } 
	
	 .ui-datepicker .ui-datepicker-title { margin: 0 0em; line-height: 16px; text-align: center; font-size: 14px; padding: 0px; font-weight: bold; } 
	
	 .ui-datepicker { display: none; background-color: #fff; border-radius: 4px; margin-top: 10px; margin-left: 0px; margin-right: 0px; padding: 20px; padding-bottom: 10px; width: 300px; box-shadow: 10px 10px 40px rgba(0, 0, 0, 0.1); } 
	
	 .ui-widget.ui-widget-content { border: 1px solid #eee; } 
	
	 #datepicker:focus>.ui-datepicker { display: block; } 
	
	 .ui-datepicker-prev,
	 .ui-datepicker-next { cursor: pointer; color: #212121; } 
	
	 .ui-datepicker-next { float: right; } 
	
	 .ui-state-disabled { cursor: auto; color: hsla(0, 0%, 80%, 1); } 
	
	 .ui-datepicker-title { text-align: center; padding: 10px; font-weight: 100; font-size: 20px; } 
	
	 .ui-datepicker-calendar { width: 100%; } 
	
	 .ui-datepicker-calendar>thead>tr>th { padding: 5px; font-size: 20px; font-weight: 400; } 
	
	 .ui-datepicker-calendar>tbody>tr>td>a { color: #000; font-size: 12px !important; font-weight: bold !important; text-decoration: none;}
	
	 .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover { cursor: auto; background-color: #fff; } 
	
	 .ui-datepicker-calendar>tbody>tr>td { border-radius: 100%; width: 44px; height: 30px; cursor: pointer; padding: 5px; font-weight: 100; text-align: center; font-size: 12px; } 
	
	 .ui-datepicker-calendar>tbody>tr>td:hover { background-color: transparent; opacity: 0.6; } 
	
	 .ui-state-hover,
	 .ui-widget-content .ui-state-hover,
	 .ui-widget-header .ui-state-hover,
	 .ui-state-focus,
	 .ui-widget-content .ui-state-focus,
	 .ui-widget-header .ui-state-focus,
	 .ui-button:hover,
	 .ui-button:focus { border: 0px solid #cccccc; background-color: transparent; font-weight: normal; color: #2b2b2b; } 
	
	 .ui-widget-header .ui-icon { background-image: url('/images/btns.png'); } 
	
	 .ui-icon-circle-triangle-e { background-position: -20px 0px; background-size: 36px; } 
	
	 .ui-icon-circle-triangle-w { background-position: -0px -0px; background-size: 36px; } 
	
	 .ui-datepicker-calendar>tbody>tr>td:first-child a { color: red !important; } 
	
	 .ui-datepicker-calendar>tbody>tr>td:last-child a { color: #0099ff !important; } 
	
	 .ui-datepicker-calendar>thead>tr>th:first-child { color: red !important; } 
	
	 .ui-datepicker-calendar>thead>tr>th:last-child { color: #0099ff !important; } 
	
	 .ui-state-highlight,
	 .ui-widget-content .ui-state-highlight,
	 .ui-widget-header .ui-state-highlight { border: 0px; background: #f1f1f1; border-radius: 50%; padding-top: 10px; padding-bottom: 10px; } 
	
	 .inp { padding: 10px 10px; background-color: #f1f1f1; border-radius: 4px; border: 0px; } 
	
	 .inp:focus { outline: none; background-color: #eee; } 
        
        
    button {
	  border: 1px solid #212121;
	  padding: 3px 5px 3px 5px;
	  font-size: 0.8rem;
	  color: white;
	  background-color: #212121;	
	}
	
	button:hover {
	  cursor: pointer;	
	}

    </style>
</head>

<body>

    <form action="/vote/voteWrite" method="post">

    
    <div class="container">
        <div class="title">
            <input class="title_input" name="vl_title" type="text" placeholder="투표 제목">
        </div>

        <div class="items">
            <div class="pick_type">
                <input type="radio" name="vl_type" id="pick1" value="0" checked>
                <label  class="pick1_label" for="pick1">단일선택</label>
    
                <input type="radio" name="vl_type" id="pick2" value="1">
                <label class="pick1_labe2" for="pick2">중복선택</label>
            </div>
    
            <div class="answers" style="display: block;">
                <input class="answers_input" id="option1" type="text" name="option" placeholder="항목 입력" value="">
            </div>
    
            <div class="answers" style="display: block;">
                <input class="answers_input" id="option2" type="text" name="option" placeholder="항목 입력" value="">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option3" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option4" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option5" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option6" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option7" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option8" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option9" type="text" placeholder="항목 입력" value=".">
            </div>
    
            <div class="answers" style="display: none;">
                <input class="answers_input" id="option10" type="text" placeholder="항목 입력" value=".">
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

                마감일 설정
                <input type="text" name="edate" id="datepicker" placeholder="마감일을 입력해 주세요" autocomplete="off">
			    <script>
			        $(function () {
			            $("#datepicker").datepicker({ 
			              minDate: 1,
			              dateFormat: 'yy-mm-dd'
			            });
			        });
			    </script>

                <!-- <select name="edateY">
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
                </select>일 -->
            </div>
        </div>

        

        <div class="write">
            <button type="reset"><i class="fas fa-redo-alt"></i> 다시 작성</button>
            &nbsp;&nbsp;
<<<<<<< HEAD
            <button class="insert_vote">작성하기</button>
=======
            <button><i class="fas fa-pen-square"></i> 작성하기</button>
>>>>>>> fa9c4ffc77c4149fc5793710e65194ff99fb5da6
        </div>
        
    </div>
</form>

    <script>
    
    // 투표 regex
    $(".insert_vote").on("click", function() {
    	let regex = /^([\S]){1,2000}/;
    	let regex_date = (/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		   
		let title = $(".title_input").val();
		let result1 = regex.test(title);
		
		let date = $("#datepicker").val();
		let result2 = regex_date.test(date);
        
		if(!result1){
  			 alert("제목을 한글자 이상 입력해주세요.\n(공백으로 시작될 수 없습니다.)");
  			 $(".title_input").focus();
  	   		 return false;
 		 }else if(!result2){
 			alert("종료일을 형식에 맞게 선택해주세요. \n형식 : yyyy-mm-dd");
 			return false;
 		 }
		for(let i = 1; i<11; i++){
			if($("#option"+i).val() == ""){
				alert("비어있는 항목이 존재합니다.");
				return false;
			}
		}
		alert("투표가 성공적으로 업로드 되었습니다.");
    })
    
    
        let index = 1;

        $(".plus_aw").on("click", function() {
            if(index >= 9) {
                alert("최대 10개까지 등록가능합니다.");
                return false;
            }
            index = index + 1;
            $(".items").children(".answers").eq(index).css('display','block');
            $(".items").children(".answers").eq(index).children("input").val("")
            $(".items").children(".answers").eq(index).children("input").attr('name','option')
        })

        $(".minus_aw").on("click", function() {
            
            if(index < 2) {
                alert("최대 2개 이상은 등록하셔야합니다.");
                return false;
            }

            $(".items").children(".answers").eq(index).css('display','none');
            $(".items").children(".answers").eq(index).children("input").val(".")
            $(".items").children(".answers").eq(index).children("input").attr('name','')
            index = index - 1;
        })
    </script>

</body>
</html>