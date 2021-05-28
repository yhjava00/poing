package com.spring.poing.main.controller;

import org.springframework.ui.Model;

public interface MainController {
	
	public String main(Model model);
	
	public String login();
	
	public String signUp();
	
	public String search();

}
