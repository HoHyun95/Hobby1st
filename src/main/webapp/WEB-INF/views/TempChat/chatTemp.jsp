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


   <style>
            .dragAndDropDiv {
                border: 2px dashed #92AAB0;
                width: 650px;
                height: 200px;
                color: #92AAB0;
                text-align: center;
                vertical-align: middle;
                padding: 10px 0px 10px 10px;
                font-size:200%;
                display: table-cell;
            }
            .progressBar {
                width: 200px;
                height: 22px;
                border: 1px solid #ddd;
                border-radius: 5px; 
                overflow: hidden;
                display:inline-block;
                margin:0px 10px 5px 5px;
                vertical-align:top;
            }
             
            .progressBar div {
                height: 100%;
                color: #fff;
                text-align: right;
                line-height: 22px; /* same as #progressBar height if we want text middle aligned */
                width: 0;
                background-color: #0ba1b5; border-radius: 3px; 
            }
            .statusbar{
                border-top:1px solid #A9CCD1;
                min-height:25px;
                width:99%;
                padding:10px 10px 0px 10px;
                vertical-align:top;
            }
            .statusbar:nth-child(odd){
                background:#EBEFF0;
            }
            .filename{
                display:inline-block;
                vertical-align:top;
                width:250px;
            }
            .filesize{
                display:inline-block;
                vertical-align:top;
                color:#30693D;
                width:100px;
                margin-left:10px;
                margin-right:5px;
            }
            .abort{
                background-color:#A8352F;
                -moz-border-radius:4px;
                -webkit-border-radius:4px;
                border-radius:4px;display:inline-block;
                color:#fff;
                font-family:arial;font-size:13px;font-weight:normal;
                padding:4px 15px;
                cursor:pointer;
                vertical-align:top
            }
            
            .rightMouse_clicked{
            	border : 1px solid black;
            	backgound-color : red;
            	z-index : 3;
            }
        </style>


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
												
												<!-- 오른쪽 마우스 클릭 상장 -->
												<div class="rightMouse_clicked" style="display : none;">
													<div class="rightMouse_delBtn">삭제</div>
												
												</div>
												
												<script>
// 												 $('.sent_msg').on('mouseover', () => {
// 													console.log("dddd");
// 													$(this).children('.rightMouse_clicked').css("display", "block");
// 												 })
												</script>
												<!-- 오른쪽 마우스 클릭 상장 -->
												
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
				

				 let ws = new WebSocket("ws://3.38.211.61:8090/chat/${clubInfo.cl_id}");
				 			
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
			    		 

				    		if(member.length == 0){
				    			alert("채팅 로딩중입니다. 잠시만 기다려주세요");
				    			 location.reload();
				    		}else{
			    		 
			    		 sender = member[0].chat_writer;
			    		sender_ID = member[0].chat_writer_id;
				    		}return;
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
	   emojiVal = "emoji1";
	   insertEmojiIntoDB(emojiVal);
	})

	   emoji2.on('click', () => {
	   emojiVal = "emoji2";
	   insertEmojiIntoDB(emojiVal);
	})

	emoji3.on('click', () => {
	   emojiVal = "emoji3";
	   insertEmojiIntoDB(emojiVal);
	})

	emoji4.on('click', () => {
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
			
			
<!-- 			<div id="fileUpload" class="dragAndDropDiv">Drag & Drop Files Here</div> -->
<!--         <input type="file" name="fileUpload" id="fileUpload" style="display:none;" multiple/> -->
        
          <script type="text/javascript">
//             $(document).ready(function(){
//                 var objDragAndDrop = $(".dragAndDropDiv");
                
//                 $(document).on("dragenter",".dragAndDropDiv",function(e){
//                     e.stopPropagation();
//                     e.preventDefault();
//                     $(this).css('border', '2px solid #0B85A1');
//                 });
//                 $(document).on("dragover",".dragAndDropDiv",function(e){
//                     e.stopPropagation();
//                     e.preventDefault();
//                 });
//                 $(document).on("drop",".dragAndDropDiv",function(e){
                    
//                     $(this).css('border', '2px dotted #0B85A1');
//                     e.preventDefault();
//                     var files = e.originalEvent.dataTransfer.files;
                
//                     handleFileUpload(files,objDragAndDrop);
//                 });
                
//                 $(document).on('dragenter', function (e){
//                     e.stopPropagation();
//                     e.preventDefault();
//                 });
//                 $(document).on('dragover', function (e){
//                   e.stopPropagation();
//                   e.preventDefault();
//                   objDragAndDrop.css('border', '2px dotted #0B85A1');
//                 });
//                 $(document).on('drop', function (e){
//                     e.stopPropagation();
//                     e.preventDefault();
//                 });
                //drag 영역 클릭시 파일 선택창   ///막기
//                 objDragAndDrop.on('click',function (e){
//                     $('input[type=file]').trigger('click');
//                 });
 
//                 $('input[type=file]').on('change', function(e) {
//                     var files = e.originalEvent.target.files;
//                     handleFileUpload(files,objDragAndDrop);
//                 });
                
//                 function handleFileUpload(files,obj)
//                 {
//                    for (var i = 0; i < files.length; i++) 
//                    {
//                         var fd = new FormData();
//                         fd.append('file', files[i]);
                 
//                         var status = new createStatusbar(obj); //Using this we can set progress.
//                         status.setFileNameSize(files[i].name,files[i].size);
//                         sendFileToServer(fd,status);
                 
//                    }
//                 }
                
//                 var rowCount=0;
//                 function createStatusbar(obj){
                        
//                     rowCount++;
//                     var row="odd";
//                     if(rowCount %2 ==0) row ="even";
//                     this.statusbar = $("<div class='statusbar "+row+"'></div>");
//                     this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
//                     this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
//                     this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
//                     this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);
                    
//                     obj.after(this.statusbar);
                 
//                     this.setFileNameSize = function(name,size){
//                         var sizeStr="";
//                         var sizeKB = size/1024;
//                         if(parseInt(sizeKB) > 1024){
//                             var sizeMB = sizeKB/1024;
//                             sizeStr = sizeMB.toFixed(2)+" MB";
//                         }else{
//                             sizeStr = sizeKB.toFixed(2)+" KB";
//                         }
                 
//                         this.filename.html(name);
//                         this.size.html(sizeStr);
//                     }
                    
//                     this.setProgress = function(progress){       
//                         var progressBarWidth =progress*this.progressBar.width()/ 100;  
//                         this.progressBar.find('div').animate({ width: progressBarWidth }, 10).html(progress + "% ");
//                         if(parseInt(progress) >= 100)
//                         {
//                             this.abort.hide();
//                         }
//                     }
                    
//                     this.setAbort = function(jqxhr){
//                         var sb = this.statusbar;
//                         this.abort.click(function()
//                         {
//                             jqxhr.abort();
//                             sb.hide();
//                         });
//                     }
//                 }
                
//                 function sendFileToServer(formData,status)
//                 {
//                     var uploadURL = "/fileUpload/post"; //Upload URL
//                     var extraData ={}; //Extra Data.
//                     var jqXHR=$.ajax({
//                             xhr: function() {
//                             var xhrobj = $.ajaxSettings.xhr();
//                             if (xhrobj.upload) {
//                                     xhrobj.upload.addEventListener('progress', function(event) {
//                                         var percent = 0;
//                                         var position = event.loaded || event.position;
//                                         var total = event.total;
//                                         if (event.lengthComputable) {
//                                             percent = Math.ceil(position / total * 100);
//                                         }
//                                         //Set progress
//                                         status.setProgress(percent);
//                                     }, false);
//                                 }
//                             return xhrobj;
//                         },
//                         url: uploadURL,
//                         type: "POST",
//                         contentType:false,
//                         processData: false,
//                         cache: false,
//                         data: formData,
//                         success: function(data){
//                             status.setProgress(100);
                 
                            //$("#status1").append("File upload Done<br>");           
//                         }
//                     }); 
                 
//                     status.setAbort(jqXHR);
//                 }
                
//             });
            
        //  채팅방 생성 
//             function message_profile_create_function(mIdYou){
//                    if(loginId != null && mIdYou != null){
//                       var params="mId="+loginId+"&"+"mIdYou="+mIdYou;
//                          $.ajax({
//                             url:'messages_room_create',
//                             method:'GET',
//                             data : params,
//                             dataType:'text',
//                             success:function(isSuccess){
//                                location.href = contextPath.replace('ws','http')+'/messages';
//                             }
//                       });
//                    }
//             }
            
        </script>
</body>
</html>