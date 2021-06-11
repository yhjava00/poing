package com.spring.poing.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.poing.chat.service.ChattingService;

@Controller
public class ChattingControllerImpl implements ChattingController{

	@Autowired
	ChattingService chattingService;

	@Override
	@RequestMapping("/chat")
	public String chat(HttpServletRequest request, String roomCode) {
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("loginCheck");
		
		Map<String, Object> info = chattingService.chat(id);
		
		request.setAttribute("info", info);
		
		return "chat";
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/chat/roomIn.do", produces = "application/json; charset=UTF-8")
	public String roomInAction(HttpServletRequest request, String roomCode) {
		
		StringBuilder json = chattingService.roomIn(roomCode); 
		
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		json.append(", \"id\" : \"").append(id).append("\"}");
		
		return json.toString();
	}
	
}
