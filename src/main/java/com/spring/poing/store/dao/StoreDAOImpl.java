package com.spring.poing.store.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("storeDAO")
public class StoreDAOImpl implements StoreDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	
}
