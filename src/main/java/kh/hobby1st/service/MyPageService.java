package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.MemberDAO;
import kh.hobby1st.dao.MyPageDAO;
import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.ClubListDTO;

@Service
public class MyPageService {

	@Autowired
	public MyPageDAO my_dao;

	// 내가 만든 동호회 리스트
	public List<ClubListDTO> clubList_make(String id) {
		return my_dao.clubList_make(id);
	}

	// 내가 가입한 동호회 리스트
	public List<ClubListDTO> clubList_join(String id) {
		return my_dao.clubList_join(id);
	}

	// 내가 좋아요 한 동호회 리스트
	public List<ClubListDTO> clubList_interest(String id) {
		return my_dao.clubList_interest(id);
	}

	// 내가 올린 게시글 리스트
	public List<ClubBoardDTO> clubBoardList(String id) {
		return my_dao.clubBoardList(id);
	}

}
