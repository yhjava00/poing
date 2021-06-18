package com.spring.poing.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

import oracle.net.aso.s;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public int totStorePastRes(Map<String, Object> info) {
		return sqlSession.selectOne("store.totStorePastRes", info);
	}

	@Override
	public int totStoreComingVisit(Map<String, Object> info) {
		return sqlSession.selectOne("store.totStoreComingVisit", info);
	}
	
	@Override
	public StoreAllVO selectStoreAll(Map<String, Object> storeInfo) {
		return sqlSession.selectOne("store.selectStoreAll", storeInfo);
	}
	
	@Override
	public StoreVO selectStore(int storeIdx) {
		return sqlSession.selectOne("store.selectStore", storeIdx);
	}
	
	@Override
	public List<String> selectStoreImgList(int storeIdx) {
		return sqlSession.selectList("store.selectstoreImgList", storeIdx);
	}
	
	@Override
	public int updateStore(StoreAllVO store) {
		return sqlSession.update("store.updateStore", store);
	}
	
	@Override
	public int updateStoreInfo(StoreAllVO store) {
		return sqlSession.update("store.updateStoreInfo", store);
	}
	
	@Override
	public int totStoreImg(int storeIdx) {
		return sqlSession.selectOne("store.totStoreImg", storeIdx);
	}
	
	@Override
	public int deleteImg(Map<String, Object> info) {
		return sqlSession.delete("store.deleteImg", info);
	}
	
	@Override
	public int updateMainImg(Map<String, Object> info) {
		return sqlSession.update("store.updateMainImg", info);
	}
	
	@Override
	public int insertImg(Map<String, Object> info) {
		return sqlSession.insert("store.insertImg", info);
	}
	
	@Override
	public List<Object> storePastResList(Map<String, Object> info) {
		return sqlSession.selectList("store.storePastResList", info);
	}
	
	@Override
	public List<Object> storeComingVisitList(Map<String, Object> info) {
		return sqlSession.selectList("store.storeComingVisitList", info);
	}
	
	@Override
	public int insertStore() {
		return sqlSession.insert("store.insertStore");
	}
	
	@Override
	public int selectNewStoreIdx() {
		return sqlSession.selectOne("selectNewStoreIdx");
	}
	
	@Override
	public int updateMemberStore(Map<String, Object> info) {
		return sqlSession.update("updateMemberStore", info);
	}
	
	@Override
	public int insertStoreInfo(int storeIdx) {
		return sqlSession.insert("store.insertStoreInfo", storeIdx);
	}
	
}
