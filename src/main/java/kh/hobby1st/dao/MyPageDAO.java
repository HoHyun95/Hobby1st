package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubListDTO;

@Repository
public class MyPageDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 내가 만든 동호회 리스트
	public List<ClubListDTO> clubList_make(String id) {
		return mybatis.selectList("Mypage.clubList_make", id);
	}
	
	// 내가 가입한 동호회 리스트
	public List<ClubListDTO> clubList_join(String id) {
		return mybatis.selectList("Mypage.clubList_join", id);
	}
	
	// 내가 좋아요 한 동호회 리스트
	public List<ClubListDTO> clubList_interest(String id) {
		return mybatis.selectList("Mypage.clubList_interest", id);
	}

}
