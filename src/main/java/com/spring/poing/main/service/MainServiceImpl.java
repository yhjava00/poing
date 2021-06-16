package com.spring.poing.main.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.main.dao.MainDAO;
import com.spring.poing.member.dao.MemberDAO;
import com.spring.poing.store.dao.StoreDAO;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

import oracle.net.aso.p;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Autowired
	StoreDAO storeDAO;
	
	@Override
	public Map<String, Object> getMainInfo() {
		
		Map<String, Object> mainInfo = new HashMap<String, Object>();
		
		List<CategoryVO> category = mainDAO.getCategory();
		List<StoreVO> recommendList = mainDAO.selectRecommendList();
		List<StoreVO> likeList = mainDAO.selectLotOfLikesList();
		
		mainInfo.put("category", category);
		mainInfo.put("recommendList", recommendList);
		mainInfo.put("likeList", likeList);
		
		return mainInfo;
	}
	
	@Override
	public Map<String, Object> search(String search, int page) {
		
		int totSearchNO = mainDAO.totSearchNO(search);

		Map<String, Object> info = new HashMap<String, Object>();
		
		paging(info, totSearchNO, page, 12);
		
		info.put("search", search);
		
		List<StoreVO> searchList = mainDAO.selectSearchList(info);
		
		info.put("search", search);
		
		info.put("totSearchNO", totSearchNO);
		
		info.put("searchList", searchList);
		
		return info;
	}
	
	@Override
	public Map<String, Object> store(String id, int storeIdx) {
		
		Map<String, Object> storeInfo = new HashMap<String, Object>();
		
		if(id==null) {
			id = "";
		}
		
		storeInfo.put("id", id);
		storeInfo.put("storeIdx", storeIdx);
		
		StoreAllVO storeAllVO = storeDAO.selectStoreAll(storeInfo);
		List<String> storeImgList = storeDAO.selectStoreImgList(storeIdx);
		List<ReviewVO> reviewList = mainDAO.selectOnlyThreeReviewList(storeIdx);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		
		Date tomorrowDate = new Date();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(tomorrowDate);
		cal.add(Calendar.DATE, 1);
				
		String tomorrow = dateFormat.format(cal.getTime());
		
		storeInfo.put("storeAllVO", storeAllVO);
		storeInfo.put("storeImgList", storeImgList);
		storeInfo.put("reviewList", reviewList);
		storeInfo.put("tomorrow", tomorrow);
		
		return storeInfo;
	}
	
	@Override
	public String selectTime(int storeIdx, String date) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		
		try {
			
			Date selectDate = dateFormat.parse(date);
			
			Date todayDate = new Date();
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(todayDate);
			cal.add(Calendar.MONTH, 2);
			
			Date twoMonthsLater = cal.getTime();
			
			int compare = selectDate.compareTo(todayDate);
			int compare2 = selectDate.compareTo(twoMonthsLater);
			
			if(compare<0||compare2>0) {
				return "{ \"time\" : [], \"len\" : 0}";
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", storeIdx);
		info.put("id", "");
		
		StoreAllVO storeAllVO = storeDAO.selectStoreAll(info);
		
		List<String> selectTimeList = getSelectTimeList(storeAllVO.getOpening_hours());
		
		Map<String, Object> unreservedTimeInfo = new HashMap<String, Object>();
		
		unreservedTimeInfo.put("idx", storeIdx);
		unreservedTimeInfo.put("date", date);
		unreservedTimeInfo.put("peopleNum", 1);
		
		List<String> unreservedTimeList = mainDAO.getUnreservedTimeList(unreservedTimeInfo);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("{ \"time\" : [");
		
		for(int i=0; i<selectTimeList.size(); i++) {
			if(!unreservedTimeList.contains(selectTimeList.get(i)))
				sb.append("\""+ selectTimeList.get(i) +"\", ");
		}
		
		sb.deleteCharAt(sb.lastIndexOf(","));
		
		sb.append("], ");
		
		sb.append("\"len\" : " + (selectTimeList.size() - unreservedTimeList.size()) + "}");
		
		return sb.toString();
	}
	
	public List<String> getSelectTimeList(String opening_hours) {
		
		List<String> selectTimeList = new ArrayList<String>();
		
		String firstTime = "";
		String secondTime = null;
		
		if(opening_hours.contains("/")) {
			firstTime = opening_hours.substring(0, opening_hours.indexOf('/')-1);
			secondTime = opening_hours.substring(opening_hours.indexOf('/')+2);
		} else {
			firstTime = opening_hours;
		}
		
		selectTimeListAdd(selectTimeList, firstTime);
		
		if(secondTime!=null) {
			selectTimeListAdd(selectTimeList, secondTime);			
		}
		
		return selectTimeList;
	}
	
	public void selectTimeListAdd(List<String> selectTimeList, String time) {
		
		int hour = Integer.parseInt(time.substring(0, time.indexOf(':')));
		int min = Integer.parseInt(time.substring(time.indexOf(':')+1, time.indexOf('~')));
		
		int closeHour = Integer.parseInt(time.substring(time.indexOf('~')+1, time.lastIndexOf(':')));
		int closeMin = Integer.parseInt(time.substring(time.lastIndexOf(':')+1));
		
		if(min==30) {
			selectTimeList.add(hour + "시 30분");
			hour++;
		}
		
		while(hour<closeHour) {
			selectTimeList.add(hour + "시 00분");
			selectTimeList.add(hour + "시 30분");
			hour++;	
		}
		
		selectTimeList.add(hour + "시 00분");
		
		if(closeMin==30)
			selectTimeList.add(hour + "시 30분");
	}
	
	@Override
	public String reservation(ReservationVO vo) {

		String state = "success";
		
		int insertNum = mainDAO.insertReservation(vo);
		
		if(insertNum < 1) {
			state = "failed";
		}
		
		return state;
	}
	
	@Override
	public String writeReview(ReviewVO vo) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd/hh시 mm분");
		Date todayDate = new Date();
		String dayAndTime = dateFormat.format(todayDate);
		
		String today = dayAndTime.substring(0, dayAndTime.indexOf("/"));
		String time = dayAndTime.substring(dayAndTime.indexOf("/")+1);
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("today", today);
		info.put("time", time);
		info.put("id", vo.getMember_id());
		info.put("idx", vo.getStore_idx());
		
		int canReviewNum = mainDAO.canIWriteReview(info);

		if(canReviewNum<=0) {
			return "not visited";
		}
		
		int insertNum = mainDAO.insertReview(vo);
		
		if(insertNum < 1) {
			return "failde";
		}
		
		info.clear();
		
		info.put("storeIdx", vo.getStore_idx());
		info.put("star", vo.getStar());
		
		mainDAO.updateStoreStar(info);
		
		return "success";
	}
	
	@Override
	public Map<String, Object> review(int placeId, int page) {
		
		int totReviewNO = mainDAO.totReviewNO(placeId);

		Map<String, Object> info = new HashMap<String, Object>();
		
		paging(info, totReviewNO, page, 30);
		
		info.put("storeIdx", placeId);
		
		List<ReviewVO> reviewList = mainDAO.selectReviewList(info);
		StoreVO store = storeDAO.selectStore(placeId);

		info.put("store", store);
		info.put("reviewList", reviewList);
		
		info.put("totReviewNO", totReviewNO);
		
		return info;
	}
	
	@Override
	public StoreVO getStoreinfo(int storeIdx) {
		return storeDAO.selectStore(storeIdx);
	}
	
	@Override
	public Map<String, Object> myPage(String path, String id, int page) {

		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		
		Date todayDate = new Date();
		
		String today = dateFormat.format(todayDate);
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("id", id);
		info.put("today", today);
		
		int totPastRes = mainDAO.totPastRes(info);
		int totMyReview = mainDAO.totMyReview(id);
		int totComingVisit = mainDAO.totComingVisit(info);
		int totLikeStore = mainDAO.totLikeStore(id);
		
		if(path.equals("past_reservation")) {
			paging(info, totPastRes, page, 10);
		}else if(path.equals("review")) {
			paging(info, totMyReview, page, 10);
		}else if(path.equals("coming_visit")) {
			paging(info, totComingVisit, page, 10);
		}else if(path.equals("like_store")) {
			paging(info, totLikeStore, page, 10);
		}

		List<Object> itemList = null;
		
		if(path.equals("past_reservation")) {
			itemList = mainDAO.pastResList(info);
		}else if(path.equals("review")) {
			itemList = mainDAO.myReviewList(info);
		}else if(path.equals("coming_visit")) {
			itemList = mainDAO.comingVisitList(info);
		}else if(path.equals("like_store")) {
			itemList = mainDAO.likeStoreList(info);
		}
		
		MemberVO member = memberDAO.selectMember(id);
		
		member.setPw("");
		
		info.put("member", member);
		
		info.put("totComingVisit", totComingVisit);
		info.put("totMyReview", totMyReview);
		info.put("totLikeStore", totLikeStore);
		
		info.put("itemList", itemList);

		return info;
	}
	
	@Override
	public String like(String memberId, int storeIdx, byte like) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("id", memberId);
		info.put("idx", storeIdx);
		
		if(like==0) {
			mainDAO.iLikedThis(info);
			return "liked";
		}else {
			mainDAO.iLikeThis(info);
			return "like";
		}
	}

	public void paging(Map<String, Object> info, int totNum, int page, int line) {

		int lastPage = (totNum-1)/line + 1;
		
		if(page > lastPage)
			page = lastPage;
		
		int frontPage = 1;
		int behindPage = lastPage;
		
		if(page>2) {
			frontPage = page-2;
		}
		
		if(page<lastPage-1) {
			behindPage = page+2;
		}
		
		info.put("page", page);
		info.put("lastPage", lastPage);
		info.put("frontPage", frontPage);
		info.put("behindPage", behindPage);

	}
	
	@Override
	public String cancelReservation(String id, int store_idx, String resDate, String time, int page) {
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("id", id);
		info.put("store_idx", store_idx);
		info.put("resDate", resDate);
		info.put("time", time);
		
		int state = mainDAO.deleteReservation(info);
		
		if(state<=0)
			return "{\"state\" : \"error\"}";
		
		return "{\"state\" : \"success\"}";
	}
}
