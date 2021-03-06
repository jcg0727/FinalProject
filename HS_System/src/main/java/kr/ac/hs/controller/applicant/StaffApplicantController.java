package kr.ac.hs.controller.applicant;

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
import kr.ac.hs.command.applicant.StaffApplicantCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.applicant.StaffApplicantVO;
import kr.ac.hs.service.SmsService;
import kr.ac.hs.service.applicant.StaffApplicantService;

@Controller
//@RequestMapping("/academic/admission")
public class StaffApplicantController {
	
	@Autowired
	private StaffApplicantService staffApplicantService;
	
	@Autowired
	private SmsService smsService;
/*	@RequestMapping(value="/academic/admission/candidate", method=RequestMethod.GET)
	public String applicantMain() throws Exception{
		String url = "academic/staff/applicantManagement";
		return url;
	}*/

	@RequestMapping("/academic/admission/candidate")
	public ModelAndView applicantMain(SearchCriteria cri, ModelAndView mnv, HttpSession session, Map<String, Object> dataMap) throws Exception{
		String url = "academic/staff/applicantManagement";
		String url2 = "academic/staff/applicantDeptManagement";
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		
		cri.setPerPageNum(5);
		
		dataMap.put("cri", cri);
		dataMap.put("staff_no", loginUser.getId());
		
		if(loginUser.getAuthority_cd().equals("ROLE_ACADEMIC")) {
			dataMap = staffApplicantService.getListSelectApplicant(dataMap);
			mnv.setViewName(url);
		}else if(loginUser.getAuthority_cd().equals("ROLE_STAFF")) {
			dataMap = staffApplicantService.getApplicantDeptStaff(dataMap);
			mnv.setViewName(url2);
		}
		
		mnv.addObject("dataMap" , dataMap);
		
		return mnv;
	}	
	
	@RequestMapping(value="/academic/admission/candidate/detail")
	@ResponseBody
	public ResponseEntity<StaffApplicantVO> detail(@RequestParam("applicant_no") String applicant_no) throws Exception{
		
		ResponseEntity<StaffApplicantVO> entity = null;
		
		try {
			StaffApplicantVO staffApplicantVO = staffApplicantService.getDetail(applicant_no);
			entity = new ResponseEntity<StaffApplicantVO>(staffApplicantVO, HttpStatus.OK);
		}catch (Exception e) {
			entity = new ResponseEntity<StaffApplicantVO>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/academic/admission/candidate/change")
	@ResponseBody
	public ResponseEntity<StaffApplicantVO> update(StaffApplicantCommand cmd, String phoneNumber, String name) throws Exception{
		
		ResponseEntity<StaffApplicantVO> entity = null;
		
		StaffApplicantVO staffApplicantVO = cmd.toVO();
		System.out.println("applicant_no : " + staffApplicantVO.getApplicant_no());
		System.out.println("pass_w : " + staffApplicantVO.getPass_whether());
		try {
			smsService.passSms(phoneNumber, name);
			staffApplicantService.modifyApplicantPassOrFail(staffApplicantVO);
			entity = new ResponseEntity<StaffApplicantVO>(staffApplicantVO, HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<StaffApplicantVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	@RequestMapping(value="/academic/admission/candidate/modify")
	@ResponseBody
	public ResponseEntity<HttpStatus> modify(String applicant_no) throws Exception{
		
		ResponseEntity<HttpStatus> entity = null;
		
		try {
			staffApplicantService.modifyApplicantPassDelete(applicant_no);
			entity = new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	
	@RequestMapping(value="/academic/admission/candidate/insert")
	@ResponseBody
	public ResponseEntity<HttpStatus> insert(String applicant_no) throws Exception{
		
		ResponseEntity<HttpStatus> entity = null;
		
		try {
			staffApplicantService.registApplicantToStudent(applicant_no);
			entity = new ResponseEntity<HttpStatus>(HttpStatus.OK);
		}catch(Exception e) {
			entity = new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}
		
		return entity;
	}
}

