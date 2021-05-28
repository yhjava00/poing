package com.spring.poing.main.dao;

import java.util.List;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;

public interface MainDAO {

	public List<CategoryVO> getCategory();
	
	public MemberVO selectMember(String id);
	
	public int insertMember(MemberVO vo);
	
}
