package com.spring.poing.chat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.chat.dao.ChattingDAO;
import com.spring.poing.vo.ChattingRoomVO;
import com.spring.poing.vo.ChattingVO;

@Service("ChattingService")
public class ChattingServiceImpl implements ChattingService {

	private static final char[] words = {
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
		'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
		'U', 'V', 'W', 'X', 'Y', 'Z'
	};
	
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

		String roomName = chattingDAO.selectRoomName(roomCode);
		
		json.append("{\"state\" : \"success\"");
		
		json.append(", \"roomName\" : \"").append(roomName).append("\"");
		
		json.append(", \"chattingMemberList\" : [");
		
		for(String member : chattingMemberList) {
			json.append("\"").append(member).append("\", ");
		}

		json.deleteCharAt(json.lastIndexOf(",")).append("]");

		json.append(", \"chattingList\" : [");
		
		for(ChattingVO chat : chattingList) {
			json.append("{\"id\" : \"").append(chat.getMember_id()).append("\", \"content\" : \"").append(chat.getContent())
			.append("\", \"regDate\" : \"").append(chat.getRegDate()).append("\"}, ");
		}
		
		if(chattingList.size()>0)
			json.deleteCharAt(json.lastIndexOf(","));
		
		json.append("]");
		
		return json;
	}
	
	@Override
	public String writeChatting(String roomCode, String id, String content) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("roomCode", roomCode);
		info.put("id", id);
		info.put("content", content);
		
		int state = chattingDAO.insertChatting(info);
		
		if(state<=0) {
			return "error";
		}
		
		return "success";
	}
	
	@Override
	public String makeRoom(String id, String roomName) {
		
		StringBuilder code = null;
		
		Random r = new Random();
		String findCode = "";
		
		do {
			
			code = new StringBuilder();
			
			for(int i=0; i<6; i++) {
				code.append(words[r.nextInt(words.length)]);
			}
			
			findCode = chattingDAO.selectRoomCode(code.toString());
			
		} while(findCode!=null);
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("code", code.toString());
		info.put("roomName", roomName);
		
		int state = chattingDAO.insertRoom(info);
		
		if(state<=0) {
			return "{\"state\" : \"error\"}";
		}
		
		info.put("id", id);
		
		chattingDAO.insertRoomMember(info);
		List<ChattingRoomVO> roomList = chattingDAO.selectRoomList(id);

		StringBuilder json = new StringBuilder();
		
		json.append("{\"state\" : \"success\"");
		
		makeRoomListJson(json, roomList);

		json.append("}");

		return json.toString();
	}
	
	@Override
	public String visitRoom(String id, String roomCode) {

		String findRoom = chattingDAO.selectRoomCode(roomCode);
		
		if(findRoom==null) {
			return "{\"state\" : \"no room\"}";
		}
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("code", roomCode);
		
		chattingDAO.insertRoomMember(info);
		List<ChattingRoomVO> roomList = chattingDAO.selectRoomList(id);

		StringBuilder json = new StringBuilder();
		
		json.append("{\"state\" : \"success\"");

		makeRoomListJson(json, roomList);
		
		json.append("}");

		return json.toString();
	}
	
	public void makeRoomListJson(StringBuilder json, List<ChattingRoomVO> roomList) {

		json.append(", \"roomList\" : [");

		for(ChattingRoomVO room : roomList) {
			json.append("{\"code\" : \"").append(room.getCode()).append("\", \"name\" : \"").append(room.getName()).append("\"}, ");
		}

		json.deleteCharAt(json.lastIndexOf(",")).append("]");
	}
	
	@Override
	public String leaveRoom(String id, String roomCode) {
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("code", roomCode);
		
		int state = chattingDAO.deleteRoomMember(info);
		
		if(state<=0) {
			return "error";
		}
		
		return "success";
	}
	
	@Override
	public String refreshMember(String roomCode) {
		
		List<String> roomMemberList = chattingDAO.selectChattingMemberList(roomCode);
		
		StringBuilder json = new StringBuilder();
		
		json.append("{\"memberList\" : [");
		
		for(String member : roomMemberList) {
			json.append("\"").append(member).append("\", ");
		}
		
		json.deleteCharAt(json.lastIndexOf(",")).append("]}");
		
		return json.toString();
	}

}
