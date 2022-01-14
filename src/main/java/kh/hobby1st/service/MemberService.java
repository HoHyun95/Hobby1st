package kh.hobby1st.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.MemberDAO;
import kh.hobby1st.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	public MemberDAO mem_dao;

	public int insert(MemberDTO dto) {
		return mem_dao.insert(dto);
	}

	public int login(String mem_id, String mem_pass) {
		return mem_dao.login(mem_id, mem_pass);
	}
	
	public int id_check(String id) {
		return mem_dao.id_check(id);
	}

}
