package kh.hobby1st.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.MemberDAO;
import kh.hobby1st.dao.MypageDAO;

@Service
public class MypageService {
	
	
	@Autowired
	public MypageDAO my_dao;

}
