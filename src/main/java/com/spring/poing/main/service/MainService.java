package com.spring.poing.main.service;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.StoreVO;

public interface MainService {
	
	public Map<String, Object> getMainInfo();
	
	public String login(String id, String pw);
	
	public String signUp(MemberVO vo);
	
	public Map<String, Object> search(String search, int page);
	
	public Map<String, Object> store(int storeIdx);
	
	public String selectTime(int storeIdx, String date);
	
	public String reservation(ReservationVO vo);
	
}
