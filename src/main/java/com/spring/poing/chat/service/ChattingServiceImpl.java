package com.spring.poing.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.chat.dao.ChattingDAO;
import com.spring.poing.vo.ChattingRoomVO;
import com.spring.poing.vo.ChattingVO;

@Service("ChattingService")
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	ChattingDAO chattingDAO;
	
	@Override
	public Map<String, Object> chat(String id) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		List<ChattingRoomVO> roomList = chattingDAO.selectRoomList(id);
		
		info.put("roomList", roomList);
		
		return info;
	}
	
	@Override
	public StringBuilder roomIn(String roomCode) {
		
		StringBuilder json = new StringBuilder();
		
		List<ChattingVO> chattingList = chattingDAO.selectChattingList(roomCode);
		List<String> chattingMemberList = chattingDAO.selectChattingMemberList(roomCode);
		
		json.append("{\"chattingList\" : [");
		
		for(ChattingVO chat : chattingList) {
			json.append("{\"id\" : \"").append(chat.getMember_id()).append("\", \"content\" : \"").append(chat.getContent())
			.append("\", \"regDate\" : \"").append(chat.getRegDate()).append("\"}, ");
		}
		
		json.deleteCharAt(json.lastIndexOf(",")).append("]");
		
		json.append(", \"chattingMemberList\" : [");
		
		for(String member : chattingMemberList) {
			json.append("\"").append(member).append("\", ");
		}

		json.deleteCharAt(json.lastIndexOf(",")).append("]");
		
		String roomName = chattingDAO.selectRoomName(roomCode);
		
		json.append(", \"roomName\" : \"").append(roomName).append("\"");
		
		return json;
	}

}
