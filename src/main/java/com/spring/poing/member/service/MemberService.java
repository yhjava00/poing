package com.spring.poing.member.service;

import com.spring.poing.vo.MemberVO;

public interface MemberService {

	public int login(String id, String pw);
	
	public int naverLogin(String id, String nickname);
	
	public String findPw(String id, String pw);
	
	public String signUp(MemberVO vo);

	public String changeProfile(String id, String profile);
	
	public String updateNickname(String id, String nickname);
	
	public String updatePassword(String id, String pw, String newPw);
	
	public String withdrawal(String id, String pw);
	
}
