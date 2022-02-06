package kh.hobby1st.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	  model.addAttribute("list", cal_service.selectAll(club_cl_name));
	  return "calendar"; 
	  }
	 	  
	  //달력에서 입력만 하게되면 자동 저장이 됩니다.(스케줄 저장기능)
	  @ResponseBody
	  @RequestMapping(value = "insert", method = RequestMethod.GET) 
	  public String insert(String title, String club, Date day_start, Date day_end) {
	  //sql table 디폴트값 주입
	  String memberWrite = "No Message";	  
	  String detailWrite = "No Message";	  
	  //널값을 잡기위한 날짜 계산
	  day_end = new Date(day_end.getTime()+(1000*60*60*24*-1));	  
	    
	  //출력결과물을 보여주기 위해 달력형식 변환  
	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	  String update_start = simpleDateFormat.format(day_start);
	  String update_end = simpleDateFormat.format(day_end);
	  
	  //시간단위 자르기
	  if(update_start.equals(update_end)) {
	  String change_start = update_start.substring(0,10);
	  String change_end = update_end.substring(0,10);
	  int result = cal_service.insert(new CalendarDateDTO(club, change_start, change_end, title, memberWrite, detailWrite));
	  } else {
	  int result = cal_service.insert(new CalendarDateDTO(club, update_start, update_end, title, memberWrite, detailWrite));
	  }
	  return "pageJsonReport"; 
	  }
	  
	  //메인 캘린더에서 스케줄 클릭시 디테일 jsp로 이동
	  @RequestMapping(value = "calendarDetail")
	  public String detail(Model model, String title, String club_cl_name) {
		  model.addAttribute("list", cal_service.selectAllDetail(club_cl_name, title));
		  return "/calendar/calendarDetail"; 
	  }
	     //팝업창에서 스케줄 삭제를 누를 시
         @ResponseBody
		 @RequestMapping(value = "delete", method = RequestMethod.POST) 
         public String delete(String title, String club_cl_name) { 
         int result = cal_service.delete(club_cl_name, title); 
         return "pageJsonReport";
       }
         //팝업창에서 스케줄 내용등록을 할 시
         @ResponseBody
		 @RequestMapping(value = "insertDetail", method = RequestMethod.POST) 
         public String insertDetail(String detail, String member, String club_cl_name, String title) { 
          System.out.println(detail); 
          System.out.println(member); 
           
          int result = cal_service.update(club_cl_name, title, member, detail);
          return "pageJsonReport";
       }
} 


		/*
		 * @RequestMapping("delete") public String delete(String title, String
		 * club_cl_name) { int result = cal_service.delete(club_cl_name, title); return
		 * ("<script language='javascript' type='text/javascript'> alert('에러다.'); </script>"
		 * );
		 * 
		 * }
		 */

//-------------------------소스 보관용 -------------------------------------	  
	  //에이작스를 통한 프론트단에서 삭제요청
	/*
		 * @ResponseBody
		 * @RequestMapping(value = "delete", method = RequestMethod.POST) public String
		 * delete(String title, String club_cl_name) { int result =
		 * cal_service.delete(club_cl_name, title); return "pageJsonReport"; }
	 */
	  
