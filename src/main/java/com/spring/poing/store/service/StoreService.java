package com.spring.poing.store.service;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.StoreAllVO;

public interface StoreService {
	
	public String storeModify(StoreAllVO store);
	
	public StringBuilder deleteImg(int storeIdx, String img);
	
	public StoreAllVO getstoreInfo(String id, int storeIdx);
	
	public String updateMainImg(int storeIdx, String mainImg);
	
	public String updateImg(int storeIdx, List<String> fileNameList);
	
	public int addStore(String storeId);

}
