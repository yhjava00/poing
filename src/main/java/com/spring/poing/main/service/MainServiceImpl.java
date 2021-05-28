package com.spring.poing.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.poing.main.dao.MainDAOImpl;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAOImpl mainDAO;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	@Override
	public Map<String, Object> getMainInfo() {
		
		Map<String, Object> mainInfo = new HashMap<String, Object>();
		
		List<CategoryVO> category = mainDAO.getCategory();
		
		mainInfo.put("category", category);
		
		return mainInfo;
	}
	
	@Override
	public String login(String id, String pw) {
		
		String loginState = "login";
		
		MemberVO member = mainDAO.selectMember(id);
		
		if(member==null) {
			loginState = "no member";
		}else if(!pw.equals(member.getPw())) {
			loginState = "incorrect pw";
		}
		
		return loginState;
	}
	
	@Override
	public String signUp(MemberVO vo) {
		
		String signUpState = "signUp";
		
		MemberVO member = mainDAO.selectMember(vo.getId());
		
		if(member==null) {
			vo.setPw(passwordEncoder.encode(vo.getPw()));
			mainDAO.insertMember(vo);
		}else {
			signUpState = "Exist member";
		}
		
		return signUpState;
	}
	
}
