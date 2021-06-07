package com.spring.poing.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.spring.poing.vo.MemberVO;
import com.spring.poing.vo.ReservationVO;
import com.spring.poing.vo.ReviewVO;

public interface MainController {
	
	public String main(Model model);
	
	public String search(Model model, String search, int page);
	
	public String store(HttpServletRequest request);
	
	public String askSelectTimeAction(int storeIdx, String date);
	
	public String reservation(HttpServletRequest request, ReservationVO vo);
	
	public String writeReview(Model model, int placeId);
	
	public String writeReviewAction(HttpServletRequest request, ReviewVO vo);
	
	public String review(Model model, int placeId, int page);
	
	public String myPage(HttpServletRequest request, int page);

}
