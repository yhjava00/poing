package com.spring.poing.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.spring.poing.vo.MemberVO;

public interface MemberController {

	public String login();
	
	public String loginAction(HttpServletRequest request, String id, String pw);
	
	public String findPw();
	
	public String logOutAction(HttpServletRequest request);
	
	public String signUp();
	
	public String signUpAction(MemberVO vo);

	public String uploadProfilAction(HttpServletRequest request, MultipartFile profile);

	public String updateNicknameAction(HttpServletRequest request, String nickname);
	
	public String updatePasswordAction(HttpServletRequest request, String pw, String newPw);
	
	public String withdrawalAction(HttpServletRequest request, String pw);

}
