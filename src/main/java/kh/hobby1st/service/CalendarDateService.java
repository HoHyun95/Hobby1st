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
	 
	 public CalendarDateDTO selectAllDetail(String club_cl_name, String title) {
		 return dao.selectAllDetail(club_cl_name, title);
	 }
	 
	 public int delete(String club_cl_name, String title) {
		 return dao.delete(club_cl_name, title);
	 }
	 
	 public int update(String club_cl_name, String title, String member, String detail) {
		 return dao.update(club_cl_name, title, member, detail);
	 }
}
