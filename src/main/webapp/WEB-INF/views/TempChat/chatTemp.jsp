<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.google.gson.*"%>
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

						<div>
							<div class="club_openDate">${clubInfo.formDate }동호회가개설
								되었습니다</div>
						</div>

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


						<!-- 채팅 작성자와 session 아이디 일치한 경우 자신이 보낸 메세지로 취급 -->
						<!-- DB에 이모티콘이 저장되어있다면 이모티콘을 img 로 출력 -->
						<!--  이모티콘 중 내가 보낸 이모티콘일경우 -->
						<!-- choose 안에 주석 삽입시 "에러" -->
						<c:forEach var="chatList" items="${chatList }">
							<c:choose>

								<c:when test="${fn:contains(chatList.chat_contents, 'emoji' )}">

									<c:if test="${chatList.chat_writer_id eq mem_id }">
										<div class="outgoing_msg">
											<div class="sent_msg">
												<img src="/images/chatImg/${chatList.chat_contents }.gif">
												<span class="time_date">${chatList.formDate}</span>
											</div>
										</div>
									</c:if>

									<c:if test="${chatList.chat_writer_id != mem_id }">

										<div class="sender">
											<img class="sender_profile" src=${chatList_chat_user_photo }>
											<sapn>${chatList.chat_writer }</sapn>

											<div class="received_withd_msg">
												<img src="/images/chatImg/${chatList.chat_contents }.gif">
												<span class="time_date">${chatList.formDate }</span>
											</div>
										</div>
									</c:if>
								</c:when>


								<c:otherwise>
									<c:if test="${chatList.chat_writer_id eq mem_id }">

										<div class="outgoing_msg">
											<div class="sent_msg">
												<p>${chatList.chat_contents }</p>
												<span class="time_date">${chatList.formDate}</span>
											</div>
										</div>
									</c:if>

									<c:if test="${chatList.chat_writer_id != mem_id }">

										<div class="sender">
											<img class="sender_profile" src=${chatList_chat_user_photo }>
											<sapn>${chatList.chat_writer }</sapn>

											<div class="received_withd_msg">
												<p>${chatList.chat_contents }</p>
												<span class="time_date">${chatList.formDate }</span>
											</div>
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
						<input type="hidden" id="user_id" value="${user_id }">

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
				$("#chat_contents").scrollTop($("#chat_contents")[0].scrollHeight);
				

				 let ws = new WebSocket("ws://localhost/chat");
				 
					
				   let emojiVal ="";
				   const emoji1 = $('#emoji1'); 
				   const emoji2 = $('#emoji2');
				   const emoji3 = $('#emoji3');
				   const emoji4 = $('#emoji4');
				   const emoji5 = $('#emoji5');
				   const emoji6 = $('#emoji6');
				   const emoji7 = $('#emoji7');
				   const emoji8 = $('#emoji8');
				   
					let si ="";
					let bun ="";
				   
					// 메세지 송신 시간
					function pullTime(){
						
						let date = new Date();
						si = date.getHours();			
						bun = date.getMinutes();
		
						if(si < 10){
							si = "0"+si;
							}
						
						if(bun < 10){
							bun = "0"+bun;
							}
					}
				   
				 
			     ws.onmessage = function(e){
					//웹 소켓에 보낸 문자 그대로를 변수로 지정
			      	let msgData = e.data;
			
			    	let sender = "";
			    	let sender_ID ="";
			    	
			    	
			    	// 메세지 Seq 중에서 가장 최근의 값을 찾아 누가 보낸 것인지 불러온다.
			    	 $.ajax({
			    		 url : "/chat/whoIsLastChat",
			    		 data : { chat_cl_id : "${clubInfo.cl_id}" },
			    		 async: false,
			    	 }).done(function(member){
			    		 
			    		 sender = member[0].chat_writer;
			    		sender_ID = member[0].chat_writer_id;

			    	 })
			    	 
			    		// 최신 메세지 작성자 ID 와 현재 로그인 한 session 의 아이디와 같을 때
			         if(sender_ID == $('#user_id').val()){
			        	 
						sendMsg(msgData);
						$('#chat_contents').append(htmlData);
			       		htmlData="";
			    		$("#chat_contents").scrollTop($("#chat_contents")[0].scrollHeight);
						
					}else{
						let sender_profile ="";
				    	 
				    	 $.ajax({
				    		 url : "/chat/getUserProfile",
				    		 data : {mem_id : sender_ID}
				    	 }).done(function(userProfile){
				    		 sender_profile = userProfile;
				    		 console.log("유저 프로필 : "+ sender_profile);
				    	 })

				    	 
				    	 
				    	 
						receiveMsg(msgData, sender);
			       	    $('#chat_contents').append(htmlData);
			       		htmlData="";
			    		$("#chat_contents").scrollTop($("#chat_contents")[0].scrollHeight);
			       		
						}
			     	}


			 let htmlData ="";
			
			// 메세지 송신 
	  		function sendMsg(msgData){	 

				//이모티콘 있을 때 
	         if(msgData.indexOf("emoji") == 0){
	        	 
	            let emojiData = msgData;
	            
	            pullTime();
	            
	            htmlData += "<div class='outgoing_msg'>";
	  		    htmlData +=   	"<div class='sent_msg'>";
	            htmlData +=			"<img class='msg_img' src='/images/chatImg/"+emojiData+".gif"+"'>";
	      		htmlData += 		"<span class='time_date'>"+si+":"+bun+"</span>";
	      		htmlData += 	"</div>"
	      		htmlData +=	"</div>"

	      		//이모티콘 없을 때 (이모티콘을 클릭하면 emoji 라는 값이 웹소켓으로 보내지기에 emoji 있는지 검사)
	         }else if(msgData.indexOf("emoji") != 0){
	      		
	      		pullTime();
	      		
	      		htmlData += "<div class='outgoing_msg'>";
	  			htmlData +=   	"<div class='sent_msg'>";
	      		htmlData +=			"<p>"+msgData+"</p>";
	      		htmlData += 		"<span class='time_date'>"+si+":"+bun+"</span>";
	      		htmlData += 	"</div>"
	      		htmlData +=	"</div>"
	              }else{
	            	  return;
	              }
	  			}
	         

				//메세지 수신 
	  		function receiveMsg(msgData, senderName){

					
				//이모티콘 있을 때
	         if(msgData.indexOf("emoji") == 0){
	        	 
	        	  let emojiData = msgData;
	        	  
	       	  	  pullTime();
	       	  	  
	       	  	  
	    		  htmlData +="<div class='sender'><img class='sender_profile' src='sender_profile'>";
	           	  htmlData += "	<sapn>"+senderName+"</span>";
	              htmlData += "		<div class='incoming-msg'>";
	              htmlData += "			<div class='received_msg'>";
	              htmlData += "				<div class='received_withd_msg'>";
	              htmlData +=					"<img class='msg_img' src='/images/chatImg/"+emojiData+".gif"+"'>";
	              htmlData += 					"<span class='time_date'>"+si+":"+bun+"</span>";
	              htmlData += " 			</div>";
	              htmlData += " 		</div>";
	              htmlData += "	</div>";
	              htmlData += "</div>"

	              //이모티콘 없을 때 
	         }else if(msgData.indexOf("emoji") != 0){
	        	 
	       	      pullTime();

	      		  htmlData +="<div class='sender'><img class='sender_profile' src='sender_profile'>";
	           	  htmlData += "	<sapn>"+senderName+"</span>";
	              htmlData += "		<div class='incoming-msg'>";
	              htmlData += "			<div class='received_msg'>";
	              htmlData += "				<div class='received_withd_msg'>";
	              htmlData += "					<p>"+msgData+"</p>";
	              htmlData += 					"<span class='time_date'>"+si+":"+bun+"</span>";
	              htmlData += " 			</div>";
	              htmlData += " 		</div>";
	              htmlData += "	</div>";
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
	   					chat_writer : "${member.mem_name}",
	   					chat_writer_id : "${user_id}"
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
	   					chat_writer : "${member.mem_name}",
	   					chat_writer_id : "${user_id}"
	   					}
	   			 	})

	            emojiVal ="";
	            $('#sendText').focus();
	            }
			
	    
	   		$('#sendText').on('keyup', () => {
	   			
	   			let textValue = $('#sendText').val();
	   		
	   			if(
	   				textValue.length > 100
	   			){
					alert("전송 가능한 최대 범위를 초과하여 전송할 수 없습니다");
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