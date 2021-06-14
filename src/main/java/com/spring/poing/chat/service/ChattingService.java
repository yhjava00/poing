package com.spring.poing.chat.service;

import java.util.Map;

public interface ChattingService {
	
	public Map<String, Object> chat(String id);
	
	public StringBuilder roomIn(String roomCode);
	
	public String writeChatting(String roomCode, String id, String content);
	
	public String makeRoom(String id, String roomName);
	
	public String visitRoom(String id, String roomCode);
	
	public String leaveRoom(String id, String roomCode);
	
	public String refreshMember(String roomCode);
	
}
