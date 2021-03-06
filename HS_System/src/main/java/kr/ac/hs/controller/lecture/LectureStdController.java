package kr.ac.hs.controller.lecture;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.service.attendance.AttendanceService;
import kr.ac.hs.service.lecture.LectureStdService;

@Controller
public class LectureStdController {

	@Autowired
	LectureStdService service;

	@Autowired
	AttendanceService service2;

	// 학생- 수업목록 page
	@RequestMapping("/lecture/management_st")
	public ModelAndView LectureStdMain(HttpSession session, ModelAndView mnv, SearchCriteria cri, String account_no) throws SQLException {
		String url = "lecture/student/lectureStuManagement";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		account_no = account.getStudent_no();

		Map<String, Object> dataMap = service.getStdLectureList(cri, account_no);
		Map<String, Object> dataMap2 = service2.selectDissentAttendence(cri, account_no);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dataMap2", dataMap2);
		mnv.setViewName(url);

		return mnv;
	}

	// 학생-강의계획서조회
	@RequestMapping("/lecture/management_st/lecturePlan")
	public ModelAndView LectureStuPlan(HttpSession session, String class_no, String lecture_semester, ModelAndView mnv) throws SQLException {
		String url = "/lecture/student/lectureStuPlan";

		LectureVO lecture = null;

		lecture = service.selectLectureDetail(class_no, lecture_semester);

		mnv.addObject("lecture", lecture);
		mnv.setViewName(url);
		return mnv;
	}

}
