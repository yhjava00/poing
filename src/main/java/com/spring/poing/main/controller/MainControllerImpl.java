package com.spring.poing.main.controller;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.comparator.DefaultFileComparator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.spring.poing.main.service.MainServiceImpl;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;
import com.spring.poing.vo.StoreVO;

@Controller
public class MainControllerImpl implements MainController {

	@Autowired
	MainServiceImpl mainService;

	@Override
	@RequestMapping(value = {"/", "/main"})
	public String main(Model model) {
		
		Map<String, Object> mainInfo = mainService.getMainInfo();

		model.addAttribute("mainInfo", mainInfo);
		
		return "main";
	}
	
	@Override
	@RequestMapping("/search")
	public String search(Model model, String search, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		Map<String, Object> searchMap = mainService.search(search, page);
		
		model.addAttribute("searchMap", searchMap);
		
		return "search";
	}
	
	@Override
	@RequestMapping("/store/*")
	public String store(HttpServletRequest request) {
		
		String uri = request.getRequestURI();
		
		int storeIdx = Integer.parseInt(uri.substring(uri.lastIndexOf('/')+1));
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		Map<String, Object> storeInfo = mainService.store(id, storeIdx);
		
		request.setAttribute("storeInfo", storeInfo);
		
		return "store";
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/askSelectTime.do", produces = "application/json; charset=UTF-8")
	public String askSelectTimeAction(int storeIdx, String date) {
		return mainService.selectTime(storeIdx, date);
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/reservation.do")
	public String reservation(HttpServletRequest request, ReservationVO vo) {
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("loginCheck");
		
		if(member_id==null) {
			return "please login";
		}
		
		vo.setMember_id(member_id);
		
		String state = mainService.reservation(vo);
		
		return state;
	}
	
	@Override
	@RequestMapping("/write_review")
	public String writeReview(HttpServletRequest request, int placeId) {
		
		StoreVO store = mainService.getStoreinfo(placeId);
		
		request.setAttribute("store", store);
		
		return "write_review";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/write_review.do")
	public String writeReviewAction(HttpServletRequest request, ReviewVO vo) {
		HttpSession session = request.getSession();
		
		String member_id = (String)session.getAttribute("loginCheck");
		
		if(member_id==null) {
			return "please login";
		}

		vo.setMember_id(member_id);
		
		String state = mainService.writeReview(vo);
		
		return state;
	}
	
	@Override
	@RequestMapping("/review")
	public String review(Model model, int placeId,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		Map<String, Object> reviewInfo = mainService.review(placeId, page);
		
		model.addAttribute("reviewInfo", reviewInfo);
		
		return "review";
	}
	
	@Override
	@RequestMapping(value = {"/myPage", "/myPage/*"})
	public String myPage(HttpServletRequest request, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		String uri = request.getRequestURI();
		
		String path = uri.substring(uri.lastIndexOf('/')+1);
		
		if(path.equals("myPage")) {
			path = "coming_visit";
		}
		
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		Map<String, Object> info = mainService.myPage(path, id, page);
		
		request.setAttribute("path", path);
		request.setAttribute("info", info);
		
		return "myPage";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/iLikeThis.do")
	public String likeAction(HttpServletRequest request, byte like, int idx) {
		String id = (String) request.getSession().getAttribute("loginCheck");
		
		if(id==null)
			return "no member";
		
		String state = mainService.like(id, idx, like);
		
		return state;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "cancelReservation.do", produces = "application/json; charset=UTF-8")
	public String cancelReservation(HttpSession session, int store_idx, String resDate, String time,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		String id = (String) session.getAttribute("loginCheck");
		
		return mainService.cancelReservation(id, store_idx, resDate, time, page);
	}

}
