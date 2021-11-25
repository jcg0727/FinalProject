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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.LectureProfessorModifyCommand;
import kr.ac.hs.command.lecture.LectureTimeTableModifyCommand;
import kr.ac.hs.command.lecture.LecturetimeListCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.lecture.LectureTimeVO;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.service.AcademicFreshmenService;
import kr.ac.hs.service.lecture.LectureTimeService;

@Controller
public class LectureTimeController {

	@Autowired
	private LectureTimeService service;
	
	@RequestMapping("/lecture/lectureTime")
	public ModelAndView lectureTimeMain(ModelAndView mnv)throws Exception{
		String url = "/lecture/staff/lectureTime";
		
		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value="/lecture/lectureTimeList", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ResponseEntity<Map<String,Object>>  lectureTime(@RequestBody LecturetimeListCommand cmd, HttpSession session, SearchCriteria cri)throws SQLException {
		ResponseEntity<Map<String,Object>> entity = null;
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		Map<String,Object> dataMap = new HashMap<String, Object>();

		dataMap.put("cri",cmd);
		dataMap.put("staff_no", loginUser.getId());	
		try {
			
			if(loginUser.getAuthority_cd().equals("ROLE_STAFF")) {
				dataMap = service.getStaffLectureTimeList(dataMap);
			}else if(loginUser.getAuthority_cd().equals("ROLE_ACADEMIC")) {
				dataMap = service.getLectureTimeList(cri);
			}
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
			
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	
	//학수번호로 교수변경목록 리스트
	@RequestMapping(value = "/lecture/professor", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> lectureProfessor(Map<String, Object> dataMap,String lecture_semester, String class_no) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		dataMap.put("class_no", class_no);
		dataMap.put("lecture_semester", lecture_semester);
		try {
			Map<String, Object> lectureList = service.selectLectureProfessorByClassNo(dataMap);
			entity = new ResponseEntity<Map<String, Object>>(lectureList, HttpStatus.OK);
		} catch (SQLException e) {
			entity =  new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
			
	}
	
	@RequestMapping("/lecture/proList")
	public ModelAndView selectPro(HttpSession session, SearchCriteria cri, ModelAndView mnv,Map<String,Object> dataMap, String class_no) throws Exception{
		String url="lecture/staff/proList";
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		dataMap.put("cri" , cri);
		dataMap.put("staff_no" , loginUser.getId());
		
		dataMap = service.selectProlistByStaffNo(dataMap);
		
		mnv.addObject("class_no", class_no);
		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}
 	
	/**
	 * @param cmd
	 * @return
	 * @throws Exception
	 */
	
	@RequestMapping(value="/lecture/updateProfessor", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateProfessor(@RequestBody LectureProfessorModifyCommand cmd) throws Exception{
		ResponseEntity<String> entity = null;
		
		LectureVO lecturePro = cmd.toLecture();
		try {
			service.modify(lecturePro);
			entity =  new ResponseEntity<String>(HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity =  new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	//과목, 학기로 시간 리스트 출력
	@RequestMapping(value="/lecture/timeTable", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> timeTable(Map<String, Object> dataMap,String lecture_semester, String class_no) throws Exception{
		ResponseEntity<Map<String, Object>> entity = null;
		dataMap.put("class_no", class_no);
		dataMap.put("lecture_semester", lecture_semester);
		try {
			Map<String, Object> timeList = service.lectureTime(dataMap);
			entity = new ResponseEntity<Map<String, Object>>(timeList, HttpStatus.OK);
		} catch (SQLException e) {
			entity =  new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/lecture/updateTimetable", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<String> updateProfessor(@RequestBody LectureTimeTableModifyCommand cmd) throws Exception{
		ResponseEntity<String> entity = null;
		LectureTimeVO lectureTime = cmd.toLectureTime();
		try {
			service.modify(lectureTime);
			entity =  new ResponseEntity<String>(HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity =  new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
}
