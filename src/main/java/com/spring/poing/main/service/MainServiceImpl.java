package com.spring.poing.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.main.dao.MainDAOImpl;
import com.spring.poing.vo.CategoryVO;

@Service("mainService")
public class MainServiceImpl implements MainService {
	
	@Autowired
	MainDAOImpl mainDAO;
	
	@Override
	public Map<String, Object> getMainInfo() {
		
		Map<String, Object> mainInfo = new HashMap<String, Object>();
		
		List<CategoryVO> category = mainDAO.getCategory();
		
		mainInfo.put("category", category);
		
		return mainInfo;
	}
	
}
