package com.spring.poing.store.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	SqlSession sqlSession;

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
	
}
