package com.spring.poing.store.controller;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.poing.vo.StoreAllVO;

public interface StoreController {
	
	public String storeModify(Model model, HttpSession session);
	
	public String storeModifyAction(HttpSession session, StoreAllVO store);
	
	public String storeImgDeleteAction(HttpSession session, String img);
	
	public String uploadMainImgAction(HttpSession session, MultipartHttpServletRequest multi);
	
	public String uploadImgAction(HttpSession session, MultipartHttpServletRequest multi);
}
