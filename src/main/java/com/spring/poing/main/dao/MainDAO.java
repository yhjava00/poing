package com.spring.poing.main.dao;

import java.util.List;
import java.util.Map;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

public interface MainDAO {

	public List<CategoryVO> getCategory();
	
	public List<StoreVO> selectRecommendList();
	
	public List<StoreVO> selectLotOfLikesList();
	
	public int totSearchNO(String search);
	
	public int totReviewNO(int storeIdx);
	
	public int totPastRes(Map<String, Object> info);

	public int totComingVisit(Map<String, Object> info);
	
	public int totMyReview(String id);
	
	public int totLikeStore(String id);
	
	public List<StoreVO> selectSearchList(Map<String, Object> searchMap);
	
	public StoreAllVO selectStoreAll(Map<String, Object> storeInfo);
	
	public StoreVO selectStore(int storeIdx);
	
	public List<String> selectStoreImgList(int storeIdx);
	
	public List<String> getUnreservedTimeList(Map<String, Object> info);
	
	public int insertReservation(ReservationVO vo);
	
	public int updateStoreStar(Map<String, Object> info);
	
	public int insertReview(ReviewVO vo);
	
	public int canIWriteReview(Map<String, Object> info);
	
	public List<ReviewVO> selectOnlyThreeReviewList(int storeIdx);
	
	public List<ReviewVO> selectReviewList(Map<String, Object> info);
	
	public List<Object> pastResList(Map<String, Object> info);
	
	public List<Object> comingVisitList(Map<String, Object> info);
	
	public List<Object> myReviewList(Map<String, Object> info);
	
	public List<Object> likeStoreList(Map<String, Object> info);
	
	public int iLikeThis(Map<String, Object> info);

	public int iLikedThis(Map<String, Object> info);
	
	public int deleteReservation(Map<String, Object> info);
	
}
