package kh.hobby1st.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.hobby1st.dto.CalendarDateDTO;
import kh.hobby1st.service.CalendarDateService;

@Controller
@RequestMapping("/calendar/")
public class CalendarController {

	@Autowired
	private HttpSession session;

	@Autowired
	private CalendarDateService cal_service;

	
	  @RequestMapping(value = "do", method = RequestMethod.GET) 
	  public String calendar(Model model, String club_cl_name) { 
	  model.addAttribute("club_cl_name", club_cl_name);
	  return "calendar"; 
	  }
	  
	  @ResponseBody
	  @RequestMapping(value = "method", method = RequestMethod.GET) 
	  public String method(Model model, String title, String club, String allDay) {
	  model.addAttribute("list", cal_service.selectAll(club));
	  System.out.println(title + club + allDay); 
	  return"pageJsonResport"; 
	  }
	 

	/*
	 * @GetMapping(params = "method=list") public String list() { return "calendar";
	 * }
	 * 
	 * @GetMapping(params = "method=data") public String data(Model model, String
	 * club_cl_name) { model.addAttribute("list",
	 * cal_service.selectAll(club_cl_name)); return "pageJsonReport"; }
	 */

}

/*
 * // 캘린더 호출 무조건 "do" 타고 들어와야함!
 * 
 * @RequestMapping(value = "do", method = RequestMethod.GET) public String
 * calendar(Model model, HttpServletRequest request, CalendarDateDTO dateData,
 * String club_cl_name){
 * 
 * Calendar cal = Calendar.getInstance(); CalendarDateDTO calendarData;
 * 
 * //검색 날짜 if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
 * dateData = new
 * CalendarDateDTO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get
 * (Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null); }
 * 
 * //검색 날짜 end Map<String, Integer> today_info = dateData.today_info(dateData);
 * List<CalendarDateDTO> dateList = new ArrayList<CalendarDateDTO>();
 * 
 * //실질적인 달력 데이터 리스트에 데이터 삽입 시작. //일단 시작 인덱스까지 아무것도 없는 데이터 삽입 for(int i=1;
 * i<today_info.get("start"); i++){ calendarData= new CalendarDateDTO(null,
 * null, null, null); dateList.add(calendarData); }
 * 
 * //날짜 삽입 for (int i = today_info.get("startDay"); i <=
 * today_info.get("endDay"); i++) { if(i==today_info.get("today")){
 * calendarData= new CalendarDateDTO(String.valueOf(dateData.getYear()),
 * String.valueOf(dateData.getMonth()), String.valueOf(i), "today"); }else{
 * calendarData= new CalendarDateDTO(String.valueOf(dateData.getYear()),
 * String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date"); }
 * dateList.add(calendarData); }
 * 
 * //달력 빈곳 빈 데이터로 삽입 int index = 7-dateList.size()%7; if(dateList.size()%7!=0){
 * for (int i = 0; i < index; i++) { calendarData= new CalendarDateDTO(null,
 * null, null, null); dateList.add(calendarData); } }
 * 
 * //해당 동호회의 리스트만 출력 List<CalendarDateDTO> result =
 * cal_service.selectAll(club_cl_name);
 * 
 * model.addAttribute("result", result); model.addAttribute("dateList",
 * dateList); model.addAttribute("today_info", today_info);
 * model.addAttribute("club_cl_name", club_cl_name); return "calendar"; }
 * 
 * //캘린더에서 "submit"을 누르면 호출됨
 * 
 * @RequestMapping("input_calendar") public String inputDay(Model model, String
 * year, String month, String value, String date, String schedule, String
 * schedule_detail) {
 * 
 * //해당"월, 일, 동회명"에 중복되는 값이 SQL에 존재하는지 확인 String value_ej = value; int
 * search_delete = cal_service.search(month, value, date);
 * 
 * //만약에 존재한다면 "0"을 돌려받음, SQL에 정보가 없으면 ELSE if(0==search_delete) { int result =
 * cal_service.insert(new CalendarDateDTO(year, month, date, value, schedule,
 * schedule_detail)); } else { //기존에 존재하던 정보를 삭제하고 새로운 정보를 입력 String delete =
 * cal_service.delete(month, value, date); int result = cal_service.insert(new
 * CalendarDateDTO(year, month, date, value, schedule, schedule_detail)); }
 * //"submit"을 누르면 원래 있었던 페이지로 돌아감 session.setAttribute("club_cl_name",
 * value_ej); model.addAttribute("club_cl_name", value_ej); return
 * "redirect: /calendar/do"; } }
 */
