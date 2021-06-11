package com.spring.poing.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.poing.chat.service.ChattingService;

public class ChattingHandler extends TextWebSocketHandler {

	private Map<String, List<WebSocketSession>> sessionMap = new HashMap<String, List<WebSocketSession>>();

	@Autowired
	ChattingService chattingService;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String roomCode  = (String) session.getAttributes().get("roomCode");

		if(sessionMap.containsKey(roomCode)) {
			sessionMap.get(roomCode).add(session);
		}else {
			sessionMap.put(roomCode, new ArrayList<WebSocketSession>());
			sessionMap.get(roomCode).add(session);
		}
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String roomCode  = (String) session.getAttributes().get("roomCode");
		
		String id = (String) session.getAttributes().get("loginCheck");
		
		String content = message.getPayload();
		
		if(roomCode.equals("waiting")||content.equals("")) {
			return;
		}
		
		chattingService.writeChatting(roomCode, id, content);
			
		List<WebSocketSession> room = sessionMap.get(roomCode);
		
		for(WebSocketSession sess : room) {
			sess.sendMessage(new TextMessage(id + content));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String roomCode  = (String) session.getAttributes().get("roomCode");
		
		List<WebSocketSession> room = sessionMap.get(roomCode);
		
		room.remove(session);
		
		if(room.size()==0) {
			sessionMap.remove(roomCode);
		}
	}
	
}
