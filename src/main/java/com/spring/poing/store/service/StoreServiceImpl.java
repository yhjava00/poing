package com.spring.poing.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.poing.store.dao.StoreDAO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDAO storeDAO;
	
}
