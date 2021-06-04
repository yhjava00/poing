package com.spring.poing.main.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
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
	public int totReviewNO(int storeIdx) {
		return sqlSession.selectOne("main.totReviewNO", storeIdx);
	}
	
	@Override
	public List<StoreVO> selectSearchList(Map<String, Object> searchMap) {
		return sqlSession.selectList("main.selectSearchList", searchMap);
	}
	
	@Override
	public StoreAllVO selectStoreAll(int storeIdx) {
		return sqlSession.selectOne("main.selectStoreAll", storeIdx);
	}
	
	@Override
	public StoreVO selectStore(int storeIdx) {
		return sqlSession.selectOne("main.selectStore", storeIdx);
	}
	
	@Override
	public List<String> selectStoreImgList(int storeIdx) {
		return sqlSession.selectList("main.selectstoreImgList", storeIdx);
	}
	
	@Override
	public List<String> getUnreservedTimeList(Map<String, Object> info) {
		return sqlSession.selectList("main.unreservedTimeList", info);
	}
	
	@Override
	public int insertReservation(ReservationVO vo) {
		return sqlSession.insert("main.insertReservation", vo);
	}
	
	@Override
	public int updateStoreStar(Map<String, Object> info) {
		return sqlSession.update("main.updateStoreStar", info);
	}
	
	@Override
	public int insertReview(ReviewVO vo) {
		return sqlSession.insert("main.insertReview", vo);
	}
	
	@Override
	public int canIWriteReview(Map<String, Object> info) {
		return sqlSession.selectOne("main.canIWriteReview", info);
	}
	
	@Override
	public List<ReviewVO> selectOnlyThreeReviewList(int storeIdx) {
		return sqlSession.selectList("main.selectOnlyThreeReviewList", storeIdx);
	}
	
	@Override
	public List<ReviewVO> selectReviewList(Map<String, Object> info) {
		return sqlSession.selectList("main.selectReviewList", info);
	}
	
}
