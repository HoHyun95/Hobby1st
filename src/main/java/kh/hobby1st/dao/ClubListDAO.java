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
		return mybatis.insert("ClubList.createClub", dto);
	}

	// 동호회명 중복 체크
	public int nameCheck(String cl_name) {
		return mybatis.selectOne("ClubList.nameCheck", cl_name);
	}

	public List<ClubListDTO> selectAll() {
		return mybatis.selectList("ClubList.selectAll");
	}

	// 동호회 리스트 10개씩 가져오기
	public List<ClubListDTO> selectSplit(int start, int end) {

		Map<String, String> map = new HashMap<>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));

		return mybatis.selectList("ClubList.selectSplit", map);
	}

	public ClubListDTO selectClub(String cl_id) {
		return mybatis.selectOne("ClubList.selectClub", cl_id);
	}

	public List<ClubListDTO> searchClub(String searchField, String searchText) {
		System.out.println(searchField + "+" + searchText);

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
	public int checkMember(int cl_id, String mem_id) {

		Map<String, String> map = new HashMap<>();
		map.put("cl_id", String.valueOf(cl_id));
		map.put("mem_id", mem_id);

		return mybatis.selectOne("ClubList.checkMember", map);
	}

	// 해당 동호회 가입 여부 확인
	public int checkClubBoss(int cl_id, String mem_id) {

		Map<String, String> map = new HashMap<>();
		map.put("cl_id", String.valueOf(cl_id));
		map.put("mem_id", mem_id);

		return mybatis.selectOne("ClubList.checkClubBoss", map);
	}

	// -------- 추천 기능 ----------

	// 추천 여부 확인
	public int checkRec(int cl_id, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cl_id", String.valueOf(cl_id));
		map.put("rec_id", rec_id);

		return mybatis.selectOne("ClubList.checkRec", map);
	}

	// 추천한 게시글에 id 저장
	public int insertRec(int cl_id, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cl_id", String.valueOf(cl_id));
		map.put("rec_id", rec_id);

		return mybatis.insert("ClubList.insertRec", map);
	}

	// 추천 쉬소
	public int deleteRec(int cl_id, String rec_id) {

		Map<String, String> map = new HashMap<>();

		map.put("cl_id", String.valueOf(cl_id));
		map.put("rec_id", rec_id);

		return mybatis.insert("ClubList.deleteRec", map);
	}

	// 추천수 갱신
	public int updateRec(int cl_id) {
		return mybatis.update("ClubList.updateRec", cl_id);
	}

	// 추천수
	public int recCount(int cl_id) {
		return mybatis.selectOne("ClubList.recCount", cl_id);
	}
	
	// 관심있는 동호회 목록 출력
	public List<ClubListDTO> interestClubList(String rec_id) {
		return mybatis.selectList("ClubList.interestClubList", rec_id);
	}
	
	
	// 관심없는 동호회 목록 출력
	public List<ClubListDTO> notInterestClubList(String rec_id, int start, int end) {
		
		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("rec_id", rec_id);
		
		return mybatis.selectList("ClubList.notInterestClubList", map);
	}
	
	// 동호회 가입 시 인원 수 증가
	public int plusMemCount(int cl_id) {
		return mybatis.update("ClubList.plusMemCount", cl_id);
	}
	
	// 동호회 가입 시 인원 수 감소
	public int minusMemCount(int cl_id) {
		return mybatis.update("ClubList.minusMemCount", cl_id);
	}
	
	// 대분류 클릭시 해당 동호회 리스트 불러오기 (인원수 기준 정렬)
	
	
	

}
