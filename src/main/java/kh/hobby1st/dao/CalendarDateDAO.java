package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.CalendarDateDTO;

@Repository
public class CalendarDateDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	//캘린더 등록
	public int insert(CalendarDateDTO dto) {
		return mybatis.insert("calendar.insert",dto);
	}
	
	//해당 동호회의 리스트 출력
	public List<CalendarDateDTO> selectAll(String club_cl_name) {
		return mybatis.selectList("calendar.selectAll", club_cl_name);
	}
	
	//캘린더 디테일 페이지 출력
	public CalendarDateDTO selectAllDetail(String club_cl_name, String title) {
		Map<String, String> map = new HashMap<>();
		map.put("club_cl_name", club_cl_name);
		map.put("title", title);
		return mybatis.selectOne("calendar.selectAllDetail", map);
	}
	//캘린더내 중복 스케줄 삭제
	public int delete(String club_cl_name, String title) {
		Map<String, String> map = new HashMap<>();
		map.put("club_cl_name", club_cl_name);
		map.put("title", title);
		return mybatis.selectOne("calendar.delete", map);
	}
	
	//세부스케줄 update로 추가 
	public int update(String club_cl_name, String title, String member, String detail) {
		Map<String, String> map = new HashMap<>();
		map.put("club_cl_name", club_cl_name);
		map.put("title", title);
		map.put("member", member);
		map.put("detail", detail);
		return mybatis.update("calendar.update", map);
		
		
	}
}

