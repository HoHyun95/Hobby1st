package kh.hobby1st.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	//홈에 총 맴버수 뿌려줍니다. 
    public int totalMember() {
    	return mybatis.selectOne("member.totalMember");
    }
	
	//회원가입 성공!
	public int insert(MemberDTO dto) {
		return mybatis.insert("member.insert", dto);
	}

	//로그인 기능입니다. 
	public int login(String mem_id, String mem_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		return mybatis.selectOne("member.login", map);
	}
	
	//회원가입 페이지에서 자동으로 아이디 중복여부를 체크합니다.
	public int id_check(String id) {
		return mybatis.selectOne("member.id_check", id);
	}
}
