package kr.ac.hs.controller.academic;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.hs.command.academic.DepartmentChangeCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.service.academic.DepartmentChangeService;

@Controller
@RequestMapping("/academic/departmentChange")
public class DepartmentChangeController {
	
	@Autowired
	private DepartmentChangeService service;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> regist(DepartmentChangeCommand cmd) throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		
		DepartmentChangeVO dept = cmd.toVO();
		CounselVO cousel = new CounselVO();
		cousel.setCounsel_date(cmd.formatDate());
		Map<String,String> resultMap = new HashMap<String,String>();;

		try {
			String check = service.regist(dept, cousel, cmd.getTransfer_files());
			String message = "";
			
			if(check.equals("OK")) {
				message = "신청 완료되었습니다";
			}else {
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
	public ResponseEntity<List<DepartmentChangeVO>> getList(@RequestParam("id") String student_no) throws Exception{
		ResponseEntity<List<DepartmentChangeVO>> entity = null;
		
		try {
			List<DepartmentChangeVO> deptList = service.getListByStudentNO(student_no);
			entity = new ResponseEntity<List<DepartmentChangeVO>>(deptList, HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<List<DepartmentChangeVO>>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	@ResponseBody
	public HttpStatus remove(@RequestBody DepartmentChangeCommand cmd, HttpSession session) throws Exception{
		HttpStatus status = null; 
		
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");
		DepartmentChangeVO dept = cmd.toVO();
		
		dept.setStudent_no(loginUser.getId());
		
		try {
			service.remove(dept);
			status = HttpStatus.OK;
		}catch (SQLException e) {
			status = HttpStatus.BAD_REQUEST;
		}
		return  status;
	}
	
	@RequestMapping("/pdf")
	public String pdf(@RequestParam("studentNO") String student_no, Model model) throws Exception{
		String url = "academic/departmentChangePdf";
		
		List<DepartmentChangeVO> deptList = service.getListByStudentNO(student_no);
		for (DepartmentChangeVO vo : deptList) {
			if(vo.getStatus_cd().equals("CCDH004")) {
				model.addAttribute("dept", vo);
			}
		}
		return url;
	}
	
}
