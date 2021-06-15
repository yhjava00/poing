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
	public int login(String id, String pw) {
		
		int state = 0;
		
		MemberVO member = memberDAO.selectMember(id);
		
		if(member==null) {
			//"no member"
			state = -1;
		}else if(!passwordEncoder.matches(pw, member.getPw())) {
			//incorrect pw
			state = -2;
		}else if(member.getStore_check()>0) {
			state = member.getStore_check();
		}
		
		return state;
	}
	
	@Override
	public int naverLogin(String id, String nickname) {
		
		MemberVO member = memberDAO.selectMember(id);
		
		if(member!=null&&!member.getMember_type().equals("naver"))
			return -1;
		
		if(member==null) {
			member = new MemberVO(id, nickname, "naver");
			memberDAO.insertMember(member);
		}
		
		if(member.getStore_check()>0) {
			return member.getStore_check();
		}
		
		return 0;
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
		
		vo.setMember_type("default");
		
		if(member==null) {
			vo.setPw(passwordEncoder.encode(vo.getPw()));
			memberDAO.insertMember(vo);
		}else {
			signUpState = "Exist member";
		}
		
		return signUpState;
	}

	@Override
	public String changeProfile(String id, String profile) {

		String beforeName = memberDAO.selectProfile(id);
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("profile", profile);
		
		int state = memberDAO.updateProfile(info);
		
		if(state<=0) {
			return "error";
		}
		
		return beforeName;
	}
	
	@Override
	public String updateNickname(String id, String nickname) {
		
		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("nickname", nickname);
		
		int state = memberDAO.updateNickname(info);
		
		if(state<=0) {
			return "erorr";
		}
		
		return "success";
	}
	
	@Override
	public String updatePassword(String id, String pw, String newPw) {
		
		MemberVO member = memberDAO.selectMember(id);
		
		if(!passwordEncoder.matches(pw, member.getPw())) {
			return "wrong pw";
		}
		
		pw = passwordEncoder.encode(newPw);

		Map<String, String> info = new HashMap<String, String>();
		
		info.put("id", id);
		info.put("pw", pw);

		int state = memberDAO.updatePassword(info);
		
		if(state<=0) {
			return "erorr";
		}
		
		return "success";
	}
	
	@Override
	public String withdrawal(String id, String pw) {
		
		MemberVO member = memberDAO.selectMember(id);

		if(!passwordEncoder.matches(pw, member.getPw())) {
			return "wrong pw";
		}
		
		int state = memberDAO.deleteMember(id);
		
		if(state<=0) {
			return "erorr";
		}
		
		return "success";
	}
	
}
