package kh.hobby1st.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
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

import org.json.simple.parser.JSONParser;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;



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
	 
	  //삭제요청
	  @ResponseBody
	  @RequestMapping(value = "delete", method = RequestMethod.POST)
	  public String delete(Model model, String title, String club_cl_name) {
      int result = cal_service.delete(club_cl_name, title);
      return "pageJsonReport";
	  }
	  
	  
	  
	  //달력에서 입력만 하게되면 자동 저장이 됩니다.(스케줄 저장기능)
	  @ResponseBody
	  @RequestMapping(value = "insert", method = RequestMethod.GET) 
	  public String insert(String title, String club, Date day_start, Date day_end) {
	  //널값을 잡기위한 날짜 계산
	  day_end = new Date(day_end.getTime()+(1000*60*60*24*-1));	  
	    
	  //출력결과물을 보여주기 위해 달력형식 변환  
	  SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	  SimpleDateFormat endDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	  String update_start = simpleDateFormat.format(day_start);
	  String update_end = endDateFormat.format(day_end);
	  
	  //시간단위 자르기
	  if(update_start.equals(update_end)) {
	  String change_start = update_start.substring(0,10);
	  String change_end = update_end.substring(0,10);
	  int result = cal_service.insert(new CalendarDateDTO(club, change_start, change_end, title));
	  } else {
	  int result = cal_service.insert(new CalendarDateDTO(club, update_start, update_end, title));
	  }
	  return "pageJsonReport"; 
	  }
}	  
