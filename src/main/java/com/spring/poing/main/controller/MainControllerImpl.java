package com.spring.poing.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.poing.main.service.MainServiceImpl;

@Controller
public class MainControllerImpl implements MainController {
	
	@Autowired
	MainServiceImpl mainService;
	
	@Override
	@RequestMapping("/")
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
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@Override
	@RequestMapping("/search")
	public String search() {
		return "search";
	}
	
}
