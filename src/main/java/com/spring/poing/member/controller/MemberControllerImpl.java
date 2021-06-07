package com.spring.poing.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.poing.member.service.MemberService;
import com.spring.poing.vo.MemberVO;

@Controller
public class MemberControllerImpl implements MemberController{
	
	@Autowired
	MemberService memberService;

	@Override
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/login.do")
	public String loginAction(HttpServletRequest request, String id, String pw) {
		
		String loginState = memberService.login(id, pw);
		
		if(loginState.equals("login")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginCheck", id);
			session.setMaxInactiveInterval(60*60*3);
		}
		
		return loginState;
	}
	
	@Override
	@RequestMapping("/findPw")
	public String findPw() {
		return "findPw";
	}
	
	@Override
	@RequestMapping("/logOut.do")
	public String logOutAction(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginCheck");
		
		return "redirect:/main";
	}
	
	@Override
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/signUp.do")
	public String signUpAction(MemberVO vo) {
		
		String signUpState = memberService.signUp(vo);
		
		return signUpState;
	}
		
}
