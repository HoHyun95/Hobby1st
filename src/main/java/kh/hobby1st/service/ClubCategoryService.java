package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubCategoryDAO;
import kh.hobby1st.dto.ClubCategoryDTO;

@Service
public class ClubCategoryService {

	@Autowired
	public ClubCategoryDAO ccdao;
	
	// 카테고리 목록
	public List<ClubCategoryDTO> selectCategoryList() {
		return ccdao.selectCategoryList();
	}
	
	
	
	
	
	
}
