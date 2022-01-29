package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.MemberDTO;

@Repository
public class MemberAdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원수
	public int totalMember() {
		return mybatis.selectOne("member.totalMember");
	}
	
	// 관리자 페이지에서 멤버 리스트 페이징
	public List<MemberDTO> MemberListByPaging(int start, int end ){
		
		Map<String,String> map = new HashMap<>();
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		return mybatis.selectList("member.MemberListByPaging",map);
		
	}
	
	
}
