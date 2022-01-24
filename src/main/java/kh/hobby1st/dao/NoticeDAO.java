package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
	
	
	
	
//	// ------------ 추천 기능 -------------------
//
//		// 추천 여부 확인
//		public int checkRec(int not_seq, String rec_id) {
//
//			Map<String, String> map = new HashMap<>();
//
//			map.put("cb_seq", String.valueOf(not_seq));
//			map.put("rec_id", rec_id);
//
//			return mybatis.selectOne("ClubBoardRec.checkRec", map);
//		}
//
//		// 추천한 게시글에 id 저장
//		public int insertRec(int cb_seq, String rec_id) {
//
//			Map<String, String> map = new HashMap<>();
//
//			map.put("cb_seq", String.valueOf(cb_seq));
//			map.put("rec_id", rec_id);
//
//			return mybatis.insert("ClubBoardRec.insertRec", map);
//		}
//
//		// 추천 쉬소
//		public int deleteRec(int cb_seq, String rec_id) {
//
//			Map<String, String> map = new HashMap<>();
//
//			map.put("cb_seq", String.valueOf(cb_seq));
//			map.put("rec_id", rec_id);
//
//			return mybatis.insert("ClubBoardRec.deleteRec", map);
//		}
//		
//		// 추천수 갱신
//		public int updateRec(int cb_seq) {
//			return mybatis.update("ClubBoardRec.updateRec", cb_seq);
//		}
//		
//		// 추천수
//		public int recCount(int cb_seq) {
//			return mybatis.selectOne("ClubBoardRec.recCount", cb_seq);
//		}
//	
}
