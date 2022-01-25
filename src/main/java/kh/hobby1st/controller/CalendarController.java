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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
		List<CalendarDateDTO> result = cal_service.selectAll(club_cl_name);

		model.addAttribute("result", result);
		model.addAttribute("dateList", dateList);		
		model.addAttribute("today_info", today_info);
		model.addAttribute("club_cl_name", club_cl_name);
		return "calendar";
	}
	@RequestMapping("input_calendar")
    public String inputDay(String year, String month, String value, String date, String schedule, String schedule_detail) {
		session.setAttribute("club_cl_name", value);
		int result = cal_service.insert(new CalendarDateDTO(year, month, date, value, schedule, schedule_detail));
		return "redirect: /calendar/do";
	}
}

//          좋은코드가 생각이 안납니다 보시는분 있으시면 코드 분석하시고 살려주십쇼 제발 사람살려주세요여ㅕㅕ
//	@RequestMapping("input_calendar")
//    public String inputDay(String year, String month, 
////    		작성날짜
//    		String date_1, String date_2, String date_3, String date_4, String date_5, String date_6, String date_7, String date_8, String date_9,
//    		String date_10, String date_11, String date_12, String date_13, String date_14, String date_15, String date_16, String date_17,
//    		String date_18, String date_19, String date_20, String date_21, String date_22, String date_23, String date_24, String date_25,
//    		String date_26, String date_27, String date_28, String date_29, String date_30, String date_31,
////          작성한 동호회 캘린더    		
//    		String value,
////          캘린더제목 살려주세요 제발..    		   		
//    		String schedule_1, String schedule_2, String schedule_3, String schedule_4, String schedule_5, String schedule_6, String schedule_7, String schedule_8, String schedule_9,
//    		String schedule_10, String schedule_11, String schedule_12, String schedule_13, String schedule_14, String schedule_15, String schedule_16, String schedule_17,
//    		String schedule_18, String schedule_19, String schedule_20, String schedule_21, String schedule_22, String schedule_23, String schedule_24, String schedule_25,
//    		String schedule_26, String schedule_27, String schedule_28, String schedule_29, String schedule_30, String schedule_31,
////          캘린더내용 살려주세요 제발.. 사용자가 캘린더 30일치에서 원하는데로 글을 쓰고 저장(버튼)한번만 누르면 모든내용이 한꺼번에 sql에 담기게 하고싶습니다. 개별적으로는 담기게 할 수있는데... 별로일듯해서..  		   		
//    		String schedule_detail_1, String schedule_detail_2, String schedule_detail_3, String schedule_detail_4, String schedule_detail_5, String schedule_detail_6, String schedule_detail_7, String schedule_detail_8, String schedule_detail_9,
//    		String schedule_detail_10, String schedule_detail_11, String schedule_detail_12, String schedule_detail_13, String schedule_detail_14, String schedule_detail_15, String schedule_detail_16, String schedule_detail_17,
//    		String schedule_detail_18, String schedule_detail_19, String schedule_detail_20, String schedule_detail_21, String schedule_detail_22, String schedule_detail_23, String schedule_detail_24, String schedule_detail_25,
//    		String schedule_detail_26, String schedule_detail_27, String schedule_detail_28, String schedule_detail_29, String schedule_detail_30, String schedule_detail_31
//    		)
//	{
//
//		
//		
//	  for(int i =0; i<30; i++) {
//		System.out.println("date_"+(i));
//		System.out.println("schedule_"+(i));
//



		
//		cal_service.insert(new CalendarDateDTO(year, month, date, value, schedule, schedule_detail));

//	  }
			
//			cal_service.insert(new CalendarDateDTO(year, month, date, value, schedule, schedule_detail));
//		return "redirect: /";
//	}
//	
//}
//    아래내용은 좋은 코드 나오기전까지 참고용으로 쓰겠습니다... 

//		for(int i=0; i<dto.getDate_list().length;i++) {
//			dto.setSchedule(dto.getSchedules_list()[i]);
//			dto.setSchedule_detail(dto.getSchedules_details_list()[i]);
//			
//			cal_service.insert(new CalendarDateDTO(year,month,dto.setDate(dto.getDate_list()[i]),
//					value, dto.setSchedule(dto.getSchedules_list()[i]),
//					dto.setSchedule_detail(dto.getSchedules_details_list()[i])
//					)
//				);		
//			}
	
//	@RequestMapping("input_calendar")
//	public String inputDay(@RequestParam(value="schedules",required=true) List<String> schedules,
//			@RequestParam(value="schedule_details",required=true) List<String> schedule_details,
//			@RequestParam(value="dates",required=true) List<String> dates,
//			String year, String month, String value) 
//	{
//		dates.addAll(schedules);
//		dates.addAll(schedule_details);
//		
//		String[] dataArr = dates.toArray(new String[dates.size()]);
//        for(String s : dataArr) {
//        	System.out.println(s);
//        }
		
//		String[] scheduleArr = schedules.toArray(new String[schedules.size()]);
//		String[] schedule_detail_Arr = schedule_details.toArray(new String[schedule_details.size()]);
//		
//		String[] dest = new String[scheduleArr.length];
//		System.arraycopy(dataArr, 0, dest, 0, dataArr);
//		System.arraycopy(scheduleArr, 0, dest, dataArr, scheduleArr);
//
//		System.out.println(Arrays.toString(dest)); 
//		String date = dataArr[0];
//		String schedule = scheduleArr[0];
//		String schedule_detail = schedule_detail_Arr[0];
//		
//		System.out.println(date);
//		System.out.println(schedule);
//	    cal_service.insert(new CalendarDateDTO(year,month,date,value,schedule,schedule_detail));
	    
//		for(String date : dataArr) {
//			for(String schedule : scheduleArr) {
//				for(String schedule_detail : schedule_detail_Arr) {
//					System.out.println("잘되나 이게..? 해치웠나? :" + date);
//					System.out.println("잘되나 이게..? 해치웠나? :" + schedule);
//					System.out.println("잘되나 이게..? 해치웠나? :" + schedule_detail);
//				    cal_service.insert(new CalendarDateDTO(year,month,date,value,schedule,schedule_detail));
//
//				}
//			}			
//		}
//		CalendarDateDTO dto = new CalendarDateDTO(year,month,dataArr[0],value,scheduleArr[0],schedule_detail_Arr[0]);
//		for(String s : sArrays)
//		{ 
//			System.out.println(sArrays[0]);
//			System.out.println(s); 
//			}
//		if(date.equals(null) || schedule.equals(null) || schedule_detail.equals(null)) {
//			date.remove(String.valueOf(null));
//			schedule.remove(String.valueOf(null));
//			schedule_detail.remove(String.valueOf(null));
//			
//			System.out.println("작성연:" + year);
//			System.out.println("작성월:" + month);
//			System.out.println("작성동호회:" + value);
//			
//			List<String> sum = new ArrayList<>();
//			sum.addAll(0, schedule_detail);		
//			sum.addAll(0, schedule);
//			sum.addAll(0, schedule_detail);
//	        System.out.println(sum);		
//		}		
//		return "redirect: /";
//	}	
//}
