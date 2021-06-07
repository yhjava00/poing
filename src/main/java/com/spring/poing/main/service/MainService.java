package com.spring.poing.main.service;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreVO;

public interface MainService {
	
	public Map<String, Object> getMainInfo();
	
	public Map<String, Object> search(String search, int page);
	
	public Map<String, Object> store(int storeIdx);
	
	public String selectTime(int storeIdx, String date);
	
	public String reservation(ReservationVO vo);
	
	public String writeReview(ReviewVO vo);
	
	public Map<String, Object> review(int placeId, int page);
	
	public StoreVO getStoreinfo(int storeIdx);
	
	public Map<String, Object> myPage(String path, String id, int page);
	
}
