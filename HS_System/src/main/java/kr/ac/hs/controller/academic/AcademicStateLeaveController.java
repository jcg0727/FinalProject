package kr.ac.hs.controller.academic;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.thoughtworks.qdox.parser.ParseException;

import kr.ac.hs.command.academic.AcademicStateLeaveCommand;
import kr.ac.hs.command.academic.DepartmentChangeCommand;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.AccountVO;

import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.service.AcademicStateService;

@Controller
@RequestMapping("/academicState/leave")
public class AcademicStateLeaveController {

	@Autowired
	private AcademicStateService academicStateService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> leave_regist(AcademicStateLeaveCommand leaveCommand) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;
		AcademicStateVO academicLeaveState = leaveCommand.toVO();
		Map<String,String> resultMap = new HashMap<String,String>();
		
		try {
		
			String check = academicStateService.registLeaveAcademicState(academicLeaveState, leaveCommand.getEx_file());
			String message = "";
			
			if(check.equals("OK")) {
				message = "신청 완료되었습니다.";
			} else {
				message = "이미 신청하신 내역이 존재합니다.\n 신청이 불가능합니다";
			}
			
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String, String>>(resultMap,HttpStatus.OK);
		} catch (IllegalAccessError e) {
			entity = new ResponseEntity<Map<String, String>>(HttpStatus.BAD_REQUEST);
		}
	
		return entity;

	}
	
	@RequestMapping("/list")
	@ResponseBody
	public ResponseEntity<List<AcademicStateVO>> getList(@RequestParam("id") String student_no) throws Exception {
		ResponseEntity<List<AcademicStateVO>> entity = null;
		
		try {
			List<AcademicStateVO> leaveList = academicStateService.getListByStudentNO(student_no);
			entity = new ResponseEntity<List<AcademicStateVO>>(leaveList, HttpStatus.OK);
		} catch (Exception e) {
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
			academicStateService.remove(state);
			status = HttpStatus.OK;
		} catch (Exception e) {
			status = HttpStatus.BAD_REQUEST;
		}
		
		return status;
	}
	
	

}
