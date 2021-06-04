package com.spring.poing.main.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.poing.main.service.MainServiceImpl;
import com.spring.poing.vo.MemberVO;
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
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/login.do")
	public String loginAction(HttpServletRequest request, String id, String pw) {
		
		String loginState = mainService.login(id, pw);
		
		if(loginState.equals("login")) {
			HttpSession session = request.getSession();
			session.setAttribute("loginCheck", id);
			session.setMaxInactiveInterval(60*60*3);
		}
		
		return loginState;
	}
	
	@Override
	@RequestMapping("/logOut.do")
	public String logOutAction(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("loginCheck");
		
		return "redirect:/main";
	}
	
	@Override
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/signUp.do")
	public String signUpAction(MemberVO vo) {
		
		String signUpState = mainService.signUp(vo);
		
		return signUpState;
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
		
		Map<String, Object> storeInfo = mainService.store(storeIdx);
		
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
	public String writeReview(Model model, int placeId) {
		
		StoreVO store = mainService.getStoreinfo(placeId);
		
		model.addAttribute("store", store);
		
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
	
}
