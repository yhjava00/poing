package com.spring.poing.store.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.poing.store.service.StoreService;
import com.spring.poing.vo.StoreAllVO;

@Controller
public class StoreControllerImpl implements StoreController {

	@Autowired
	StoreService storeService;
	
	@Override
	@RequestMapping("/store/modify")
	public String storeModify(Model model, HttpSession session) {
		
		String id = (String) session.getAttribute("loginCheck");
		int storeIdx = (Integer) session.getAttribute("storeCheck");
		
		Map<String, Object> info = storeService.storeModify(id, storeIdx);
		
		model.addAttribute("info", info);
		
		return "storeModify";
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/store/modify.do")
	public String storeModifyAction(StoreAllVO store) {
		System.out.println(store.getStore_name());
		return "hello";
	}
	
}
