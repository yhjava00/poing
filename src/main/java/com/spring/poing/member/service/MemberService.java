package com.spring.poing.member.service;

import com.spring.poing.vo.MemberVO;

public interface MemberService {

	public String login(String id, String pw);
	
	public String findPw(String id, String pw);
	
	public String signUp(MemberVO vo);
	
}
