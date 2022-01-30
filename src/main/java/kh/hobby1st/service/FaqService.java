package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.FaqDAO;
import kh.hobby1st.dto.FaqDTO;

@Service
public class FaqService {

	@Autowired
	private FaqDAO fDao;

	// FAQ 리스트 
	public List<FaqDTO> faqList(){
		return fDao.faqList();
	}

	// FAQ 작성
	public int faqInsert(FaqDTO dto) {
		return fDao.faqInsert(dto);
	}

	// FAQ 삭제
	public int deleteFaq(int faq_seq){
		return fDao.deleteFaq(faq_seq);
	}
}
