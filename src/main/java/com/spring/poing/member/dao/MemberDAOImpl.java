package com.spring.poing.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberVO selectMember(String id) {
		return sqlSession.selectOne("member.selectMember", id);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert("member.insertMember", vo);
	}
	
	@Override
	public int changePw(Map<String, String> info) {
		return sqlSession.update("member.changePw", info);
	}

	@Override
	public int updateProfile(Map<String, String> info) {
		return sqlSession.update("member.updateProfile", info);
	}
	
	@Override
	public String selectProfile(String id) {
		return sqlSession.selectOne("member.selectProfile", id);
	}
	
	@Override
	public int updateNickname(Map<String, String> info) {
		return sqlSession.update("member.updateNickname", info);
	}
	
	@Override
	public int updatePassword(Map<String, String> info) {
		return sqlSession.update("member.updatePassword", info);
	}
	
	@Override
	public int deleteMember(String id) {
		return sqlSession.delete("member.deleteMember", id);
	}
	
}
