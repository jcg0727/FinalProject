package kr.ac.hs.controller.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.attendance.AttendanceCommand;
import kr.ac.hs.command.lecture.LectureDetailCommandProf;
import kr.ac.hs.command.lecture.LectureManagemenProfCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.dto.lecture.LectureStudentListVO;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.service.attendance.AttendanceService;
import kr.ac.hs.service.lecture.LectureManagementProfService;
import kr.ac.hs.service.sugang.SugangApplyService;
import kr.ac.hs.service.sugang.SugangApplyServiceImpl;

@Controller
public class LectureProfController {
	
	@Autowired
	private SugangApplyService sugangApplyService;
	
	@Autowired
	private LectureManagementProfService lectureManagementProfService;
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping("/lecture/management_prof")
	public ModelAndView management_prof(HttpSession session, ModelAndView mnv)  throws SQLException {
		String url = "/lecture/prof/management_prof";
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String pro_no = loginUser.getId();
		
		List<LectureManagemenProfVO> lectureList_prof = lectureManagementProfService.getLectureList_prof(pro_no);
		
		mnv.addObject("lectureList_prof",lectureList_prof);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/lecture/management_prof/timetable")
	public ModelAndView timeTable3(ApplyLessonCommand cmd, ModelAndView mnv, HttpSession session)throws Exception{
		String url = "/lecture/prof/timetable";
		
		List<ApplyLessonVO> profTimeTableList = sugangApplyService.getProfTimeTableList(cmd);
		
		mnv.addObject("profTimeTableList",profTimeTableList);
		mnv.setViewName(url);
		return mnv;
	}	
	
	@RequestMapping(value="/lecture/management_prof/attendanceCheckForm", method=RequestMethod.GET)
	public ModelAndView attendanceCheckForm(String class_no, ModelAndView mnv, HttpSession session) throws Exception{
	String url = "/lecture/prof/js/attendanceCheckForm";
	
	mnv.addObject("class_no", class_no);
	
	mnv.setViewName(url);
	return mnv;
	
	}
	
	@RequestMapping(value = "/lecture/management_prof/lectureStudentList", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> lectureStudentList(@RequestBody LectureDetailCommandProf cmd, HttpSession session)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String pro_no = "11004001";		
		
		try {
			
			List<LectureStudentListVO> lectureStudentList = lectureManagementProfService.getLectureStudentList(cmd);
			resultMap.put("lectureStudentList", lectureStudentList);
			
			entity = new ResponseEntity<Map<String,Object>> (resultMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/lecture/management_prof/lectureDetail", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> lectureDetail(@RequestBody LectureDetailCommandProf cmd, HttpSession session)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String pro_no = loginUser.getId();		
		
		try {
			
			List<LectureManagemenProfVO> lectureDetailProf = lectureManagementProfService.getLectureDetailProfByClassNo(cmd);
			resultMap.put("lectureDetailProf", lectureDetailProf);
			
			entity = new ResponseEntity<Map<String,Object>> (resultMap, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	@RequestMapping(value = "/lecture/management_prof/checkAttendanceStatus", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> checkAttendanceStatus(@RequestBody AttendanceCommand cmd, HttpSession session)throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		try {
			String message = "";
			
			int count = attendanceService.getAttendanceStatus(cmd);
			if(count>=1) {
				message = "attendance";
			} else {
				message = "unregistered";
			}
			
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String,Object>> (resultMap, HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
		
	
	
	
	
	
	
}
