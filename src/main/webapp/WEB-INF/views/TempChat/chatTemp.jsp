
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
								<!--  동호회 채팅 이미지 --> <img
								src="${pageContext.request.contextPath}/clubPic/${clubInfo[0].CLP_PHOTO}"
								class="club_photo"> <!--  동호회 이름 --> <span>
									${clubInfo[0].CL_NAME } </span> <br>
							</li>
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
								<div class="sender">temp sender</div>

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



						<!-- 채팅 작성자와 session 아이디 일치한 경우 자신이 보낸 메세지로 취급 -->
						<c:forEach var="chatList" items="${chatList }">
							<c:choose>


								<c:when test="${chatList.chat_writer eq user_name }">

									<div class="outgoing_msg">
										<div class="sent_msg">
											<p>${chatList.chat_contents }</p>
											<span class="time_date">${chatList.chat_write_date }</span>
										</div>
									</div>

								</c:when>


								<c:otherwise>

									<div class="sender">${chatList.chat_writer }</div>

									<div class="received_withd_msg">
										<p>${chatList.chat_contents }</p>
										<span class="time_date">${chatList.chat_write_date }</span>
									</div>



								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!--  채팅 작성자와 Session 아이디 일치하지 않은 경우 자신의 메세지가 아닌걸로 취급 -->

					</div>

					<!--메세지 보내는 라인-->
					<div class="send-message">

						<input type="text" class="form-control" name="chat_contents"
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
			
     let ws = new WebSocket("ws://localhost/chat");

     ws.onmessage = function(e){
 		let eData = e.data;

 		
 		  let htmlData ="";

    		function sendMsg(){
        		console.log("내가 보내는 메세지 ");
        		
        		htmlData += "<div class='outgoing_msg'>";
    			htmlData +=   	"<div class='sent_msg'>";
        		htmlData +=			"<p>"+eData+"</p>";
        		htmlData += 		"<span class='time_date'>오늘</span>"
        		htmlData += 	"</div>"
        		htmlData +=	"</div>"
        		}
    		
    		function receiveMsg(){
        		console.log("수신 메세지");
        		
                htmlData += "<div class='incoming-msg'>";
                htmlData += "	<div class='received_msg'>";
                htmlData += "		<div class='received_withd_msg'>";
                htmlData += "			<p>"+eData+"</p>";
                htmlData += " 		</div>";
                htmlData += " 	</div>";
                htmlData += "</div>";
        		}
     		
    	if($('#mem_writer').val() == $('#session_user_name').val()){
    		sendMsg();		
    		
    	}else{
    		recevieMsg();
         }
    	
        $('#chat_contents').append(htmlData);
    	}


 $('#chatSendBtn').on('click', () => {
	 
	 $.ajax({
			url : "/chat/insertChatIntoDB",
			method : "post",
			data : {
				chat_cl_id : "${clubInfo[0].CL_ID}",
					chat_cl_name : "${clubInfo[0].CL_NAME}",
					chat_contents : $('#sendText').val(),
					chat_writer : "${member[0].mem_name}"
			}
		
		})
// 		.done(function(resp)
// 				{
// 			if(resp == 1){
			
// 				console.log("여기는 성공 ");
// 				sendMsg();
// 				return;
// 			}else{
// 				console.log("여기는 실패 ");
// 				receiveMsg();
// 				return;
		
		    let text = $('#sendText').val();
    $('#sendText').val("");
    $('#sendText').focus();
    ws.send(text);
})
	 
	 

   </script>
</body>
</html>