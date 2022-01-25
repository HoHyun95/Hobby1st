package kh.hobby1st.dao;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import kh.hobby1st.dto.ClubBoardDTO;
import kh.hobby1st.dto.NoticeDTO;

@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insert(NoticeDTO dto) {
		return mybatis.insert("Notice.insertNotice", dto);
	}

	// 공지사항 상세보기
	public NoticeDTO noticeDetail(int not_seq) {
		return mybatis.selectOne("Notice.noticeDetail", not_seq);
	}

	// 작성자 프로필 가져오기
	public String writerProfile(int notice_seq) {
		return mybatis.selectOne("Notice.writerProfile", notice_seq);
	}

	// 게시판 조회수 증가
	public int increaseView(int not_seq) {
		return mybatis.update("Notice.increaseView", not_seq);
	}

	public int getRecordCount() {
		return mybatis.selectOne("Notice.RecordCount");
	}

	// 공지사항 삭제
	public int deleteNotice(int notice_seq) {
		return mybatis.delete("Notice.deleteNotice", notice_seq);
	}

	// 공지사항 수정
	public int modifyNotice(NoticeDTO dto) {
		return mybatis.update("Notice.modifyNotice", dto);
	}


	// 공지사항 페이징 적용 출력
	public List<NoticeDTO> selectNoticeAll(int start, int end){
		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));

		return mybatis.selectList("Notice.selectNoticeAll", map);
	}


	// 검색 시 총 개수
	public int getRecordSearchCount(String keyword, String searchWord) {

		Map<String, String> map = new HashMap<>();

		map.put("searchWord", String.valueOf(searchWord));

		int count = 0;
		if (keyword.equals("제목")) {
			count = mybatis.selectOne("Notice.searchTitleCount", map);
		} 
		return count;
	}

	// 공지사항 제목 검색
	public List<NoticeDTO> selectNoticeSearchByPaging(int start, int end, String keyword,
			String searchWord) {

		Map<String, String> map = new HashMap<>();

		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("searchWord", searchWord);

		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		if (keyword.equals("제목")) {
			list = mybatis.selectList("Notice.searchTitle", map);
		} 
		return list;
	}



}
