package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.NoticeDTO;

@Repository
public class NoticeAdminDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 공지사항 글 수
	public int countNotice() {
		return mybatis.selectOne("Notice.RecordCount");
	}
	
	// 관리자 공지사항 리스트 페이징
	public List<NoticeDTO> NoticeByPaging(int start, int end){
		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));

		return mybatis.selectList("Notice.selectNoticeAll", map);
	}
	
}
