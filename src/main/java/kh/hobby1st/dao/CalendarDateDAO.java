package kh.hobby1st.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDateDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
}

