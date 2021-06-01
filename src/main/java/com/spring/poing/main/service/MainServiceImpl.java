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
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

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
		List<StoreVO> recommendList = mainDAO.selectRecommendList();
		
		mainInfo.put("category", category);
		mainInfo.put("recommendList", recommendList);
		
		return mainInfo;
	}
	
	@Override
	public String login(String id, String pw) {
		
		String loginState = "login";
		
		MemberVO member = mainDAO.selectMember(id);
		
		if(member==null) {
			loginState = "no member";
		}else if(!passwordEncoder.matches(pw, member.getPw())) {
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
	
	@Override
	public Map<String, Object> search(String search, int page) {
		
		int totSearchNO = mainDAO.totSearchNO(search);
		
		int lastPage = (totSearchNO-1)/12 + 1;
		
		if(page > lastPage)
			page = lastPage;
		
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		infoMap.put("search", search);
		infoMap.put("page", page);
		
		List<StoreVO> searchList = mainDAO.selectSearchList(infoMap);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		int frontPage = 1;
		int behindPage = lastPage;
		
		if(page>2) {
			frontPage = page-2;
		}
		
		if(page<lastPage-1) {
			behindPage = page+2;
		}
		
		searchMap.put("search", search);
		
		searchMap.put("totSearchNO", totSearchNO);
		
		searchMap.put("frontPage", frontPage);
		searchMap.put("behindPage", behindPage);
		searchMap.put("page", page);
		searchMap.put("lastPage", lastPage);
		
		searchMap.put("searchList", searchList);
		
		return searchMap;
	}
	
	@Override
	public Map<String, Object> store(int storeIdx) {
		
		Map<String, Object> storeInfo = new HashMap<String, Object>();
		
		StoreAllVO storeAllVO = mainDAO.selectStoreAllList(storeIdx);
		List<String> storeImgList = mainDAO.selectStoreImgList(storeIdx);
		
		storeInfo.put("storeAllVO", storeAllVO);
		storeInfo.put("storeImgList", storeImgList);
		
		return storeInfo;
	}
	
}
