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
	
	public List<ClubListDTO> modifyClubPage(int cl_id){
		return mybatis.selectList("ClubList.modifyClubPage", cl_id);
	}
	
	public int modifyClubProc(ClubListDTO dto) {
	
		return mybatis.update("ClubList.modifyClubProc", dto);
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
	public List<ClubListDTO> ClubListByCategory(String cl_category_id) {
		return mybatis.selectList("ClubList.ClubListByCategory", cl_category_id);
	}
	
	// 동호회 정보 수정
	public int modifyClub(ClubListDTO dto) {
		return  mybatis.update("ClubList.modifyClub", dto);
	}
	
	
	
	// 관리자 페이지에서 동호회 리스트 페이징
	public List<ClubListDTO> ClubListByPaging(int start, int end ){
		
		Map<String,String> map = new HashMap<>();
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("ClubList.ClubListByPaging",map);
	}
	
	//	회원 수 많은 동호회 TOP 30
	public List<ClubListDTO> ClubListByTop30(int start, int end) {
		Map<String,String> map = new HashMap<>();
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		return mybatis.selectList("ClubList.ClubListByTop30", map);
	}
	
	
	// 관리자 페이지 오늘 생성된 동호회 수
	public int newClub() {
				return mybatis.selectOne("ClubList.newClub");
			}
	
	// 관리자 페이지 지난주 총 동호회 수
	public int lastClub() {
		return mybatis.selectOne("ClubList.lastClub");
	}
	
	// 관리자 페이지 지난주 월요일 동호회 개설 수
	public int lastMonday() {
		return mybatis.selectOne("ClubList.lastMonday");
	}
	
	// 관리자 페이지 지난주 화요일 동호회 개설 수
	public int lastTuesday() {
		return mybatis.selectOne("ClubList.lastTuesday");
	}
	
	// 관리자 페이지 지난주 수요일 동호회 개설 수
	public int lastWednesday() {
		return mybatis.selectOne("ClubList.lastWednesday");
	}
	
	// 관리자 페이지 지난주 목요일 동호회 개설 수
	public int lastThurseday() {
		return mybatis.selectOne("ClubList.lastThurseday");
	}
	
	// 관리자 페이지 지난주 금요일 동호회 개설 수
	public int lastFriday() {
		return mybatis.selectOne("ClubList.lastFriday");
	}
	
	// 관리자 페이지 지난주 토요일 동호회 개설 수
	public int lastSaturday() {
		return mybatis.selectOne("ClubList.lastSaturday");
	}
	
	// 관리자 페이지 지난주 일요일 동호회 개설 수
	public int lastSunday() {
		return mybatis.selectOne("ClubList.lastSunday");
	}	
	

}
