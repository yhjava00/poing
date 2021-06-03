package com.spring.poing.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;

public interface MainController {
	
	public String main(Model model);
	
	public String login();
	
	public String loginAction(HttpServletRequest request, String id, String pw);
	
	public String logOutAction(HttpServletRequest request);
	
	public String signUp();
	
	public String signUpAction(MemberVO vo);
	
	public String search(Model model, String search, int page);
	
	public String store(HttpServletRequest request);
	
	public String askSelectTimeAction(int storeIdx, String date);
	
	public String reservation(HttpServletRequest request, ReservationVO vo);
	
	public String writeReview(Model model, int placeId);

}
