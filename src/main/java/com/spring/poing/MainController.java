package com.spring.poing;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping("/search")
	public String search() {
		return "search";
	}
	
}
