package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ClubMemberDTO;
import kh.hobby1st.dto.MemberDTO;

@Repository
public class ClubMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 동호회 회원 수
	public int getRecordCount() {
		return mybatis.selectOne("ClubMember.RecordCount");
	}
	
	// 페이징해서 리스트 담기
	public List<MemberDTO> selectMemberByPaging(int start, int end,int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("seq", String.valueOf(seq));

		return mybatis.selectList("ClubMember.memberInfor", map);
	}
	
	public List<ClubMemberDTO> selectClubMemberByPaging(int start, int end,int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("seq", String.valueOf(seq));

		return mybatis.selectList("ClubMember.clubMemberInfor", map);
	}
	
	
	public int deleteMember(String id) {
		return mybatis.delete("ClubMember.deleteMember",id);
	}
	
	
	
	
	
	
	

}
