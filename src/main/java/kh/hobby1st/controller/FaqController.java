package kh.hobby1st.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.dto.FaqDTO;
import kh.hobby1st.service.FaqService;

@Controller
@RequestMapping("/faq")
public class FaqController {

	@Autowired
	private FaqService faqService;

	//FAQ 리스트
	@RequestMapping("/faqList")
	public String faqList(Model model) {

		List<FaqDTO> faqList = faqService.faqList();

		model.addAttribute("faqList", faqList);
		return "faq/faqList";
	}

	// FAQ 작성 
	@RequestMapping("/faqWrite")
	public String faqWrite() {
		return "faq/faqWrite";
	}


	// FAQ 삽입
	@RequestMapping("/faqInsert")
	public String faqInsert(FaqDTO dto, Model model) {
		faqService.faqInsert(dto);
		return "redirect:/faq/faqList";
	}

	//FAQ 삭제
	@RequestMapping("/faqDelete")
	public String deleteFaq(int faq_seq) {
		faqService.deleteFaq(faq_seq);
		return "redirect:/faq/faqList";
	}
}
