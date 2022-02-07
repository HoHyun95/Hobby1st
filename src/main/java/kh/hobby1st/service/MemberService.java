package kh.hobby1st.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	// 네이버 아이디 디비에 저장되어있는지 확인
	public int naver_idCheck(String naver_id) {
		return mem_dao.naver_idCheck(naver_id);
	}

	// 회원가입 성공!
	public int insert(MemberDTO dto) {
		return mem_dao.insert(dto);
	}

	// 네이버 회원가입 성공
	public int naver_insert(MemberDTO dto) {
		return mem_dao.insert(dto);
	}

	// 로그인 기능입니다.
	public int login(String mem_id, String mem_pass) {
		return mem_dao.login(mem_id, mem_pass);
	}

	// 관리자 로그인
	public int adminLogin(String mem_id, String mem_pass) {
		return mem_dao.adminLogin(mem_id, mem_pass);
	}

	// 회원가입 페이지에서 자동으로 아이디 중복여부를 체크합니다.
	public int id_check(String id) {
		return mem_dao.id_check(id);
	}

	// 이메일 찾기 기능
	public int email_check(String email) {
		return mem_dao.email_check(email);
	}

	public MemberDTO selectOne(String mem_ID) {
		return mem_dao.selectOne(mem_ID);
	}
	
	public MemberDTO selectEmail(String email) {
		return mem_dao.selectEmail(email);
	}

	public List<MemberDTO> selectAll() {
		return mem_dao.selectAll();
	}

	// 관리자 페이지 회원 추방
	public int signOut(String mem_id) {
		int result = mem_dao.signOut(mem_id);
		return result;
	}

	// 회원 정보 수정
	public int modifyMember(MemberDTO dto) {
		return mem_dao.modifyMember(dto);
	}

	// 회원 정보 수정 (사진제외)
	public int modifyMemberP(MemberDTO dto) {
		return mem_dao.modifyMemberP(dto);
	}

	// 회원 탈퇴
	public int leaveMember(String mem_id) {
		return mem_dao.leaveMember(mem_id);
	}

	// 오늘 가입한 회원 수 관리자용
	public int newMember() {
		return mem_dao.newMember();
	}
	
	// 지난주 총 회원 수
	public int lastMember() {
		return mem_dao.lastMember();
	}
	
	// 관리자 지난주 월요일 가입자 수
	public int lastMonday() {
		return mem_dao.lastMonday();
	}
	
	// 관리자 지난주 화요일 가입자 수
	public int lastTuesday() {
		return mem_dao.lastTuesday();
	}
	
	// 관리자 지난주 수요일 가입자 수
	public int lastWednesday() {
		return mem_dao.lastWednesday();
	}
	
	// 관리자 지난주 목요일 가입자 수
	public int lastThurseday() {
		return mem_dao.lastThurseday();
	}
	
	// 관리자 지난주 금요일 가입자 수
	public int lastFriday() {
		return mem_dao.lastFriday();
	}
	
	// 관리자 지난주 토요일 가입자 수
	public int lastSaturday() {
		return mem_dao.lastSaturday();
	}
	
	// 관리자 지난주 일요일 가입자 수
	public int lastSunday() {
		return mem_dao.lastSunday();
	}
	
}
