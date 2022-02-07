package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ClubJoinStateDAO;
import kh.hobby1st.dao.ClubListDAO;
import kh.hobby1st.dto.ClubListDTO;

@Service
public class ClubListService {

	@Autowired
	public ClubListDAO cldao;

	@Autowired
	public ClubJoinStateDAO csdao;

//	동호회 수
	public int countClub() {
		return cldao.countClub();
	}

	public int createClub(ClubListDTO dto) {
		return cldao.createClub(dto);
	}

	public int nameCheck(String cl_name) {
		return cldao.nameCheck(cl_name);
	}

	public List<ClubListDTO> selectAll() {
		return cldao.selectAll();
	}

	// 클럽 수정 페이지 해당 리스트 정보 출력
	public List<ClubListDTO> modifyClubPage(int cl_id) {
		return cldao.modifyClubPage(cl_id);
	}

	// 클럽 정보 수정
	public int modifyClubProc(ClubListDTO dto) {
		return cldao.modifyClubProc(dto);
	}

	public List<ClubListDTO> selectSplit(int start, int end) {
		return cldao.selectSplit(start, end);
	}

	// 동호회 리스트 및 검색 결과에서 동호회 명 클릭시 해당 동호회 상세 정보->
	public ClubListDTO selectClub(String cl_id) {
		return cldao.selectClub(cl_id);
	}

	public List<ClubListDTO> searchClub(String searchField, String searchText) {
		String modifiedText = searchText;
		if (searchText.contains(" ")) {
			modifiedText = searchText.trim();
		}
		return cldao.searchClub(searchField, modifiedText);
	}

	// 해당 동호회 가입 여부 확인
	public int checkMember(int cl_id, String mem_id) {
		int checkMember = 0;

		// 보스 여부
		int clubBoss = cldao.checkClubBoss(cl_id, mem_id);
		// 일반회원 여부
		int clubMember = cldao.checkMember(cl_id, mem_id);
		// 동호회 요청 여부
		int checkClubJoin = csdao.checkClubJoin(cl_id, mem_id);

		if (clubMember == 0) {
			checkMember = 0;
		} else if (clubMember == 1) {
			checkMember = 1;
		}

		if (clubBoss == 1) {
			checkMember = 2;
		}

		if (checkClubJoin == 1) {
			checkMember = 3;
		}

		return checkMember;
	}

	// 추천 ajax 기능

	public int clubRecommend(int cl_id, String rec_id) {

		int check = cldao.checkRec(cl_id, rec_id);

		int checkRec = 0;
		if (check == 1) {
			cldao.deleteRec(cl_id, rec_id);
			checkRec = 0;
		} else if (check == 0) {
			cldao.insertRec(cl_id, rec_id);
			checkRec = 1;
		}

		cldao.updateRec(cl_id);
		return checkRec;
	}

	// 추천수
	public int recCount(int cl_id) {
		return cldao.recCount(cl_id);
	}

	// 관심있는 동호회 목록 출력
	public List<ClubListDTO> interestClubList(String rec_id) {
		return cldao.interestClubList(rec_id);
	}

	// 관심없는 동호회 목록 출력
	public List<ClubListDTO> notInterestClubList(String rec_id, int start, int end) {

		return cldao.notInterestClubList(rec_id, start, end);
	}

	// 대분류 클릭시 해당 동호회 리스트 불러오기 (인원수 기준 정렬)
	public List<ClubListDTO> ClubListByCategory(String cl_category_id) {
		return cldao.ClubListByCategory(cl_category_id);
	}

	// 동호회 정보 수정
	public int modifyClub(ClubListDTO dto) {
		return cldao.modifyClub(dto);
	}

	//	회원 수 많은 동호회 TOP 30
	public List<ClubListDTO> ClubListByTop30(int start, int end) {
		return cldao.ClubListByTop30(start, end);
	}

	// 오늘 생성된 동호회 수 관리자용
	public int newClub() {
		return cldao.newClub();
	}
	
	// 지난주 총 동호회 수
	public int lastClub() {
		return cldao.lastClub();
	}
		
}
