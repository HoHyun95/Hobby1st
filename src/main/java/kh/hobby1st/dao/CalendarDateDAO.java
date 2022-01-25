package kh.hobby1st.dao;

import java.util.List;

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
}

