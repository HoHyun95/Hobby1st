package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubListDTO;

@Repository
public class ClubListDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int createClub(ClubListDTO dto) {
		int result =  mybatis.insert("ClubList.createClub",dto);
		return dto.getCl_id();
	}

	//동호회명 중복 체크 
	public int nameCheck(String cl_name) {
		return mybatis.selectOne("ClubList.nameCheck",cl_name);
	}
	
	public List<Map<String, Object>>  selectAll(){
	return mybatis.selectList("ClubList.selectAll");
	}
	
	public List<Map<String, Object>> selectClub(String cl_id){
		return mybatis.selectList("ClubList.selectClub", cl_id);
	}
	
	public List<ClubListDTO> searchClub(String searchField, String searchText){
	System.out.println(searchField +"+"+ searchText);
	
		Map<String, String> map = new HashMap<>();
		map.put("column", searchField);
		map.put("value", searchText);
		return mybatis.selectList("ClubList.searchClub", map);
	}
	
	// 동호회 수 
	public int countClub() {
		return mybatis.selectOne("ClubList.countClub");
	}
	//
}
