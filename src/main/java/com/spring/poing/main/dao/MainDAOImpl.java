package com.spring.poing.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.poing.vo.CategoryVO;
import com.spring.poing.vo.MemberVO;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<CategoryVO> getCategory() {
		return sqlSession.selectList("main.category");
	}
	
	@Override
	public MemberVO selectMember(String id) {
		return sqlSession.selectOne("main.selectMember", id);
	}
	
	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert("main.insertMember", vo);
	}
	
}
