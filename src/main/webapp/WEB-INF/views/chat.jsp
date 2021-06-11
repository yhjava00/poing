<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style>
			#roomWrap {
			    width: 200px;
			}
			
			#roomList {
			    border: 1px solid #0084FF;
			    border-radius: 5px;
			}
			
			#roomHeader {
			    background-color: #0084FF;
			    color: #fff;
			    height: 40px;
			    font-size: 18px;
			    line-height: 40px;
			    text-align: center;
			    border-radius: 5px;
			}
			
			.roomEl {
			    text-align: center;
			    border-bottom: 1px solid #f0f0f0;
			    padding: 10px 0px;
			    cursor: pointer;
			}
			
			.roomEl:hover{
			    background: #f0f0f0;
			}
			
			.roomEl.active{
				color: #0084FF;
			    background: #f0f0f0;
			}
			#chatWrap {
			    width: 600px;
			    border: 1px solid #ddd;
			}
			
			#chatHeader {
			    height: 60px;
			    text-align: center;
			    line-height: 60px;
			    font-size: 25px;
			    font-weight: 900;
			    border-bottom: 1px solid #ddd;
			}
			
			#chatLog {
			    height: 700px;
			    overflow-y: auto;
			    padding: 10px;
			}
			
			.myMsg {
			    text-align: right;
			}
			
			.anotherMsg {
			    text-align: left;
			    margin-bottom: 5px;
			}
			
			.msg {
			    display: inline-block;
			    border-radius: 15px;
			    padding: 7px 15px;
			    margin-bottom: 10px;
			    margin-top: 5px;
			
			}
			
			.anotherMsg > .msg {
			    background-color: #f1f0f0;
			
			}
			
			.myMsg > .msg {
			    background-color: #0084FF;
			    color: #fff;
			}
			
			.anotherName {
			    font-size: 12px;
			    display: block;
			}
			
			#chatForm {
			    display: block;
			    width: 100%;
			    height: 50px;
			    border-top: 2px solid #f0f0f0;
			}
			
			.makeRoomBox {
			    display: block;
			    width: 100%;
			    height: 35px;
			    border-top: 2px solid #f0f0f0;
			}
			
			.makeRoomInput {
			    width: 65%;
			    height: 30px;
			    border: none;
			    padding: 0 5px;
			}
			
			.makeRoomInput:focus {
			    outline: none;
			}
			
			.makeRoomBtn {
			    outline: none;
			    border: none;
			    background: none;
			    color: #0084FF;
			    font-size: 12px;
			    cursor: pointer;
			}
			
			#message {
			    width: 85%;
			    height: calc(100% - 1px);
			    border: none;
			    padding-bottom: 0;
			}
			
			#message:focus {
			    outline: none;
			}
			
			#sendBtn {
			    outline: none;
			    border: none;
			    background: none;
			    color: #0084FF;
			    font-size: 17px;
			    cursor: pointer;
			}
			#memberWrap{
			    width: 200px;
			}
			
			#memberList {
			    border: 1px solid #aaaaaa;
			    border-radius: 5px;
			}
			
			#memberHeader {
			    height: 40px;
			    font-size: 18px;
			    line-height: 40px;
			    padding-left: 15px;
			    border-bottom: 1px solid #f0f0f0;
			    font-weight: 600;
			}
			
			.memberEl {
			    border-bottom: 1px solid #f0f0f0;
			    padding: 10px 20px;
			    font-size: 14px;
			}
			#contentCover{
			    width: 1280px;
			    margin: 0 auto 50px;
			    padding-top: 20px;
			    display: flex;
			    justify-content: space-around;
			}
		</style>
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".enter").keydown(function(key) {
	                if (key.keyCode == 13) {
	                	sendMessage()
						$('#message').val('')
	                }
	            });
				 
				$("#sendBtn").click(function() {
					sendMessage()
					$('#message').val('')
				});
			})
			
			var sock = new SockJS("<c:url value="/chat.do"/>")
			sock.onmessage = onMessage
			sock.onclose = onClose
			
			function sendMessage() {
				sock.send($('#message').val())
			}
			
			function onMessage(msg) {
				var data = msg.data;
				
				console.log(data)
			}
			
			function onClose(evt) {
				console.log("연결 끊김");
			}
			
			function roomIn(roomCode) {
				$.ajax({
			        type: "post", 
			        url: "chat/roomIn.do", 
			        data: {'roomCode':roomCode},
			        success:function (data) {
			        	
			        	var id = data.id
			        	
			        	var chatList = data.chattingList
			        	
			        	var item = ''
			        	
						$('#chatHeader').text(data.roomName)
			        	
						$('#chatLog').empty()

			        	for(var i=0; i<chatList.length; i++) {
			        		if(chatList[i].id === id) {
			        			item += '<div class="myMsg">'
			        		}else {
			        			item += '<div class="anotherMsg">'
			        			item += '<span class="anotherName">' + chatList[i].id + '</span>'
			        		}
							item += '<span class="msg">' + chatList[i].content + '</span>'
							item += '</div>'
			        	}
			        	
						$('#chatLog').append(item)
						
						var memberList = data.chattingMemberList
						
						$('#memberList').children('.memberSelect').remove()

						item = ''

						for(var i=0; i<memberList.length; i++) {
							item += '<div class="memberSelect">' + memberList[i] + '</div>'
						}

						$('#memberList').append(item)
			        },
			        error:function () {
			        	alert('에러가 발생했습니다.');
			        }
			    })
			}
		</script>
	</head>
	<body>
		<div id="contentCover">
	        <div id="roomWrap">
	            <div id="roomList">
	                <div id="roomHeader">채팅 방 목록</div>
	                <div id="roomSelect">
	                    <div class="roomEl active" data-id="1">Everyone</div>
	                    <c:forEach var="room" items="${info.roomList}">
		                    <div class="roomEl" onclick="roomIn('${room.code}')">${room.name}</div>
	                    </c:forEach>
	                </div>
	                <hr>
	                <div class="makeRoomBox">
	                	<input class="makeRoomInput" type="text">
	                	<input class="makeRoomBtn" type="button" value="방만들기">
	                </div>
	            </div>
	        </div>
	        <div id="chatWrap">
	            <div id="chatHeader">채팅방을 선택해주세요</div>
	            <div id="chatLog">
	                
	            </div>
	            <hr>
	            <div id="chatForm">
	                <input class="enter" type="text" autocomplete="off" size="30" id="message" placeholder="메시지를 입력하세요">
	                <input type="button" id="sendBtn" value="보내기">
	            </div>
	        </div>
	        <div id="memberWrap">
	            <div id="memberList">
	                <div id="memberHeader">채팅 참여 멤버</div>
	            </div>
	        </div>
	    </div>
	</body>
</html>