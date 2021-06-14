package com.spring.poing.chat.dao;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.ChattingRoomVO;
import com.spring.poing.vo.ChattingVO;

public interface ChattingDAO {
	
	public List<ChattingRoomVO> selectRoomList(String id);
	
	public String selectRoomName(String roomCode);
	
	public List<ChattingVO> selectChattingList(String roomCode);
	
	public List<String> selectChattingMemberList(String roomCode);
	
	public int insertChatting(Map<String, Object> info);
	
	public String selectRoomCode(String code);
	
	public int insertRoom(Map<String, String> info);
	
	public int insertRoomMember(Map<String, String> info);
	
	public int deleteRoomMember(Map<String, String> info);
	
}
