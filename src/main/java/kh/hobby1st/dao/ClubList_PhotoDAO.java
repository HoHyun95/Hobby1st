package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubList_PhotoDTO;

@Repository
public class ClubList_PhotoDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertPhoto(ClubList_PhotoDTO dto) {
		return mybatis.insert("clp_Photo.insertPhoto", dto);
	}
	

}
