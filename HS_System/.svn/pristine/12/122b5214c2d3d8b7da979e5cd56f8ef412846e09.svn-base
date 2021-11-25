package kr.ac.hs.controller.academic;

import java.sql.SQLException;
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
import kr.ac.hs.dto.AcademicFreshmenVO;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.StudentInformationVO;
import kr.ac.hs.service.AcademicFreshmenService;

@Controller
public class AcademicFreshmenController {
	
	@Autowired
	private AcademicFreshmenService service;

	@RequestMapping("/academic/admission/freshmen")
	public ModelAndView main(HttpSession session, ModelAndView mnv, SearchCriteria cri)throws SQLException {
		String url="academic/freshmen";
		
		AccountVO account = (AccountVO)session.getAttribute("loginUser");
		String staff_no = account.getId();
		
		String dept_nm = service.selectDept_nmByStaff_no(staff_no);
		Map<String, Object> dataMap = service.getInfoByStaff_no(staff_no, cri);
		
		mnv.addObject("dept_nm", dept_nm);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/academic/admission/freshmen/detail")
	@ResponseBody
	public ResponseEntity<List<AcademicFreshmenVO>> getList(@RequestParam("student_no") String student_no)throws Exception{
		ResponseEntity<List<AcademicFreshmenVO>> entity = null;
		try {
			List<AcademicFreshmenVO> infoList = service.selectDetailByStudent_no(student_no);
			entity = new ResponseEntity<List<AcademicFreshmenVO>>(infoList,HttpStatus.OK);
			for(AcademicFreshmenVO data : infoList) {
				System.out.println(data.getName()+" "+data.getAddress());
			}
		}catch (SQLException e) {
			entity = new ResponseEntity<List<AcademicFreshmenVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/academic/admission/advisorList")
	public ModelAndView main(String dept_nm,String student_no,String professorYN, ModelAndView mnv, SearchCriteria cri)throws SQLException{
		String url="academic/proList";
		
		Map<String, Object> dataMap = service.selectProfessorListByDept_nm(dept_nm, cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("dept_nm", dept_nm);
		mnv.addObject("student_no", student_no);
		mnv.addObject("professorYN", professorYN);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/academic/admission/freshmen/changeAdvisor")
	@ResponseBody
	public ResponseEntity<String> updateAdvisor(String pro_no, String student_no)throws Exception{
		System.out.println("----------------------------"+pro_no);
		System.out.println("----------------------------"+student_no);
		
		
		ResponseEntity<String> entity = null;
		try {
			service.updateAdvisor(pro_no, student_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}

	@RequestMapping("/academic/admission/freshmen/insertAdvisor")
	@ResponseBody
	public ResponseEntity<String> insertAdvisor(String pro_no, String student_no)throws Exception{
		System.out.println("왜안넘어와 미쳤나봐");
		System.out.println("----------------------------"+pro_no);
		System.out.println("----------------------------"+student_no);
		
		ResponseEntity<String> entity = null;
		
		try {
			service.insertAdvisor(pro_no, student_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
