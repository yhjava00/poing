package com.spring.poing.store.dao;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

public interface StoreDAO {

	public int totStorePastRes(Map<String, Object> info);

	public int totStoreComingVisit(Map<String, Object> info);
	
	public StoreAllVO selectStoreAll(Map<String, Object> storeInfo);
	
	public StoreVO selectStore(int storeIdx);
	
	public List<String> selectStoreImgList(int storeIdx);
	
	public int updateStore(StoreAllVO store);
	
	public int updateStoreInfo(StoreAllVO store);
	
	public int totStoreImg(int storeIdx);
	
	public int deleteImg(Map<String, Object> info);
	
	public int updateMainImg(Map<String, Object> info);
	
	public int insertImg(Map<String, Object> info);
	
	public List<Object> storePastResList(Map<String, Object> info);

	public List<Object> storeComingVisitList(Map<String, Object> info);
	
	public int insertStore();
	
	public int selectNewStoreIdx();
	
	public int updateMemberStore(Map<String, Object> info);
	
	public int insertStoreInfo(int storeIdx);
	
}
