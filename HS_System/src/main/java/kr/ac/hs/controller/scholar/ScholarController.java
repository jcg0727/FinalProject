package kr.ac.hs.controller.scholar;

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
import kr.ac.hs.command.scholar.ScholarCommand;
import kr.ac.hs.command.scholar.ScholarSearchCriCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.service.scholar.ScholarService;

@Controller
//@RequestMapping("/academic/admission")
public class ScholarController {

	@Autowired
	private ScholarService service;

	@RequestMapping("/tuition/management")
	public ModelAndView ScholarMain(SearchCriteria cri, ScholarSearchCriCommand cmd, ModelAndView mnv, HttpSession session, Map<String, Object> dataMap,
	        String account_no) throws Exception {
		String url = "scholar/staff/scholarManagement";

		System.out.println("----------------------------->> " + cmd.getLecture_semester());
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		

		String dept_nm = service.getDeptNmDeptStaff(loginUser.getId());
	
		//cmd.setPerPageNum(5);

		dataMap.put("cri", cmd);
		dataMap.put("staff_no", loginUser.getId());

		if (loginUser.getAuthority_cd().equals("ROLE_STAFF")) {
			dataMap = service.getStudentDeptStaffScoreList(dataMap);
		} else if (loginUser.getAuthority_cd().equals("ROLE_SCHOLAR")) {
			dataMap = service.getStudentScholarRecommend(dataMap);
		}

		mnv.addObject("dept_nm", dept_nm);
		mnv.addObject("dataMap", dataMap);
	
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/tuition/management/recommendDeptRegistStu")
	@ResponseBody
	public ResponseEntity<HttpStatus> regist(@RequestParam("student_no") String student_no) throws Exception {
		ResponseEntity<HttpStatus> entity = null;

		try {
			service.registDeptStaffScholar(student_no);
			entity = new ResponseEntity<HttpStatus>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		return entity;
	}

	@RequestMapping("/tuition/management/remove")
	@ResponseBody
	public ResponseEntity<ScholarStaffVO> remove(ScholarCommand cmd) throws Exception {

		System.out.println("1111111111111111111111111");

		ResponseEntity<ScholarStaffVO> entity = null;
		ScholarStaffVO vo = cmd.toDelete();

		System.out.println(vo.getRecommend_date());
		System.out.println(vo.getStudent_no());

		try {

			service.removeDeptStaffScholarStu(vo);
			entity = new ResponseEntity<ScholarStaffVO>(vo, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<ScholarStaffVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	//????????? ?????? -----------------------------------------------------------------
	@RequestMapping("/tuition/management/recommendScholarStaff")
	@ResponseBody
	public ResponseEntity<ScholarStaffVO> recommend(ScholarCommand cmd) throws Exception {

		ResponseEntity<ScholarStaffVO> entity = null;

		ScholarStaffVO vo = cmd.toUpdateStaff();
		try {

			service.modifyScholarStaffStu(vo);
			entity = new ResponseEntity<ScholarStaffVO>(vo, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<ScholarStaffVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("/tuition/management/removeScholarStaff")
	@ResponseBody
	public ResponseEntity<ScholarStaffVO> removeScholar(ScholarCommand cmd) throws Exception {

		ResponseEntity<ScholarStaffVO> entity = null;

		ScholarStaffVO vo = cmd.toDelete();
		try {
			service.removeScholarStaffStu(vo);
			entity = new ResponseEntity<ScholarStaffVO>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<ScholarStaffVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
