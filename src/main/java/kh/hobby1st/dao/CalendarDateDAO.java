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
	
	public int insert(CalendarDateDTO dto) {
		return mybatis.insert("calendar.insert",dto);
	}
	
	public List<CalendarDateDTO> selectAll(String club_cl_name) {
		return mybatis.selectList("calendar.selectAll", club_cl_name);
	}
	
	public int search(String month, String value, String date) {
		Map<String, String> map = new HashMap<>();
		map.put("month", month);
		map.put("date", date);
		map.put("value", value);
		return mybatis.selectOne("calendar.search", map);
	}
	public String delete(String month, String value, String date) {
		Map<String, String> map = new HashMap<>();
		map.put("month", month);
		map.put("date", date);
		map.put("value", value);
		return mybatis.selectOne("calendar.delete", map);
	}
}

