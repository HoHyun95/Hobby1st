package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubListDTO;

@Repository
public class ClubListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int createClub(ClubListDTO dto) {
		return mybatis.insert("ClubList.createClub",dto);
	}
	
	public int nameCheck(String cl_name) {
	System.out.println("dao 성공");
		return mybatis.selectOne("ClubList.nameCheck",cl_name);
		
	}
}
