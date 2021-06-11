package com.spring.poing.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface ChattingController {

	public String chat(HttpServletRequest request, String roomCode);
	
	public String roomInAction(HttpServletRequest request, String roomCode);
}
