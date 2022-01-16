package kh.hobby1st.controller;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.hobby1st.service.ClubList_PhotoService;

@Controller
@RequestMapping("/clubListPhoto/")
public class ClubList_Photo {

	@Autowired
	private HttpSession session;

	@Autowired
	private ClubList_PhotoService clpService;

	@RequestMapping("expressPhoto")
	public void expressPhoto(HttpServletResponse response, String clp_photo) throws Exception {
		String realPath = session.getServletContext().getRealPath("clubPic");

		File target = new File(realPath+"/"+clp_photo);

		try(
				DataInputStream dis = new DataInputStream(new FileInputStream(target));
				DataOutputStream dos = new DataOutputStream(response.getOutputStream());
				){
			byte[] imgContents = new byte[(int)target.length()];
			dis.readFully(imgContents);

			clp_photo = new String(clp_photo.getBytes(), "ISO-8859-1");
			response.reset();
			response.setHeader("Content-Disposition", "attachment;");

			dos.write(imgContents);
			dos.flush();
		}
	}


	@ExceptionHandler(Exception.class)
	public String execeptionHandler(Exception e) {
		e.printStackTrace();
		return "redirect:/";
	}
}
