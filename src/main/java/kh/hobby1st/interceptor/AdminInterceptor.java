package kh.hobby1st.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

@Autowired HttpSession session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		String admin = (String)session.getAttribute("admin");
		if(admin == null) {
			response.sendRedirect("/error");
			return false;
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

}
