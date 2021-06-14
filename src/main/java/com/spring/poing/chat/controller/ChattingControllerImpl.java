package com.spring.poing.chat.controller;

import java.util.Map;
import java.util.Random;

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
		
		session.setAttribute("roomCode", "waiting");
		
		String id = (String) session.getAttribute("loginCheck");
		
		Map<String, Object> info = chattingService.chat(id);
		
		request.setAttribute("info", info);
		
		return "chat";
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/chat/roomIn.do", produces = "application/json; charset=UTF-8")
	public String roomInAction(HttpSession session, String roomCode) {
		
		if(roomCode==null) {
			return "{\"state\" : \"error\"}";
		}
		
		session.setAttribute("roomCode", roomCode);
		
		StringBuilder json = chattingService.roomIn(roomCode); 
		
		String id = (String) session.getAttribute("loginCheck");
		
		json.append(", \"id\" : \"").append(id).append("\"}");
		
		return json.toString();
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/chat/makeRoom.do", produces = "application/json; charset=UTF-8")
	public String makeRoomAction(HttpSession session, String roomName) {
		
		if(roomName==null) {
			return "{\"state\" : \"error\"}";
		}
		
		String id = (String) session.getAttribute("loginCheck");
		
		return chattingService.makeRoom(id, roomName);
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/chat/visitRoom.do", produces = "application/json; charset=UTF-8")
	public String visitRoomAction(HttpSession session, String roomCode) {

		if(roomCode==null) {
			return "{\"state\" : \"error\"}";
		}

		String id = (String) session.getAttribute("loginCheck");
		
		return chattingService.visitRoom(id, roomCode);
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/chat/leaveRoom.do")
	public String leaveRoomAction(HttpSession session, String roomCode) {

		String id = (String) session.getAttribute("loginCheck");
		
		return chattingService.leaveRoom(id, roomCode);
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/chat/refreshMember.do", produces = "application/json; charset=UTF-8")
	public String refreshMember(String roomCode) {
		return chattingService.refreshMember(roomCode);
	}
	
}
