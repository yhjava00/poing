package com.spring.poing.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.poing.vo.MemberVO;

public interface MainController {
	
	public String main(Model model);
	
	public String login();
	
	public String loginAction(HttpServletRequest request, String id, String pw);
	
	public String signUp();
	
	public String signUpAction(MemberVO vo);
	
	public String search();

}
