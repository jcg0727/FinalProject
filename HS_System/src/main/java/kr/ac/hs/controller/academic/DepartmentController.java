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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.common.DepartmentCommand;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.DepartmentVO;
import kr.ac.hs.service.DepartmentService;

@Controller
public class DepartmentController {
	@Autowired
	DepartmentService service;

	// 학과 목록
	@RequestMapping("/major/management")
	public ModelAndView departList(HttpSession session, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "department/departmentManagement";

		cri.setPerPageNum(5);

		Map<String, Object> dataMap = service.getDepartmentSearch(cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	//	@RequestMapping("/major/management/list")
	//	@ResponseBody
	//	public ResponseEntity<Map<String, Object>> departAjaxList(SearchCriteria cri) throws Exception {
	//		ResponseEntity<Map<String, Object>> entity = null;
	//
	//		try {
	//			Map<String, Object> departMap = service.getDepartmentSearch(cri);
	//			entity = new ResponseEntity<Map<String, Object>>(departMap, HttpStatus.OK);
	//		} catch (Exception e) {
	//			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
	//		}
	//
	//		return entity;
	//	}

	@RequestMapping("/major/management/detail")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> departDetail(@RequestParam("dept_nm") String dept_nm) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			List<DepartmentVO> detail = service.getDepartmentDetail(dept_nm);
			dataMap.put("detail", detail);

			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	// 학과등록
	@RequestMapping(value = "/major/management/regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> departInsert(DepartmentCommand departCommand) throws Exception {

		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> dataMap = new HashMap<>();

		DepartmentVO departVO = departCommand.toVO();

		try {
			service.insertDepartment(departVO);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	// 학과수정
	@RequestMapping(value = "/major/management/modify", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> departModify(DepartmentCommand departCommand) throws Exception {

		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> dataMap = new HashMap<>();

		DepartmentVO departVO = departCommand.toVO();

		try {
			service.updateDepartment(departVO);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}