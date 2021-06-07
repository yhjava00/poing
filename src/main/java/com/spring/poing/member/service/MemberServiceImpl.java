package com.spring.poing.member.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.poing.member.dao.MemberDAOImpl;
import com.spring.poing.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAOImpl memberDAO;
	
	@Inject
	PasswordEncoder passwordEncoder;

	@Override
	public String login(String id, String pw) {
		
		String loginState = "login";
		
		MemberVO member = memberDAO.selectMember(id);
		
		if(member==null) {
			loginState = "no member";
		}else if(!passwordEncoder.matches(pw, member.getPw())) {
			loginState = "incorrect pw";
		}
		
		return loginState;
	}
	
	@Override
	public String findPw(String id, String pw) {
		
		MemberVO member = memberDAO.selectMember(id);
		
		if(member==null) {
			return "no member";
		}
		
		pw = passwordEncoder.encode(pw);
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("pw", pw);
		
		memberDAO.changePw(info);
		
		return "success";
	}
	
	@Override
	public String signUp(MemberVO vo) {
		
		String signUpState = "signUp";
		
		MemberVO member = memberDAO.selectMember(vo.getId());
		
		if(member==null) {
			vo.setPw(passwordEncoder.encode(vo.getPw()));
			memberDAO.insertMember(vo);
		}else {
			signUpState = "Exist member";
		}
		
		return signUpState;
	}
	
}
