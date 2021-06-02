package com.spring.poing.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

import oracle.net.aso.s;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CategoryVO> getCategory() {
		return sqlSession.selectList("main.category");
	}
	
	@Override
	public List<StoreVO> selectRecommendList() {
		return sqlSession.selectList("main.selectRecommendList");
	}
	
	@Override
	public MemberVO selectMember(String id) {
		return sqlSession.selectOne("main.selectMember", id);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert("main.insertMember", vo);
	}
	
	@Override
	public int totSearchNO(String search) {
		return sqlSession.selectOne("main.totSearchNO", search);
	}
	
	@Override
	public List<StoreVO> selectSearchList(Map<String, Object> searchMap) {
		return sqlSession.selectList("main.selectSearchList", searchMap);
	}
	
	@Override
	public StoreAllVO selectStoreAllList(int storeIdx) {
		return sqlSession.selectOne("main.selectStoreAllList", storeIdx);
	}
	
	@Override
	public List<String> selectStoreImgList(int storeIdx) {
		return sqlSession.selectList("main.selectstoreImgList", storeIdx);
	}
	
	@Override
	public List<String> getUnreservedTimeList(Map<String, Object> info) {
		return sqlSession.selectList("main.unreservedTimeList", info);
	}
	
}
