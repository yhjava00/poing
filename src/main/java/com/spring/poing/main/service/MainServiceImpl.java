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

import com.spring.poing.main.dao.MainDAOImpl;
import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAOImpl mainDAO;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
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
	public String login(String id, String pw) {
		
		String loginState = "login";
		
		MemberVO member = mainDAO.selectMember(id);
		
		if(member==null) {
			loginState = "no member";
		}else if(!passwordEncoder.matches(pw, member.getPw())) {
			loginState = "incorrect pw";
		}
		
		return loginState;
	}
	
	@Override
	public String signUp(MemberVO vo) {
		
		String signUpState = "signUp";
		
		MemberVO member = mainDAO.selectMember(vo.getId());
		
		if(member==null) {
			vo.setPw(passwordEncoder.encode(vo.getPw()));
			mainDAO.insertMember(vo);
		}else {
			signUpState = "Exist member";
		}
		
		return signUpState;
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
	public Map<String, Object> store(int storeIdx) {
		
		Map<String, Object> storeInfo = new HashMap<String, Object>();
		
		StoreAllVO storeAllVO = mainDAO.selectStoreAll(storeIdx);
		List<String> storeImgList = mainDAO.selectStoreImgList(storeIdx);
		List<ReviewVO> reviewList = mainDAO.selectOnlyThreeReviewList(storeIdx);
		int countAllReview = mainDAO.countAllReview(storeIdx);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd");
		
		Date tomorrowDate = new Date();
		
		Calendar cal = Calendar.getInstance();
		cal.setTime(tomorrowDate);
		cal.add(Calendar.DATE, 1);
				
		String tomorrow = dateFormat.format(cal.getTime());
		
		storeInfo.put("storeAllVO", storeAllVO);
		storeInfo.put("storeImgList", storeImgList);
		storeInfo.put("reviewList", reviewList);
		storeInfo.put("countAllReview", countAllReview);
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
		
		StoreAllVO storeAllVO = mainDAO.selectStoreAll(storeIdx);
		
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
		
		String state = "success";
		
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
			state = "failde";
		}
		
		return state;
	}
	
	@Override
	public StoreVO getStoreinfo(int storeIdx) {
		return mainDAO.selectStore(storeIdx);
	}
	
}
