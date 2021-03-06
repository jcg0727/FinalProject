package kr.ac.hs.controller.lecture;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.attendance.AttendanceCommand;
import kr.ac.hs.service.attendance.AttendanceService;


@Controller
public class AttendanceController {
	
	@Autowired
	private AttendanceService attendanceService;

	@RequestMapping("/attendance/attendanceCheck")
	public void attendanceCheck(AttendanceCommand cmd, HttpServletResponse response)  throws SQLException, IOException {
		
		System.out.println(" student_no ::::::::::::::::::::::::::::::::::::::::::  " + cmd.getStudent_no());
		System.out.println(" check id :::::::::::::::::::::::::::::::;:::::::: " + cmd.getId_check());
		System.out.println(" class_no :::::::::::::::::::::::::::::::;:::::::: " + cmd.getClass_no());
	
		String message = attendanceService.registAttendance(cmd);
		
		if(message.equals("OK")) {
			System.out.println("출석등록완료");
		}
		// 이승은님 출석등록이 완료되었습니다. 
		
		// 다시 출석 확인 화면을 띄음
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>history.go(-1);</script>");
		out.flush();

	}
	
	
	
	
}
