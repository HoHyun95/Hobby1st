package kh.hobby1st.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.hobby1st.dto.CalendarDateDTO;

@Controller
@RequestMapping("/calendar/")
public class CalendarController {

	@RequestMapping(value = "do", method = RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, CalendarDateDTO dateData, String club_cl_name){
		
		Calendar cal = Calendar.getInstance();
		CalendarDateDTO calendarData;
		
		//검색 날짜
		if(dateData.getDate().equals("")&&dateData.getMonth().equals("")){
			dateData = new CalendarDateDTO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}
		
		//검색 날짜 end
		Map<String, Integer> today_info =  dateData.today_info(dateData);
		List<CalendarDateDTO> dateList = new ArrayList<CalendarDateDTO>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new CalendarDateDTO(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new CalendarDateDTO(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new CalendarDateDTO(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				calendarData= new CalendarDateDTO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		//System.out.println(dateList);
		
		//배열에 담음
		//날짜 데이터 배열
		model.addAttribute("dateList", dateList);		
		model.addAttribute("today_info", today_info);
		model.addAttribute("club_cl_name", club_cl_name);
		return "calendar";
	}
	
	@RequestMapping("input_calendar")
	public String inputDay(String date, String year, String month, String value, String schedule, String schedule_detail) {
		System.out.println(year+":"+ month +":"+ date +":"+ value +":"+ schedule +":"+ schedule_detail);
		return "redirect: /";
	}

	
}
