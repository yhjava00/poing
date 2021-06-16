package com.spring.poing.store.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.main.dao.MainDAO;
import com.spring.poing.store.dao.StoreDAO;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;
	
	@Autowired
	MainDAO mainDAO;
	
	@Override
	public Map<String, Object> storeModify(String id, int storeIdx) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("id", id);
		info.put("storeIdx", storeIdx);
		
		StoreAllVO store = storeDAO.selectStoreAll(info);
		List<String> storeImgList = storeDAO.selectStoreImgList(storeIdx);
		List<CategoryVO> categoryList = mainDAO.getCategory();
		
		info.put("store", store);
		info.put("storeImgList", storeImgList);
		info.put("categoryList", categoryList);
		
		return info;
	}
	
}
