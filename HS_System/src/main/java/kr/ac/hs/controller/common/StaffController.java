package kr.ac.hs.controller.common;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.service.common.StaffService;

@Controller
@RequestMapping("/staff")
public class StaffController {
	@Autowired
	private StaffService service;
	
	@RequestMapping("/getDeptName")
	public ResponseEntity<String> getBelongDepartmentName(@RequestParam("staff_no") String staff_no)throws Exception{
		ResponseEntity<String> entity = null;
		
		try{
			StaffVO staff = service.getStaff(staff_no);
			entity = new ResponseEntity<String>(staff.getDept_nm(), HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
