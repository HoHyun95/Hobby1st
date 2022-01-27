package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.CalendarDateDAO;
import kh.hobby1st.dto.CalendarDateDTO;

@Service
public class CalendarDateService {

	 @Autowired
	 public CalendarDateDAO dao;
	 
	 
	 public int insert(CalendarDateDTO dto) {
		 return dao.insert(dto);
	 }
	 
	 public List<CalendarDateDTO> selectAll(String club_cl_name) {
		 return dao.selectAll(club_cl_name);
	 }
	 
	 public int search(String month, String value, String date) {
		 return dao.search(month, value, date);
	 }
	 
	 public String delete(String month, String value, String date) {
		 return dao.delete(month, value, date);
	 }
}
