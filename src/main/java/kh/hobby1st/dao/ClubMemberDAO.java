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

	
	// 총 동호회 회원 가입 수
	public int totalClubMember() {
		return mybatis.selectOne("ClubMember.TotalClubMember");
	}
	
	
	// 해당 동호회 회원 수
	public int getRecordCount(int seq) {
		return mybatis.selectOne("ClubMember.RecordCount", seq);
	}
	
	// 동호회 회원 리스트 페이징해서 담기
	public List<MemberDTO> selectMemberByPaging(int start, int end,int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("seq", String.valueOf(seq));

		return mybatis.selectList("ClubMember.memberInfor", map);
	}
	
	
	// 동호회 가입일 페이징해서 담기
	public List<ClubMemberDTO> selectClubMemberByPaging(int start, int end,int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("seq", String.valueOf(seq));

		return mybatis.selectList("ClubMember.clubMemberInfor", map);
	}
	
	// 동호회 회원 추방시키기
	public int deleteMember(String id) {
		return mybatis.delete("ClubMember.deleteMember",id);
	}
	
	
	// 해당 동호회 회원 정보 가져오기
	public List<MemberDTO> clubMemberInfo(int cb_seq){
		return mybatis.selectList("ClubMember.clubMemberInfomation", cb_seq);
	}
	
	
	
	
	
	
	

}
