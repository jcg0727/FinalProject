package kr.ac.hs.controller.sugang;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.LecturePlanCommand;
import kr.ac.hs.command.sugang.ApplyCompleteLectureCommand;
import kr.ac.hs.command.sugang.ApplyLessonCommand;
import kr.ac.hs.command.sugang.LectureRegisterCommand;
import kr.ac.hs.command.sugang.SugangApplyCommand;
import kr.ac.hs.controller.lecture.LectureCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.DepartmentVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.lecture.LecturePlanVO2;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.dto.sugang.ApplyCompleteLectureVO;
import kr.ac.hs.dto.sugang.ApplyLessonVO;
import kr.ac.hs.dto.sugang.ExSugangListVO;
import kr.ac.hs.dto.sugang.LectureListVO;
import kr.ac.hs.dto.sugang.LectureRegisterVO;
import kr.ac.hs.service.DepartmentService;
import kr.ac.hs.service.StudentService;
import kr.ac.hs.service.academic.StudentInformationService;
import kr.ac.hs.service.sugang.ExSugangListService;
import kr.ac.hs.service.sugang.SugangApplyService;

// 전공 및 교양 개설강의 Controller
@Controller
public class SugangListController {
	
	@Autowired
	private StudentInformationService studentInfoService;
	
	@Autowired
	private SugangApplyService sugangApplyService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired ExSugangListService exService;
	
	@RequestMapping("/sugang/list")
	public ModelAndView student_main(HttpSession session, ModelAndView mnv)  throws SQLException {
		String url = "/sugang/sugangApply";
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String account_no = loginUser.getAccount_no();
		String student_no = loginUser.getId();
		
		/*int semester = studentInfoService.selectLectureSemester(student_no);*/
		Map<String, Object> dataMap = studentInfoService.getInfoByAccountNO(account_no);
		
		mnv.addObject("dataMap",dataMap);
		/*mnv.addObject("semester",semester);*/
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping(value = "/sugang/list_search", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> list_search(@RequestBody SugangApplyCommand cmd, HttpSession session)
			throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(5);
		
		DepartmentVO department = departmentService.getDepartmentByName(cmd.getSearchDept());

		try {
			Map<String, Object> resultMap = sugangApplyService.getLectureList(department.getDept_cd(),
					cmd.getSearchClassName(), cmd.getSearchYear(), cmd.getSearchClassType(), cmd);
			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/sugang/boguanList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> boguanList(@RequestBody SugangApplyCommand cmd, HttpSession session)
			throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(5);
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String student_no = loginUser.getId();
		StudentVO student = studentService.getStudent(student_no);
		String dept_cd = student.getDept_cd();

		try {
			Map<String, Object> resultMap = sugangApplyService.getBoguanList(dept_cd, student_no, cmd);
			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping(value = "/sugang/sugangApplySuccessList", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> sugangApplySuccessList(@RequestBody SugangApplyCommand cmd, HttpSession session)
			throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		cmd.setPerPageNum(5);
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String student_no = loginUser.getId();
		StudentVO student = studentService.getStudent(student_no);
		String dept_cd = student.getDept_cd();

		try {
			Map<String, Object> resultMap = sugangApplyService.getSugangApplySuccessList(dept_cd, student_no, cmd);
			
			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}	
	
	@RequestMapping(value ="/sugang/list_year", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> list_year(@RequestBody SugangApplyCommand cmd, HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(5);
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String student_no = loginUser.getId();
		
		StudentVO student = studentService.getStudent(student_no);
		String dept_cd = student.getDept_cd();
		
		try {
			Map<String, Object> list_year = sugangApplyService.getLectureList_year(dept_cd, student_no, cmd);
			entity = new ResponseEntity<Map<String,Object>>(list_year, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping("/sugang/list/timeTable2")
	public ModelAndView timeTable2(ApplyLessonCommand cmd, ModelAndView mnv, HttpSession session)throws Exception{
		String url = "/sugang/timeTable2";
		
		List<ApplyLessonVO> applyLessonList = sugangApplyService.getApplyLessonList(cmd);
		
		mnv.addObject("applyLessonList",applyLessonList);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/sugang/list/lectureDetail")
	public ModelAndView lectureDetail(ModelAndView mnv, HttpSession session, String class_no) throws Exception{
		String url = "/sugang/js/lectureDetail";
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> dataMap2 = new HashMap<String, Object>();
		Map<String, Object> dataMap3 = new HashMap<String, Object>();
		
		dataMap = sugangApplyService.getLecturePlan(class_no);
		dataMap2 = sugangApplyService.getLectureEvaluation(class_no);
		dataMap3 = sugangApplyService.getLectureEvaluationQ_6(class_no);
		
		mnv.addObject("dataMap",dataMap);
		mnv.addObject("dataMap2",dataMap2);
		mnv.addObject("dataMap3",dataMap3);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/sugang/list/exSugangList")
	public ModelAndView exSugangList_main(ModelAndView mnv, HttpSession session, SearchCriteria cri)throws Exception{
		String url = "/sugang/exSugangList";
		
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		String student_no = loginUser.getId();
		
		Calendar calendar = Calendar.getInstance();
		java.util.Date date = calendar.getTime();
		//올해 연도(year)와 학기 두자리수(semester)
		String year = (new SimpleDateFormat("yyyy").format(date));
		String month = (new SimpleDateFormat("MM").format(date));
		String semester = "";
		if(month.equals("01")||month.equals("02")||month.equals("03")||month.equals("04")||month.equals("05")||month.equals("06")) {
			semester = "01";
		}else {
			semester = "02";
		}
		// lecture_semester 형식에 맞춘 연도+학기
		String lecture_semester = year+semester;
		//학기 한자리수
		String semester2 = semester.substring(1);
		
		// searchType 기본설정. ex) 현재 2021년 2학기면 2021년 1학기의 값을 기본설정.
		String searchYear=null;
		String searchSemester=null;
		
		if(semester2.equals("2")) {
			searchYear=year;
			searchSemester="1";
		}else if(semester2.equals("1")) {
			searchYear = String.valueOf(Integer.parseInt(year)-1); 
			searchSemester="2";
		}
		
		
		List<ExSugangListVO> infoList =  exService.sugangInfoBystudent_no(student_no, lecture_semester);
		//이수학기
		int stuYear=0;
		for(ExSugangListVO items : infoList) {
			stuYear = items.getSemester();
		}
		//학년
		int grade=0;
		switch(stuYear) {
			case 0: case 1 :
		 	grade = 1;
			break;
			case 2: case 3 :
			grade = 2;
			break;
			case 4: case 5:
			grade = 3;
			break;
			case 6: case 7: case 8: case 9: case 10:
			grade = 4;
			break;
		 }
				
		cri.setPerPageNum(5);
		Map<String, Object> dataMap = exService.selectTookClassesByStudent_no(student_no,cri);
		List<ExSugangListVO> openList = exService.selectClassesOpenThisSemester(student_no, lecture_semester);
		
		
		mnv.addObject("stuYear", stuYear);
		mnv.addObject("year", year);
		mnv.addObject("grade", grade);
		mnv.addObject("semester2", semester2);
		mnv.addObject("infoList", infoList);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("openList", openList);
		
		
		/*/sugang/exSugangList?searchType=2018&searchType2=1*/
		//url="/sugang/exSugangList?searchType="+searchYear+"&searchType2="+searchSemester;
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping(value="/sugang/registLecture",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,String>> registLecture(@RequestBody ApplyCompleteLectureCommand cmd) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		
		try {
			String check = sugangApplyService.registLectureList(cmd);
			String message = "";
			
			if(check.equals("OK")) {
				message = "수강신청 완료되었습니다.";
			} else if (check.equals("NO")){
				message = "이미 신청하신 내역이 존재합니다.";
			} else if (check.equals("OVERLAP")) {
				message = "중복된 요일/시간 입니다.\n신청 불가능합니다";
			}else {
				message= "정원 초과입니다.\n신청 불가능합니다.";
			}
			resultMap.put("message", message);
			resultMap.put("check",check);
			entity = new ResponseEntity<Map<String,String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/sugang/registBoguan",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,String>> registBoguan(@RequestBody LectureRegisterCommand cmd) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
	
		Map<String,String> resultMap = new HashMap<String,String>();
	
		try {
			String check = sugangApplyService.registBoguanList(cmd);
			String message = "";
			
			if(check.equals("OK")) {
				message = "보관함에 추가되었습니다.";
			} else {
				message = "이미 보관함에 담은 강의입니다.";
			}
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String,String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/sugang/updateBoguanToSugangSuccess",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,String>> updateBoguanToSugangSuccess(@RequestBody ApplyCompleteLectureCommand cmd) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		Map<String,String> resultMap = new HashMap<String,String>();
	
		try {
			String check = sugangApplyService.updateBoguanToSugangSuccess(cmd);
			String message = "";
			
			if(check.equals("OK")) {
				message = "수강신청 완료되었습니다.";
				
			} else if (check.equals("NO")){
				message = "이미 신청하신 내역이 존재합니다.";
				
			} else if (check.equals("OVERLAP")) {
				message = "중복된 요일/시간 입니다.\n신청 불가능합니다";
				
			}else {
				message= "정원 초과입니다.\n신청 불가능합니다.";
			}
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String,String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	@RequestMapping(value="/sugang/removeBoguan",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,String>> removeBoguan( @RequestBody LectureRegisterCommand cmd, HttpSession session) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		Map<String,String> resultMap = new HashMap<String,String>();
		try {
			
			AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
			LectureRegisterVO lectureRegister = cmd.toVO();
			
			lectureRegister.setStudent_no(loginUser.getId());
			
			String check = sugangApplyService.removeBoguan(lectureRegister);
			String message = "";
			
			if(check.equals("OK")) {
				message = "보관함의 강의를 삭제했습니다.";
			} else {
				message = "취소되었습니다.";
			}
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String,String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/sugang/removeSugangSuccess",method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,String>> removeSugangSuccess( @RequestBody LectureRegisterCommand cmd, HttpSession session) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		Map<String,String> resultMap = new HashMap<String,String>();
		try {
			
			AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
			LectureRegisterVO lectureRegister = cmd.toVO();
			
			lectureRegister.setStudent_no(loginUser.getId());
			
			String check = sugangApplyService.removeSugang(lectureRegister);
			String message = "";
			
			if(check.equals("OK")) {
				message = "수강신청이 취소되었습니다.";
			} else {
				message = "수강신청을 취소할 수 없습니다.";
			}
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String,String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String,String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	

	
	
	
	
}
