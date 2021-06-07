package com.spring.poing.member.dao;

import java.util.Map;

import com.spring.poing.vo.MemberVO;

public interface MemberDAO {

	public MemberVO selectMember(String id);
	
	public int insertMember(MemberVO vo);
	
	public int changePw(Map<String, String> info);
	
}
