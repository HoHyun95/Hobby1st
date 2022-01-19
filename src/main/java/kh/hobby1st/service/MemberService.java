package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.MemberDAO;
import kh.hobby1st.dto.MemberDTO;

@Service
public class MemberService {

	@Autowired
	public MemberDAO mem_dao;
    
	// 홈에 보여지는 현재까지 가입회원 숫자
	public int totalMember() {
		return mem_dao.totalMember();
	}
	
	//회원가입 성공!
	public int insert(MemberDTO dto) {
		return mem_dao.insert(dto);
	}
	
	//로그인 기능입니다. 
	public int login(String mem_id, String mem_pass) {
		return mem_dao.login(mem_id, mem_pass);
	}
	
	//회원가입 페이지에서 자동으로 아이디 중복여부를 체크합니다.
	public int id_check(String id) {
		return mem_dao.id_check(id);
	}
	
	//이메일 찾기 기능
	public int email_check(String email) {
		return mem_dao.email_check(email);
	}


	public MemberDTO selectOne(String mem_ID){
		return mem_dao.selectOne(mem_ID);
	}

	
}
