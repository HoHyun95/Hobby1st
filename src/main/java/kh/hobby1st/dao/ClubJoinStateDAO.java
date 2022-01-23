package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubJoinStateDTO;

@Repository
public class ClubJoinStateDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 동호회 가입 요청
	public int requestJoin(ClubJoinStateDTO dto){
		return mybatis.insert("JoinState.requestJoin", dto);
	}

}
