package com.spring.poing.main.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.poing.main.dao.MainDAO;
import com.spring.poing.main.dao.MainDAOImpl;
import com.spring.poing.member.dao.MemberDAO;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAO mainDAO;
	
	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public Map<String, Object> getMainInfo() {
		
		Map<String, Object> mainInfo = new HashMap<String, Object>();
		
		List<CategoryVO> category = mainDAO.getCategory();
		List<StoreVO> recommendList = mainDAO.selectRecommendList();
		
		mainInfo.put("category", category);
		mainInfo.put("recommendList", recommendList);
		
		return mainInfo;
	}
	
	@Override
	public Map<String, Object> search(String search, int page) {
		
		int totSearchNO = mainDAO.totSearchNO(search);
		
		int lastPage = (totSearchNO-1)/12 + 1;
		
		if(page > lastPage)
			page = lastPage;
		
		Map<String, Object> infoMap = new HashMap<String, Object>();
		
		infoMap.put("search", search);
		infoMap.put("page", page);
		
		List<StoreVO> searchList = mainDAO.selectSearchList(infoMap);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		
		int frontPage = 1;
		int behindPage = lastPage;
		
		if(page>2) {
			frontPage = page-2;
		}
		
		if(page<lastPage-1) {
			behindPage = page+2;
		}
		
		searchMap.put("search", search);
		
		searchMap.put("totSearchNO", totSearchNO);
		
		searchMap.put("frontPage", frontPage);
		searchMap.put("behindPage", behindPage);
		searchMap.put("page", page);
		searchMap.put("lastPage", lastPage);
		
		searchMap.put("searchList", searchList);
		
		return searchMap;
	}
	
	@Override
	public Map<String, Object> store(String id, int storeIdx) {
		
		Map<String, Object> storeInfo = new HashMap<String, Object>();
		
		if(id==null) {
			id = "";
		}
		
		storeInfo.put("id", id);
		storeInfo.put("storeIdx", storeIdx);
		
		StoreAllVO storeAllVO = mainDAO.selectStoreAll(storeInfo);
		List<String> storeImgList = mainDAO.selectStoreImgList(storeIdx);
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
				return "{ \"time\" : [], \"len\" : 0";
			}
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", storeIdx);
		info.put("id", "");
		
		StoreAllVO storeAllVO = mainDAO.selectStoreAll(info);
		
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
		
		int lastPage = (totReviewNO-1)/30 + 1;
		
		if(page > lastPage)
			page = lastPage;
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("storeIdx", placeId);
		info.put("page", page);
		
		List<ReviewVO> reviewList = mainDAO.selectReviewList(info);
		StoreVO store = mainDAO.selectStore(placeId);

		Map<String, Object> reviewInfo = new HashMap<String, Object>();
		
		int frontPage = 1;
		int behindPage = lastPage;
		
		if(page>2) {
			frontPage = page-2;
		}
		
		if(page<lastPage-1) {
			behindPage = page+2;
		}
		
		reviewInfo.put("store", store);
		reviewInfo.put("reviewList", reviewList);
		
		reviewInfo.put("totReviewNO", totReviewNO);
		
		reviewInfo.put("frontPage", frontPage);
		reviewInfo.put("behindPage", behindPage);
		reviewInfo.put("page", page);
		reviewInfo.put("lastPage", lastPage);
		
		return reviewInfo;
	}
	
	@Override
	public StoreVO getStoreinfo(int storeIdx) {
		return mainDAO.selectStore(storeIdx);
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
		
		int lastPage = 0;
		
		if(path.equals("past_reservation")) {
			lastPage = (totPastRes-1)/10 + 1;
		}else if(path.equals("review")) {
			lastPage = (totMyReview-1)/10 + 1;
		}else if(path.equals("coming_visit")) {
			lastPage = (totComingVisit-1)/10 + 1;
		}else if(path.equals("like_store")) {
			lastPage = (totLikeStore-1)/10 + 1;
		}

		if(page > lastPage)
			page = lastPage;
		
		info.put("page", page);
		
		List<Object> itemList =  null;
		
		if(path.equals("past_reservation")) {
			itemList = mainDAO.pastResList(info);
		}else if(path.equals("review")) {
			itemList = mainDAO.myReviewList(info);
		}else if(path.equals("coming_visit")) {
			itemList = mainDAO.comingVisitList(info);
		}else if(path.equals("like_store")) {
			itemList = mainDAO.likeStoreList(info);
		}
		
		info.clear();
		
		int frontPage = 1;
		int behindPage = lastPage;
		
		if(page>2) {
			frontPage = page-2;
		}
		
		if(page<lastPage-1) {
			behindPage = page+2;
		}
		
		MemberVO member = memberDAO.selectMember(id);
		
		info.put("member", member);
		
		info.put("totComingVisit", totComingVisit);
		info.put("totMyReview", totMyReview);
		info.put("totLikeStore", totLikeStore);
		
		info.put("itemList", itemList);

		info.put("frontPage", frontPage);
		info.put("behindPage", behindPage);
		info.put("page", page);
		info.put("lastPage", lastPage);
		
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
	
}
