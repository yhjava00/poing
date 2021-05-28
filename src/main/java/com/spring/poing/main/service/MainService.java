package com.spring.poing.main.service;

import java.util.Map;

import com.spring.poing.vo.MemberVO;

public interface MainService {
	
	public Map<String, Object> getMainInfo();
	
	public String login(String id, String pw);
	
	public String signUp(MemberVO vo);
	
}
