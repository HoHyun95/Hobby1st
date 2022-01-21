<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
							<li>
								<!--  동호회 채팅 이미지 --> <img src="" class="club_photo"> <!--  동호회 이름 -->
								<span id="cl_name_span"> ${clubInfo.cl_name } </span> <br>
							</li>
							<span id="cl_memCount"><i class="fas fa-user-friends"></i>멤버수
								${clubInfo.cl_memCount }</span>
						</ul>

					</div>


					<!-- 메세지 컨텐츠 시작 -->
					<div id="chat_contents">
					
					<div><span class="club_openDate">${clubInfo.formDate }</span></div>
					
						<div class="emojiBox">
							<div class="emojies">
								<img src="/images/chatImg/emoji1.gif" id="emoji1"> <img
									src="/images/chatImg/emoji2.gif" id="emoji2"> <img
									src="/images/chatImg/emoji3.gif" id="emoji3"> <img
									src="/images/chatImg/emoji4.gif" id="emoji4"> <img
									src="/images/chatImg/emoji5.gif" id="emoji5"> <img
									src="/images/chatImg/emoji6.gif" id="emoji6"> <img
									src="/images/chatImg/emoji7.gif" id="emoji7"> <img
									src="/images/chatImg/emoji8.gif" id="emoji8">
							</div>
						</div>

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
						<!-- DB에 이모티콘이 저장되어있다면 이모티콘을 img 로 출력 -->
						<!--  이모티콘 중 내가 보낸 이모티콘일경우 -->
						<!-- choose 안에 주석 삽입시 "에러" -->
						<c:forEach var="chatList" items="${chatList }">
							<c:choose>


								<c:when test="${fn:contains(chatList.chat_contents, 'emoji' )}">

									<c:if test="${chatList.chat_writer eq user_name }">
										<div class="outgoing_msg">
											<div class="sent_msg">
												<img src="/images/chatImg/${chatList.chat_contents }.gif">
												<span class="time_date">${chatList.formDate}</span>
											</div>
										</div>
									</c:if>

									<c:if test="${chatList.chat_writer != user_name }">

										<div class="sender">${chatList.chat_writer }</div>

										<div class="received_withd_msg">
											<img src="/images/chatImg/${chatList.chat_contents }.gif">
											<span class="time_date">${chatList.formDate }</span>
										</div>
									</c:if>

								</c:when>

								<c:otherwise>

									<c:if test="${chatList.chat_writer eq user_name }">

										<div class="outgoing_msg">
											<div class="sent_msg">
												<p>${chatList.chat_contents }</p>
												<span class="time_date">${chatList.formDate}</span>
											</div>
										</div>
									</c:if>

									<c:if test="${chatList.chat_writer != user_name }">

										<div class="sender">${chatList.chat_writer }</div>

										<div class="received_withd_msg">
											<p>${chatList.chat_contents }</p>
											<span class="time_date">${chatList.formDate }</span>
										</div>
									</c:if>



								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!--  채팅 작성자와 Session 아이디 일치하지 않은 경우 자신의 메세지가 아닌걸로 취급 -->

					</div>

					<!--메세지 보내는 라인-->
					<div class="send-message">

						<input type="text" class="form-control" name="chat_contents"
							id="sendText" />

						<!--  멤버 리스트 가져와서 멤버 이름 넣는다 .  -->


						<input type="hidden" id="mem_writer" value="${member.mem_name }">


						<!-- session 의 멤버 이름 -->
						<input type="hidden" id="session_user_name" value="${user_name }">


						<!--이모티콘, 사진, 전송 버튼-->
						<ul class="list-inline">
							<li><i class="far fa-smile" id="emojiBtn"></i></li>
							<li><i class="fas fa-paper-plane" id="chatSendBtn"></i></li>
						</ul>
					</div>
				</div>
			</div>


			<script>
			 let ws = new WebSocket("ws://localhost/chat");
			 
		     ws.onmessage = function(e){
				//웹 소켓에 보낸 문자 그대로를 변수로 지정
		      	let eData = e.data;
		    	 let myMsg = eData.substring(3);
				
		         if($('#mem_writer').val() == $('#session_user_name').val()){
					sendMsg(myMsg);
					$('#chat_contents').append(htmlData);
		       		htmlData="";

				
				}else{
					// 메세지 부분 
					let liveMsg = eData.substring(3);
				
					// 메세지 작성자 이름 부분
					let senderName = eData.substring(0,3);
				
					receiveMsg(liveMsg, senderName);
		       	    $('#chat_contents').append(htmlData);
		       		htmlData="";
		       		
					}
		     	}

			
   let emojiVal ="";
   const emoji1 = $('#emoji1'); 
   const emoji2 = $('#emoji2');
   const emoji3 = $('#emoji3');
   const emoji4 = $('#emoji4');
   const emoji5 = $('#emoji5');
   const emoji6 = $('#emoji6');
   const emoji7 = $('#emoji7');
   const emoji8 = $('#emoji8');

   				// 메세지 송신 시간
			let date = new Date();
			let si = date.getHours();			
			let bun = date.getMinutes();
			
			if(si < 10){
				si = "0"+si;
				}		
			if(bun < 10){
				bun = "0"+bun;
			}

		 
		 let htmlData ="";
		
		// 메세지 송신 
  		function sendMsg(liveMsg){	 

			//이모티콘 있을 때 
         if(liveMsg.indexOf("emoji") == 0){
            let emojiData = liveMsg;
            
            htmlData += "<div class='outgoing_msg'>";
  		    htmlData +=   	"<div class='sent_msg'>";
            htmlData +=			"<img src='/images/chatImg/"+emojiData+".gif"+"'>";
      		htmlData += 		"<span class='time_date'>"+si+":"+bun+"</span>";
      		htmlData += 	"</div>"
      		htmlData +=	"</div>"

      		//이모티콘 없을 때
         }else if(liveMsg.indexOf("emoji") != 0){
      		console.log("내가 보내는 메세지 ");
      		
      		htmlData += "<div class='outgoing_msg'>";
  			htmlData +=   	"<div class='sent_msg'>";
      		htmlData +=			"<p>"+liveMsg+"</p>";
      		htmlData += 		"<span class='time_date'>"+si+":"+bun+"</span>";
      		htmlData += 	"</div>"
      		htmlData +=	"</div>"
              }else{
            	  return;
              }
  			}
         

			//메세지 수신 
  		function receiveMsg(liveMsg, senderName){

				
			//이모티콘 있을 때
         if(liveMsg.indexOf("emoji") == 0){
        	 
        	 let emojiData = liveMsg;
        	  
        	 htmlData +="<div class='sender'>"+senderName;
              htmlData += "<div class='incoming-msg'>";
              htmlData += "	<div class='received_msg'>";
              htmlData += "		<div class='received_withd_msg'>";
              htmlData +=			"<img src='/images/chatImg/"+emojiData+".gif"+"'>";
              htmlData += " 		</div>";
              htmlData += " 	</div>";
              htmlData += "</div>";
              htmlData += "</div>"

              //이모티콘 없을 때 
         }else if(liveMsg.indexOf("emoji") != 0){

      		  htmlData +="<div class='sender'>"+senderName;
              htmlData += "<div class='incoming-msg'>";
              htmlData += "	<div class='received_msg'>";
              htmlData += "		<div class='received_withd_msg'>";
              htmlData += "			<p>"+liveMsg+"</p>";
              htmlData += " 		</div>";
              htmlData += " 	</div>";
              htmlData += "</div>";
              htmlData += "</div>";
              
         	}else{
         		return;
         	}		
         }
  		
			// 데이터베이스에 메세지 저장
   		 function insertIntoDB(){ 
    	 	$.ajax({
   				url : "/chat/insertChatIntoDB",
   				method : "post",
   				data : {
   					chat_cl_id : "${clubInfo.cl_id}",
   					chat_cl_name : "${clubInfo.cl_name}",
   					chat_contents :  $('#sendText').val(),
   					chat_writer : "${member.mem_name}"
   					}
   			 	})
   			}
			
			//데이터 베이스에 이모티콘 메세지 저장 
            function insertEmojiIntoDB(emojiVal){
               
               ws.send(emojiVal);

               $.ajax({
   				url : "/chat/insertChatIntoDB",
   				method : "post",
   				data : {
   					chat_cl_id : "${clubInfo.cl_id}",
   					chat_cl_name : "${clubInfo.cl_name}",
   					chat_contents :  emojiVal,
   					chat_writer : "${member.mem_name}"
   					}
   			 	})

            emojiVal ="";
            $('#sendText').focus();
            }
		
    
   		$('#sendText').on('keyup', () => {
   			
   			let textValue = $('#sendText').val();
   		
   			if(
   				textValue.length > 198
   			){
				alert("200자 이상 전송할 수 없습니다");
				return false;
				
   			}else{
   				return true;
   			}
   		})
     
     $('#sendText').on("keypress",function(e){
    	 
			let textValue = $('#sendText').val();
   			let trimedValue = $.trim(textValue);
    	 
    	 
         if(e.keyCode==13 && e.shiftKey==false){

           if($('#sendText').val() == ""){
        	   alert("공백은 전송할 수 없습니다");
        	   return false;
           
           }else if(trimedValue == "" ){
				alert("공백은 전송할 수 없습니다");
				return false;
           }else{
        	   true;
           }
           
           
			let text = textValue;
	
     	    ws.send(text);
            	 
     	    insertIntoDB();
  	 
 	    $('#sendText').val("");
  	    $('#sendText').focus();   

     		}
         })

         
     $('#chatSendBtn').on('click', () => {

    		let text = $('#sendText').val();
    		let trimedValue = $.trim(text);
    		
    		if(text == ""){
    			alert("공백은 전송할 수 없습니다");
    		}else if(trimedValue == ""){
    			alert("공백은 전송할 수 없습니다");
    		}else{

    	    ws.send(text);
    		
			insertIntoDB();
    	    	
	   		 $('#sendText').val("");
 	   		 $('#sendText').focus();
    		}}
     )
    		
     
    		
	$('#emojiBtn').on('click', () => {
		$('.emojiBox').slideToggle(100);

      $('#chat_contents').on('click', () => {
         $('.emojiBox').css("display", "none");
      })
	})

	
	$('.emojiBox').on('wheel', () => {
		$('.emojiBox').css("display", "none");
	})



emoji1.on('click', () => {
   console.log(1);
   emojiVal = "emoji1";
   insertEmojiIntoDB(emojiVal);
})

   emoji2.on('click', () => {
      console.log(2);
   emojiVal = "emoji2";
   insertEmojiIntoDB(emojiVal);
})

emoji3.on('click', () => {
   console.log(3);
   emojiVal = "emoji3";
   insertEmojiIntoDB(emojiVal);
})

emoji4.on('click', () => {
   console.log(4);
   emojiVal = "emoji4";
   insertEmojiIntoDB(emojiVal);
})

emoji5.on('click', () => {
   emojiVal = "emoji5";
   insertEmojiIntoDB(emojiVal);
})

emoji6.on('click', () => {
   emojiVal = "emoji6";
   insertEmojiIntoDB(emojiVal);
})

emoji7.on('click', () => {
   emojiVal = "emoji7";
   insertEmojiIntoDB(emojiVal);
})

emoji8.on('click', () => {
   emojiVal = "emoji8";
   insertEmojiIntoDB(emojiVal);
})

   </script>
</body>
</html>