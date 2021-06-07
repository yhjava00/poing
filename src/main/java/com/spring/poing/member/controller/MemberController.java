package com.spring.poing.member.controller;

import javax.servlet.http.HttpServletRequest;

import com.spring.poing.vo.MemberVO;

public interface MemberController {

	public String login();
	
	public String loginAction(HttpServletRequest request, String id, String pw);
	
	public String findPw();
	
	public String logOutAction(HttpServletRequest request);
	
	public String signUp();
	
	public String signUpAction(MemberVO vo);
	
}
