package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.tags.form.AbstractFormTag;

import kh.hobby1st.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 홈에 총 맴버수 뿌려줍니다.
	public int totalMember() {
		return mybatis.selectOne("member.totalMember");
	}

	// 회원가입 성공!
	public int insert(MemberDTO dto) {
		return mybatis.insert("member.insert", dto);
	}

	// 로그인 기능입니다.
	public int login(String mem_id, String mem_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		return mybatis.selectOne("member.login", map);
	}

	// 관리자 로그인
	public int adminLogin(String mem_id, String mem_pass) {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("mem_pass", mem_pass);
		return mybatis.selectOne("member.adminLogin", map);
	}

	// 회원가입 페이지에서 자동으로 아이디 중복여부를 체크합니다.
	public int id_check(String id) {
		return mybatis.selectOne("member.id_check", id);
	}
	
	// 이메일 중보겨웁 체크
	public int email_search(String email) {
		return mybatis.selectOne("member.email_search", email);
	}

	public int naver_idCheck(String naver_id) {
		return mybatis.selectOne("member.naver_idCheck", naver_id);
	}

	// 이메일 인증시 이메일 존재여부 체크
	public int email_check(String email) {
		return mybatis.selectOne("member.email_check", email);
	}

	// ClubListController 에서 사용.
	public MemberDTO selectOne(String mem_ID) {
		return mybatis.selectOne("member.selectOne", mem_ID);
	}
	
	// 이메일찾기에서 사용
	public MemberDTO selectEmail(String email) {
		return mybatis.selectOne("member.selectEmaile", email);
	}
	
	// 회원가입 된 멤버들 전체 출력
	public List<MemberDTO> selectAll() {
		return mybatis.selectList("member.selectAll");
	}

	// 관리자 페이지 회원 추방
	public int signOut(String mem_id) {
		return mybatis.delete("member.signOut", mem_id);
	}

	// 회원 정보 수정
	public int modifyMember(MemberDTO dto) {
		return mybatis.update("member.modifyMember", dto);
	}

	// 회원 정보 수정 (사진제외)
	public int modifyMemberP(MemberDTO dto) {
		return mybatis.update("member.modifyMemberP", dto);
	}
	
	// 회원 탈퇴
	public int leaveMember(String mem_id) {
		return mybatis.delete("member.leaveMember", mem_id);
	}

	// 관리자 페이지 오늘 가입한 회원 수
	public int newMember() {
		return mybatis.selectOne("member.newMember");
	}
	
	// 관리자 페이지 지난주 총 회원 수
	public int lastMember() {
		return mybatis.selectOne("member.lastMember");
	}
		
	// 관리자 페이지 지난주 월요일 회원 가입 수
	public int lastMonday() {
		return mybatis.selectOne("member.lastMonday");
	}
	
	// 관리자 페이지 지난주 화요일 회원 가입 수
	public int lastTuesday() {
		return mybatis.selectOne("member.lastTuesday");
	}
	
	// 관리자 페이지 지난주 수요일 회원 가입 수
	public int lastWednesday() {
		return mybatis.selectOne("member.lastWednesday");
	}
	
	// 관리자 페이지 지난주 목요일 회원 가입 수
	public int lastThurseday() {
		return mybatis.selectOne("member.lastThurseday");
	}
	
	// 관리자 페이지 지난주 금요일 회원 가입 수
	public int lastFriday() {
		return mybatis.selectOne("member.lastFriday");
	}
	
	// 관리자 페이지 지난주 토요일 회원 가입 수
	public int lastSaturday() {
		return mybatis.selectOne("member.lastSaturday");
	}
	
	// 관리자 페이지 지난주 일요일 회원 가입 수
	public int lastSunday() {
		return mybatis.selectOne("member.lastSunday");
	}
	
		
		
}
