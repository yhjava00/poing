package com.spring.poing.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.poing.main.dao.MainDAO;
import com.spring.poing.member.dao.MemberDAO;
import com.spring.poing.store.dao.StoreDAO;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;
	
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public String storeModify(StoreAllVO store) {
		
		String[] addr = store.getAddr().split(" ");
		
		store.setLocation1(addr[0]);
		store.setLocation2(addr[1]);
		
		int state1 = storeDAO.updateStore(store);
		int state2 = storeDAO.updateStoreInfo(store);
		
		if(state1+state2!=2) {
			return "error";
		}
		
		return "success";
	}
	
	@Override
	public StringBuilder deleteImg(int storeIdx, String img) {

		StringBuilder json = new StringBuilder();
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", storeIdx);
		info.put("img", img);
		
		int state = storeDAO.deleteImg(info);
		
		if(state<=0) {
			return json.append("{\"state\":\"error\"}");
		}
		
		json.append("{\"state\":\"success\", \"imgList\":");
		
		ObjectMapper mapper = new ObjectMapper();
		
		List<String> storeImgList = storeDAO.selectStoreImgList(storeIdx);

		try {
			json.append(mapper.writeValueAsString(storeImgList));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
				
		json.append("}");
		
		return json;
	}
	
	@Override
	public StoreAllVO getstoreInfo(String id, int storeIdx) {

		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("id", id);
		info.put("storeIdx", storeIdx);
		
		return storeDAO.selectStoreAll(info);
	}
	
	@Override
	public String updateMainImg(int storeIdx, String mainImg) {

		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", storeIdx);
		info.put("mainImg", mainImg);
		
		int state = storeDAO.updateMainImg(info);
		
		if(state==0) {
			return "{\"state\" : \"error\"}";
		}
		
		return "{\"state\" : \"success\", \"mainImg\" : \"" + mainImg + "\"}";
	}
	
	@Override
	public String updateImg(int storeIdx, List<String> fileNameList) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", storeIdx);
		info.put("fileNameList", fileNameList);
		
		int state = storeDAO.insertImg(info);
		
		if(state!=fileNameList.size()) {
			return "{\"state\" : \"error\"}";
		}
		

		List<String> storeImgList = storeDAO.selectStoreImgList(storeIdx);
		
		StringBuilder json = new StringBuilder();

		json.append("{\"state\":\"success\", \"imgList\":");
		
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			json.append(mapper.writeValueAsString(storeImgList));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
				
		json.append("}");
		
		return json.toString();
	}
	
	@Override
	public int addStore(String storeId) {
		
		MemberVO member = memberDAO.selectMember(storeId);
		
		if(member==null) {
			return -1;
		}else if(member.getStore_check()>0) {
			return -2;
		}
		
		storeDAO.insertStore();
		int storeIdx = storeDAO.selectNewStoreIdx();
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeId", storeId);
		info.put("storeIdx", storeIdx);
		
		storeDAO.updateMemberStore(info);
		storeDAO.insertStoreInfo(storeIdx);
		
		return storeIdx;
	}
	
}
