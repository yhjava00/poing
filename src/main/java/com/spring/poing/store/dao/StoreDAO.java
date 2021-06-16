package com.spring.poing.store.dao;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

public interface StoreDAO {

	public StoreAllVO selectStoreAll(Map<String, Object> storeInfo);
	
	public StoreVO selectStore(int storeIdx);
	
	public List<String> selectStoreImgList(int storeIdx);
	
}
