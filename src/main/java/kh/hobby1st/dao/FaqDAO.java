package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.FaqDTO;

@Repository
public class FaqDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public List<FaqDTO> faqList(){
		return mybatis.selectList("Faq.faqList");
	}

	// FAQ 삽입
	public int faqInsert(FaqDTO dto) {
		return mybatis.insert("Faq.faqInsert", dto);
	}

	public int deleteFaq(int faq_seq) {
		return mybatis.delete("Faq.deleteFaq", faq_seq);
	}
}
