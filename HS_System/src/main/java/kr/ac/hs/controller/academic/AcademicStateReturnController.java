package kr.ac.hs.controller.academic;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.hs.command.academic.AcademicStateReturnCommand;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;
import kr.ac.hs.dto.academic.PluralMajorVO;
import kr.ac.hs.service.AcademicStateService;

@Controller
@RequestMapping("/academicState/academicReturn")
public class AcademicStateReturnController {
	
	@Autowired
	private AcademicStateService service;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> regist(@RequestBody AcademicStateReturnCommand cmd) throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		
		AcademicStateStaffVO acdm = cmd.toStudentVO();
		
		try {
			service.registReturnAcademicState(acdm);
			
			Map<String,String> resultMap = new HashMap<String, String>();
			entity = new ResponseEntity<Map<String, String>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, String>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public ResponseEntity<List<AcademicStateVO>> getList(@RequestParam("id") String student_no) throws Exception{
		ResponseEntity<List<AcademicStateVO>> entity = null;
		
		try {
			List<AcademicStateVO> returnList = service.getListReturnAcademicStateStudentNo(student_no);
			entity = new ResponseEntity<List<AcademicStateVO>>(returnList, HttpStatus.OK);
		}catch(SQLException e) {
			entity = new ResponseEntity<List<AcademicStateVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping("/remove")
	@ResponseBody
	public HttpStatus remove(@RequestParam("register_date")String register_date, HttpSession session) throws Exception{
		HttpStatus status = null; 
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		Date parse = format.parse(register_date);
		AcademicStateVO state = new AcademicStateVO();
		
		state.setStudent_no(loginUser.getId());
		state.setRegister_date(parse);
		
		try {
			service.removeReturnAcademicState(state);
			status = HttpStatus.OK;
		} catch (Exception e) {
			status = HttpStatus.BAD_REQUEST;
		}
		
		return status;
	}
	
}
	
	 
	
