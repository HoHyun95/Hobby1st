package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.MemberDTO;

@Repository
public class ClubMemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<MemberDTO> memberInformation(int seq) {
		return mybatis.selectList("ClubMember.memberInfor", seq);
	}

	public int getRecordCount() {
		return mybatis.selectOne("ClubMember.RecordCount");
	}

	public List<MemberDTO> selectByPaging(int start, int end,int seq) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("seq", String.valueOf(seq));

		return mybatis.selectList("ClubMember.memberInfor", map);

	}

}
