package com.spring.poing.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ChattingController {

	public String chat(HttpServletRequest request, String roomCode);
	
	public String roomInAction(HttpSession session, String roomCode);
	
	public String makeRoomAction(HttpSession session, String roomName);
	
	public String visitRoomAction(HttpSession session, String roomCode);
	
	public String leaveRoomAction(HttpSession session, String roomCode);
	
	public String refreshMember(String roomCode);
}
