package com.spring.poing.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ParseException;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.spring.poing.vo.MemberVO;

public interface MemberController {

	public String login(Model model, HttpSession session);
	
	public String loginAction(HttpServletRequest request, String id, String pw);
	
	public String naverLoginAction(String code, String state, HttpSession session) throws IOException, ParseException;
	
	public String findPw();
	
	public String logOutAction(HttpServletRequest request);
	
	public String signUp();
	
	public String signUpAction(MemberVO vo);

	public String uploadProfilAction(HttpServletRequest request, MultipartFile profile);

	public String updateNicknameAction(HttpServletRequest request, String nickname);
	
	public String updatePasswordAction(HttpServletRequest request, String pw, String newPw);
	
	public String withdrawalAction(HttpServletRequest request, String pw);

}
