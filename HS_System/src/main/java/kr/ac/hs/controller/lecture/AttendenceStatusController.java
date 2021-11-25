package kr.ac.hs.controller.lecture;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.hs.command.attendance.AttendenceStatusCommand;
import kr.ac.hs.dto.attendance.AttendanceStatusVO;
import kr.ac.hs.service.attendance.AttendanceStatusService;


@Controller
@RequestMapping("/professor")
public class AttendenceStatusController {
	
	@Autowired
	private AttendanceStatusService attenService;
	
	@RequestMapping("/attendanceStatus")
	@ResponseBody
	public ResponseEntity<Map<String,Object>> getAttendanceStatus(@RequestBody AttendenceStatusCommand cmd) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		AttendanceStatusVO attendance = cmd.convertToAttendanceStatusVO();
		
		try {
			Map<String, Object> dataMap = attenService.getTotalAttendanceStatus(attendance);
			entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
