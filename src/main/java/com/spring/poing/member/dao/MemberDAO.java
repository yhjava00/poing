package com.spring.poing.member.dao;

import java.util.Map;

import com.spring.poing.vo.MemberVO;

public interface MemberDAO {

	public MemberVO selectMember(String id);
	
	public int insertMember(MemberVO vo);
	
	public int changePw(Map<String, String> info);

	public int updateProfile(Map<String, String> info);
	
	public String selectProfile(String id);
	
	public int updateNickname(Map<String, String> info);
	
	public int updatePassword(Map<String, String> info);
	
	public int deleteMember(String id);
}
