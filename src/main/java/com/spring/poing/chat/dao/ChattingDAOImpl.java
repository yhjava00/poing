package com.spring.poing.chat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.ChattingRoomVO;
import com.spring.poing.vo.ChattingVO;

@Repository("chattingDAO")
public class ChattingDAOImpl implements ChattingDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ChattingRoomVO> selectRoomList(String id) {
		return sqlSession.selectList("chatting.selectRoomList", id);
	}
	
	@Override
	public String selectRoomName(String roomCode) {
		return sqlSession.selectOne("chatting.selectRoomName", roomCode);
	}
	
	@Override
	public List<ChattingVO> selectChattingList(String roomCode) {
		return sqlSession.selectList("chatting.selectChattingList", roomCode);
	}
	
	@Override
	public List<String> selectChattingMemberList(String roomCode) {
		return sqlSession.selectList("chatting.selectChattingMemberList", roomCode);
	}
	
	@Override
	public int insertChatting(Map<String, Object> info) {
		return sqlSession.insert("chatting.insertChatting", info);
	}
}
