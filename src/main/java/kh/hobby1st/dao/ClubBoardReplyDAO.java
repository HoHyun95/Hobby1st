package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubBoardDTO;

@Repository
public class ClubBoardReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	

}
