package com.spring.poing.store.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.poing.store.service.StoreService;

@Controller
public class StoreControllerImpl implements StoreController {

	@Autowired
	StoreService storeService;
	
	@Override
	@RequestMapping("/store/modify")
	public String storeModify() {
		return "storeModify";
	}
	
}
