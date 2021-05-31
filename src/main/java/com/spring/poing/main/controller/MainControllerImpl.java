package com.spring.poing.main.controller;

import java.util.List;
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
	public String store() {
		return "store";
	}
	
}
