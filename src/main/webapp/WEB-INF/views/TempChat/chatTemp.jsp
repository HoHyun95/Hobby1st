
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
	
	<link rel="stylesheet" href="/css/chat/chat.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>


<body>
	<div class="container">
		<div class="row">
			<div class="col-md-8">
				<div class="message-box">
					<div class="head-box-1">

						<ul
							class="msg-box list-inline text-left d-inline-block float-left">
							<li><i class="fas fa-arrow-left" id="back"></i></li>
							<li>
							<img src="${pageContext.request.contextPath}/clubPic/${clubInfo[0].CLP_PHOTO}" class="club_photo">
								
								
					
								 <span> ${clubInfo[0].CL_NAME } </span> <br></li>
						</ul>

						<ul
							class="flat-icon list-inline text-right d-inline-block float-right">
							<li><i class="fas fa-video"></i> </a></li>
							<li><i class="fas fa-camera"></i> </a></li>
							<li></li>
						</ul>

					</div>


					<!-- 메세지 컨텐츠 시작 -->
					<div id="chat_contents">
						<div class="incoming_msg">
							<div class="received_msg">
							
							<!-- DB 에서 출력 후 보낸 사람을 출력하자  -->
							 <div class="sender"> temp sender </div>
							 
							 <!-- ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ -->
								<div class="received_withd_msg">
									<p>Lorem Ipsum is simply dummy text</p>
									<span class="time_date"> 11:01 AM | June 9</span>
								</div>
							</div>
						</div>

						<!--내가 보내는 메세지-->
						<div class="outgoing_msg">
							<div class="sent_msg">
								<p>Lorem Ipsum is simply dummy text</p>
								<span class="time_date"> 11:01 AM | June 9</span>
							</div>
						</div>
					</div>

					<!--메세지 보내는 라인-->
					<div class="send-message">

						<input type="text" class="form-control" name="chat_writer"
							id="sendText" placeholder="Type your message here ..." />

						<!--  멤버 리스트 가져와서 멤버 이름 넣는다 .  -->

					
						<input type="hidden" id="mem_writer"
							value="${member[0].mem_name }">


						<!-- session 의 멤버 이름 -->
						<input type="hidden" id="session_user_name" value="${user_name }">
						
						
						<!--이모티콘, 사진, 전송 버튼-->
						<ul class="list-inline">
							<li><i class="fas fa-paper-plane" id="chatSendBtn"></i></li>
						</ul>
					</div>


				</div>
			</div>



			<script>

			
		      
// 	        function updateScroll() {
// 	            var element = document.getElementById("contents");
// 	            $(element).scrollTop(element.scrollHeight);
// 	        }
			
	        console.log("dd");
			
			console.log(""+$('#mem_writer').val());
			console.log("세션 멤버 이름 : "+$('#session_user_name').val());
			
     let ws = new WebSocket("ws://localhost/chat");

     ws.onmessage = function(e){
 		let eData = e.data;
 		console.log("eData 값 :" + eData);
 		
 		  let htmlData ="";
     		let identity = 0;
 		  
    	if($('#mem_writer').val() == $('#session_user_name').val()){
    		
    		console.log("내가 보내는 메세지 ");
    		
    		htmlData += "<div class='outgoing_msg'>";
			htmlData +=   	"<div class='sent_msg'>";
    		htmlData +=			"<p>"+eData+"</p>";
    		htmlData += 		"<span class='time_date'>오늘</span>"
    		htmlData += 	"</div>"
    		htmlData +=	"</div>"
    		
    		identity = 1;
    		
    	}else{
    		
    		console.log("수신 메세지");
    		
            htmlData += "<div class='incoming-msg'>";
            htmlData += "	<div class='received_msg'>";
            htmlData += "		<div class='received_withd_msg'>";
            htmlData += "			<p>"+eData+"</p>";
            htmlData += " 		</div>";
            htmlData += " 	</div>";
            htmlData += "</div>";
            
            identity = 0;
         }
    	
        $('#chat_contents').append(htmlData);
    	};

      
 $('#chatSendBtn').on('click', () => {
    let text = $('#sendText').val();
    $('#sendText').val("");
    $('#sendText').focus();

    ws.send(text);
    
 })

   </script>
</body>
</html>