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


	public int insert(MemberDTO dto) {
		return mybatis.insert("member.insert", dto);
	}

	public int login(String mem_id, String mem_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		return mybatis.selectOne("member.login", map);
	}
	
	public int id_check(String id) {
		return mybatis.selectOne("member.id_check", id);
	}
}
