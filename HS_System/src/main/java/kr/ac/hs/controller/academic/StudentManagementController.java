package kr.ac.hs.controller.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.service.StudentService;

// 교직원- 학적관리(학생관리)  Controller
@Controller
public class StudentManagementController {
	@Autowired
	StudentService service;

	@RequestMapping("/academic/management_as")
	public ModelAndView stdList(HttpSession session, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "academic/staff/studentManagement";

		Map<String, Object> dataMap = service.getStudentList(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);
		return mnv;
	}

	//	@RequestMapping("/academic/management_as/detail")
	//	@ResponseBody
	//	public ResponseEntity<List<StudentVO>> stdDetail(@RequestParam("student_no") String student_no) throws Exception {
	//		ResponseEntity<List<StudentVO>> entity = null;
	//		ResponseEntity<List<ProfessorVO>> proNmEntity = null;
	//		try {
	//			List<StudentVO> stuDetail = service.getStudentDetail(student_no);
	//			List<ProfessorVO> proNm = service.getProfessorNm(student_no);
	//			proNmEntity = new ResponseEntity<List<ProfessorVO>>(proNm, HttpStatus.OK);
	//			entity = new ResponseEntity<List<StudentVO>>(stuDetail, HttpStatus.OK);
	//		} catch (SQLException e) {
	//			entity = new ResponseEntity<List<StudentVO>>(HttpStatus.BAD_REQUEST);
	//			proNmEntity = new ResponseEntity<List<ProfessorVO>>(HttpStatus.BAD_REQUEST);
	//		}
	//		return entity;
	//
	//	}
	@RequestMapping("/academic/management_as/detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> stdDetail(@RequestParam("student_no") String student_no) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {

			// map으로 받아 2개의 List를 dataMap에 다 넣어버림
			List<StudentVO> stuDetail = service.getStudentDetail(student_no);
			List<ProfessorVO> proNm = service.getProfessorNm(student_no);

			dataMap.put("student", stuDetail);
			dataMap.put("prof", proNm);

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping("/academic/management_as/studentProList")
	public ModelAndView main(String dept_nm, String student_no, String professorYN, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "academic/staff/studentProList";

		Map<String, Object> dataMap = service.selectProfessorListByDept_nm(dept_nm, cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dept_nm", dept_nm);
		mnv.addObject("student_no", student_no);
		mnv.addObject("professorYN", professorYN);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/academic/management_as/changeAdvisor")
	@ResponseBody
	public ResponseEntity<String> updateAdvisor(String pro_no, String student_no) throws Exception {
		System.out.println("----------------------------" + pro_no);
		System.out.println("----------------------------" + student_no);

		ResponseEntity<String> entity = null;
		try {
			service.updateAdvisor(pro_no, student_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
