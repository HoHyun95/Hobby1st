
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
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
   section{
	padding-top: 60px;
    padding-bottom: 60px;
    background: #f5f5f5;
}
::-webkit-scrollbar {
	width: 2px;
}

::-webkit-scrollbar-thumb {
	background: #000; 
	border-radius: 5px;
}
.chat-list-box {
    display: inline-block;
    width: 100%;
    background: #fff;
    box-shadow: 0px 10px 30px 0px rgba(50, 50, 50, 0.16);
}

.flat-icon li{
	display: inline-block;
    padding: 0px 8px;
    vertical-align: middle;
    position: relative;
    top: 7px;
}

.flat-icon a img {
    width: 22px;
    border-radius: unset !important;
}

ul.list-inline.text-left.d-inline-block.float-left {
    margin-bottom: 0;
}

.chat-list-box ul li img {
    border-radius: 50px;
}

.message-box{
	display: inline-block;
    width: 100%;
    background: #fff;
    box-shadow: 0px 10px 30px 0px rgba(50, 50, 50, 0.16);
}

.msg-box li{
	display:inline-block;
	padding-left: 10px;
}

.msg-box img{
	border-radius:50px;
}

.msg-box li span{
	padding-left:8px;
	color:#545454;
	font-weight:550;
}

.head-box {
    display: flow-root;
    padding: 10px;
    background: #007bff;
}
.head-box ul li a{
    color:#fff;
}
.chat-person-list{
	padding:14px;
}
.chat-person-list ul li img{
	width:30px;
	border-radius:50px;
}

.chat-person-list ul li span {
    padding-left: 20px;
}

.chat-person-list ul li {
    line-height: 55px;
}

span.chat-time {
    float: right;
    font-size: 12px;
}

.head-box-1{
	display: flow-root;
    padding: 10px;
    background: #007bff;
}
.head-box-1 ul li i{
    color:#fff;
    cursor:pointer;
}
.head-box-1 ul li span{
    color:#fff;
    position:relative;
    top:-10px;
}
#chat_contents {
    padding: 10px;
    height:400px;
    overflow: overlay;
}
.incoming_msg_img {
    display: inline-block;
    width: 6%;
}
.timee{  
    position: absolute;
    left: 115px;
    top: 30px;
    color: #fff;}

.received_msg {
	margin-top : 5px;
    display: inline-block;
    padding: 0 0 0 10px;
    vertical-align: top;
    width: 92%;
}
.received_withd_msg {
    width: 57%;
}
.received_withd_msg p {
       background: rgba(0,123,255,.5) none repeat scroll 0 0;
    border-radius: 3px;
    color: #ffffff;
    font-size: 14px;
    margin: 0;
    padding: 5px 10px 5px 22px;
    width: 100%;
    border-bottom-right-radius: 50px;
    border-top-left-radius: 50px;
}
.time_date {
    color: #747474;
    display: block;
    font-size: 12px;
    margin: 8px 0 0;
}
.incoming_msg_img img {
    width: 100%;
    border-radius: 50px;
    float: left;
}
.outgoing_msg {
    overflow: hidden;
    margin: 10px 0 10px;
}
.sent_msg {
    float: right;
    width: 46%;
}
.sent_msg p {
  background: #ddd;
    border-radius: 3px;
    font-size: 14px;
    margin: 0;
    color: #333;
    padding: 5px 10px 5px 22px;
    width: 100%;
	border-bottom-right-radius: 50px;
    border-top-left-radius: 50px;
}
.chat-person-list ul li a {
    color: #545454;
    text-decoration: none;
}



.send-message {
    padding: 15px;
    background: #007bff;
    height: auto;
}
.send-message textarea:focus {
    box-shadow: none;
    outline: none;
	border-color:#ddd;
}
.send-message ul li {
    display: -webkit-inline-box;
    padding-left: 15px;
}
.send-message ul li i{color:#0056b3;}
.send-message ul li a{color:#0056b3;}
.send-message ul {
    position: absolute;
    right: 45px;
    top: 23px;
    border-left: 1px solid #9c9a9a;
}
.send-message .form-control {
    border-radius: 50px;
}

.send-message{
    position:relative;
}
</style>
</head>


<body>
   <div class="container">
      <div class="row">
      <div class="col-md-8">
            <div class="message-box">
              <div class="head-box-1">
             
               <ul class="msg-box list-inline text-left d-inline-block float-left">
                <li> <i class="fas fa-arrow-left" id="back"></i> </li> 
                 <li> <img src="https://i.ibb.co/fCzfFJw/person.jpg" alt="" width="40px"> <span> 스포츠 동호회 </span> <br></li> 
               </ul>
               
               <ul class="flat-icon list-inline text-right d-inline-block float-right">
                 <li> <i class="fas fa-video"></i> </a> </li>
                     <li> <i class="fas fa-camera"></i> </a> </li> 
                 <li> 
                 </li> 
               </ul>
               
            </div>
            

                <!-- 메세지 컨텐츠 시작 -->
            <div id="chat_contents">
               <div class="incoming_msg">
                 <div class="received_msg">
                   <div class="received_withd_msg">
                     <p>Lorem Ipsum is simply dummy text</p>
                     <span class="time_date"> 11:01 AM    |    June 9</span></div>
                 </div>
               </div>

               <!--내가 보내는 메세지-->
               <div class="outgoing_msg">
                 <div class="sent_msg">
                   <p>Lorem Ipsum is simply dummy text</p>
                   <span class="time_date"> 11:01 AM    |    June 9</span>
                  </div>

               </div>
            </div>

           <!--메세지 보내는 라인-->
            <div class="send-message">
                  <input type="text" class="form-control" name="" id="sendText" placeholder="Type your message here ..."/>
              
                  <!--이모티콘, 사진, 전송 버튼-->
                <ul class="list-inline"> 
                 <li> <i class="fas fa-paper-plane" id="chatSendBtn"></i></li>
               </ul>
            </div>
            
            
            </div>
          </div>
      
 

   <script>
     
     let ws = new WebSocket("ws://localhost/chat");
      
      ws.onmessage = function(e){
		let eData = e.data;
		console.log("eData 값 :" + eData);
		
         let htmlData ="";
     	
         htmlData += "<div class='incoming-msg'>";
         htmlData += "	<div class='received_msg'>";
         htmlData += "		<div class='received_withd_msg'>";
         htmlData += "			<p>"+eData+"</p>";
         htmlData += " 		</div>";
         htmlData += " 	</div>";
         htmlData += "</div>";
         
         $('#chat_contents').append(htmlData);

      }
      
 $('#chatSendBtn').on('click', () => {
    let text = $('#sendText').val();
    $('#sendText').val("");
    $('#sendText').focus();
    ws.send(text);
 })

   </script>
</body>
</html>