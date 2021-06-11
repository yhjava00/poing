package com.spring.poing.chat.dao;

import java.util.List;

import com.spring.poing.vo.ChattingRoomVO;
import com.spring.poing.vo.ChattingVO;

public interface ChattingDAO {
	
	public List<ChattingRoomVO> selectRoomList(String id);
	
	public String selectRoomName(String roomCode);
	
	public List<ChattingVO> selectChattingList(String roomCode);
	
	public List<String> selectChattingMemberList(String roomCode);
	
}
