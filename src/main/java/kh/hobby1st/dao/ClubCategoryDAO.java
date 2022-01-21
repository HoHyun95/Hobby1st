package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubCategoryDTO;

@Repository
public class ClubCategoryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<ClubCategoryDTO> selectCategoryList(){
		return mybatis.selectList("ClubCategory.selectCategoryList");
	}
	
	

}
