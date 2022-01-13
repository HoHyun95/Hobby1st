package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.MemberDTO;

@Repository
public class ClubMemberDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MemberDTO> memberInformation(int seq){
		return mybatis.selectList("ClubMember.memberInfor",seq);
	}

}
