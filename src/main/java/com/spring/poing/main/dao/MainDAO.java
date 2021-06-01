package com.spring.poing.main.dao;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

public interface MainDAO {

	public List<CategoryVO> getCategory();
	
	public List<StoreVO> selectRecommendList();
	
	public MemberVO selectMember(String id);
	
	public int insertMember(MemberVO vo);
	
	public int totSearchNO(String search);
	
	public List<StoreVO> selectSearchList(Map<String, Object> searchMap);
	
	public StoreAllVO selectStoreAllList(int storeIdx);
	
	public List<String> selectStoreImgList(int storeIdx);
}
