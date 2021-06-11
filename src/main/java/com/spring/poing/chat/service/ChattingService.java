package com.spring.poing.chat.service;

import java.util.Map;

public interface ChattingService {
	
	public Map<String, Object> chat(String id);
	
	public StringBuilder roomIn(String roomCode);
	
	public String writeChatting(String roomCode, String id, String content);
	
}
