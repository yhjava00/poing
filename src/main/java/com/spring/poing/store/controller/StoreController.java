package com.spring.poing.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.spring.poing.vo.StoreAllVO;

public interface StoreController {
	
	public String storeModify(Model model, HttpSession session);
	
	public String storeModifyAction(StoreAllVO store);
	
}
