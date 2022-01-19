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
		return  mybatis.insert("ClubList.createClub",dto);
	}

	//동호회명 중복 체크 
	public int nameCheck(String cl_name) {
		return mybatis.selectOne("ClubList.nameCheck",cl_name);
	}
	
	public List<ClubListDTO>  selectAll(){
	return mybatis.selectList("ClubList.selectAll");
	}
	
	public ClubListDTO selectClub(String cl_id){
		return mybatis.selectOne("ClubList.selectClub", cl_id);
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
	
	
	// 해당 동호회 가입 여부 확인
	public int checkMember(int cl_seq, String mem_id) {
		
		Map<String, String> map = new HashMap<>();
		map.put("cl_seq", String.valueOf(cl_seq));
		map.put("mem_id", mem_id);
		
		return mybatis.selectOne("ClubList.checkMember", map);
	}
}
