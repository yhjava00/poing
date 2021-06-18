package com.spring.poing.store.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.poing.store.service.StoreService;
import com.spring.poing.vo.StoreAllVO;
import com.spring.poing.vo.StoreVO;

@Controller
public class StoreControllerImpl implements StoreController {

	private static final String STORE_PATH = "C:\\lyh_java_2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\poing\\resources\\store\\";
	
	@Autowired
	StoreService storeService;
	
	@Override
	@ResponseBody
	@RequestMapping("/store/modify.do")
	public String storeModifyAction(HttpSession session, StoreAllVO store) {
		
		int storeIdx = (Integer) session.getAttribute("storeCheck");
		
		store.setIdx(storeIdx);
		
		String state = storeService.storeModify(store);
		return state;
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/store/deleteImg.do", produces = "application/json; charset=UTF-8")
	public String storeImgDeleteAction(HttpSession session, String img) {

		int storeIdx = (Integer) session.getAttribute("storeCheck");
		
		StringBuilder json = storeService.deleteImg(storeIdx, img);
		
		if(!json.toString().contains("error")) {
			
			String path = STORE_PATH + storeIdx;
			
			File file = new File(path, img);
			
			file.delete();
		}
		
		return json.toString();
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/store/uploadMainImg.do", produces = "application/json; charset=UTF-8")
	public String uploadMainImgAction(HttpSession session, MultipartHttpServletRequest multi) {

		String id = (String) session.getAttribute("loginCheck");
		int storeIdx = (Integer) session.getAttribute("storeCheck");
		
		StoreAllVO store = storeService.getstoreInfo(id, storeIdx);
		
		String mainImg = store.getMain_img();
		
		String path = STORE_PATH + storeIdx;
		
		File mainImgFile = new File(path, mainImg);
		
		mainImgFile.delete();
		
		List<String> fileNameList = upload(multi, storeIdx);
		
		return storeService.updateMainImg(storeIdx, fileNameList.get(0));
	}
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/store/uploadImg.do", produces = "application/json; charset=UTF-8")
	public String uploadImgAction(HttpSession session, MultipartHttpServletRequest multi) {
		
		int storeIdx = (Integer) session.getAttribute("storeCheck");
		
		List<String> fileNameList = upload(multi, storeIdx);
		
		return storeService.updateImg(storeIdx, fileNameList);
	}
	
	public List<String> upload(MultipartHttpServletRequest multi, int storeIdx) {
		
		List<String> fileNameList = new ArrayList<String>();
		
		String path = STORE_PATH + storeIdx;
		
		File dir = new File(path);
		
		if(!dir.exists()) {
			dir.mkdir();
		}
		
		Iterator<String> files = multi.getFileNames();

		while(files.hasNext()) {
			
			String uploadFile = files.next();
			MultipartFile mFile = multi.getFile(uploadFile);
			
			String fileName = mFile.getOriginalFilename();
			
			if(fileName.equals("")) {
				break;
			}
			
			File file = new File(path, fileName);
			
			try {
				mFile.transferTo(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String type = fileName.substring(fileName.lastIndexOf("."));
			
			fileName = UUID.randomUUID().toString() + type;
			
			file.renameTo(new File(path, fileName));
			
			fileNameList.add(fileName);
		}
		
		return fileNameList;
	}
	
	@Override
	@ResponseBody
	@RequestMapping("/addStore.do")
	public String addStore(String storeId) {
		
		int state = storeService.addStore(storeId);
		
		if(state>0) {
			String path = STORE_PATH + state;
			
			File originFile = new File(STORE_PATH, "뷔페.png");
			File newFile = new File(path, "뷔페.png");
			
			newFile.getParentFile().mkdir();
			
			try {
				FileInputStream fis = new FileInputStream(originFile);
				FileOutputStream fos = new FileOutputStream(newFile);
				
				int fileByte = 0; 
	            while((fileByte = fis.read()) != -1) {
	                fos.write(fileByte);
	            }
	            
	            fis.close();
	            fos.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return String.valueOf(state);
	}
	
}
